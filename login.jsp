<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logged In Successfully</title>
</head>
<body style="background-color: skyblue;">
<!-- again importing some sql classes -->
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!-- starting database logic here -->

<% 
String username = request.getParameter("username");//as we want to keep it secure so i am implementing the session method i.e
session.putValue("username",username);
String pwd= request.getParameter("pwd");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/steinmetz","root","sagar");
Statement st = con.createStatement();
ResultSet rs= st.executeQuery("Select * from users where username='"+username+"'");
if(rs.next())
{
if(rs.getString(4).equals(pwd))
{
	out.println("welcome "+username+" to Steinmetz Integrated Software Solution's Portal");
	out.println("We are a group of software experts working on different areas of technology like web developement, android application developement and digital");
	out.println("our aim is to provide best qulity softwares solutions to our customers at affordable price,");
	out.println("Thank you for joining us!!");
}
else
{
	out.println("check username and password");
}

}
else
{
	out.println("something went wrong");
}
%>
<div style="margin-left: 650px; margin-top: 30px;">
<a href="index.html" style="background-color: red; padding: 5px;">Home Page</a>
</div>
</body>
</html>