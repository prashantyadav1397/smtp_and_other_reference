<%@ page language="java" import="java.sql.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"                                                    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">

function logout(){
	alert("Do you want to signout?" );
window.location = "index.jsp";
}
</script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
<form method="post">

<table border="2">
<tr>
<td>Name</td>
<td>Mobile</td>
<td>EmailId</td>
<td>Dob</td>
<td>Address</td>
<td>Organization</td>
<td>Role</td>
<td>Employee Id</td>
<td>Telephone Number</td>
</tr>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/test";
String username="root";
String password="root";
String query="select * from Register";
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{

%>
    <tr><td><%=rs.getString("name") %></td><td><%=rs.getString("mobile") %></td><td><%=rs.getString("emailId") %></td><td><%=rs.getString("dob") %></td><td><%=rs.getString("address") %></td><td><%=rs.getString("organization") %></td><td><%=rs.getString("role") %></td><td><%=rs.getString("employeeId") %></td><td><%=rs.getString("telephoneNumber") %></td></tr>
        <%

}
%>
    </table>
    <%
    rs.close();
    stmt.close();
    conn.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }




%>
<input type="button" value="Logout" style="margin-left: 90%;" onclick="return logout();">
</form>
</html> 