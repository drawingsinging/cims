package system;

import java.sql.SQLException;

import javax.servlet.ServletContext;

import sql.AbstractDbQuery;

public class SystemDbQuery extends AbstractDbQuery {
	public SystemDbQuery() {
		super();
	}

	public SystemDbQuery(ServletContext context) {
		super(context);
	}

	public String[] getAccount(String id) throws SQLException {
		return sql.get("user", "where id='" + id + "'")[1];
	}

	public void updatePartAccount(String id, String realname, String email,
			String phone) throws SQLException {
		sql.update("user", "realname='" + realname + "',email='" + email
				+ "',phone='" + phone + "' where id='" + id + "'");
	}

	public boolean changePassword(String id, String oldPassword,
			String newPassword) throws SQLException {
		if (sql.get("user", "where id='" + id + "' and password='"
				+ oldPassword + "'").length <= 1)
			return false;
		sql.update("user", "password='" + newPassword + "' where id='" + id
				+ "'");
		return true;
	}

	public void updateUserAccount(String id, String username, String realname,
			String email, String phone, String userpower, String password)
			throws SQLException {
		sql.update("user", "username='" + username + "',realname='" + realname
				+ "',email='" + email + "',phone='" + phone + "',userpower='"
				+ userpower + "',password='" + password + "' where id='" + id
				+ "'");
	}

	public void deleteUserAccount(String id) throws SQLException {
		sql.delete("user", "where id='" + id + "'");
	}

	public void newUserAccount(String username, String realname, String email,
			String phone, String userpower, String password)
			throws SQLException {
		sql.insert("user", "NULL,'" + username + "','" + realname + "','"
				+ password + "',NULL,'" + email + "','1111111','" + userpower
				+ "','" + phone + "'");
	}

}
