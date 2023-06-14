package common;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class JSFunction {

	public JSFunction() {
		
	}

	
	/*
	 * 알림창을 띄운 후 명시한 URL 로 이동 
	 * @param msg
	 * @param url
	 * @param out
	 * */
	// 공통 로직 메서드               메세지, url, out 객체를 받아서 출력
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = "" 
					+ "<script>" 
					+ "		alert('"+msg+"');" 
					+ "		location.href = '"+url+"'; " 
					+ "</script>";
			
			out.print(script);
		} catch (IOException e) {
			System.err.println(e.getMessage());
		}
	}
	
	/*
	 * 알림창을 띄운 후 이전페이지로 이동 (url 필요없)
	 * @param msg
	 * @param out
	 * history.go(-1)
	 * */
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = "" 
					+ "<script>" 
					+ "		alert('"+msg+"');" 
					+ "		history.go(-1)"
					+ "</script>";
			out.print(script);
		} catch (IOException e) {
			System.err.println(e.getMessage());
		}
	}
}
