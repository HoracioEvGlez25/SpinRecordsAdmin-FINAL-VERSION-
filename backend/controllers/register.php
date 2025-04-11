<?php
require_once '../config/database.php';

header("Content-Type: application/json");

$data = json_decode(file_get_contents("php://input"));

if (
    isset($data->nombre) &&
    isset($data->correo) &&
    isset($data->password)
) {
    $nombre = $data->nombre;
    $correo = $data->correo;
    $password = password_hash($data->password, PASSWORD_DEFAULT);

    try {
        $query = "INSERT INTO usuarios (nombre, correo, password) VALUES (:nombre, :correo, :password)";
        $stmt = $conn->prepare($query);
        $stmt->bindParam(":nombre", $nombre);
        $stmt->bindParam(":correo", $correo);
        $stmt->bindParam(":password", $password);
        $stmt->execute();

        echo json_encode(["message" => "Usuario registrado exitosamente."]);
    } catch (PDOException $e) {
        echo json_encode(["error" => "Error en el registro: " . $e->getMessage()]);
    }
} else {
    echo json_encode(["error" => "Faltan datos obligatorios."]);
}
?> 