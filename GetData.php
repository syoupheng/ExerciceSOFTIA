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

$idEtu=$_POST["etudiant"];
$sql_etu="SELECT * FROM Etudiant WHERE Etudiant.idEtudiant=$idEtu";
$result_etu = mysqli_query($conn, $sql_etu);
if (mysqli_num_rows($result_etu) > 0) {
    // output data of each row
    $row = mysqli_fetch_assoc($result_etu);
    $Nom_etu=$row["nom"];
    $Prenom_etu=$row["prenom"];
    $content_etu= "Nom: " . $row["nom"]. " - Prénom: " . $row["prenom"]. " - Mail: " . $row["mail"];
    /*echo "<label for='etudiant'>Étudiant</label><br>
<input id='etudiant' type='text' name='etudiant' value=$content_etu readonly /><br><br>";*/
    echo $content_etu . "<br><br>
    <input type='hidden' name='etudiantID' value='$idEtu'/>";
} else {
    echo "0 results";
}

$sql_conv = "SELECT Convention.idConvention, Convention.nom, Convention.nbHeur FROM Convention WHERE Convention.idConvention = (SELECT Etudiant.convention FROM Etudiant WHERE Etudiant.idEtudiant=$idEtu)";
$result_conv = mysqli_query($conn, $sql_conv);

if (mysqli_num_rows($result_conv) > 0) {
  // output data of each row
  while($row = mysqli_fetch_assoc($result_conv)) {
    $nomConv=$row["nom"];
    $nbHeur=$row["nbHeur"];
    $idConv=$row["idConvention"];
    echo "<label for='convention'>Convention</label><br>
    <input id='convention' type='text' name='convention' value='$nomConv' readonly />
    <input type='hidden' name='conventionID' value='$idConv'/><br><br>
    <label for='message'>Message</label><br>
    <textarea id='message' name='message'>Bonjour $Nom_etu $Prenom_etu,
    
Vous avez suivi $nbHeur heures de formation chez FormationPlus.
Pouvez-vous nous retourner ce mail avec la pièce jointe signée.
    
Cordialement,

FormationPlus</textarea>";
  }
} else {
  echo "0 results";
}

mysqli_close($conn);
?> 