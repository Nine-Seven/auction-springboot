package com.entity;

public class User {
    private Integer userId;

    private String userName;

    private String userPassword;

    private String userCardNo;

    private String userTel;

    private String userAddress;

    private String userPostNumber;

    private Short userIsAdmin;

    private String userQuestion;

    private String userAnswer;

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", userCardNo='" + userCardNo + '\'' +
                ", userTel='" + userTel + '\'' +
                ", userAddress='" + userAddress + '\'' +
                ", userPostNumber='" + userPostNumber + '\'' +
                ", userIsAdmin=" + userIsAdmin +
                ", userQuestion='" + userQuestion + '\'' +
                ", userAnswer='" + userAnswer + '\'' +
                '}';
    }

    public User(Integer userId, String userName, String userPassword, String userCardNo, String userTel, String userAddress, String userPostNumber, Short userIsAdmin, String userQuestion, String userAnswer) {
        this.userId = userId;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userCardNo = userCardNo;
        this.userTel = userTel;
        this.userAddress = userAddress;
        this.userPostNumber = userPostNumber;
        this.userIsAdmin = userIsAdmin;
        this.userQuestion = userQuestion;
        this.userAnswer = userAnswer;
    }

    public User() {
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public String getUserCardNo() {
        return userCardNo;
    }

    public void setUserCardNo(String userCardNo) {
        this.userCardNo = userCardNo == null ? null : userCardNo.trim();
    }

    public String getUserTel() {
        return userTel;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel == null ? null : userTel.trim();
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress == null ? null : userAddress.trim();
    }

    public String getUserPostNumber() {
        return userPostNumber;
    }

    public void setUserPostNumber(String userPostNumber) {
        this.userPostNumber = userPostNumber == null ? null : userPostNumber.trim();
    }

    public Short getUserIsAdmin() {
        return userIsAdmin;
    }

    public void setUserIsAdmin(Short userIsAdmin) {
        this.userIsAdmin = userIsAdmin;
    }

    public String getUserQuestion() {
        return userQuestion;
    }

    public void setUserQuestion(String userQuestion) {
        this.userQuestion = userQuestion == null ? null : userQuestion.trim();
    }

    public String getUserAnswer() {
        return userAnswer;
    }

    public void setUserAnswer(String userAnswer) {
        this.userAnswer = userAnswer == null ? null : userAnswer.trim();
    }
}