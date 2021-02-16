package com.imageLabel.labelAnalyzeServer.service;

import java.io.IOException;

import org.json.JSONArray;
import org.json.JSONObject;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class ConnectionDAO {
	//Api-Server 접속
	private static final String requestURL = "http://ec2-13-209-47-146.ap-northeast-2.compute.amazonaws.com:8082/internal/api/capture/event?status=START";

	JSONArray imageIDArray, infoArray;
	JSONObject imageIDObject, infoObject;

	OkHttpClient client = new OkHttpClient();
	Request request = new Request.Builder()
		.url(requestURL)
		.build();

	Response response = client.newCall(request).execute();
	JSONArray jsonArray= new JSONArray(response.body().string());

	int count = jsonArray.length();

	public ConnectionDAO() throws IOException {
	}

	//imageList 만들기
	public JSONArray getImageId(String requestURL){
		try{
			imageIDArray = new JSONArray();

			if(count != 0){
				for(int i = 0; i < count; i++){
					imageIDObject = new JSONObject();
					JSONObject jsonObject = jsonArray.getJSONObject(i);

					if(jsonObject.getString("status").equals("START")){
						imageIDObject.put("imageId", jsonObject.getString("imageId"));
					}
					imageIDArray.put(imageIDObject);
				}
			}
			else return null;


		}catch (Exception e){
			System.err.println(e.toString());
		}
		return imageIDArray;
	}

	//request 정보 JSON 객체에 파싱
	public JSONArray getInfo(String requestURL){
		try{
			infoArray = new JSONArray();


			for(int i=0; i< count; i++){
				infoObject = new JSONObject();
				JSONObject jsonObject = jsonArray.getJSONObject(i);

				if(jsonObject.getString("status").equals("START")){
					infoObject.put("eventId", jsonObject.getString("eventId"));
					infoObject.put("imageId", jsonObject.getString("imageId"));
					infoObject.put("userId", jsonObject.getString("userId"));
				}
				infoArray.put(infoObject);
			}

			for(int k=0;k<infoArray.length();k++){
				System.out.println(infoArray.get(k));
			}

		}catch (Exception e){
			System.err.println(e.toString());
		}

		return infoArray;
	}
}
