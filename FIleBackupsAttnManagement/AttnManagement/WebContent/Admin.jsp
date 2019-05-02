<%@ page language="java" import="java.sql.*"%> 
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Smart Attendance management System</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
  
  
 <script type="text/javascript">
	function noticeBoard() {
		document.getElementById("noticeBoard2").style.display="block";
		document.getElementById("noticeBoard1").style.display="none";
		document.getElementById("attendanceDetails").style.display="none";
		//alert("I got a hit from Notice Borad Button!!!!!!!!!!!!!!");
	}
	function attendanceDetails() {
		document.getElementById("noticeBoard2").style.display="none";
		document.getElementById("noticeBoard1").style.display="none";
		document.getElementById("attendanceDetails").style.display="block";
		//alert("I got a hit from Notice Borad Button!!!!!!!!!!!!!!");
	}
	function logout(){
		 window.location.href = "index.jsp";
	}
</script>
  
  
  
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    .navbar-inverse{
      background-color: #996600;
          
    }
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <img src="logo.png" alt="Smiley face" height="70" width="180">
      <!-- <a class="navbar-brand" href="#">Logo</a> -->
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
    <h1 style="color:white;"><b>&nbsp &nbsp &nbsp &nbsp &nbsp Welcomes you to Admin Dashborad of GFMS.&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" value="Logout" style="color:red;" onclick="return logout();"></b></h1>
     <!--  <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="UpdateInformation.html">About</a></li>
        <li><a href="#">Projects</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul> -->
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">    
  <div class="row content">
  
  
    <div class="col-sm-2 sidenav">
      <p><input type="button" value="Notice Board" onclick="return noticeBoard(); "></p>
      <p><input type="button" value="Attendance Details" onclick="return attendanceDetails(); "></p>
      <p><input type="button" value="Admission Details" onclick="return noticeBoard(); "></p>
      <p><input type="button" value="Placement Services" onclick="return noticeBoard(); "></p>
      <p><input type="button" value="Financial Management" onclick="return noticeBoard(); "></p>
      <p><input type="button" value="Extra Activities of collge" onclick="return noticeBoard(); "></p>
      <p><input type="button" value="Hiring Employees" onclick="return noticeBoard(); "></p>
      <p><input type="button" value="Organizational Maintainance" onclick="return noticeBoard(); "></p>
      <p><input type="button" value="Tieup with other organization" onclick="return noticeBoard(); "></p>
      <p><input type="button" value="Personal meetings" onclick="return noticeBoard(); "></p>
        <p><input type="button" value="MyProfile" onclick="return noticeBoard(); "></p>
 
    </div>



			<div class="col-sm-8 text-left" id="noticeBoard1">
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
						try {
							Class.forName("com.mysql.jdbc.Driver");
							String url = "jdbc:mysql://localhost/test";
							String username = "root";
							String password = "root";
							String query = "select * from Register";
							Connection conn = DriverManager.getConnection(url, username, password);
							Statement stmt = conn.createStatement();
							ResultSet rs = stmt.executeQuery(query);
							while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("name")%></td>
						<td><%=rs.getString("mobile")%></td>
						<td><%=rs.getString("emailId")%></td>
						<td><%=rs.getString("dob")%></td>
						<td><%=rs.getString("address")%></td>
						<td><%=rs.getString("organization")%></td>
						<td><%=rs.getString("role")%></td>
						<td><%=rs.getString("employeeId")%></td>
						<td><%=rs.getString("telephoneNumber")%></td>
					</tr>
					<%
						}
					%>
				</table>
				<%
					rs.close();
						stmt.close();
						conn.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</div>


			<div class="col-sm-8 text-left" style="display: none;"
				id="noticeBoard2">
				<form action="noticeBoardServlet" method="post">
					<table>
						<tr>
							<td>Branch:</td>
							<td><input type="text" name="branch"></td>
						</tr>
						<tr>
							<td>Time Line:</td>
							<td><input type="text" name="timeLine"></td>
						</tr>
						<tr>
							<td>Notice Board:</td>
							<td><textarea rows="10" cols="50" name="noticeBoardInfo"></textarea></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="Submit Notice"></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="col-sm-8 text-left" style="display: none;"
				id="attendanceDetails">
				<form action="attendanceDetails" method="post">
					<table>
						<tr>
							<td>Branch:</td>
							<td><input type="text" name="branch"></td>
						</tr>
						<tr>
							<td>Time Line:</td>
							<td><input type="text" name="timeLine"></td>
						</tr>
						<tr>
							<td>Notice Board:</td>
							<td><textarea rows="10" cols="50" name="noticeBoardInfo"></textarea></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="Submit Notice"></td>
						</tr>
					</table>
				</form>
			</div>






			<div class="col-sm-2 sidenav">
      <div class="well">
        <img src="add1.jpg" alt="Smiley face" height="120" width="180">
      </div>
       <div class="well">
        <img src="add2.png" alt="Smiley face" height="120" width="180">
      </div>
      <div class="well">
        <img src="add3.jpg" alt="Smiley face" height="120" width="180">
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>©2019 Smart Attendance Management System. All Rights Reserved.</p>
</footer>

</body>
</html>











