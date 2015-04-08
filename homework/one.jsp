<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
<title>one.jsp</title>
</head>
<body>
<%  
    String num=request.getParameter("number");
    if(num==null)
    { num="0";
    }
    try
    {
       int n=Integer.parseInt(num);
       if(n>=1&&n<=100)
       {
%>      <jsp:forward page="two.jsp" >
          <jsp:param name="number" value="<%=n%>" />
        </jsp:forward>
<%     }
     }
    catch(Exception e)
     {
%>      <jsp:forward page="error.jsp" > 
           <jsp:param name="mess" value="<%=e.toString()%>" />
        </jsp:forward>
<%   }
%>
<jsp:include page="head.txt" flush="true"/>
<form action="one.jsp" method="post">
<table>
<tr><td>
请输入一个数:
</td>
<td><input type="text" name="number"/></td>
</tr>
<tr><td colspan="2">
<input type="submit" value="确定"/>
</td></tr>
</table>
</form>

</body>
</html>
