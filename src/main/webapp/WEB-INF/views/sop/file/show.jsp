<%--
  Created by IntelliJ IDEA.
  User: w24164
  Date: 2018/2/27
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.sql.Statement" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
    String fid = request.getParameter("fid");
    Connection conn = null;
    Statement st = null;
    ResultSet rs = null;
    //String url = "jdbc:mysql://192.168.126.242:3306/sop";
    //String user = "iot";
    //String pass = "Iot85228800#1";
    String sql = "select file from sop_file where fid=" + fid + "";
    String url = "jdbc:mysql://:3306/ssm-admin?useUnicode=true&characterEncoding=utf-8";
    String user = "root";
    String pass = "root";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        //数据库的地址，密码，用户名
        conn = DriverManager.getConnection(url, user, pass);
        Statement stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
        rs.next();
        byte[] bs = rs.getBytes("file");
        //改成PDF类型 application/pdf;charset=UTF-8
        response.setContentType("application/pdf;charset=UTF-8");
        //response.setContentType("image/jpeg");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        response.addHeader("Cache-Control", "no-cache");//浏览器和缓存服务器都不应该缓存页面信息
        response.addHeader("Cache-Control", "no-store");//请求和响应的信息都不应该被存储在对方的磁盘系统中；
        response.addHeader("Cache-Control", "must-revalidate");
        Cookie c = new Cookie("livetime", "alive");
        c.setMaxAge(500);
        response.addCookie(c);
        response.getOutputStream().write(bs);
        out.clear();
    }catch (Exception e){
        System.out.println(e);
    }finally {
        try {
            rs.close();
        } catch (Exception e) {
        }
        try {
            st.close();
        } catch (Exception e) {
        }
        try {
            conn.close();
        } catch (Exception e) {
        }
    }
%>