<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<head>
<title>SELECT操作</title>
</head>

<BODY>
<%  
	try {  
	Class.forName("com.mysql.jdbc.Driver");  ////加载数据库驱动
	String url = "jdbc:MySQL://localhost:3306/news?&useSSL=false&serverTimezone=UTC"; //指向数据库table1
	String username = "root";  //数据库用户名
	String password = "313182";  //数据库用户密码
	Connection conn = DriverManager.getConnection(url, username, password);  //连接数据库
	if(conn != null){  
		out.print("数据库连接成功！");
		out.println("<br />"); 
		out.println("-------------------------------"); 
		out.print("<br />");              			
		}
		else{  
			out.print("连接失败！");  
              }           
        }
		catch (Exception e) {        
            out.print("数据库连接异常！");  
             }  
%>      
</body>
</html>