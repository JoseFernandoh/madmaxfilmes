<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	  <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	
	<title>MadMaxFilme</title>
	
	<style type="text/css">
	
		.tela{	
		 	background-color: white;
			width: 450px;
			padding: 70px 80px 70px 80px;
			border-radius: 15px;	
			font-family: 'Dosis', sans-serif;
			font-size: 14px;
			color: #222222;
		}
		.btn{
			width: 210px;
			margin-left: 45px;
			margin-top: 15px;
		}
		.msg{
			font-size: 15px;
			text-align: center;
			margin-top: 20px;
			padding-top: 10px;
			padding-bottom: 10px;
			color: #664d03;
    		background-color: #fff3cd;
    		border-color: #ffecb5;
    		border-radius: 5px;
		}
		body{
			background-image: url(<%= request.getContextPath() %>/images/uploads/slider-bg2.jpg);
		    background-repeat: no-repeat;
		    background-attachment: fixed;
		    background-position: center;
		    height: 100%;
		    background-size: cover;
		}
		
	</style>
	
</head>
<body onload="alertFun();">

	<div class="position-absolute top-50 start-50 translate-middle">
		<div class="tela">
			<div>
				<h4 class="text-center">Acessar Conta</h4>
				<br>
			</div>
			<div>
				<form action="<%= request.getContextPath() %>/ServletLogin" method="post" class="row g-3 needs-validation">
					<div>
						<label  class="form-label">Login: </label>
						<input class="form-control" name="login" type="text" required="required">
					</div>
					<div>
						<label  class="form-label">Senha: </label>
						<input class="form-control" name="senha" type="password" required="required">		
					</div>
					<div>
						<input class="btn btn-primary" type="submit" value="Acessar">
					</div>
				</form>
			</div>
			<div>
				<p id="msg">${msg}</p>		
			</div>
		</div>
	</div>

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

	<script type="text/javascript">
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(function () {
		  'use strict'
	
		  // Fetch all the forms we want to apply custom Bootstrap validation styles to
		  var forms = document.querySelectorAll('.needs-validation')
	
		  // Loop over them and prevent submission
		  Array.prototype.slice.call(forms)
		    .forEach(function (form) {
		      form.addEventListener('submit', function (event) {
		        if (!form.checkValidity()) {
		          event.preventDefault()
		          event.stopPropagation()
		        }
	
		        form.classList.add('was-validated')
		      }, false)
		    })
		})()
		
		function alertFun() {
			var msg = document.querySelector("#msg").innerHTML;
			var msgidit = document.getElementById("msg");
			if(msg === ""){
				msgidit.classList.remove("msg");
			}else{
				msgidit.classList.add("msg");
			}
			
		}
		
	</script>

</body>
</html>