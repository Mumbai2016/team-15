<?php
	session_start();
	if(isset($_SESSION['login_user'])){
		if(isset($_GET["logout"])){
			session_destroy();
			unset($_SESSION['login_user']);
			header("Location: login atma.php");	
		}
	}else
		header("Location: login atma.php");
?>