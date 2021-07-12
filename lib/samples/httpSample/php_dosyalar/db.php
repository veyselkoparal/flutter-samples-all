<?php
$db = new mysqli("localhost","admin","","flutter_http");
$db->set_charset("utf8");
if($db->connect_errno){ 
	die("Üzgünüm, bazı problemler oluştu");
}
?>