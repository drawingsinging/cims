package source;

import java.sql.SQLException;
import javax.servlet.ServletContext;

import junit.framework.TestCase;

import sql.Sql;

public class FileDbQuery extends TestCase {
	Sql sql;

	public FileDbQuery(ServletContext context) {
		if (context != null)
			sql = new Sql(context);
		else
			sql = new Sql();
	}

	public void close() {
		sql.close();
	}

	public String[] getFile(String id) throws SQLException {
		String[][] tresult = sql.get("file", "where id='" + id + "'");
		return tresult[1];
	}

	
	public String saveFile(String filename, String filepath)
			throws SQLException {
		sql.insert("file", "NULL,'" + filename + "','" + filepath + "',NULL");
		return sql.get("file", "id", "where filename='" + filename + "'")[1][0];
	}

	public static void main(String args[]) {
		try {
			FileDbQuery dv = new FileDbQuery(null);
			System.out.println(dv.getFile(String.valueOf(2))[0]);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
