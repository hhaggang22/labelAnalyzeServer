package com.imageLabel.labelAnalyzeServer.service;

import okhttp3.OkHttpClient;

public class ConnectionDAO {

	public void get(String requestURL){
		try{
			OkHttpClient client = new OkHttpClient();

		}catch (Exception e){
			System.err.println(e.toString());
		}
	}
}
