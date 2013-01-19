package review;

import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.ServletContext;

import sql.AbstractDbQuery;

public class ReviewDbQuery extends AbstractDbQuery {

	public ReviewDbQuery(ServletContext context) {
		super(context);
	}

	public String[][] getNotReviewApply() throws SQLException {
		return sql.get("apply", "where state='0'");
	}

	public String[][] getReviewedApply() throws SQLException {
		return sql.get("apply", "where state='1' or state='2'");
	}

	public static void main(String args[]) throws SQLException {
		// ReviewDbQuery d = new ReviewDbQuery();
		System.out.println();
	}

	public String getUserNameById(String id) throws SQLException {
		return sql.get("user", "realname", "where id='" + id + "'")[1][0];
	}

	public String getCategoryNameById(String id) throws SQLException {
		return sql.get("category", "name", "where id='" + id + "'")[1][0];
	}

	public void reviewOp(String reviewId, String reviewerId,
			String reviewResult, String reviewResultReason) throws SQLException {
		Calendar calendar = Calendar.getInstance();
		String year = String.valueOf(calendar.get(Calendar.YEAR));
		String month = String.valueOf(calendar.get(Calendar.MONTH) + 1);
		String day = String.valueOf(calendar.get(Calendar.DATE));
		String reviewTime = year + "." + month + "." + day;
		sql.update("apply", "state='"
				+ reviewResult
				+ "',reviewid='"
				+ reviewerId
				+ "',reviewtime='"
				+ reviewTime
				+ "',reviewreason="
				+ (reviewResultReason != null ? "'" + reviewResultReason + "'"
						: "NULL") + "  where id='" + reviewId + "'");
	}
}
