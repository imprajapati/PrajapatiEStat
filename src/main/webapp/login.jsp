<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Real EState Website</title>
</head>

   <link rel="stylesheet" href="Resources/css/logincss.css">
     <!--    <link rel="stylesheet" href="Resources/css/style.css"> -->
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">  --> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
<body>

<form action="SignUp" method="get">
<div id="container" class="container">
		<!-- FORM SECTION -->
		<div class="row">
			<!-- SIGN UP -->
			<div class="col align-items-center flex-col sign-up">
				<div class="form-wrapper-reg align-items-	center">
					<div class="form sign-up">
					
							<label> <h2>Registration</h2></label>
						<div class="input-group">
							<i class='bx bxs-user'></i>
							<input type="text" placeholder="First Name" id="fname" name="fname">
						</div>
						<div class="input-group">
							<i class='bx bxs-user'></i>
							<input type="text" placeholder="Last Name" id="lname" name="lname">
						</div>
						<div class="input-group">
							<i class='bx bx-mail-send'></i>
							<input type="email" placeholder="Email" id="email" name="email">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i>
							<input type="password" placeholder="Password" id="pwd" name ="pwd">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i>
							<input type="text" placeholder="Mobile Number" id="mobile_no" name="mobile_no">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i>
							<input type="text" placeholder="Address" name="address" id="address" >
						</div>
						<button type="submit" id="btnSubmit" onclick="return Validate()";>
							Sign up
						</button>
						<p>
						
							<span>
								Already have an account?
							</span>
							<b onclick="toggle()" class="pointer">
								Sign in here
								
							</b>
						</p>
						
					</div>
				</div>
			
			</div>
			</form>
			<!-- END SIGN UP -->
			<!-- SIGN IN -->
			<form action="Login" method="post" name="loginform" onsubmit="return loginvalidation() ">
			<div class="col align-items-center flex-col sign-in">
				<div class="form-wrapper-log align-items-center">
					<div class="form sign-in">	<label><h2> Login</h2></label>
						<div class="input-group">
							<i class='bx bxs-user'></i>
							<input type="text" placeholder="Username" id="email" name ="email">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i>
							<input type="password" placeholder="Password" id="pwd" name ="pwd">
						</div>
						<button type="submit" id="btnSubmit" onclick="return Validate()";>
							Sign in
						</button>
						<p>
						<!-- 	 <b class="pointer" onclick="resetPassword()">Forgot password?</b>  -->
							  <b class="pointer"> <a href="ResetPassword.jsp">Forgot password?</a></b> 
						
						</p>
						<p>
							<span>
								Don't have an account?
							</span>
							<b onclick="toggle()" class="pointer">
								Sign up here
							</b>
							 <c:if test="${not empty errormsg}">
        <div>
        <h3 style="color: red;">${errormsg}</h3>
        </div>
        </c:if>
						</p>
					</div>
				</div>
				<div class="form-wrapper">
		
				</div>
			</div>
			<!-- END SIGN IN -->
		</div>
		<!-- END FORM SECTION -->
		<!-- CONTENT SECTION -->
		<div class="row content-row">
			<!-- SIGN IN CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="text sign-in">
					<h2>
						Welcome
					</h2>
	
				</div>
				<div class="img sign-in">
		
				</div>
			</div>
			<!-- END SIGN IN CONTENT -->
			<!-- SIGN UP CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="img sign-up">
				
				</div>
				<div class="text sign-up">
					<h2>
						Join with us
					</h2>
	
				</div>
			</div>
			<!-- END SIGN UP CONTENT -->
		</div>
		<!-- END CONTENT SECTION -->
	</div>
	</form>
	
<!-- 	 <div class="form-gap"></div>
<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="text-center">
                  <h3><i class="fa fa-lock fa-4x"></i></h3>
                  <h2 class="text-center">Forgot Password?</h2>
                  <p>You can reset your password here.</p>
                  <div class="panel-body">
    
                    <form id="register-form" role="form" autocomplete="off" class="form" method="post">
    
                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                          <input id="email" name="email" placeholder="email address" class="form-control"  type="email">
                        </div>
                      </div>
                      <div class="form-group">
                        <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit">
                      </div>
                      
                      <input type="hidden" class="hide" name="token" id="token" value=""> 
                    </form>
    
                  </div>
                </div>
              </div>
            </div>
          </div>
	</div>
</div> -->
	
<%-- <c:forEach var="par" items="${userList}">	 --%> 
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"  onclick="close()">&times;</button>
          <h4 class="modal-title">Reset Password </h4>
        </div>
        <div class="modal-body"  id="resetPwd">
      <form id="d">

Email:- <input type="text" name="email"  id="email" placeholder="Enter mail" ><br>

<br>
<a href="#" onclick="sendOtp()"> <i class="fas fa-tag"></i> Send Otp  </a>
<br>
<div id="password" style="display: none">
OTP:- <input type="text" name= "OTP" id="otp" placeholder="Enter Otp  sent to your email id" ><br>
Password:- <input  type="text" name="password"   id="setPwd" placeholder="Set new password"  />

</div>
<br>
<br>
<button type="button" onclick="setPaasword()">Change password</button>
</form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="close()">Close</button>
        </div>
      </div>
      
    </div>
  </div>

<%-- </c:forEach> --%>
<script type="text/javascript">

function resetPassword(){
	
	
	alert("for got pwd")
	$('#d')[0].reset();
	 $('#myModal').modal('show');

	
}




function sendOtp(){
	
	
	
	alert("otp sent")
	
	
	
	
	
	
	 var email=document.getElementById("email").value;
	 var otp=document.getElementById("otp").value;
	 //.innerHTML=xhr.responseText;
		
		var xhr = new XMLHttpRequest();
		xhr.open("Post", 'ManagePassword', true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.onreadystatechange = function() {
		    if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
		        // Request finished. Do processing here.
		        
		        alert(xhr.responseText);
		        $('#password').show();
		        
		        
		    }
		}
		xhr.send("action=sendOtp&email="+email+"&otp="+otp);
	
	
	
}


function setPaasword(){
	
	alert("set password")
	
	
	
	var email=document.getElementById("email").value;
	 var otp=document.getElementById("otp").value;
	 var newPass=document.getElementById("setPwd").value;
	 
		var xhr = new XMLHttpRequest();
		xhr.open("Post", '/ManagePassword', true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.onreadystatechange = function() {
		    if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
		        // Request finished. Do processing here.
		        
		        alert(xhr.responseText);
		        $('#password').show();
		        
		        
		    }
		}
		xhr.send("action=setNewPassword&email="+email+"&otp="+otp+"&newPassword="+newPass);
	
	
	
}

let container = document.getElementById('container')

toggle = () => {
	container.classList.toggle('sign-in')
	container.classList.toggle('sign-up')
}

setTimeout(() => {
	container.classList.add('sign-in')
}, 200)


</script>  


<!-- 
 <script type="text/javascript">
    
  
    //Alphanumeric values only Validation
    $(function () {
            $("#fname").keypress(function (e) {
                var keyCode = e.keyCode || e.which;
     
                $("#lblError").html("");
     
                //Regex for Valid Characters i.e. Alphabets and Numbers.
                var regex = /^[A-Za-z0-9]+$/;
     
                //Validate TextBox value against the Regex.
                var isValid = regex.test(String.fromCharCode(keyCode));
                if (!isValid) {
                    $("#lblError").html("Only Alphabets and Numbers allowed.");
                }
     
                return isValid;
            });
        });
  
    $(function () {
        $("#lname").keypress(function (e) {
            var keyCode = e.keyCode || e.which;
 
            $("#lblError").html("");
 
            //Regex for Valid Characters i.e. Alphabets and Numbers.
            var regex = /^[A-Za-z0-9]+$/;
 
            //Validate TextBox value against the Regex.
            var isValid = regex.test(String.fromCharCode(keyCode));
            if (!isValid) {
                $("#lblError").html("Only Alphabets and Numbers allowed.");
            }
 
            return isValid;
        });
    });

    $(document).ready(function () {
                $('.error').hide();
                $('#btnSubmit').click(function () {
                    
                    var email = $('#email').val();
      
                    if (email == '') {
                        $('#email').next().show();
                        return false;
                    }
                    if (IsEmail(email) == false) {
                        $('#invalid_email').show();
                        return false;
                    }
                    
                });
            });


    function IsEmail(email) {
                var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                if (!regex.test(email)) {
                    return false;
                }
                else {
                    return true;
                }
            }


            function Validate() {
            var mobile = document.getElementById("phone").value;
            var pattern = /^\d{10}$/;
            if (pattern.test(mobile)) {
                alert("Your mobile number : " + mobile);
                return true;
            } else {
                alert("It is not valid mobile number.input 10 digits number!");
                return false;
            }
        }


    
     let container = document.getElementById('container')

     toggle = () => {
     	container.classList.toggle('sign-in')
     	container.classList.toggle('sign-up')
     }

     setTimeout(() => {
     	container.classList.add('sign-in')
     }, 200)
      </script>   -->
</body>
</html>