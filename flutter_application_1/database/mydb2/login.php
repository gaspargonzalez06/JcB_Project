<?php
require_once ('connection.php');

$emai =$_POST["email"];
$email=strval($emai);
$passwor=$_POST["password"];
$password=strval($passwor);



$sql =" SELECT * FROM `mainlogin` where `email` = '".$email."' ";

#$results = mysqli_query($connection,$sql);
$results = $connection->prepare($sql);
$results->execute();

$rows_count=$results->rowCount();

$msg="";


while ($row =$results ->fetch()){
	if($rows_count >=1){
		if($row['password'] == $password){
			$msg=json_encode($row['role']);
		}else{
			$msg=json_encode(`false`);
		}
	}
}
if($rows_count < 1){
	$msg=json_encode("not exists");
}
       

echo $msg;



?>