package util;

import java.io.UnsupportedEncodingException;

public class StringUtil {
	public static String code2Utf_8(String data) {
		String rs="";
		try {
			if(data==null)
				return null;
			rs = new String(data.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
}
