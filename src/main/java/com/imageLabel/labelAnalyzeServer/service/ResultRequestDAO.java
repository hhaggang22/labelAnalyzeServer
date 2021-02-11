package com.imageLabel.labelAnalyzeServer.service;

import java.io.IOException;

import org.json.JSONObject;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class ResultRequestDAO {

	public void sendResult(JSONObject jsonObject, String putRequestUrl) throws IOException {

		MediaType JSON = MediaType.parse("application/json; charset=utf-8");
		RequestBody body = RequestBody.create(JSON, jsonObject.toString());

		OkHttpClient client = new OkHttpClient();

		Request request = new Request.Builder()
			.url(putRequestUrl)
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
