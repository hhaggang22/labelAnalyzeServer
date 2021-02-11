package com.imageLabel.labelAnalyzeServer.controller.dto;

import org.json.JSONArray;

public class InfoDto {

	private static JSONArray infoArray;
	private static int count = 0;

	public InfoDto(){}

	public static final InfoDto infoDto = new InfoDto();

	public static JSONArray getInfoArray() {
		return infoArray;
	}

	public void setInfoArray(JSONArray jsonArray){this.infoArray = jsonArray;}

	public static int getCount(){ return count; }

	public void setCount(int count){ this.count = count; }



}
