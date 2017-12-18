<%@ page language="java" contentType="text/html" import="java.sql.*"%>
<%@ page import="java.util.*"%>

<html>
<meta http-equiv="pragma" content="no-cache">
<% String log=(String)session.getAttribute("login");
	if(log!=null)
	{
%>
<body>
<%@ include file="report.html"%>
 <table align="center" border="0" width="1000">
	<tr width="120%">
		<th bgcolor="#79BCFF">Sno.</th>
		<th bgcolor="#79BCFF">Emp Code</th>
		<th bgcolor="#79BCFF">Imtno</th>
		<th bgcolor="#79BCFF">Manf SNo</th>
		<th bgcolor="#79BCFF">Asset Type</th>
		<th bgcolor="#79BCFF">Instrument Desc</th>
		<th bgcolor="#79BCFF">Instrment Make</th>
		<th bgcolor="#79BCFF">Manf Date</th>
		<th bgcolor="#79BCFF">Resolution</th>
		<th bgcolor="#79BCFF">Branch recd on</th>
		<th bgcolor="#79BCFF">Emp Name</th>
		<th bgcolor="#79BCFF">Emp type</th>
		<th bgcolor="#79BCFF">Emp mail</th>
		<th bgcolor="#79BCFF">Next cal. Date</th>
		<th bgcolor="#79BCFF">Last cal. Date</th>
		<th bgcolor="#79BCFF">lastcalbrationstikcolr</th>
		<th bgcolor="#79BCFF">AssetIssuedDate</th>
		<th bgcolor="#79BCFF">Status</th>
		<th bgcolor="#79BCFF">pstatus</th>

	</tr>
	<%! String asth,mnoh,imt,mno,mdate,ast,ides,ecod,imake,pstat,stat,res,recon,sql,bname,ecode,ename,type,mail,ncal,lcal,col,adate;
		int sno;
	%>
	<% ecod=request.getParameter("ec");
		
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
		
				sql="select * from Asthistory where branch='"+bname+"' and Empcode='"+ecod+"'";
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
				res=rs.getString(8);
				recon=rs.getString(9);
				ecode=rs.getString(10);
				ename=rs.getString(11);
				type=rs.getString(12);
				mail=rs.getString(13);
				ncal=rs.getString(14);
				lcal=rs.getString(15);
				col=rs.getString(16);
				adate=rs.getString(17);
				stat=rs.getString(18);
				pstat=rs.getString(19);
	%>
	
	<tr>
		<td bgcolor="#BAE9E7">	<% out.println(sno);%></td>
		<td bgcolor="#BAE9E7">	<% out.println(ecode); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(imt); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(mno); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(ast); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(ides); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(imake); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(mdate); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(res); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(recon); %></td>		
		<td bgcolor="#BAE9E7">	<% out.println(ename); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(type); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(mail); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(ncal); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(lcal); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(col); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(adate); %></td>
		<td bgcolor="#BAE9E7">	<% out.println(stat); %></td>
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
