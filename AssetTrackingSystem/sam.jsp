<%@ page language="java" contentType="text/html" import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!--<html>
<body>
<% String n=request.getParameter("t");
%>
<form name=f >
<input type="text" name=te value="<%=n%>"/>
hai
</form>
</body>
</html>-->
<html>
<META HTTP-EQUIV="Refresh" CONTENT="1">
<body>
<% 
	int i=0;
	String ii = (String) session.getValue("count");
      if (ii!=null) { 
		i = Integer.parseInt(ii);
		out.println("<h1>Counter is: "+i+"<h1>" );
	      
	}
      session.putValue("count",new Integer(i).toString());
%>
</body>
</html>
