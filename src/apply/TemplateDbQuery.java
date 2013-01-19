package apply;

import java.sql.SQLException;
import javax.servlet.ServletContext;

import sql.AbstractDbQuery;
import sql.Sql;
import sql.SqlUtil;

public class TemplateDbQuery extends AbstractDbQuery {
	Sql sql;
	String templateItemString = "template.id,template.name,category.name,template.docid,template.htmlid";



	public TemplateDbQuery(ServletContext context) {
		if (context != null)
			sql = new Sql(context);
		else
			sql = new Sql();
	}

	public void close() {
		sql.close();
	}

	public String[][] getAllTemplates() throws SQLException {
		return sql.getall("template");
	}

	public String[][] getCategorys() throws SQLException {
		return sql.getall("category");
	}
	public String getCategoryNameById(String categoryId) throws SQLException {
		return sql.get("category","name","where id='"+categoryId+"'")[1][0];
	}
	public String[][] getTemplatesByCategoryName(String categoryName)
			throws SQLException {
		String[][] result = sql.get("template,category", templateItemString,
				"where template.category=category.id and category.name='"
						+ categoryName + "'");
		return result;
	}

	public String[][] getTemplatesByCategoryId(String categoryId)
			throws SQLException {
		String[][] result = sql.get("template", "where category='" + categoryId
				+ "'");
		return result;
	}

	public void testCatagory() {
		try {
			String[][] result = getTemplatesByCategoryName("´úÊÕ·Ñ");
			SqlUtil.printString2V(result);
			// String[] result=getCategoryNames();
			// SqlUtil.printString1V(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
