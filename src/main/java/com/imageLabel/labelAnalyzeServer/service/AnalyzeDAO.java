package com.imageLabel.labelAnalyzeServer.service;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.imageLabel.labelAnalyzeServer.controller.dto.AnalyzeDto;

public class AnalyzeDAO {

	public static JSONArray makeResult(AnalyzeDto analyzeDto){
		Gson gson = new Gson();
		JSONArray jsonList = new JSONArray();
		JSONObject jsonObject = new JSONObject();

		jsonObject.put("material", analyzeDto.getMaterial());
		jsonObject.put("percent", analyzeDto.getPercent());
		jsonObject.put("waterwash" , analyzeDto.getWaterwash());
		jsonObject.put("bleach", analyzeDto.getBleach());
		jsonObject.put("ironing", analyzeDto.getIroning());
		jsonObject.put("dry", analyzeDto.getDry());
		jsonObject.put("drycleaning", analyzeDto.getDrycleaning());
		
		jsonList.put(jsonObject);

		//String result = gson.toJson(jsonList);

		return jsonList;
	}
}
