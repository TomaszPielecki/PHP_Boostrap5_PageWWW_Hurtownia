<?php
include 'Components/DBConn.php';
$conn = OpenCon();

echo "Connected Successfully To DataBase" . "<br><br>";
$query_sql = "SELECT * FROM  sklep,adress where ida =1 ";

$query_sql1 = "SELECT * FROM  kontakt,adress where ida=1 ";
$result = $conn->query($query_sql);
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "Region:" . $row["region"] . " sklep: " . $row["nazwa_sklepu"] . "<br>";
    }
    echo "<br>";
    $result = $conn->query($query_sql1);
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "Mail:" . $row["mail"] . " Strona internetowa: " . $row["www"] . "<br><br>";
        }
    }
}

CloseConnection($conn);
