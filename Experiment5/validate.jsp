<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import = "java.sql.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
String User=request.getParameter("username");
String Pwd=request.getParameter("password");

Connection conn = null;
String url = "jdbc:mysql://localhost:3306/newsdb";

try{
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url,"root","root");
}
catch(Exception e)
{}
Statement stmt=null;
String sql="select password from user where username = '"+User+"'";
java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);
if(rs.next())
{
	if(Pwd.equals(rs.getString("password")))
	{
		out.println("欢迎您！"+User);
		String newsql="select * from newsdb.user where username = '"+User+"'";
		ResultSet rss=stmt.executeQuery(newsql);
		if(rss.next())
		{
			//Date time=rss.getDate("lastLoginTime");
			//out.print("上次登陆时间: "+sdf.format(time));
			String time=rss.getString("lastLoginTime");
			out.print("最近登陆时间为: "+time);
		}
		java.util.Date now=new java.util.Date(java.util.Calendar.getInstance().getTimeInMillis());
		stmt.executeUpdate("update newsdb.user set lastLoginTime=now() where username='"+User+"'");
	}
	else
	{
	out.println("<script LANGUAGE = 'javascript'>alert('密码错误');history.go(-1);</script>");
	}
}
rs.close();
conn.close();
%>
</body>
</html>