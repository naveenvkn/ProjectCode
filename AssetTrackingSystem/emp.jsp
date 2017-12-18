<%@ page language="java" contentType="text/html" import="java.sql.*"%>
<%@ page import="java.util.*"%>

<html>
<meta http-equiv="pragma" content="no-cache">
<% String log=(String)session.getAttribute("login");
	if(log!=null)
	{
%>
<body>
<%@ include file="empl.html"%>
 <table align="center" border="0" width="90%">
	<tr>
		<th bgcolor="#79BCFF">Sno.</th>
		<th bgcolor="#79BCFF">Emp_Code</th>
		<th bgcolor="#79BCFF">Emp_Name</th>
		<th bgcolor="#79BCFF">Emp_Mail</th>
		<th bgcolor="#79BCFF">Department_Name</th>
		<th bgcolor="#79BCFF">Role</th>
		<th bgcolor="#79BCFF">Company</th>
		<th bgcolor="#79BCFF">Type</th>

	</tr>
	<%! String code,ecod,ename,mail,dept,role,cmp,type,sql,bname;
		int sno;
		boolean flag;
	%>
	<%  ecod=request.getParameter("ecod");
		ename=request.getParameter("ename");
		mail=request.getParameter("mail");
		dept=request.getParameter("dept");
		role=request.getParameter("role");
		cmp=request.getParameter("cmp");
		type=request.getParameter("type");
		String action=request.getParameter("action");
		flag=true;
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
			sql="select * from employee where branchname='"+bname+"'";
			rs=st.executeQuery(sql);
			while(rs.next())
			{
				sno=rs.getInt(1);
				code=rs.getString(2);
				if(code.equals(ecod))
				{
					flag=false;
				}
			}
			if(flag)
			{
		
			if(ecod!=null && ename!=null && mail!=null && dept!=null && role!=null && cmp!=null && type!=null)
			{
				sno=sno+1;
			sql="insert into employee values("+sno+",'"+ecod+"','"+ename+"','"+mail+"','"+dept+"','"+role+"','"+cmp+"','"+type+"','"+bname+"')";
			st.executeUpdate(sql);
			}

			}
			else
			{
				out.println(ecod+" Emp code already exists");
			}
			sql="select * from employee where branchname='"+bname+"'";
			rs=st.executeQuery(sql);
			while(rs.next())

			{
				sno=rs.getInt(1);
				ecod=rs.getString(2);
				ename=rs.getString(3);
				mail=rs.getString(4);
				dept=rs.getString(5);
				role=rs.getString(6);
				cmp=rs.getString(7);
				type=rs.getString(8);
				
	%>
	
	<tr>
		<td>	<% out.println(sno); %></td>
		<td>	<% out.println(ecod);%></td>
		<td>	<% out.println(ename); %></td>
		<td>	<% out.println(mail); %></td>
		<td>	<% out.println(dept); %></td>
		<td>	<% out.println(role); %></td>
		<td>	<% out.println(cmp); %></td>
		<td>	<% out.println(type); %></td>
		<td>    <A HREF='emp1.html?action=delete'>Delete</A></td>
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