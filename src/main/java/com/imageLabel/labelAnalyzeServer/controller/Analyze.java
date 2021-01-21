package com.imageLabel.labelAnalyzeServer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.imageLabel.labelAnalyzeServer.controller.dto.AnalyzeDto;
import com.imageLabel.labelAnalyzeServer.service.AnalyzeDAO;

@WebServlet(name = "Analyze", value = "/Analyze")
public class Analyze extends HttpServlet {
	private String country, waterwash, dry, ironing, drycleaning, bleach, material;
	private int percent;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
		ServletException,
		IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		material = request.getParameter("mate");
		percent = Integer.parseInt((request.getParameter("percent")));
		waterwash = request.getParameter("cate1");
		bleach = request.getParameter("cate2");
		ironing = request.getParameter("cate3");
		dry = request.getParameter("cate4");
		drycleaning = request.getParameter("cate5");

		AnalyzeDto analyzeDto = new AnalyzeDto();
		analyzeDto.setMaterial(material);
		analyzeDto.setPercent(percent);
		analyzeDto.setWaterwash(waterwash);
		analyzeDto.setBleach(bleach);
		analyzeDto.setIroning(ironing);
		analyzeDto.setDry(dry);
		analyzeDto.setDrycleaning(drycleaning);

		JSONArray resultJsonString = AnalyzeDAO.makeResult(analyzeDto);

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
