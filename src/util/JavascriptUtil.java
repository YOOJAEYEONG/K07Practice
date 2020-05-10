package util;

import javax.servlet.jsp.JspWriter;

public class JavascriptUtil {

	public static String jsAlertLocation(String msg, String url) {
		
		return 	  "<script>"
				+ "	alert('"+msg+"'; "
				+ "	location.href='"+url+"'; "
				+ "</script>";
	}

	
	public static String jsAlertBack(String msg) {
		return	"<script>"+
					"alert('"+msg+"';"+
					"history.back();"+
				"</script>";
	}
	
	public static void jsAlertLocation(
			String msg, String url, JspWriter out) {
		try {
			String str = ""
					+ "<script>"
					+ "  alert('"+msg+"');"
					+ "  location.href='"+url+"';"
					+ "</script>";
			out.print(str);
			
		} catch (Exception e) {		}
	}
	public static void jsAlertBack(
			String msg, JspWriter out) {
		try {
			String str = ""
					+ "<script>"
					+ "  alert('"+msg+"');"
					+ "  location.go(-1);"
					+ "</script>";
			out.print(str);
		} catch (Exception e) {		}
	}
	
	
}
































