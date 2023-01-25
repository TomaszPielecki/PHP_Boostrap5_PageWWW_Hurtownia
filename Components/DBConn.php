<?php
function OpenCon()
{
    $dbhost = "localhost";
    $dbuser = "root";
    $password = "";
    $db = "hurtownia_art_spoz";
// Create connection
    $conn = new mysqli($dbhost, $dbuser, $password, $db) or die ("Connection failed" . $conn->error);
    return $conn;
}

function CloseConnection($conn)
{
    $conn->close();
}