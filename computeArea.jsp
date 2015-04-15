<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="triangle" class="com.haikang.Triangle" scope="request"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>computeArea</title>
</head>
<body>
<%--
int first=Integer.parseInt(request.getParameter("a"));
int second=Integer.parseInt(request.getParameter("b"));
int third=Integer.parseInt(request.getParameter("c"));
--%>
<%--
String first=request.getParameter("a");
String second=request.getParameter("b");
String third=request.getParameter("c");
--%>
首先使用jsp:setProperty为三角形三边赋值为3，4，5<br>
<jsp:setProperty property="a" param="first" name="triangle"/>
<jsp:setProperty property="b" param="second" name="triangle"/>
<jsp:setProperty property="c" param="third" name="triangle"/>
<br>
然后使用jsp:getProperty取得triangle对象三边的值。<br>
<%out.print("c=");%>
<jsp:getProperty property="c" name="triangle"/><br>
<%out.print("b=");%>
<jsp:getProperty property="b" name="triangle"/><br>
<%out.print("a=");%>
<jsp:getProperty property="a" name="triangle"/><br>
<%out.print("最后计算面积");%>
<jsp:getProperty property="area" name="triangle"/><br>
</body>
</html>