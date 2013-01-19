package login;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletContext;

import sql.Sql;
import sql.SqlUtil;

public class LoginDbQuery {
	Sql sql;
	public LoginDbQuery(ServletContext context) {
		if (context != null)
			sql = new Sql(context);
		else
			sql = new Sql();
	}

	public void close() {
		sql.close();
	}

	public boolean login(String user, String password) throws SQLException {
		String[][] result = sql.get("user", "where username='" + user
				+ "' and password='" + password + "' ");
		return result.length > 1;
	}

	public Map<String, String> getUserData(String user) throws SQLException {
		String[][] result = sql.get("user", "where username='" + user + "'");
		Map<String, String> userdata = SqlUtil.unicStringArray2Map(result);
		return userdata;
	}

	public static void main(String args[]) throws SQLException {
		LoginDbQuery ld = new LoginDbQuery(null);
		boolean islogin = ld.login("liuqi", "12345");
		System.out.println(islogin);
	}
}
