<%@ page language="java" contentType="text/html" import="java.sql.*"%>
<%@ page import="java.util.*"%>

<html>
<meta http-equiv="pragma" content="no-cache">
<% String log=(String)session.getAttribute("login");
	if(log!=null)
	{
%>
<body>
<%! int sn;
	String sql,bname;
%>
<% sn=Integer.parseInt(request.getParameter("del"));
%>
<%	
		try
		{

			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con=DriverManager.getConnection("jdbc:odbc:instrument");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from log where lstatus='yes'");
			while(rs.next())
			{
				bname=rs.getString(4);
			}
			sql="delete from instrument where Sno="+sn+" and bname='"+bname+"'";
			st.executeUpdate(sql);
%>
			<jsp:forward page="ins.jsp"/>
			<%
			}

		catch(Exception ex)
		{
			out.println("Error"+ex);

		}
	%>
	</body>
</html>
	<% }
	else
	{
		out.println("<html><body><center><h5> SESSION EXPIRED </h5></center></body></html>");
	}
%>

