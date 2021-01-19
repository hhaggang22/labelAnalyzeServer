package com.imageLabel.labelAnalyzeServer.controller.dto;

public class AnalyzeDto {
	private String country;
	private String waterwash;
	private String bleach;
	private String ironing;
	private String dry;
	private String drycleaning;

	public AnalyzeDto(String country, String waterwash, String bleach, String ironing, String dry, String drycleaning){
		this.country = country;
		this.waterwash = waterwash;
		this.bleach = bleach;
		this.ironing = ironing;
		this.dry = dry;
		this.drycleaning = drycleaning;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getWaterwash() {
		return waterwash;
	}

	public void setWaterwash(String waterwash) {
		this.waterwash = waterwash;
	}

	public String getBleach() {
		return bleach;
	}

	public void setBleach(String bleach) {
		this.bleach = bleach;
	}

	public String getIroning() {
		return ironing;
	}

	public void setIroning(String ironing) {
		this.ironing = ironing;
	}

	public String getDry() {
		return dry;
	}

	public void setDry(String dry) {
		this.dry = dry;
	}

	public String getDrycleaning() {
		return drycleaning;
	}

	public void setDrycleaning(String drycleaning) {
		this.drycleaning = drycleaning;
	}
}
