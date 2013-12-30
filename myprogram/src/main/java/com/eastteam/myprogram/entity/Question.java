package com.eastteam.myprogram.entity;

public class Question extends IdEntity {

	private String question;
	private String questionType;
	private String questionOptions;
	private String trashed;
	private String business_type;
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
}
