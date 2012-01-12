################################################################################
# guilty-party: Andrew J Lenards <lenards@iplantcollaborative.org>
# date: Sunday, December 19, 2010 08:58 AM
# purpose: Perform database migration operations
################################################################################

################################################################################
# NOTE - You do not need to edit these values for the script, use --help
################################################################################

"""
We'll be using optparse until we determine what are Python versions are.

We are assuming that we would like to target Python version 2.4, 2.5, 2.6 with
this script - and not force any Python EGGs to be installed in order to execute.

This assumption has a mind-numbing affect on how you implement some things. SO!
When reviewing the code, consider this little ``constraint`` before you rail
the author.  Dealing w/ ambiguous version of Python and not allowing for the
install of modules makes this a different sort of ``excite.``

optparse has been deprecated since Python 2.7.* and new development has move to
the argparse module.

New versions of this script should likely move to using argparse, but this can
only happen when we know that development, qa, and production systems have
versions of Python 2.7 or above since I have not determined if argparse was
backported.

==============================
A Special Note From Our Author
==============================

Before we enter the code, I'd like to say that I believe the below code to be
functional.  I have not performed ``rigorous`` testing yet - but I am not proud
of the style and format overall.  I am proud that it works.  I believe it can be
improved upon greatly; I offer my appreciate for the importants made by others.

"""

# Yes - I know ``commands`` is deprecated
import commands
import os
import os.path
# Yes - I know ``optparse`` is deprecated (see above rant)
from optparse import OptionParser
from subprocess import call

################################################################################
# NOTE - You do not need to edit these values for the script, use --help
################################################################################

################################################################################
# "Constants" used by the driver function [main()] as defaults.
################################################################################
OPTIONS = ["refresh", "migrate"]
PG_PASS = os.path.join(os.environ['HOME'], '.pgpass')

################################################################################
# Default value -
#
# The term "defaults" is used because the script will accept arguments for
# HOST, DB_USER, DB_NAME.  However, if no argument is provided on the command
# line then these values will be used in-lieu of user provided values.
################################################################################
HOST = "localhost"
DB_USER = "de"
DB_NAME = "de"
SCRIPT_DIR = 'org/iplantc/sql'

################################################################################
# Execution object
################################################################################
class Executor(object):
    """Performs a migration operation."""
    def __init__(self, operation, version, host, db_user, db_name, script_dir,
                 verbose):
        self.operation = operation
        self.version = int(version)
        self.host = host
        self.db_user = db_user
        self.db_name = db_name
        self.script_dir = script_dir
        self.verbose = verbose

    def _make_call(self, cmd):
        ret = call(cmd, shell=True)
        if ret != 0:
            print "\n* ERROR: return code %s for command: \n%s\n" % (ret, cmd)
        return ret

    def _drop_schema(self):
        cmd = ''.join(["psql", " -h %s" % (self.host),
                       " -U %s" % (self.db_user), " -d %s" % (self.db_name),
                       ' -c "drop schema public cascade"'])
        return self._make_call(cmd)

    def _create_schema(self):
        cmd = ''.join(["psql", " -h %s" % (self.host),
                       " -U %s" % (self.db_user), " -d %s" % (self.db_name),
                       ' -c "create schema public"'])
        return self._make_call(cmd)

    def _alter_database_owner(self):
        cmd = ''.join(["psql", " -h %s" % (self.host),
                       " -U %s" % (self.db_user), " -d %s" % (self.db_name),
                       ' -c "alter database %s owner to %s"' %
                       (self.db_name, self.db_user)])
        return self._make_call(cmd)

    def _alter_schema_owner(self):
        cmd = ''.join(["psql", " -h %s" % (self.host),
                       " -U %s" % (self.db_user), " -d %s" % (self.db_name),
                       ' -c "alter schema public owner to %s"' %
                       (self.db_user)])
        return self._make_call(cmd)

    def _get_version(self):
        """
        Spawns a shell within the executions to produce output that is
        redirected into the psql command to retrieve the current ``version``
        from the database's ``version`` table.  The output it parsed/split
        in order to grab the numeric value for version.  An int type is returned
        """
        ubercmd = "\" echo 'select \"version\" from \"version\";' | psql -h %s -U %s -d %s\""
        version = None
        tuple = commands.getstatusoutput(
            ''.join(["sh ", "-c ",
                     ubercmd % (self.host, self.db_user, self.db_name)]))

        if tuple != None:
            output = tuple[1].split()
            version = output[2]

        try:
            version = int(version)
        except ValueError:
            version = None

        return version

    def _update_version(self, new_version):
        """
        Spawns a shell within the executions to produce output that is
        redirected into the psql command and updated the ``version`` table.
        """
        ubercmd = "\" echo 'update \"version\" set \"version\"=%s;'"

        psqlcmd = " | psql -h %s -U %s -d %s\"" % (self.host, self.db_user,
                                                   self.db_name)

        cmd = ''.join(["sh ", "-c ", ubercmd % (new_version), psqlcmd])

        tuple = commands.getstatusoutput(cmd)
        return (len(tuple) >= 2 and tuple[1] != None and tuple[1] == 'UPDATE 1')

    def _extract_version_from(self, filename):
        """
        By convention, the script filenames are in the format
        {database}-{version}.sql.  The version part is really just ignored and
        assumed that the user desires all scripts to be run into the specified
        database (this may change in the future and become a specifier for the
        target database, but HEY! - that's the future and *not* now, relax there
        Maciej!).  So, back to the method - it examples something like the
        doctest below to be true:

        >>> scripts = ['database-0.sql', 'database-1.sql', 'database-2.sql', 'metadata-2-0.sql']
        >>> [parts.split('-')[1].split('.')[0] for parts in scripts]
        ['0', '1', '2', '2']

        It just attempts a 'safer' version of the list comprehension above.

        This method returns the ``version`` as an int type for consistent
        comparison with self.version.
        """
        version = None
        parts = filename.split('-')
        if parts != None:
            moreparts = parts[1].split('.')
            version = moreparts[0]
        return int(version)

    def _extract_all_versions_from(self, filename):
        """
        Many of our SQL filenames contain both versions and subversions.  When
        sorting filenames, we need to take all version numbers into account
        this method extracts all version numbers contained in the filename
        and returns them as a list.
        """
        return map(lambda x: int(x.split(".")[0]), filename.split('-')[1:])

    def _perform_refresh(self):
        """
        Executes the steps to perform a ``refresh`` operation on the database.

        The steps performed:
        * dropping the current schema for the DB_NAME argument, aka self.db_name
        * creating a new schema
        * changing database ownership to the DB_USER argument, aka self.db_user
        * changing schema ownership to the DB_NAME to DB_USER
        """
        ret = self._drop_schema()
        # if the drop failed, it is because there is no schema to drop
        if ret == 0 or ret == 1:
            ret = self._create_schema()
        if ret == 0:
            ret = self._alter_database_owner()
        if ret == 0:
            ret = self._alter_schema_owner()
        return ret

    def _perform_migrate(self, refresh_happened):
        """
        Executes the steps to perform a ``migrate`` operation on the database.

        * ``refresh_happened`` - this indicates that the refresh was run and the
        database is much like scorched, barren earth that needs to be populated
        with a bootstrap step, much like the Jetson's rotary farm.

        The steps performed:
        * determined the sql scripts to run
        * conditionally bootstrap the database w/ version 0
        * get the version of the current database
        * use version to determine what scripts to run
        * execute scripts
        * updated version of the current database to ``highest_script_version``

        Returns the final status code of the script execution.

        WARNING: this may not properly indicate a SQL script failed execution.
        """
        ret = 0

        cmd = ''.join(["psql", " -h %s" % (self.host),
                       " -U %s" % (self.db_user), " -d %s" % (self.db_name),
                 " < %s"])

        # grab sql scripts, parse the trailing version number out
        files = [os.path.join(self.script_dir, f) for f in
                 os.listdir(self.script_dir)]
        files.sort(key=self._extract_all_versions_from)

        if refresh_happened:
            #### BOOTSTRAP!
            bootstrap = files.pop(0)
            if self.verbose:
                print '* INFO: The script believes that it is necessary to bootstrap...'
                print '\t running %s as a bootstrapping script...' % bootstrap
            # we have to bootstrap the version table from first script
            curr_version = 0 # bootstrap

            if curr_version == self._extract_version_from(bootstrap):
                ret = self._make_call(cmd % bootstrap)

        # get version from the database...
        curr_version = self._get_version()

        if self.verbose:
            print "* INFO: The current version in the table is: %s" % curr_version

        highest_script_version = None

        # loop over scripts
        for script in files:
            script_version = int(self._extract_version_from(script))
            if (script_version > curr_version) and (script_version <= self.version):
                # execute each script
                if self.verbose:
                    print "* INFO: Executing script: %s" % script
                ret = self._make_call(cmd % script)
                highest_script_version = script_version

        # set version to the highest script run
        self.version = highest_script_version

        # update the version in database...
        self._update_version(self.version)

        return ret


    def execute(self):
        """here's where the magic is..."""
        refresh = False

        if self.operation == OPTIONS[0]:
            ret = self._perform_refresh()
            refresh = True
            if self.verbose and ret == 0:
                print "* INFO: Refresh/Init Successful: Drop, Create, Ownership Alter"

        ret = self._perform_migrate(refresh)
        if self.verbose and ret == 0:
            print "* INFO: Migration Successful: New Database Version is %s " % (
                self.version)


################################################################################
# End Executor class definiton
################################################################################

################################################################################
# Helper functions
################################################################################
def make_operation(operation, version, host, db_user, db_name, script_dir,
                   verbose):
    """
    This is used as a primative factory method so that an executor specify to
    the operation 'could' be used later.
    """
    return Executor(operation, version, host, db_user, db_name, script_dir,
                    verbose)

def is_valid_option(op):
    """
    Determines if ``op`` is a valid option.

    This means that ``op`` appears in the ``OPTIONS`` definition.
    """
    return len([item for item in OPTIONS if item == op]) != 0

################################################################################
# Script driver function
################################################################################
def main():
    """
    Script execution point.

    Handles parsing options from the shell and determining if ther is enough
    provided information to construct an instance of Executor and perform
    the desired database migration operation.
    """
    global HOST
    global DB_USER
    global DB_NAME
    global SCRIPT_DIR
    # Define the options and arguments recognized by the script.
    usage = ''.join(["usage: %prog [--operation {migrate or refresh}]",
                     " [--db-version=#] [--db-script-dir]",
                     " {HOST} {DB_USER} {DB_NAME}"])
    parser = OptionParser(usage=usage)
    parser.add_option("--operation", action="store", dest="op",
                      help="Defined the operation to perform: "
                      "refresh or migrate.")
    parser.add_option("--db-version", action="store", dest="db_version",
                      help="Specifies the desired database version to"
                      "migrate to")
    parser.add_option("--db-script-dir", action="store", dest="script_dir",
                      help="Specifies the database script directory path. "
                      "By default, the script will attempt to use %s" %
                      os.path.join('.', SCRIPT_DIR),)
    parser.add_option("-v", "--verbose", action="store_true", dest="verbose",
                      default=True)
    parser.add_option("-q", "--quiet", action="store_false", dest="verbose")
    (options, args) = parser.parse_args()

    # Assume that we're not ``ready`` to execute the migration operation
    ready = False

    # Ensure that the .pgpass file exists for calls to `psql`
    if not os.path.exists(PG_PASS):
        msg = ''.join(["ERROR: \t%s is missing. \n\tA postgresql password ",
                       "file must be in the home directory of the user ",
                       "executing this script."]) % PG_PASS
        exit(msg)

    # Provide a warning that we're goning to attempt to find the scripts.
    if options.script_dir == None and options.verbose:
        print ('* WARN: --db-script-dir not specified, will attempt to use %s'
               % SCRIPT_DIR)

    # determine sql script location...
    if not os.path.exists(os.path.join('.', SCRIPT_DIR)):
        exit("\nPlease specify --db-script-dir, ./%s not found." % SCRIPT_DIR)
    elif options.script_dir == None:
        options.script_dir = SCRIPT_DIR

    # We must have an operation defined.  There are no defaults.  If you edit
    # this code to provide a default, it needs to be the least destructive of
    # the two: migrate.  But I am in violent disagreement about defining a
    # default - so you'd better edit this comment too and hope that I do not
    # find out the guilty-party via ``git-blame %prog``
    if options.op == None:
        parser.print_help()
        exit("\nPlease specify the operation that is desired with --operation.\n")
    elif options.op == 'migrate' and options.db_version == None:
        parser.print_help()
        exit("\nPlease specify the database version for a migrate operation.\n")
    else:
        ready = True

    # Wrangle with the arguments.  We expect them to appear in roughly the same
    # order as in the script we're replace: ``db_init.sh``.  So they should be
    # HOST, DB_USER, DB_NAME - which, in a same ``psql`` cmd, would map like
    # so: ``psql -h HOST -U DB_USER -d DB_NAME``
    if len(args) > 0:
        if len(args) >= 1 and args[0]:
            HOST = args[0]
        if len(args) >= 2 and args[1]:
            DB_USER = args[1]
        if len(args) >= 3 and args[2]:
            DB_NAME = args[2]
        if len(args) >= 4:
            print "* WARN: The following arguments were ignored: %s" % args[3:]
        if options.verbose:
            print ''.join(["* INFO: Script will use the following arguments:\n\n",
                           "\tHOST = %s\n", "\tDB_USER = %s\n",
                           "\tDB_NAME = %s\n"]) % (HOST, DB_USER, DB_NAME)

    if ready:
        if options.verbose:
            print "* INFO: Looks like we can get to work..."
        exe = make_operation(options.op, int(options.db_version), HOST, DB_USER,
                             DB_NAME, options.script_dir, options.verbose)
        exe.execute()


if __name__ == '__main__':
    main()
