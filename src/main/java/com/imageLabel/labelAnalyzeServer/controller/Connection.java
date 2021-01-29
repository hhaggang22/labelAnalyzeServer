package com.imageLabel.labelAnalyzeServer.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;

@WebServlet(name = "Connection", value = "/Connection")
public class Connection extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String HOST_URL = "localhost:8081/image";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
		ServletException,
		IOException {
		response.setContentType("application/json;charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		HttpURLConnection conn = null;
		JSONObject responseJson = null;

		try{
			URL url = new URL(HOST_URL);

			conn = (HttpURLConnection)url.openConnection();
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(5000);
			conn.setRequestMethod("POST");

			JSONObject commands = new JSONObject();

			int responseCode = conn.getResponseCode();
			if(responseCode == 400 || responseCode == 401 || responseCode == 500){
				System.out.println(responseCode + " Error! ");
			}else {
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuilder sb = new StringBuilder();
				String line = "";
				while((line = br.readLine()) != null){
					sb.append(line);
				}
				responseJson = new JSONObject(sb.toString());
				//System.out.println(responseJson);

			}

		}catch (Exception e){
			System.err.println(e.toString());
		}

		PrintWriter out = response.getWriter();
		out.println(responseJson);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
		ServletException,
		IOException {
		doGet(request, response);

	}
}
