<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

require_once '../config/database.php';
require_once '../models/Usuario.php';

$database = new Database();
$db = $database->connect();

$user = new User($db);

// Obtener datos JSON enviados por el frontend
$data = json_decode(file_get_contents("php://input"));

if (!empty($data->correo) && !empty($data->password)) {
    $login = $user->login($data->correo, $data->password);
    
    if ($login) {
        echo json_encode([
            "message" => "Login exitoso",
            "usuario" => [
                "id" => $login['id'],
                "nombre" => $login['nombre'],
                "correo" => $login['correo']
            ]
        ]);
    } else {
        echo json_encode(["message" => "Correo o contraseña incorrectos."]);
    }
} else {
    echo json_encode(["message" => "Datos incompletos."]);
}
?>
