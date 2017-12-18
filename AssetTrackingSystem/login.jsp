<%@ page language="java" contentType="text/html" import="java.sql.*"%>
<%@ page import="java.util.*"%>
<html>
<body background="C:\Program Files\Apache Software Foundation\Tomcat 6.0\webapps\asset\log.jpg" >
<%! String uname,password,pword,sql,name;
	Boolean flag;
	%>
	<%  uname=request.getParameter("t1");
		password=request.getParameter("t2");
		session.setAttribute("login",uname);
		flag=false;
	%>
	<%	

		try
		{

			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con=DriverManager.getConnection("jdbc:odbc:instrument");
			Statement st=con.createStatement();
			sql="select * from log where username='"+uname+"'";
			ResultSet rs=st.executeQuery(sql);
			while(rs.next())

			{
				name=rs.getString(1);
				pword=rs.getString(2);
				if((name.equals(uname)) && (pword.equals(password)))
				{
					sql="update log set lstatus='yes' where password like '"+pword+"'";
					st.executeUpdate(sql);
					flag=true;
	%>
	<jsp:forward page="main.html" />
	<% break;
		}
		else
		{
		flag=false;
		}
		}
		if(!flag)
		{
	%>
	
	<jsp:forward page="relogin.html" />
	
	
	<%}
		}

		catch(Exception ex)
		{
			out.println("Error"+ex);

		}
	%>