package com.imageLabel.labelAnalyzeServer.controller.dto;

import com.imageLabel.labelAnalyzeServer.common.type.CaptureEventStatus;

public class InfoDto {
	String eventId;
	String imageId;
	CaptureEventStatus status;

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public String getImageId() {
		return imageId;
	}

	public void setImageId(String imageId) {
		this.imageId = imageId;
	}

	public CaptureEventStatus getStatus() {
		return status;
	}

	public void setStatus(CaptureEventStatus status) {
		this.status = status;
	}

}
