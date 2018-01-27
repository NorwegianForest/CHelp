package com.business;

/**
 * 描述视频资源，对应数据库中的videos表
 */
public class Video {

    private String number; // 序号
    private String title; // 视频标题
    private String youkuURL; // 优酷地址
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
}
