<html>
    <head>
        <title>
		Nirvana:Teenagers</title>
		<meta charset = "UTF-8">
		<meta name ="author" content="WT project">
		<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="home.css" rel="stylesheet">
</head><!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="teenagers.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet" href="profile.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>      



    </head>
    <body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">NIRVANA</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="main.php">Home</a></li>
        <li><a href="#">About</a></li>
        <li class="dropdown active">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Packages<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="kids.php">Kids</a></li>
            <li><a href="teenagers.php">Teenagers</a></li>
            <li><a href="women.php">Women</a></li>
            <li><a href="family.php">Family</a></li>
            <li><a href="seniorcitizen.php">Senior Citizens</a></li>
          </ul>
        </li>
        <li><a href="#">Gallery</a></li>
        <li><a href="#">Contact Us</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
          <li><?php $link_address="register.php";$link_address1=" main.php"; session_start();
		echo '<a href="'.$link_address1.'"><span id="demo" class="glyphicon glyphicon-user" ></span>'.$_SESSION['username'].'</a>';
		?>
		</li>
       <?php echo '<li><a href="logout.php"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>';
		?>
      </ul>
    </div>
  </div>
</nav>
  <div class="container-fluid">
    <div class="jumbotron" >
	<div class="row">
    <div class="col-sm-12">
      <h3>Package Details:</h3>
	   <?php
	    echo '<table class="table table-hover">
    <thead>
      <tr>
     <th >Type Of Package </th>
     <th >Package Validity</th>
     <th >No Of Registrations</th>
     <th >Time Period</th>
	 <th >Start Date Of Package</th>
	 <th >End Date Of Package</th>
	 <th>Total Price</th>
	 <th >Mode Of Payment</th>
	 <th>Status</th>
   </tr>
    </thead>';
		  $date=date("Y-m-d");
		  $user ='root';
$pass ='';
$db ='wtproject';
$conn = new mysqli('localhost',$user,$pass,$db) or die("unable to connect");
		 $sql="SELECT * FROM package_toll WHERE username='{$_SESSION['username']}'";
		 $result=$conn->query($sql);


while($row=$result->fetch_array())
{
	echo '<tbody>
      <tr>
     <th>'.$row[2].'</th>
     <th>'.$row[3].'</th>
     <th>'.$row[4].'</th>
     <th>'.$row[6].'</th>
	 <th>'.$row[7].'</th>
	 <th>'.$row[8].'</th>
	 <th>'.$row[5].'</th>
	 <th>'.$row[11].'</th>
	 <th>'.$row[12].'</th>
      </tr>';
  
	
	
}
	echo '</tbody>
  </table>';	 
      ?>
	 
	  
	  
      <br><br>
    </div>
  
	  </ul>
  </div>
  </div>
        </div>
	
    </body>
</html>