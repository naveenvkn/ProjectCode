<%@ page language="java" contentType="text/html" import="java.sql.*"%>
<%@ page import="java.util.*"%>

<html>
<meta http-equiv="pragma" content="no-cache">
<body>

<% String log=(String)session.getAttribute("login");
	if(log!=null)
	{
%>
<%@ include file="chn.html"%>
<table align="bottom" border="0" width="90%">
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
	</table>

 <table align="left" border="0" width="90%">
	
	<%! String imt,mno,mdate,ast,ides,imake,pstat,res,recon,sql,bname,ecode,ename,type,mail,ncal,lcal,col,adate;
		int sno;
	%>
	<%  imt=request.getParameter("imt3");
		mno=request.getParameter("mno3");
		mdate=request.getParameter("mdate3");
		ast=request.getParameter("ast3");
		ides=request.getParameter("ides3");
		imake=request.getParameter("make3");
		recon=request.getParameter("brn3");
		String action=request.getParameter("action");
		res=request.getParameter("res3");
		ecode=request.getParameter("ecode2");
		ename=request.getParameter("ename2");
		type=request.getParameter("type2");
		mail=request.getParameter("mail2");
		ncal=request.getParameter("ncal2");
		lcal=request.getParameter("lcal2");
		col=request.getParameter("col2");
		adate=request.getParameter("adate2");
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
			sql="select max(sno) from Asthistory where branch='"+bname+"' and Manfno='"+mno+"'";
			rs=st.executeQuery(sql);
			while(rs.next())
			{
				sno=rs.getInt(1);
			}
			if(ecode!=null && ename!=null && type!=null && mail!=null && ncal!=null && lcal!=null && col!=null )
			{
				sql="update Asthistory set pstatus='closed' where sno="+sno+" and Imtno='"+imt+"'";
				st.executeUpdate(sql);
				sno=sno+1;
				sql="insert into Asthistory values("+sno+",'"+imt+"','"+mno+"','"+ast+"','"+ides+"','"+imake+"','"+mdate+"','"+res+"','"+recon+"','"+ecode+"','"+ename+"','"+type+"','"+mail+"','"+ncal+"','"+lcal+"','"+col+"','"+adate+"','allot','open','"+bname+"')";
			
			st.executeUpdate(sql);
			}
			sql="select * from Asthistory where branch='"+bname+"' and pstatus='open'";
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
<br>

</body>
</html>
<% }
	else
	{
		out.println("<html><body><center><h5> SESSION EXPIRED </h5></center></body></html>");
	}
%>