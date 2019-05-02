<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>B2 Pvt ltd.</title>
<meta name="description" content="NESL - Registration">
<meta name="keywords" content="NESL - Registration">
<meta name="author" content="NESL">
<meta name="theme-color" content="#56cbf7" />

<script type="text/javascript">


function showDiv(){
	var loginAsValue= document.getElementById("loginId").value;
	/* alert(loginAsValue); */
	if(loginAsValue == "Student"){
		document.getElementById("usnField").style.display="block";
		document.getElementById("empField").style.display="none";
	}
	else{
		document.getElementById("usnField").style.display="none";
		document.getElementById("empField").style.display="block";
	}
}



function logout(){
	alert("Do you want to signout?" );
window.location = "bbplLanding.jsp";
}




function validate(){




return true;

  var name = document.getElementById("name").value;
  var mobile = document.getElementById("mobile").value;
  var emailId = document.getElementById("emailId").value;
  var dob = document.getElementById("dob").value;
  var address = document.getElementById("address").value;
  var organization = document.getElementById("organization").value;
  var role = document.getElementById("role").value;
  var employeeId = document.getElementById("employeeId").value;
  var telephoneNumber = document.getElementById("telephoneNumber").value;
        var nameReg = /^[A-Za-z0-9, &'.]+$/;
	    var addressRegex = /^[A-Za-z0-9, &'#:()-/]+$/;
        var nameReg = /^[A-Z a-z]+$/;
        var alphaReg = /^[A-Za-z0-9, ]+$/;
        var numberReg =  /^[0-9]+$/;
        var telephoneRegex = /^(\+91[\-\s]?)?[0]?(91)?[123456789]\d{9}$/;
        var emailReg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/; 
        var panRegex = /[A-Z]{5}\d{4}[A-Z]{1}/;
        var mobileregex= /^([789]{1})([0123456789]{1})([0-9]{8})/;
        var pinregex= /^[1-9][0-9]{5}/;

  /* if(!nameReg.test(name))
  {
    alert("Please Select Correct Name");
	return false;
  }
  if(!mobileregex.test(mobile))
  {
    alert("Please Select Correct Mobiel Number");
	return false;
  }
  if(!emailReg.test(emailId))
  {
    alert("Please Enter Correct Email ID");
	return false;
  }
  if(!addressRegex.test(address))
  {
    alert("Please Enter Correct Address");
	return false;
  }
  if(!nameReg.test(organization))
  {
    alert("Please Enter Organization Name");
	return false;
  }
  if(!numberReg.test(employeeId))
  {
    alert("Please Enter Correct Employee ID");
	return false;
  }
  if(!nameReg.test(telephoneNumber))
  {
    alert("Please Enter Corerct Telephone Number");
	return false;
  }
  
  else{
     return true;
  } */
  
  
}


</script>



<style type="text/css">
	body {
    background: #6F6765  ;
}
.form_field label {
    display: block;
    font-size: 15px;
    font-weight: 600;
    margin-bottom: 5px;
    color: #FFFAF0;
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
    font-family: 'Oxygen',sans-serif;
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
.logo{
	background: url(LOGO.jpg) 0 center no-repeat;
    text-indent: -9999em;
    width: 150px;
    display: inline-block;
    height: 72px;
    padding: 5px 5px;
    background-size: 75%;
}
.header_div {
    background: #808000;
    z-index: 10;
    position: relative;
}
.header_logo{
	display: inline-block;
    
}
.content_wrapper {
    width: 45%;
    margin: 0 auto;
    background-color: #BC8F8F;
    padding: 7%;
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
    font-family: 'Oxygen',sans-serif;
}
.form_field.full_field input {
    width: 20%;
    background-color: #7e3434;
    color: #fff;
    border-radius: 10px;
    border-bottom: 4px solid #380606;
    
}
.form_field.full_field input:hover{
	    box-shadow: 8px 5px 8px #888888;
}
</style>

</head>

<body>
<form action="servlet" method="post">
<div class="main_div">
		
	<div class="page_wrapper">

			<header class="header_div">
				<div class="header_logo">
					<a href="" class="logo"></a>
				</div>
				<div class="header_logo">
					<h2>Attn Management !</h2>
				</div>
			</header>
		<div class="content_wrapper">
			<h1> Dynamic Attn Management!!!</h1>
			<div class="form_field">
				<label>Role*</label>
				<select id="loginId" name="role" onchange="return showDiv();"><option>-Slect role-</option><option>Admin</option><option>Student</option><option>Faculty</option></select>
			</div>
			<div class="form_field">
				<label>Name*</label>
				<input type="text" id="name" name="name" class="name_emp" placeholder="Enter Your Name" autocomplete="off">
			</div>
			<div class="form_field">
				<label>Mobile*</label>
				<input type="text" id="mobile" name="mobile" class="name_emp" placeholder="Enter Mobile Number" autocomplete="off" >
			</div><div class="form_field">
				<label>Email Id*</label>
				<input type="text"  id="emailId" name="emailId" class="name_emp" placeholder="Enter Email Id" autocomplete="off">
			</div>
			<div class="form_field">
				<label>DOB*</label>
				<input type="date" id="dob" name="dob" class="name_emp" placeholder="Enter DOB " autocomplete="off">
			</div>
			<div class="form_field">
				<label>Address*:</label>
				<input type="text" id="address" name="address" class="name_emp" placeholder="Enter Address" autocomplete="off">
			</div>
			<div class="form_field">
				<label>Organization*:</label>
				<input type="text" id="organization" name="organization" class="name_emp" placeholder="Enter Organization" autocomplete="off">
			</div>
			<div class="form_field">
				<label>Branch*:</label>
				<input type="text" id="branch" name="branch" class="name_emp" placeholder="Enter branch" autocomplete="off">
			</div>
			<!-- <div class="form_field">
				<label>Role*:</label>
				<input type="text" id="role" name="role" class="name_emp" placeholder="Enter Role">
			</div> --><div class="form_field" id="empField">
				<label>Employee Id*:</label>
				<input type="text" id="employeeId" name="employeeId" class="name_emp" placeholder="Enter Employee Id" autocomplete="off">
			</div>
			
			<div class="form_field" style="display:none;" id="usnField">
				<label>USN *:</label>
				<input type="text" id="usn" name="usn" class="name_emp" placeholder="Enter Usn" autocomplete="off">
			</div>
			
			<div class="form_field">
				<label>Telephone Number*:</label>
				<input type="text" id="telephoneNumber" name="telephoneNumber" class="name_emp" placeholder="Enter Telephone Number" autocomplete="off">
			</div>
			<div class="form_field full_field">
				<input type="submit" value="Submit" onclick="return validate();">
			</div>
		</div>
	</div>
</div>
</form>
</body>
</html>