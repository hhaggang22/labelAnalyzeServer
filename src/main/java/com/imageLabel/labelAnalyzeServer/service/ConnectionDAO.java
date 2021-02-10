package com.imageLabel.labelAnalyzeServer.service;

import org.json.JSONArray;
import org.json.JSONObject;

import com.imageLabel.labelAnalyzeServer.controller.dto.InfoDto;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

public class ConnectionDAO {
	JSONArray imageIDArray, infoArray;
	JSONObject imageIDObject, infoObject;
	InfoDto infoDto = new InfoDto();

	public JSONArray getImageId(String requestURL){
		try{
			OkHttpClient client = new OkHttpClient();
			Request request = new Request.Builder()
				.url(requestURL)
				.build();

			Response response = client.newCall(request).execute();
			JSONArray jsonArray= new JSONArray(response.body().string());

			imageIDArray = new JSONArray();

			int count = jsonArray.length();

			for(int i = 0; i < count; i++){
				imageIDObject = new JSONObject();
				JSONObject jsonObject = jsonArray.getJSONObject(i);

				if(jsonObject.getString("status").equals("START")){
					imageIDObject.put("imageId", jsonObject.getString("imageId"));
					infoDto.setEventId(jsonObject.getString("eventId"));
					infoDto.setImageId(jsonObject.getString("imageId"));
				}
				imageIDArray.put(imageIDObject);
			}

		}catch (Exception e){
			System.err.println(e.toString());
		}
		return imageIDArray;
	}

	public JSONObject getInfo(String requestURL){
		try{
			OkHttpClient client = new OkHttpClient();
			Request request = new Request.Builder()
				.url(requestURL)
				.build();

			Response response = client.newCall(request).execute();
			JSONArray jsonArray= new JSONArray(response.body().string());

			int count = jsonArray.length();

			for(int i=0; i< count; i++){
				infoObject = new JSONObject();
				JSONObject jsonObject = jsonArray.getJSONObject(i);

				if(jsonObject.getString("status").equals("START")){
					infoObject.put("eventId", jsonObject.getString("eventId"));
					infoObject.put("imageId", jsonObject.getString("imageId"));
				}
			}

		}catch (Exception e){
			System.err.println(e.toString());
		}

		return infoObject;
	}
}
