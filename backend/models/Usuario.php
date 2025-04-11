<?php
class User {
    private $conn;
    private $table = "usuarios";

    public $id;
    public $nombre;
    public $correo;
    public $password;

    public function __construct($db) {
        $this->conn = $db;
    }

    // Crear usuario
    public function create() {
        $query = "INSERT INTO " . $this->table . " (nombre, correo, password) VALUES (:nombre, :correo, :password)";
        
        $stmt = $this->conn->prepare($query);

        // Limpiar datos
        $this->nombre = htmlspecialchars(strip_tags($this->nombre));
        $this->correo = htmlspecialchars(strip_tags($this->correo));
        $this->password = password_hash($this->password, PASSWORD_BCRYPT);

        // Vincular
        $stmt->bindParam(":nombre", $this->nombre);
        $stmt->bindParam(":correo", $this->correo);
        $stmt->bindParam(":password", $this->password);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    // Iniciar sesión
    public function login($correo, $password) {
        $query = "SELECT * FROM " . $this->table . " WHERE correo = :correo LIMIT 1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":correo", $correo);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            $usuario = $stmt->fetch(PDO::FETCH_ASSOC);
            if (password_verify($password, $usuario['password'])) {
                return $usuario;
            }
        }

        return false;
    }
}
?>
