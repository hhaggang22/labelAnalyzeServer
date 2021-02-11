package com.imageLabel.labelAnalyzeServer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.imageLabel.labelAnalyzeServer.controller.dto.AnalyzeDto;
import com.imageLabel.labelAnalyzeServer.controller.dto.InfoDto;
import com.imageLabel.labelAnalyzeServer.service.AnalyzeDAO;


@WebServlet(name = "Analyze", value = "/Analyze")
public class Analyze extends HttpServlet {
	private String eventId, imageId, userId;
	private String[] material,percent;
	private String waterwash, dry, ironing, drycleaning, bleach;
	private InfoDto infoDto;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
		ServletException,
		IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		AnalyzeDto analyzeDto = new AnalyzeDto();

		//페이지카운트 세기
		int count = infoDto.getCount();

		//eventId, imageId 받아오기
		JSONArray infoArray = infoDto.getInfoArray();

		//정보불러오기
		JSONObject infoObject = infoArray.getJSONObject(count);
		eventId = infoObject.getString("eventId");
		imageId = infoObject.getString("imageId");
		userId = infoObject.getString("userId");

		//옷 정보 받아오기
		material = request.getParameterValues("material");
		percent = request.getParameterValues("percent");
		waterwash = request.getParameter("waterwash");
		bleach = request.getParameter("bleach");
		ironing = request.getParameter("ironing");
		dry = request.getParameter("dry");
		drycleaning = request.getParameter("drycleaning");

		//analyzeDto에 정보들 넣기->반환할 결과
		analyzeDto.setEventId(eventId);
		analyzeDto.setImageId(imageId);
		for(int i =0; i<material.length; i++){
			analyzeDto.setMaterial(material);
			analyzeDto.setPercent(percent);
		}
		analyzeDto.setWaterwash(waterwash);
		analyzeDto.setBleach(bleach);
		analyzeDto.setIroning(ironing);
		analyzeDto.setDry(dry);
		analyzeDto.setDrycleaning(drycleaning);

		JSONObject resultJsonString = AnalyzeDAO.makeResult(analyzeDto); //JSON으로 Api-Server에 반환할 결과 만들기

		String resultURL = "http://localhost:8082/api/user/"+userId+"/capture/event/"+eventId;

		AnalyzeDAO.verify(resultURL);

		request.setAttribute("putReqeustURL", resultURL);
		request.setAttribute("jsonResult", resultJsonString);
		RequestDispatcher view = request.getRequestDispatcher("/ResultRequest");
		view.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
		ServletException,
		IOException {
			doGet(request, response);
	}
}
