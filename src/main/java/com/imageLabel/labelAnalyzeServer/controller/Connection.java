package com.imageLabel.labelAnalyzeServer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.imageLabel.labelAnalyzeServer.controller.dto.InfoDto;
import com.imageLabel.labelAnalyzeServer.service.ConnectionDAO;

@WebServlet(name = "Connection", value = "/Connection")
public class Connection extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String HOST_URL = "http://localhost:8082/internal/api/capture/event?status=START";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
		ServletException,
		IOException {
		//request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=utf-8");

		ConnectionDAO connectionDAO = new ConnectionDAO();

		JSONArray imageIdArray = connectionDAO.getImageId(HOST_URL); //이미지리스트
		JSONArray infoArray = connectionDAO.getInfo(HOST_URL); //정보리스트(eventId, imageId, userId)

		InfoDto.infoDto.setInfoArray(infoArray); //정보리스트 갖다쓰려고 infoDto에 저장

		request.setAttribute("jsonResult", imageIdArray);
		RequestDispatcher view = request.getRequestDispatcher("/ImageRendering");
		view.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
		ServletException,
		IOException {
		doGet(request, response);

	}
}
