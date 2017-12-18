<%@ page language="java" contentType="text/html" import="java.sql.*"%>
<%@ page import="java.util.*"%>

<html>
<meta http-equiv="pragma" content="no-cache">
<% String log=(String)session.getAttribute("login");
	if(log!=null)
	{
%>
<body>
<%! String npassword,cpassword,pword,sql;
	%>
	<%  npassword=request.getParameter("t1");
		cpassword=request.getParameter("t2");
	%>
	<%	

		try
		{

			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con=DriverManager.getConnection("jdbc:odbc:instrument");
			Statement st=con.createStatement();
			sql="select * from log where lstatus='yes'";
			ResultSet rs=st.executeQuery(sql);
			while(rs.next())

			{

				pword=rs.getString(2);
				if(npassword.equals(cpassword))
				{
					sql="update log set password='"+npassword+"' where password like '"+pword+"'";
					st.executeUpdate(sql);
					out.println("sucessfully updated");
	%>
	<jsp:forward page="main.html"/>
	<% break;
		}
		else
		{
	%>
	<jsp:forward page="pass.html"/>
	<center><font color=red size=4>The password is incorrect</font></center>
	
	<%
		}
		}
		}

		catch(Exception ex)
		{
			out.println("Error"+ex);

		}
	%>
	<% }
	else
	{
		out.println("<html><body><center><h5> SESSION EXPIRED </h5></center></body></html>");
	}
%>