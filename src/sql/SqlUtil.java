package sql;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class SqlUtil {

	public static Map<String, String> unicResultset2Map(ResultSet rs)
			throws SQLException {
		if (rs.next()) {
			ResultSetMetaData rsmetadata = rs.getMetaData();
			int columnNum = rsmetadata.getColumnCount();
			Map<String, String> userdata = new HashMap<String, String>();
			for (int i = 1; i <= columnNum; i++) {
				userdata.put(rsmetadata.getColumnLabel(i), rs.getString(i));
			}
			return userdata;
		}
		return null;
	}

	public static Map<String, String> unicStringArray2Map(String[][] rs)
			throws SQLException {
		if (rs.length > 1) {
			Map<String, String> userdata = new HashMap<String, String>();
			for (int i = 0; i < rs[0].length; i++) {
				userdata.put(rs[0][i], rs[1][i]);
			}
			return userdata;
		}
		return null;
	}

	public static String[] specialColumnData(String[][] result, String key) {
		int keyIndex = 0;
		for (int i = 0; i < result[0].length; i++)
			if (result[0][i].equalsIgnoreCase(key))
				keyIndex = i;
		String[] keyData = new String[result.length];
		for (int i = 0; i < keyData.length; i++) {
			keyData[i] = result[i][keyIndex];
		}
		return keyData;
	}

	public static void printString2V(String[][] data) {
		for (int i = 0; i < data.length; i++) {
			for (int j = 0; j < data[i].length; j++) {
				System.out.print(data[i][j] + " ");
			}
			System.out.println();
		}
	}

	public static void printString1V(String[] data) {
		for (int i = 0; i < data.length; i++) {
			System.out.print(data[i] + " ");
		}
		System.out.println();
	}

	

}
