package com.imageLabel.labelAnalyzeServer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.imageLabel.labelAnalyzeServer.service.ResultRequestDAO;

@WebServlet(name = "ResultRequest", value = "/ResultRequest")
public class ResultRequest extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
		ServletException,
		IOException {

		JSONObject jsonObject = (JSONObject)request.getAttribute("jsonResult");//반환할 결과 JSON
		String putRequestUrl = (String)request.getAttribute("putReqeustURL");

		ResultRequestDAO resultRequestDAO = new ResultRequestDAO();
		resultRequestDAO.sendResult(jsonObject, putRequestUrl); //Api-server에 PUT 요청

		RequestDispatcher view = request.getRequestDispatcher("/connection.jsp");
		view.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
		ServletException,
		IOException {
			doGet(request, response);
	}
}
