<?php

function OpenCon()
 {
 $dbhost = "localhost";
 $dbuser = "default";
 $dbpass = "password";
 $db = "restaurant-test-1";


 $conn = new mysqli($dbhost, $dbuser, $dbpass,$db) or die("Connect failed: %s\n". $conn -> error);

 
 return $conn;
 }
 
function CloseCon($conn)
 {
 $conn -> close();
 }
   
?>