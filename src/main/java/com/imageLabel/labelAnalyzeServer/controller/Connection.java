package com.imageLabel.labelAnalyzeServer.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.imageLabel.labelAnalyzeServer.service.ConnectionDAO;

@WebServlet(name = "Connection", value = "/Connection")
public class Connection extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String HOST_URL = "http://localhost:8082/capture/event?status=START";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
		ServletException,
		IOException {
		//request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=utf-8");

		ConnectionDAO connectionDAO = new ConnectionDAO();
		JSONArray responseJson = connectionDAO.get(HOST_URL);


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
