package com.imageLabel.labelAnalyzeServer.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;

import com.imageLabel.labelAnalyzeServer.service.ConnectionDAO;

@WebServlet(name = "Connection", value = "/Connection")
public class Connection extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String HOST_URL = "http://localhost:8082/capture/event";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
		ServletException,
		IOException {
		//request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=utf-8");

		ConnectionDAO connectionDAO = new ConnectionDAO();
		String responseJson = connectionDAO.get(HOST_URL);

		PrintWriter out = response.getWriter();
		out.println(responseJson);

		request.setAttribute("jsonresult", responseJson);
		RequestDispatcher view = request.getRequestDispatcher("/resultPage.jsp");
		view.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
		ServletException,
		IOException {
		doGet(request, response);

	}
}
