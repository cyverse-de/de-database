package org.iplantc.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.log4j.Logger;
import org.hsqldb.server.Server;
import org.iplantc.sql.SqlResourceAnchor;

/**
 * Starts an in-memory database server and loads the DE data.
 * @author hariolf
 *
 */
public class TempDatabase {
	private static Logger LOG = Logger.getLogger(TempDatabase.class);
	private static final String DB_NAME = "de";
	private static final String DB_PATH = "de";
	private static final String DB_USER = "sa";   // the HSQLDB default user
	private static final String DB_PASSWORD = "";   // the HSQLDB default p/w
	private static final String[] SQL_FILES = {"database-0.sql", "database-1.sql", "database-2.sql"};
	private Server dbServer = null;
	private Connection dbConnection = null;

	public TempDatabase() throws ClassNotFoundException, SQLException {
		dbServer = initDb();
		dbConnection = setupDbConnection();
	}

	private Server initDb() {
		Server dbServer = new Server();
		dbServer.setLogWriter(log4jWriter(LOG));
		dbServer.setDatabaseName(0, DB_NAME);
		dbServer.setDatabasePath(0, DB_PATH);
		dbServer.start();
		return dbServer;
	}
	
	private Connection setupDbConnection() throws ClassNotFoundException, SQLException {
		Class.forName("org.hsqldb.jdbcDriver");   // not necessary in Java 6
		return DriverManager.getConnection("jdbc:hsqldb:mem:" + DB_NAME, DB_USER, DB_PASSWORD);
	}
	
	public Connection getDbConnection() {
		return dbConnection;
	}
	
	/**
	 * Creates a <code>PrintWriter</code> that logs messages to a Log4j logger at the DEBUG level.
	 * @param logger
	 * @return
	 */
	private PrintWriter log4jWriter(final Logger logger) {
		Writer writer = new Writer() {
			
			@Override
			public void write(char[] cbuf, int off, int len) throws IOException {
				logger.debug(new String(cbuf, off, len));
			}
			
			@Override
			public void flush() throws IOException { }
			
			@Override
			public void close() throws IOException { }
		};
		return new PrintWriter(writer);
	}
	
	private void loadSQL(InputStream input) throws IOException {
		SqlReader sqlReader = new SqlReader(input);
		while (true) {
			String sqlCommand = sqlReader.next();
			if (sqlCommand == null) {
				break;
			}
			Statement statement;
			try {
				statement = dbConnection.createStatement();
				statement.execute(sqlCommand);
			} catch (SQLException e) {
				LOG.error("Error executing SQL command: <" + sqlCommand + ">", e);
			}
		}
	}
	
	public void loadSQL() throws SQLException, IOException {
		// XXX is PUBLIC the right schema?
		dbConnection.createStatement().execute("DROP SCHEMA PUBLIC CASCADE");
		dbConnection.createStatement().execute("CREATE DOMAIN text AS varchar(10000)");
		
		for (String sqlFile: SQL_FILES) {
			InputStream inputStream = SqlResourceAnchor.class.getResourceAsStream(sqlFile);
			if (inputStream == null) {
				LOG.error("Cannot open resource: <" + sqlFile + ">");
			}
			else {
				loadSQL(inputStream);
			}
		}
	}

	public void shutdown() {
		if (dbServer != null)
			dbServer.stop();
		
		if (dbConnection != null) {
			try {
				dbConnection.close();
			} catch (SQLException e) {
				LOG.error("Cannot close database connection.", e);
			}
		}
	}
	
	/**
	 * A simple class that reads one SQL statement at a time from an <code>InputStream</code>.
	 * @author hariolf
	 *
	 */
	private class SqlReader {
		BufferedReader reader;
		
		SqlReader(InputStream input) {
			reader = new BufferedReader(new InputStreamReader(input));
		}
		
		/**
		 * Returns the next SQL command, or <code>null</code> if the end of the stream has been reached.
		 * @return
		 * @throws IOException 
		 */
		String next() throws IOException {
			StringBuilder sqlCommand = new StringBuilder();
			while (true) {
				String nextLine = reader.readLine();
				
				// null means end of stream
				if (nextLine == null) {
					return null;
				}
				
				nextLine = nextLine.trim();
				// Skip comment lines
				if (nextLine.startsWith("-")) {
					continue;
				}
				
				// read until a semicolon terminates a line
				sqlCommand.append(nextLine);
				if (nextLine.endsWith(";")) {
					break;
				}
			}
			return sqlCommand.toString();
		}
	}
	
	public static void main(String[] args) throws Exception {
		TempDatabase db = new TempDatabase();
		db.loadSQL();
		db.shutdown();
	}
}
