/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sql;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.ServletContext;

/**
 * 
 * @author liuhao
 */
public class Sql {
	ConnectionPool connectionPool;
	String dbURL = "jdbc:mysql://localhost/cimsdb";
	String username = "root";
	String password = "12345";
	Connection conn;
	Statement stm;
	ResultSet rs;
	ResultSetMetaData rsmd;

	public Sql(ServletContext context) {
		try {
			Object poolobj = context.getAttribute("ConnectionPool");
			if (poolobj != null) {
				connectionPool = (ConnectionPool) context
						.getAttribute("ConnectionPool");
				conn = connectionPool.getConnection();

			} else {
				conn = DriverManager.getConnection(dbURL, username, password);
			}
			// System.out.println("Connection Successful!"); //如果连接成功
			// 控制台输出Connection Successful!
			stm = conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Sql() {
		try {
			conn = DriverManager.getConnection(dbURL, username, password);
			// System.out.println("Connection Successful!"); //如果连接成功
			// 控制台输出Connection Successful!
			stm = conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		if (connectionPool != null)
			connectionPool.returnConnection(conn);
		else
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	public String[][] getall(String table) throws SQLException {
		return get(table, "");
	}

	public String[][] get(String table, String request) throws SQLException {
		return get(table, "*", request);
	}

	public String[][] get(String table, String items, String request)
			throws SQLException {
		String line = "select " + items + " from " + table + " " + request;

		// System.out.println(line);
		boolean hasresult = stm.execute(line);
		if (hasresult) {
			rs = stm.getResultSet();
			rsmd = rs.getMetaData();
			return transfer();
		}
		return null;
	}

	public boolean update(String table, String request) throws SQLException {
		String line = "update " + table + " SET " + request;
		return stm.execute(line);
	}

	public boolean insert(String table, String values) throws SQLException {
		String line = "insert into " + table + " values (" + values + ")";
		return stm.execute(line);
	}
	public boolean insert(String table,String items, String values) throws SQLException {
		String line = "insert into " + table + "("+items+") values (" + values + ")";
		return stm.execute(line);
	}
	public boolean delete(String table, String request) throws SQLException {
		String line = "delete from " + table + " where " + request;
		return stm.execute(line);
	}

	private String[][] transfer() {
		String[][] rss = new String[0][0];
		ArrayList<String[]> tmp = new ArrayList<String[]>();
		try {
			int ColumnCount = rsmd.getColumnCount();
			String[] item = new String[ColumnCount];
			for (int i = 1; i <= ColumnCount; i++) {
				item[i - 1] = rsmd.getColumnLabel(i);
			}
			tmp.add(item);
			String cell;
			while (rs.next()) {
				item = new String[ColumnCount];
				for (int i = 1; i <= ColumnCount; i++) {
					cell = rs.getString(i);
					if (cell != null) {
						item[i - 1] = cell.trim();
					}

				}
				tmp.add(item);
			}
			rss = tmp.toArray(new String[0][0]);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return rss;
	}

	public static void main(String[] args) throws SQLException {
		Sql sql = new Sql();
		String[][] rs = sql.getall("user");
		int num = 0;
		for (int i = 0; i < rs.length; i++) {
			num = rs[0].length;
			for (int j = 0; j < num; j++) {
				System.out.print(rs[i][j] + " ");
			}
			System.out.println();
		}

	}
}
