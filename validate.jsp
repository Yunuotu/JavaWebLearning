<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import = "ex5pro2.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>验证页面</title>
</head>
<body>
<%
String name=request.getParameter("username");
String Pwd=request.getParameter("password");
User user=UserDAO.searchByUsername(name);
if(name!=null&&name.equals(user.getUsername()))
{
	if(Pwd.equals(user.getPassword()))
	{
		out.println("登陆成功");
		out.print("上次登录时间为："+user.getLastLoginTime());
		UserDAO.update(user);
	}
	else
	{
		out.print("密码不正确");
	}
}
else
{
	out.print("用户名不存在");
}
%>
</body>
</html>