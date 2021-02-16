package com.imageLabel.labelAnalyzeServer.service;

import static com.imageLabel.labelAnalyzeServer.common.type.CaptureEventStatus.*;

import org.json.JSONArray;
import org.json.JSONObject;

import com.imageLabel.labelAnalyzeServer.common.type.CaptureEventStatus;
import com.imageLabel.labelAnalyzeServer.controller.dto.AnalyzeDto;

public class AnalyzeDAO {

	public static JSONObject makeResult(AnalyzeDto analyzeDto) {
		JSONObject resultObject = new JSONObject();
		JSONObject jsonObject = new JSONObject();
		JSONArray materialList = new JSONArray();

		CaptureEventStatus status = EXTRACT;

		String[] material = analyzeDto.getMaterial();
		String[] percentage = analyzeDto.getPercent();

		for (int i = 0; i < material.length; i++) {
			JSONObject materialObject = new JSONObject();

			materialObject.put("name", material[i]);
			materialObject.put("percentage", percentage[i]);
			materialList.put(materialObject);
		}

		//jsonObject.put("eventId", analyzeDto.getEventId());
		jsonObject.put("imageId", analyzeDto.getImageId());

		resultObject.put("ingredientList", materialList);
		resultObject.put("waterType", analyzeDto.getWaterwash());
		resultObject.put("bleachType", analyzeDto.getBleach());
		resultObject.put("ironingType", analyzeDto.getIroning());
		resultObject.put("dryType", analyzeDto.getDry());
		resultObject.put("dryCleaning", analyzeDto.getDrycleaning());

		jsonObject.put("result", resultObject);

		jsonObject.put("status", status);

		return jsonObject;

	}

	public static void verify(String url) {
		System.out.println(url);
	}
}
