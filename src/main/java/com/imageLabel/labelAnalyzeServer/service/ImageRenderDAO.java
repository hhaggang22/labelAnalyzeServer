package com.imageLabel.labelAnalyzeServer.service;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

public class ImageRenderDAO {

	public ArrayList<String> getImageList(JSONArray jsonArray){
		ArrayList<String> imageUrl = new ArrayList<>();

		for(int i = 0 ; i<jsonArray.length(); i++){
			JSONObject imageId = (JSONObject)jsonArray.get(i);
			String imgIdUrl = "http://localhost:8081/user/null/image/"+imageId.getString("imageId");
			imageUrl.add(imgIdUrl);
		}

		for(int i= 0; i< imageUrl.size(); i++){
			System.out.println(imageUrl.get(i));
		}

		return imageUrl;
	}
}
