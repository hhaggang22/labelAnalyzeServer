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

import com.imageLabel.labelAnalyzeServer.controller.dto.InfoDto;
import com.imageLabel.labelAnalyzeServer.service.ImageRenderDAO;

@WebServlet(name = "ImageRendering", value = "/ImageRendering")
public class ImageRendering extends HttpServlet {
	InfoDto infoDto;


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
		ServletException,
		IOException {

		int count = infoDto.getCount();

		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		ImageRenderDAO imageRenderDAO = new ImageRenderDAO();

		JSONArray imageArray = (JSONArray)request.getAttribute("jsonResult"); //이미지 리스트 불러오기
		ArrayList<String> imageArrayList = imageRenderDAO.getImageList(imageArray); //이미지 리스트 Array로 변환
		String imgUrl = imageArrayList.get(count);

		request.setAttribute("imageURL", imgUrl);
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
