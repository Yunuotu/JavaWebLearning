<jsp:include page="head.txt" flush="true"/>
<% 
     String s=request.getParameter("number");
     out.println("<BR>传递过来的值是"+s);
%>
