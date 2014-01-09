package com.eastteam.myprogram.entity;

public class Question extends IdEntity {

	private String question;
	private String questionType;
	private String questionOptions;
	private String trashed;
	private String businessType;
	private int position;
	private boolean paperAnswered = false;
	private boolean paperUsed = false;


	private String[] splitOptions;
	
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getQuestionType() {
		return questionType;
	}
	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}
	public String getQuestionOptions() {
		return questionOptions;
	}
	public void setQuestionOptions(String questionOptions) {
		this.questionOptions = questionOptions;
	}	
	public String[] getSplitOptions() {
		return splitOptions;
	}
	public void setSplitOptions(String[] splitOptions) {
		this.splitOptions = splitOptions;
	}
	public String getTrashed() {
		return trashed;
	}
	public void setTrashed(String trashed) {
		this.trashed = trashed;
	}
	public String getBusiness_type() {
		return businessType;
	}
	public void setBusiness_type(String business_type) {
		this.businessType = business_type;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public boolean isPaperAnswered() {
		return paperAnswered;
	}
	public void setPaperAnswered(boolean paperAnswered) {
		this.paperAnswered = paperAnswered;
	}
	public boolean isPaperUsed() {
		return paperUsed;
	}
	public void setPaperUsed(boolean paperUsed) {
		this.paperUsed = paperUsed;
	}
	
}
