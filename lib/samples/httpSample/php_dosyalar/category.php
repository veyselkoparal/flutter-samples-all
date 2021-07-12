<?php
    include "db.php";
    $query = $db -> query("select * from category");
    $result = array();

    while($rowData = $query ->fetch_assoc()){
        $result[] = $rowData;
    }

    echo json_encode($result);
?>