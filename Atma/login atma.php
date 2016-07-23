<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="/team-15/Atma/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/team-15/Atma/dist//css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/team-15/Atma/plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <b>WELCOME TO ATMA LOGIN</b>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p align="left" class="login-box-msg">Login as Volunteer</p>

    <form action=" " method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

   

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="../../plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>


<?php
    session_start();

    
    include "dbconnect.php";
    if(isset($_POST["submit"])){
        $username = $_POST["username"];
        $password = $_POST["password"];
        $username = stripslashes($username);
        $password = stripslashes($password);
        $username = mysql_real_escape_string($username);
        $password = mysql_real_escape_string($password);
        
        if($username!="" && $password!=""){
            $sql = "SELECT id, username, password  FROM `login` WHERE `username` LIKE '$username' AND `password` LIKE '$password'";
            $result = mysql_query( $sql, $conn );
            $num_rows = mysql_num_rows($result);
            $row = mysql_fetch_assoc($result);
            if($num_rows==1){
                $_SESSION['login_user'] = $username;
                $_SESSION['id'] = $row["username"];
				if($row["user_type"]=="manager_profile")
					header("Location: PMlogin.html");
				else if($row["user_type"]=="ngo_profile")
					header("Location: PMlogin.html");
				else if($row["user_type"]=="volunteer_profile"){
					echo $row["user_type"];
					header("Location: PMlogin.html");
				}
                
            }else{
                echo "<script> alert('Username or password is incorrect')</script>";
            }
        }
    }
?>


