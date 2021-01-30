package com.imageLabel.labelAnalyzeServer.service;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.imageLabel.labelAnalyzeServer.controller.dto.AnalyzeDto;

public class AnalyzeDAO {

	public static JSONObject makeResult(AnalyzeDto analyzeDto){
		Gson gson = new Gson();
		//JSONArray jsonList = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		JSONArray materialList = new JSONArray();
		JSONObject materialObject = new JSONObject();

		String[] material = analyzeDto.getMaterial();
		String[] percentage = analyzeDto.getPercent();

		for(int i=0; i<material.length; i++){
			materialObject.put("name", material[i]);
			materialObject.put("percentage", percentage[i]);
			materialList.put(materialObject);
		}

		jsonObject.put("ingredients", materialList);
		jsonObject.put("waterwash" , analyzeDto.getWaterwash());
		jsonObject.put("bleach", analyzeDto.getBleach());
		jsonObject.put("ironing", analyzeDto.getIroning());
		jsonObject.put("dry", analyzeDto.getDry());
		jsonObject.put("drycleaning", analyzeDto.getDrycleaning());

		return jsonObject;
	}
}
