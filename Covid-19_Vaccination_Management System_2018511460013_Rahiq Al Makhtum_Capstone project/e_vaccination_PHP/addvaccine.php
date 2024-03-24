<!DOCTYPE html>
<html>
<head>
	<title>Add Vaccine</title>
</head>
<style>
	body {
	  font-family: "Lato", sans-serif;
	  background-size: cover;
	  position: fixed;
	  background: url('patientback.jpg');
	}
	.div{
        padding:20;
        font-size:20;
    }
	.text{
		background-color:#c2d6d6;
		border:none;
		padding:9px 10px;
	}	
	.container {
	    position:absolute;
	    margin: 22px 50px 50px 600px;
	    padding: 70px;
	    background-color: white;
	    font-family:Century Gothic;	
	}
	input[type='submit']{
		width:100px;
		height:35px;
		border-radius:50px 50px 50px 50px;
	}
</style>

<body>
<form method="POST" class="container" action="<?php $_SERVER['PHP_SELF'] ?>">

<div class="div">
<a href="adminindex.php"><img src="backarrow.png" width="30" height="30"></a>

<h1>Add Vaccine</h1>	

<label ><b>Vaccine Name</b></label></br>
<select name="vaccine" style="width: 200px; height: 30px">
	<option value="none" selected disabled hidden> Select an Vaccine</option>
	<option value="Covaxin">Covaxin</option>
	<option value="AstraZeneca">AstraZeneca</option>
	<option value="Sinovac">Sinovac </option>
	<option value="Pfizer">Pfizer</option>
	<option value="Moderna">Moderna</option>
	<option value="Sinopharm">Sinopharm</option>
	<option value="DPT 1st  booster">DPT 1st  booster</option>
	<option value="DPT2 2nd Booster">DPT 2nd Booster </option>
	<option value="Vitamin A">Vitamin A</option>
	<option value="other">Other</option>
</select> 

<br><br>

<center><input type="Submit" name="addvaccine" value="Add Vaccine"/></center>

</div>

<?php

	include 'database_connection.php';
	
	if(isset($_POST['addvaccine']))
	{
		$name = $_POST['vaccine'];

		$time = '';

		if($name == 'Covaxin')
			$time = '+6 month';
		elseif ($name == 'AstraZeneca') 
			$time = '+1 day';
		elseif ($name == 'Sinovac')
			$time = '+10 day';
		elseif ($name == 'Pfizer')
			$time = '+3 month';
		elseif ($name == 'Moderna')
			$time = '+2 month';
		elseif ($name == 'Sinopharm')
			$time = '+2 month';
		elseif ($name == 'DPT 1st  booster')
			$time = '+24 month';
		elseif ($name == 'DPT2 2nd Booster')
			$time = '+60 month';
		else
			$time = '+9 month';

		$query="INSERT INTO vaccine VALUES('$name','$time')";
		
		$result=mysqli_query($con,$query);

		if(!$result)
		{
			die("<br>Can't Insert Data : " .mysqli_error());
		}
		
		echo "<script>alert('Add Vaccine Details..!!');window.location='addvaccine.php'</script>";
	}
?>


</body>
</html>