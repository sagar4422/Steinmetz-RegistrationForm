<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registered Successfully</title>
</head>
<body style="background-color: skyblue;">
<!-- I have to import java sql library i.e -->
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"  %>
<!-- Starting with the databse connection logic -->
<%
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String username = request.getParameter("username");
String pwd = request.getParameter("pwd");
String address = request.getParameter("address");
String phone = request.getParameter("phone");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/steinmetz","root","sagar");
Statement st = con.createStatement();//creating a temp object
ResultSet rs;
int i = st.executeUpdate("INSERT INTO users VALUES('"+fname+"','"+lname+"','"+username+"','"+pwd+"','"+address+"','"+phone+"')");

//after this we should send user a message that he is registered successfully

 out.println("Registered Successfully, you can login now");

%>
<div style="margin-left: 560px; margin-top: 75px;">
<a href="login.html" style="background-color: red; padding: 5px;">Login</a>
<a href="index.html" style="background-color: red; padding: 5px;">Home</a>
</div>
</body>
</html>