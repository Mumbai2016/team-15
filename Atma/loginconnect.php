<?php
    session_start();
    include "dbconnect.php";
	
    if(isset($_POST['submit'])){
        $username = $_POST["username"];
        $password = $_POST["password"];
        $username = stripslashes($username);
        $password = stripslashes($password);
        $username = mysql_real_escape_string($username);
        $password = mysql_real_escape_string($password);
		
		
        
        if($username!="" && $password!=""){
            $sql = "SELECT username, password, user_type  FROM `login` WHERE `username` LIKE '$username' AND `password` LIKE '$password'";
            $result = mysql_query( $sql, $conn );
            $num_rows = mysql_num_rows($result);
            $row = mysql_fetch_assoc($result);
            if($num_rows==1){
                $_SESSION['login_user'] = $username;
				if($row["user_type"]=="manager_profile")
					header("Location: PMlogin.php");
				else if($row["user_type"]=="ngo_profile")
					header("Location: PMlogin.php");
				else if($row["user_type"]=="volunteer_profile")
					header("Location: PMlogin.php");
            }else{
                echo "<script> alert('Username or password is incorrect')</script>";
            }
        }
    }
?>