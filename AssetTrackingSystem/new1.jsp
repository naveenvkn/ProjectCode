
<table border=0 width="99%">
<tr>
<td align=middle bgColor="#006262" height=103 
    style="WIDTH: 100%; HEIGHT: 30px" vAlign=center width="100%">
	<b><font color=white face=Arial size=4>New Allocation</font></b></td></tr>
</table>
<%@ page language="java" contentType="text/html" import="java.sql.*"%>
<%@ page import="java.util.*"%>
<html>
<meta http-equiv="pragma" content="no-cache">
<% String log=(String)session.getAttribute("login");
	if(log!=null)
	{
%>
<body background="C:\Program Files\Apache Software Foundation\Tomcat 6.0\webapps\asset\ma.jpg" >
<form name=n1 method="post" action="new2.jsp">
<%! String imt,mno,mdate,ast,ides,imake,pstat,res,recon,sql,bname,ecode,ename,typ,mail,ncal,lcal,col,adate;
		int sno;
	%>
	<% boolean flag1=false,flag2=false,f=false;
	%>
	<% mno=request.getParameter("mno");
		ecode=request.getParameter("ecode");
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
			sql="select * from instrument where bname='"+bname+"'and mno='"+mno+"'";
			rs=st.executeQuery(sql);
			
			while(rs.next())
			{
				flag1=true;
				imt=rs.getString(2);
				ast=rs.getString(4);
				ides=rs.getString(5);
				imake=rs.getString(6);
				mdate=rs.getString(7);
				recon=rs.getString(8);
				res=rs.getString(10);
				
			}
			sql="select * from Employee where branchname='"+bname+"'and Ecode='"+ecode+"'";
			rs=st.executeQuery(sql);
			while(rs.next())

			{
				flag2=true;
				ename=rs.getString(3);
				mail=rs.getString(4);
				typ=rs.getString(8);
				
			}
			if(flag1)
			{
				if(flag2)
				{
					f=true;
				}
				else
				{
					out.println("<h3> <center>The Emp code does not exist.</h3></center>");
				}
			}
			else
			{
				out.println("<center><h3> The Manfno. does not exist.</h3></center>");
			}
			if(f)
			{
		%>
		<table border=0 width="100%" align="center">
<tr><td>
		<table border=0 width="55%" bgcolor="#BAE9E7"">
<tr><td><b><center><h3>Instrument Details</h3></center></b></td></tr>
<tr>
<td height=40><b><font color=black face=Arial size=2>Manf SNo. </font></td><td><input type="text" name="mno1" value="<%=mno%>"/></b></td></tr>
<tr>
<td height=40><b><font color=black face=Arial size=2>Instruent.Desc </font></td><td><input type="text" name="ides1" value="<%=ides%>"/></b></td></tr>
<tr>
<td height=40><b><font color=black face=Arial size=2>IMTENo. </font></td><td><input type="text" name="imt1" value="<%=imt%>"/></b></td></tr>
<tr><td height=40><b><font color=black face=Arial size=2>Asset Type : </font></td><td>
<input type="text" name="ast1" value="<%=ast%>"/></b></td>
</tr>

<tr><td height=40><b><font color=black face=Arial size=2>Instru.Make :  </font></td><td><input type="text" name="make1" value="<%=imake%>"/></b></td>
</tr>

<tr><td height=40><b><font color=black face=Arial size=2>Manf   Date :</font></td><td><input type="text" name="mdate1" value="<%=mdate%>"/></b></td>
</tr>
<tr><td height=40><b><font color=black face=Arial size=2>Resolution  :</font></td><td><input type="text" name="res1" value="<%=res%>"/></b></td>
</tr>
<tr>
<td height=40><b><font color=black face=Arial size=2>BranchRecAssetOn </font></td><td><input type="text" name="brn1" value="<%=recon%>"/></b></td></tr>


</table>
</td>
<td>
<table border=0 width="55%" bgcolor="#BAE9E7">
<tr><td><b><center><h3>Calibration Details</h3></center></b></td></tr>
<tr>
<td height=40><b><font color=black face=Arial size=2>EmpCode. </font></td><td><input type="text" name="ecod1" value="<%=ecode%>"/></b></td></tr>
<tr>
<td height=40><b><font color=black face=Arial size=2>EmpName </font></td><td><input type="text" name="ename1" value="<%=ename%>"/></b></td></tr>
<tr>
<td height=40><b><font color=black face=Arial size=2>EmpType </font></td><td><input type="text" name="type" value="<%=typ%>"/></b></td></tr>
<tr><td height=40><b><font color=black face=Arial size=2>EmpMail  </font></td><td><input type="text" name="email1" value="<%=mail%>"/></b></td>
</tr>
<tr><td height=40><b><font color=black face=Arial size=2>Next CalibDate  </font></td><td><input type="text" name="ncal1" /></b></td>
</tr>
<tr><td height=40><b><font color=black face=Arial size=2>Last CalibDate </font></td><td><input type="text" name="lcal1" /></b></td>
</tr>
<tr><td height=40><b><font color=black face=Arial size=2>LastCalibStkerColor </font></td><td>
<select name="col1">
			<option value="Red" selected>Red
			<option value="Green">Green
			<option value="Yellow">Yellow
			
	</select></b></td>
</tr>

<tr><td height=40><b><font color=black face=Arial size=2>AssetIssuedDate </font></td><td><input type="text" name="adate1" /></b></td>
</tr>

</table>
</td>
</table>
<table border=0 width="60%" align="center">
<tr>
<td><input type="submit" name="save" value="               Save     "/></b></td>
<td height=40><input type="reset" name="clear" value="                Clear     "/></b></td>
</tr>
</table>
<% }
	}

		catch(Exception ex)
		{
			System.out.println("Error"+ex);

		}
	%>
</form>
</body>
</html>
<% }
	else
	{
		out.println("<html><body><center><h5> SESSION EXPIRED </h5></center></body></html>");
	}
%>
