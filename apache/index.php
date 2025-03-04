<?php
// Du bon code spaguetti à l'ancienne
$host = getenv('DB_HOST') ?: 'localhost';
$user = getenv('DB_USER') ?: 'root';
$pass = getenv('DB_PASS') ?: '';
$db = getenv('DB_NAME') ?: 'testdb';

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Échec de la connexion : " . $conn->connect_error);
}

$sql = "SELECT id, name, email FROM users";
$result = $conn->query($sql);

// Mhhh la bonne table en HTML
echo "<h1>Liste de la formation Docker</h1>";
if ($result->num_rows > 0) {
    echo "<table border='1'><tr><th>ID</th><th>Nom</th><th>Email</th></tr>";
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>{$row['id']}</td><td>{$row['name']}</td><td>{$row['email']}</td></tr>";
    }
    echo "</table>";
} else {
    echo "Aucun utilisateur trouvé.";
}

$conn->close();
?>
