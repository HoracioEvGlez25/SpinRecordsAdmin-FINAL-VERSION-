<?php
require_once '../config/database.php';
require_once '../models/Usuario.php';

$database = new Database();
$db = $database->connect();

$user = new User($db);

$data = json_decode(file_get_contents("php://input"));

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if ($user->create()) {
        echo json_encode(["message" => "Usuario creado correctamente."]);
    } else {
        echo json_encode(["message" => "Error al crear usuario."]);
    }
}
?>
