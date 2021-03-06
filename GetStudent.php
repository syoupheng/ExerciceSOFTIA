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

$sql = "SELECT * FROM Etudiant";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
  // output data of each row
  while($row = mysqli_fetch_assoc($result)) {
    $idEtu=$row["idEtudiant"];
    echo "<option value='$idEtu'>Nom: " . $row["nom"]. " - Prénom: " . $row["prenom"]. " - Mail: " . $row["mail"]. "</option>";
  }
} else {
  echo "0 results";
}

mysqli_close($conn);
?> 