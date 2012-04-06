#!/bin/bash

# version: 0.1
# guilty-party: Andrew Lenards <lenards@iplantcollaborative.org>
# guilty-party: Hariolf Haefele <hariolf@iplantcollaborative.org>
# guilty-party: Dennis Roberts <dennis@iplantcollaborative.org>
# date: November 12, 2009
# changed: November 30, 2010
# changed: April 7, 2011

# Selects the default SQL directory from a list of candidates.
function get_default_sql_dir() {
	local result=$1
	local script_dir=$(dirname $0)

	# Select the first candidate directory that exists.
	local candidates="$script_dir/../sql $script_dir/sql $script_dir"
	for candidate in $candidates; do
		local candidate_path=$candidate/org/iplantc/sql
		if [[ -d $candidate_path ]]; then
			eval $result="'$candidate_path'"
			return
		fi
	done

	# Complain and exit if none of the candidates exists.
	echo 'ERROR: unable to determine the default SQL directory' >&2
	exit 1
}

# Determines which directory to look in for SQL files.  The result of this
# function will be stored in the first argumnent.  If the second argument is
# defined and not empty then the value of the second argument will be used as
# the SQL directory.  Otherwise, a default directory will be used.
function determine_sql_dir() {
	local result=$1
	local dir=$2

	# Use the default directory if one wasn't specified.
	if [[ -z $dir ]]; then
		get_default_sql_dir dir
	fi

	eval $result="'$dir'"
}

#  Define variables.  "1" etc. is the order of the passed in ones to be used.  if a var isn't passed in, it defaults to whatever is after "-".
HOST=${1-localhost}
determine_sql_dir SQL_Dir $2;
USER=${3-de}
DB=${4-de}

# specific the scripts you want to be called
# bash format is: (script0.sql script1.sql script2.sql)
scripts=(database-0.sql database-1.sql database-2.sql metadata-2-0.sql database-3.sql metadata-3-0.sql metadata-3-1.sql \
         metadata-3-2.sql database-4.sql metadata-4-0.sql metadata-4-1.sql metadata-5.sql metadata-6.sql metadata-7.sql \
         metadata-8.sql metadata-9.sql metadata-10.sql database-11.sql metadata-11.sql metadata-12.sql metadata-13.sql  \
         metadata-14.sql metadata-15.sql metadata-16.sql metadata-16-1.sql metadata-17.sql metadata-18.sql \
         metadata-19.sql metadata-19-1.sql metadata-20.sql metadata-21.sql metadata-22.sql)
# note: they will be executed in the under they appear in the array

# check for the .pgpass file in $HOME
if [ ! -e $HOME'/.pgpass' ]
then
    echo -e 'ERROR: ' $HOME '/.pgpass is missing. \n A postgresql password file must be in the home directory of the user executing this script.'
    exit 1
fi

# clear the old schema from the database
psql -h $HOST -U $USER -d $DB -c "drop schema public cascade" && psql -h $HOST  -U $USER -d $DB -c "create schema public"

if [ $? -ne 0 ]
then
    echo -e 'Dropping the public schema for database ' {$DB} ' failed.'
    exit 2
fi

# change the ownership to $DB for the public schema
psql -h $HOST  -U $USER -d $DB -c "alter database $DB owner to $USER" && psql -h $HOST  -U $USER -d $DB -c "alter schema public owner to $USER"

if [ $? -ne 0 ]
then
    echo -e 'Changing ownership for database ' {$DB} ' failed.'
    exit 3
fi

# Create the new schema from the change scripts in $scripts
for script in ${scripts[@]}
  do
     psql -h $HOST  -U $USER -d $DB < $SQL_Dir/$script
done
