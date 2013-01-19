package apply;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;

import poi.PoiDocUtil;

import sql.AbstractDbQuery;
import sql.SqlUtil;

public class ApplyDbQuery extends AbstractDbQuery {


	public ApplyDbQuery(ServletContext context) {
		super(context);
	}

	public String[][] getNormalApplysByUserId(String userid)
			throws SQLException {
		return sql.get("apply", "where userid='" + userid
				+ "' and state<>'3' and state<>'4'");
	}

	public String[][] getDeletedApplysByUserId(String userid)
			throws SQLException {
		return sql.get("apply", "where userid='" + userid + "' and state='4'");
	}

	public String[] getApplyById(String id) throws SQLException {
		return sql.get("apply", "where apply.id='" + id + "'")[1];
	}

	public String getCategoryNameById(String id) throws SQLException {
		return sql.get("category", "name", "where id='" + id + "'")[1][0];
	}

	public String getUserRealNameById(String id) throws SQLException {
		return sql.get("user", "realname", "where id='" + id + "'")[1][0];
	}

	public String[] getCategoryNames() throws SQLException {
		String[][] result = sql.get("category", "", "");
		return SqlUtil.specialColumnData(result, "name");
	}

	public void createNewApply(String applyName, String applyCategory,
			String userId, String docid, String hesuanid, String yiju)
			throws SQLException {
		Calendar calendar = Calendar.getInstance();
		String applyId = getAvailabelApplyId();
		String year = String.valueOf(calendar.get(Calendar.YEAR));
		String month = String.valueOf(calendar.get(Calendar.MONTH) + 1);
		String day = String.valueOf(calendar.get(Calendar.DATE));
		String applyTime = year + "." + month + "." + day;
		sql.insert("apply", "NULL,'" + applyId + "','" + applyName + "','"
				+ applyCategory + "','" + applyTime + "','" + userId + "','"
				+ 0 + "',NULL,NULL,'" + docid + "','" + hesuanid + "','" + yiju
				+ "',NULL");
	}

	public void convertDocFile(String docfilename, String docrealpath,
			String htmlrealpath) throws TransformerException, IOException,
			ParserConfigurationException {
		String nameWithoutSuffix = docfilename.substring(0,
				docfilename.lastIndexOf('.'));
		new File(htmlrealpath + "\\" + nameWithoutSuffix).mkdir();
		PoiDocUtil
				.convert2Html(docrealpath + "\\" + docfilename, htmlrealpath
						+ "\\" + nameWithoutSuffix + "\\" + nameWithoutSuffix
						+ ".html");
	}

	private String getAvailabelApplyId() throws SQLException {
		String[][] applyids = sql.get("apply", "max(applyid)", "applyid");
		return String.valueOf(Integer.valueOf(applyids[1][0]) + 1);
	}

	public String getCategoryIdByName(String name) throws SQLException {
		return sql.get("category", "id", "where name='" + name + "'")[1][0];
	}

	public String getFilePathById(String id) throws SQLException {
		return sql.get("file", "filepath", "where id='" + id + "'")[1][0];
	}

	public String getHtmlIdByDocId(String id) throws SQLException {
		String docname = sql.get("file", "filename", "where id='" + id + "'")[1][0];
		String htmlname = docname.substring(0, docname.lastIndexOf('.'))
				+ ".html";
		return sql.get("file", "id", "where filename='" + htmlname + "'")[1][0];
	}

	public static String stateQuery(String key) {
		if (key.equals("0"))
			return "等待审核";
		if (key.equals("1"))
			return "通过审核";
		if (key.equals("2"))
			return "未通过审核";
		if (key.equals("3"))
			return "修改历史";
		if (key.equals("4"))
			return "已经被删除";
		return "";
	}

	public static void main(String args[]) throws SQLException {
		String docfilename = "asgiojionn.asdfg.hh";
		System.out.println(docfilename.substring(0,
				docfilename.lastIndexOf('.')));
	}
}
