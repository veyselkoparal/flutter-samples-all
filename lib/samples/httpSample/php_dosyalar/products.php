<?php
    include "db.php";
	
	$userId = @$_GET["userId"];
	
	if($_GET){
		$query = $db -> query("select * from products WHERE userId = '$userID'");
		$result = array();

		while($rowData = $query ->fetch_assoc()){
			$result[] = $rowData;
		}
		echo json_encode($result);
	}else{
		$query = $db -> query("select * from products");
		$result = array();

		while($rowData = $query ->fetch_assoc()){
			$result[] = $rowData;
		}

		echo json_encode($result);
	}
?>