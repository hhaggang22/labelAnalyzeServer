package com.imageLabel.labelAnalyzeServer.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

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

		ImageRenderDAO imageRenderDAO = new ImageRenderDAO();

		JSONArray imageArray = (JSONArray)request.getAttribute("jsonResult");
		ArrayList<String> imageArrayList = imageRenderDAO.getImageList(imageArray);

		request.setAttribute("imageArray", imageArrayList);
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
