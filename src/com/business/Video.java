package com.business;

import com.DBQuery.DataProcess;

import java.util.ArrayList;
import java.util.List;

/**
 * 描述视频资源，对应数据库中的videos表
 */
public class Video {

    private String number; // 序号
    private String title; // 视频标题
    private String youkuURL; // 优酷地址
    private String imgUrl; // 封面图片地址
    private String time; // 视频市场
    public static final String TABLENAME = "videos";
    public static final String ORDERNUMBER = "order_number";
    public static final String VIDEOTITLE = "video_title";
    public static final String YOUKUPATH = "youku_path";

    public Video(String title) {
        this.title = title;
    }

    public Video(String title, String number) {
        this.title = title;
        this.number = number;
    }

    public Video(String number, String title, String youkuURL, String imgUrl, String time) {
        this.number = number;
        this.title = title;
        this.youkuURL = youkuURL;
        this.imgUrl = imgUrl;
        this.time = time;
    }

    public String getShortTitle() {
        String shortTitle = title;
        if (shortTitle.length() > 29) {
            shortTitle = shortTitle.substring(0, 27) + "...";
        }
        return shortTitle;
    }

    public static List<Video> getNextSixVideos(int number) {
        List<Video> videoList = new ArrayList<>();
        String sql = "select * from videos where order_number>" + number + " order by order_number limit 6";
        DataProcess.loadVideoList(sql, videoList);
        return videoList;
    }

    public static String getPreDis(int page) {
        return page == 1 ? "disabled" : "";
    }

    public static String getNexDis(int page) {
        return page == 6 ? "disabled" : "";
    }

    public static String getPageColor(int page, int number) {
        return page == number ? "#000000" : "#AAAAAA";
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getYoukuURL() {
        return youkuURL;
    }

    public void setYoukuURL(String youkuURL) {
        this.youkuURL = youkuURL;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
