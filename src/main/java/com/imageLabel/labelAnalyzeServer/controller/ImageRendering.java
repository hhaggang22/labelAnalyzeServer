package com.imageLabel.labelAnalyzeServer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.imageLabel.labelAnalyzeServer.service.ImageRenderDAO;

@WebServlet(name = "ImageRendering", value = "/ImageRendering")
public class ImageRendering extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
		ServletException,
		IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		JSONArray imageArray = (JSONArray)request.getAttribute("jsonResult");

		ImageRenderDAO imageRenderDAO = new ImageRenderDAO();

		imageRenderDAO.getImageList(imageArray);

		RequestDispatcher view = request.getRequestDispatcher("analyzePage.jsp");
		view.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
		ServletException,
		IOException {
			doGet(request, response);
	}
}
