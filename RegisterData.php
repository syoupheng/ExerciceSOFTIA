<?php
$configs = include("config.php");
$servername = $configs["servername"];
$username = $configs["username"];
$password = $configs["password"];
$dbname = $configs["dbname"];

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}
$idEtudiant = $_POST['etudiantID'];
$idConvention = $_POST['conventionID'];
$message = $_POST['message'];
$sql = "INSERT INTO Attestation (etudiant, convention, message) VALUES ($idEtudiant,$idConvention, '$message');";

if (mysqli_query($conn, $sql)) {
    echo "<h1 id='messagefinal'>L'attestation a bien été créée</h1>";
  } else {
    echo "<h1 id='messagefinal'>Erreur ! L'attestation n'a pas pu être créée</h1>" . mysqli_error($conn) . $sql;
  }
  
  mysqli_close($conn);
?> 