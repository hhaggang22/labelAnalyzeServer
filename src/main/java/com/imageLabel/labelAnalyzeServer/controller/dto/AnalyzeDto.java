package com.imageLabel.labelAnalyzeServer.controller.dto;

public class AnalyzeDto {
	private String eventId;
	private String imageId;
	private String[] material;
	private String[] percent;
	private String waterwash;
	private String bleach;
	private String ironing;
	private String dry;
	private String drycleaning;

	public String getEventId() { return eventId; }

	public void setEventId(String eventId) { this.eventId = eventId; }

	public String getImageId() { return imageId; }

	public void setImageId(String imageId) { this.imageId = imageId; }

	public String[] getMaterial() { return material; }

	public void setMaterial(String[] material) { this.material = material; }

	public String[] getPercent() { return percent; }

	public void setPercent(String[] percent) { this.percent = percent; }

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
