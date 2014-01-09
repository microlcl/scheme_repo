package com.eastteam.myprogram.entity;

public class Question extends IdEntity {

	private String question;
	private String questionType;
	private String questionOptions;
	private String trashed;
	private String business_type;
	private int position;

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
		return business_type;
	}
	public void setBusiness_type(String business_type) {
		this.business_type = business_type;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	
}
