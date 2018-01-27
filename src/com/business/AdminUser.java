package com.business;

import com.DBQuery.DataProcess;

/**
 * 继承User类，描述管理员用户
 */
public class AdminUser extends User {

    private Object object; // session.getAttribute()返回的对象

    public AdminUser(int id, String userName, String passWord) {
        super(id, userName, passWord);
    }

    /**
     * 通过获取管理员adminname参数后返回的对象来构造管理员，通过判断对象是否为null，判断管理员是否登录
     * @param object session.getAttribute()返回的对象
     */
    public AdminUser(Object object) {
        super();
        this.object = object;
    }

    /**
     * 根据用户名，密码判断是否合法性
     * @return 合法true
     */
    public boolean checkLegal() {
        String sql = "select count(*) from users where username='" + userName + "' and password='" + passWord +
                "' and type='admin'";
        int count = Integer.parseInt(DataProcess.getSingleResult(sql, "count(*)"));
        return count > 0 ? true : false;
    }

    /**
     * 根据session.getAttribute()返回的对象是否为null，判断此页面是否已经登录
     * @return 未登录则返回JavaScript语句，跳转到登录界面；已登录则返回空字符串
     */
    public String checkLogin() {
        if (object == null) {
            return "<SCRIPT language=javascript>alert('管理员请先登录...');location.href='login.jsp';</SCRIPT>";
        } else {
            return "";
        }
    }
}
