package com.imageLabel.labelAnalyzeServer.service;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class ConnectionDAO {
	String message = "";

	public String get(String requestURL){
		try{
			OkHttpClient client = new OkHttpClient();
			Request request = new Request.Builder()
				.url(requestURL)
				.build();

			Response response = client.newCall(request).execute();

			message = response.body().string();
			System.out.println(message);

		}catch (Exception e){
			System.err.println(e.toString());
		}
		return message;
	}
}
