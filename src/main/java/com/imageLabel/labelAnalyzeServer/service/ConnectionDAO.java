package com.imageLabel.labelAnalyzeServer.service;

import org.json.JSONObject;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

public class ConnectionDAO {
	String message = "";

	public String get(String requestURL){
		try{
			OkHttpClient client = new OkHttpClient();
			Request request = new Request.Builder()
				.url(requestURL)
				.build();

			Response response = client.newCall(request).execute();

			//JSONObject jsonObject = new JSONObject(response.body().toString());

			message = response.body().string();


		}catch (Exception e){
			System.err.println(e.toString());
		}
		return message;
	}
}
