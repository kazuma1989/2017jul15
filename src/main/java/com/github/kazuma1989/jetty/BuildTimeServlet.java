package com.github.kazuma1989.jetty;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BuildTimeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");

		// GETメソッドのときは、パラメーターによらずビルド時刻を返す
		ResourceBundle bundle = ResourceBundle.getBundle("buildTime");

		PrintWriter out = resp.getWriter();
		out.println(bundle.getString("buildTime"));
	}
}
