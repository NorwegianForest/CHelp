package com.business;

import com.DBQuery.DataProcess;

import java.util.ArrayList;
import java.util.List;

public class Course {

    private int id;
    private String title;
    private String startDate;
    private String endDate;
    private String introduce;
    private String imgUrl;
    private int teacherId;
    private TeacherUser teacherUser;
    private List<Paper> paperList;

    public Course(int id) {
        this.id = id;
        DataProcess.loadCourse(this.id, this);
        paperList = new ArrayList<>();
        String sql = "select * from papers where course_id=" + id;
        DataProcess.loadPaperList(sql, this.paperList);
        this.teacherUser = new TeacherUser(this.teacherId);
    }

    public Course(String title, String startDate, String endDate, String introduce) {
        this.title = title;
        this.startDate = startDate;
        this.endDate = endDate;
        this.introduce = introduce;
    }

    public Course(int id, String title, String startDate, String endDate, String introduce, int teacherId) {
        this.id = id;
        this.title = title;
        this.startDate = startDate;
        this.endDate = endDate;
        this.introduce = introduce;
        this.teacherId = teacherId;
    }

    public Course(int id, String title, String startDate, String endDate, String introduce, String imgUrl, int teacherId) {
        this.id = id;
        this.title = title;
        this.startDate = startDate;
        this.endDate = endDate;
        this.introduce = introduce;
        this.imgUrl = imgUrl;
        this.teacherId = teacherId;
    }

    public boolean isJoin(String username) {
        int userId = DataProcess.findUserId(username);
        String sql = "select * from user_course where user_id=" + userId + " and course_id=" + id;
        return DataProcess.isExist(sql);
    }

    public static List<Course> getFirstSixCourseList() {
        List<Course> courseList = new ArrayList<>();
        String sql = "select * from course limit 6";
        DataProcess.loadCourseList(sql, courseList);
        return courseList;
    }

    public TeacherUser getTeacher() {
        return DataProcess.findTeacher(teacherId);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getIntroduce() {
        return introduce;
    }

    public String getHTMLIntroduce() {
        return introduce.replaceAll(" ", "&nbsp;").replaceAll("\r\n", "<br>");
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public List<Paper> getPaperList() {
        return paperList;
    }

    public void setPaperList(List<Paper> paperList) {
        this.paperList = paperList;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public TeacherUser getTeacherUser() {
        return teacherUser;
    }

    public void setTeacherUser(TeacherUser teacherUser) {
        this.teacherUser = teacherUser;
    }
}
