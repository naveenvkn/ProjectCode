
<%@ page language="java" contentType="text/html" import="java.sql.*"%>
<%@ page import="java.util.*"%>

<html>
<meta http-equiv="pragma" content="no-cache">
<% String log=(String)session.getAttribute("login");
	if(log!=null)
	{
%>
<body background="C:\Program Files\Apache Software Foundation\Tomcat 6.0\webapps\asset\ma.jpg" >
<form name=n1 method="post" action="chn2.jsp">
<%! String imt,mno,mdate,ast,ides,imake,pstat,res,recon,sql,bname,ecode,type,ename,mail,ecode1,ename1,type1,mail1,ncal,lcal,col,adate;
		int sno;
	%>
	<% boolean flag1=false,flag2=false,f=false;
	%>
	<% mno=request.getParameter("mno");
		ecode1=request.getParameter("ecode");
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
			sql="select * from Asthistory where branch='"+bname+"'and Manfno='"+mno+"' and pstatus='open'";
			rs=st.executeQuery(sql);
			
			while(rs.next())
			{
				flag1=true;
				imt=rs.getString(2);
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
				if(ecode1.equals(ecode))
				{
					out.println("<h3><center>Already alloted</center></h3>");
					break;
				}
				
			}
			sql="select * from Employee where branchname='"+bname+"'and Ecode='"+ecode1+"'";
			rs=st.executeQuery(sql);
			while(rs.next())

			{
				flag2=true;
				ename1=rs.getString(3);
				mail1=rs.getString(4);
				type1=rs.getString(8);
				
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
<table border=0 width="100%">
<th><table border=0 width="300%" align="center">

<tr>
<td align=middle bgColor="#006262" height=103 
    style="WIDTH: 100%; HEIGHT: 30px" vAlign=center width="100%">
	<b><font color=white face=Arial size=4>Change Allocation</font></b></td></tr>
</table></th>

<tr>
<td>
<table align="top" border=0 width="70%" bgcolor="#BAE9E7">
<tr><b><font color="#203E46" face=Arial size=3 align=center >Calibration Details</font></b></tr><br>
<tr>
<td height=40><b><font color=black face=Arial size=2>EmpCode. </font></td><td><input type="text" name="ecode2" value="<%=ecode1%>"/></b></td></tr>
<tr>
<td height=40><b><font color=black face=Arial size=2>EmpName </font></td><td><input type="text" name="ename2" value="<%=ename1%>"/></b></td></tr>
<tr>
<td height=40><b><font color=black face=Arial size=2>EmpType </font></td><td><input type="text" name="type2" value="<%=type1%>"/></b></td></tr>
<tr><td height=40><b><font color=black face=Arial size=2>EmpMail  </font></td><td><input type="text" name="mail2" value="<%=mail1%>"/></b></td>
</tr>
<tr><td height=40><b><font color=black face=Arial size=2>Next CalibDate  </font></td><td><input type="text" name="ncal2" /></b></td>
</tr>
<tr><td height=40><b><font color=black face=Arial size=2>Last CalibDate </font></td><td><input type="text" name="lcal2" /></b></td>
</tr>
<tr><td height=40><b><font color=black face=Arial size=2>LastCalibStkerColor </font></td><td>
<select name="col2">
			<option value="Red" selected>Red
			<option value="Green">Green
			<option value="Yellow">Yellow
			
	</select></b></td>
</tr>

<tr><td height=40><b><font color=black face=Arial size=2>AssetIssuedDate </font></td><td><input type="text" name="adate2" /></b></td>
</tr>

</table>
</td>
<td>
<table border=0 width="70%" bgcolor="#B9D9C9"align="right">
<tr><b><font color="#203E46" face=Arial size=3 align=center >Instrument Details</font></b></tr><br>
<tr>
<td height=40><b><font color=black face=Arial size=2>Manf SNo. </font></td><td><input type="text" name="mno3" value="<%=mno%>"/></b></td></tr>
<tr>
<td height=40><b><font color=black face=Arial size=2>Instruent.Desc </font></td><td><input type="text" name="ides3" value="<%=ides%>"/></b></td></tr>
<tr>
<td height=40><b><font color=black face=Arial size=2>IMTENo. </font></td><td><input type="text" name="imt3" value="<%=imt%>"/></b></td></tr>
<tr><td height=40><b><font color=black face=Arial size=2>Asset Type : </font></td><td>
<input type="text" name="ast3" value="<%=ast%>"/></b></td>
</tr>

<tr><td height=40><b><font color=black face=Arial size=2>Instru.Make :  </font></td><td><input type="text" name="make3" value="<%=imake%>"/></b></td>
</tr>

<tr><td height=40><b><font color=black face=Arial size=2>Manf   Date :</font></td><td><input type="text" name="mdate3" value="<%=mdate%>"/></b></td>
</tr>
<tr><td height=40><b><font color=black face=Arial size=2>Resolution  :</font></td><td><input type="text" name="res3" value="<%=res%>"/></b></td>
</tr>
<tr>
<td height=40><b><font color=black face=Arial size=2>BranchRecAssetOn </font></td><td><input type="text" name="brn3" value="<%=recon%>"/></b></td></tr>

</table>
</td>

<td>

<table align="right" border=0 width="39.5%" bgcolor="#B9D9C9">
<tr><b><font color="#203E46" face=Arial size=3 align=center >Last updated Calibration Details</font></b></tr><br>
<tr>
<td height=40><b><font color=black face=Arial size=2>EmpCode. </font></td><td><input type="text" name="ecode3" value="<%=ecode%>"/></b></td></tr>
<tr>
<td height=40><b><font color=black face=Arial size=2>EmpName </font></td><td><input type="text" name="ename3" value="<%=ename%>"/></b></td></tr>
<tr>
<td height=40><b><font color=black face=Arial size=2>EmpType </font></td><td><input type="text" name="type3" value="<%=type%>"/></b></td></tr>
<tr><td height=40><b><font color=black face=Arial size=2>EmpMail  </font></td><td><input type="text" name="mail3" value="<%=mail%>"/></b></td>
</tr>
<tr><td height=40><b><font color=black face=Arial size=2>Next CalibDate  </font></td><td><input type="text" name="ncal3" value="<%=ncal%>"/></b></td>
</tr>
<tr><td height=40><b><font color=black face=Arial size=2>Last CalibDate </font></td><td><input type="text" name="lcal3" value="<%=lcal%>"/></b></td>
</tr>
<tr><td height=40><b><font color=black face=Arial size=2>LastCalibStkerColor </font></td><td>
<input type="text" name="col3" value="<%=col%>"/></b></td>
</tr>

<tr><td height=40><b><font color=black face=Arial size=2>AssetIssuedDate </font></td><td><input type="text" name="adate3" value="<%=adate%>"/></b></td>
</tr>

</table>
</td>
</tr>
</table>
<table border=0 width="50%" align="center">
<tr>
<td><input type="submit" name="save" value="             Save     "/></b></td>
<td height=40><input type="reset" name="clear" value="             Clear     "/></b></td>
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
