<?php
$db_host = "localhost";
$db_username = "root";
$db_password = "";
$db_name =  "atma";
$conn = mysql_connect("$db_host", "$db_username", "$db_password") or die("Could not connect to MYSQL");
@mysql_select_db("$db_name") or die("Could not connect to database schema");
?>