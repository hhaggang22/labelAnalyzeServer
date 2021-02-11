package com.imageLabel.labelAnalyzeServer.service;

import java.io.IOException;

import org.json.JSONObject;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class ResultRequestDAO {

	private static final String HOST_URL =  "http://localhost:8082//api/user/null/capture/event";

	public void sendResult(JSONObject jsonObject) throws IOException {

		MediaType JSON = MediaType.parse("application/json; charset=utf-8");
		RequestBody body = RequestBody.create(JSON, jsonObject.toString());

		OkHttpClient client = new OkHttpClient();

		Request request = new Request.Builder()
			.url(HOST_URL)
			.put(body)
			.build();

		try {
			Response response = client.newCall(request).execute();

			System.out.println(response.body().string());

		}catch (IOException e){
			e.printStackTrace();
		}


	}
}
