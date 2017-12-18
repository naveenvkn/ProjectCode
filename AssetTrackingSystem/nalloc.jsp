<%@ page language="java" contentType="text/html" import="java.sql.*"%>
<%@ page import="java.util.*"%>
<% String log=(String)session.getAttribute("login");
	if(log!=null)
	{
%>
<html>
<body>

<%@ include file="nalloc.html"%>
 <table align="center" border="0" width="90%">
	<tr>
		<th bgcolor="#79BCFF">Sno.</th>
		<th bgcolor="#79BCFF">Imtno</th>
		<th bgcolor="#79BCFF">Manf SNo</th>
		<th bgcolor="#79BCFF">Asset Type</th>
		<th bgcolor="#79BCFF">Instrument Desc</th>
		<th bgcolor="#79BCFF">Instrment Make</th>
		<th bgcolor="#79BCFF">Manf Date</th>
		<th bgcolor="#79BCFF">pstatus</th>

	</tr>
	<%! String imt,mno,mdate,ast,ides,imake,pstat,res,recon,sql,bname,ecode,ename,type,mail,ncal,lcal,col,adate;
		int sno;
	%>
	<%  imt=request.getParameter("imt");
		mno=request.getParameter("mno");
		mdate=request.getParameter("mdate");
		ast=request.getParameter("ast");
		ides=request.getParameter("des");
		imake=request.getParameter("make");
		recon=request.getParameter("brn");
		String action=request.getParameter("action");
		res=request.getParameter("res");
		ecode=request.getParameter("ecod");
		ename=request.getParameter("ename");
		type=request.getParameter("type");
		mail=request.getParameter("email");
		ncal=request.getParameter("ncal");
		lcal=request.getParameter("lcal");
		col=request.getParameter("col");
		adate=request.getParameter("adate");
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
			if(imt!=null && mno!=null && ast!=null && ides!=null && imake!=null && mdate!=null && ecode!=null)
			{
				sno=1;
			sql="insert into Asthistory values("+sno+",'"+imt+"','"+mno+"','"+ast+"','"+ides+"','"+imake+"','"+mdate+"','"+res+"','"+recon+"','"+ecode+"','"+ename+"','"+type+"','"+mail+"','"+ncal+"','"+lcal+"','"+col+"','"+adate+"','allot','open','"+bname+"')";
			st.executeUpdate(sql);
			}
			sql="select * from Asthistory where branch='"+bname+"'";
			rs=st.executeQuery(sql);
			while(rs.next())

			{

				sno=rs.getInt(1);
				imt=rs.getString(2);
				mno=rs.getString(3);
				ast=rs.getString(4);
				ides=rs.getString(5);
				imake=rs.getString(6);
				mdate=rs.getString(7);
				pstat=rs.getString(19);
	%>
	
	<tr>
		<td bgcolor="#BAE9E7">	<% out.println(sno);%></td>
		<td bgcolor="#BAE9E7">	<% out.println(imt); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(mno); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(ast); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(ides); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(imake); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(mdate); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(pstat); %></td>
		
	</tr>
	
	<%
			}		
		}

		catch(Exception ex)
		{
			System.out.println("Error"+ex);

		}
	%>
	
</table>
</body>
</html>
<% }
	else
	{
		out.println("<html><body><center><h5> SESSION EXPIRED </h5></center></body></html>");
	}
%>