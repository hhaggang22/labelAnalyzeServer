package com.imageLabel.labelAnalyzeServer.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonArray;


import com.imageLabel.labelAnalyzeServer.controller.dto.AnalyzeDto;

@WebServlet(name = "Analyze", value = "/Analyze")
public class Analyze extends HttpServlet {
	private String country, waterwash, dry, ironing, drycleaning, bleach;


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
		ServletException,
		IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		waterwash = request.getParameter("cate1");
		bleach = request.getParameter("cate2");
		ironing = request.getParameter("cate3");
		dry = request.getParameter("cate4");
		drycleaning = request.getParameter("cate5");

		AnalyzeDto analyzeDto = new AnalyzeDto();
		analyzeDto.setWaterwash(waterwash);
		analyzeDto.setBleach(bleach);
		analyzeDto.setIroning(ironing);
		analyzeDto.setDry(dry);
		analyzeDto.setDrycleaning(drycleaning);

		Gson gson = new Gson();
		String resultJsonString = gson.toJson(analyzeDto);

		PrintWriter out = response.getWriter();
		out.print(resultJsonString);
		out.flush();



	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
		ServletException,
		IOException {
			doGet(request, response);
	}
}
