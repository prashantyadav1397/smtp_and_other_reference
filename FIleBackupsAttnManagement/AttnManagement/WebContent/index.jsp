
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page
	import="com.AttnManagement.passwordcreator.CredentialCreatorBean"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Attn Management.</title>
<meta name="description" content="NESL - Registration">
<meta name="keywords" content="NESL - Registration">
<meta name="author" content="NESL">
<meta name="theme-color" content="#56cbf7" />

<script type="text/javascript">
	function validateUser() {
		/* alert("Do you want to signout?" ); */
		window.location = "forgotPasswordValidator.jsp";
	}

	function validate() {

		var captcha = document.getElementById("captcha").value;
		var input = document.getElementById("inputText").value;
		var loginId = document.getElementById("loginId").value;
		var userId = document.getElementById("userId").value;
		var password = document.getElementById("password").value;
		var captcha = document.getElementById("captcha").value;

		var nameReg = /^[A-Za-z0-9, &'.]+$/;
		var addressRegex = /^[A-Za-z0-9, &'#:()-/]+$/;
		var alphaReg = /^[A-Za-z0-9, ]+$/;
		var numberReg = /^[0-9]+$/;

		if (!nameReg.test(loginId)) {
			alert("Please Select Correct Login ID");
			return false;
		}
		if (!nameReg.test(userId)) {
			alert("Please Select Correct User ID");
			return false;
		}
		/*  if(!nameReg.test(password))
		 {
		   alert("Please Enter Correct Password");
		return false;
		 } */
		if (input != captcha) {
			alert("Please Enter Correct Captcha");
			return false;
		} else {
			return true;
		}

	}
</script>

<script>
	var captcha;

	function generateCaptcha() {

		var a = Math.floor((Math.random() * 10));
		var b = Math.floor((Math.random() * 10));
		var c = Math.floor((Math.random() * 10));
		var d = Math.floor((Math.random() * 10));

		captcha = a.toString() + b.toString() + c.toString() + d.toString();

		document.getElementById("captcha").value = captcha;
	}
</script>



<style type="text/css">
body {
	background: #6F6765;
}

.form_field label {
	display: block;
	font-size: 15px;
	font-weight: 600;
	margin-bottom: 5px;
	color: #c02626;
}

.form_field input {
	border: 1px solid #dedede;
	height: 35px;
	width: 60%;
	padding: 0 2%;
	font-size: 15px;
	outline: 0;
	display: block;
	color: #666;
	font-weight: 400;
	font-family: 'Oxygen', sans-serif;
	transition: all .4s ease-in-out;
	-webkit-transition: all .4s ease-in-out;
}

.page_wrapper {
	margin: 0 auto;
	max-width: 1200px;
	position: relative;
	padding: 0 2%;
}

.form_field {
	margin: 15px 2% 5px 0;
	position: relative;
}

.logo {
	background: url(LOGO.jpg) 0 center no-repeat;
	text-indent: -9999em;
	width: 150px;
	display: inline-block;
	height: 72px;
	padding: 5px 5px;
	background-size: 75%;
}

.header_div {
	background: #f5e5e4;
	z-index: 10;
	position: relative;
}

.header_logo {
	display: inline-block;
}

.content_wrapper {
	width: 50%;
	margin: 0 auto;
	background-color: #e9c2ac;
	padding: 2%;
	border: 1px solid #e7bebe;
	border-radius: 2%;
	box-shadow: 10px 10px 5px #888888;
}

.content_wrapper h1 {
	display: block;
	font-size: 24px;
	font-weight: 600;
	margin-bottom: 5px;
	color: #c02626;
}

.header_logo h2 {
	float: left;
	display: block;
	color: #8a0a0a;
	font-size: 30px;
	font-family: 'Oxygen', sans-serif;
}

.form_field.full_field input {
	width: 20%;
	background-color: #7e3434;
	color: #fff;
	border-radius: 10px;
	border-bottom: 4px solid #380606;
}

.form_field.full_field input:hover {
	box-shadow: 8px 5px 8px #888888;
}
</style>

</head>

<body onload="generateCaptcha()">

	<%-- <% CredentialCreatorBean userdto=(CredentialCreatorBean)request.getSession().getAttribute("ccbobj"); %>
     <%=userdto.getUserId() %>
     Username from session:<c:out value="${sessionScope.userDTO}"/> --%>

	<%
		if (request.getSession().getAttribute("userId") != null) {
	%>
	<pre style="background-color: red; font-size: 20px">Congratulations, your registration has been  successfully done with user ID: <input
			type="text" value=<%=request.getSession().getAttribute("userId")%>
			readonly="true"> and Password :<input type="text"
			value=<%=request.getSession().getAttribute("password")%>
			readonly="true">
	</pre>
	<%
		}
	%>

	<form action="LoginController" method="post">


		<div class="main_div">

			<div class="page_wrapper">

				<header class="header_div">
					<div class="header_logo">
						<a href="" class="logo"></a>
					</div>
					<div class="header_logo">
						<h2>Attn Management. !</h2>
					</div>
				</header>
				<div class="content_wrapper">
					<h1>Dynamic Attn Management.!!!</h1>
					<div class="form_field">
						<label>Login As:*</label> <select id="loginId" name="loginId"><option>-Slect
								role-</option>
							<option>Admin</option>
							<option>Student</option>
							<option>Faculty</option></select>

						<!-- <input type="text" id="loginId" name="loginId" class="name_emp" placeholder="Select the EID Type"> -->
					</div>
					<div class="form_field">
						<label>User Id*</label> <input type="text" id="userId"
							name="userId" class="name_emp" placeholder="Enter User Id">
					</div>
					<div class="form_field">
						<label>Password*</label> <input type="password" id="password"
							name="password" class="name_emp" placeholder="Enter Password">
					</div>
					<div class="form_field">
						<label>Captcha* <input type="text" id="captcha"
							readonly="readonly" />
							<button onclick="return generateCaptcha(); strikethrough();">Refresh</button></label>
						<input type="text" id="inputText" placeholder="Enter Captcha "
							required /><br />

					</div>

					<div class="form_field full_field">
						<input type="submit" value="Sign-in" onclick="return validate();"><input
							type="submit" value="ForgotPassword"
							onclick="return validateUser();"> Not yet registered ?<a
							href="RegistrationPage.jsp" class="register">Click here to
							Register.</a>
					</div>
				</div>
			</div>
		</div>



	</form>
</body>
</html>

