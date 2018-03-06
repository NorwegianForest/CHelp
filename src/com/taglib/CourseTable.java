package com.taglib;

import com.DBQuery.DataProcess;
import com.business.Course;

import java.util.ArrayList;
import java.util.List;

public class CourseTable {

    private List<Course> courseList;

    public CourseTable() {
        String sql = "select * from course";
        courseList = new ArrayList<>();
        DataProcess.loadCourseList(sql, courseList);
    }

    public List<Course> getCourseList() {
        return courseList;
    }

    public void setCourseList(List<Course> courseList) {
        this.courseList = courseList;
    }
}
