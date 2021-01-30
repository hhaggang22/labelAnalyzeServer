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
import com.imageLabel.labelAnalyzeServer.service.AnalyzeDAO;


@WebServlet(name = "Analyze", value = "/Analyze")
public class Analyze extends HttpServlet {
	private String[] material,percent;
	private String waterwash, dry, ironing, drycleaning, bleach;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
		ServletException,
		IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		material = request.getParameterValues("material");
		percent = request.getParameterValues("percent");
		waterwash = request.getParameter("waterwash");
		bleach = request.getParameter("bleach");
		ironing = request.getParameter("ironing");
		dry = request.getParameter("dry");
		drycleaning = request.getParameter("drycleaning");

		AnalyzeDto analyzeDto = new AnalyzeDto();
		for(int i =0; i<material.length; i++){
			analyzeDto.setMaterial(material);
			analyzeDto.setPercent(percent);
		}
		analyzeDto.setWaterwash(waterwash);
		analyzeDto.setBleach(bleach);
		analyzeDto.setIroning(ironing);
		analyzeDto.setDry(dry);
		analyzeDto.setDrycleaning(drycleaning);

		JSONObject resultJsonString = AnalyzeDAO.makeResult(analyzeDto);

		request.setAttribute("jsonResult", resultJsonString);
		RequestDispatcher view = request.getRequestDispatcher("analyzeResult.jsp");
		view.forward(request, response);

		//System.out.println(resultJsonString);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
		ServletException,
		IOException {
			doGet(request, response);
	}
}
