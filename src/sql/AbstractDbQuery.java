package sql;

import javax.servlet.ServletContext;

public class AbstractDbQuery {
	public Sql sql;

	public AbstractDbQuery() {
		sql = new Sql();
	}

	public AbstractDbQuery(ServletContext context) {
		if (context != null)
			sql = new Sql(context);
		else
			sql = new Sql();
	}

	public void close() {
		sql.close();
	}
}
