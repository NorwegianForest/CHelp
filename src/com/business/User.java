package com.business;

/**
 * 描述用户和管理员的类，对应数据库中的users表
 */
public class User {
    protected int id;
    protected String userName;
    protected String passWord;

    public User() {}

    public User(int id, String userName, String passWord) {
        this.id = id;
        this.userName = userName;
        this.passWord = passWord;
    }

    public User(String userName) {
        this.userName = userName;
        System.out.println("username:" + userName);
    }

    /**
     * 根据用户名参数是否为空，判断此页面是否已经登录
     * @return 未登录则返回JavaScript语句，跳转到登录界面；已登录则返回空字符串
     */
    public String checkLogin() {
        if (userName == null || "".equals(userName) || "null".equals(userName)) {
            return "<SCRIPT language=javascript>alert('请先登录...');location.href='user_login.jsp';</SCRIPT>";
        } else {
            return "";
        }
    }
}
