<?php
// index.php

// Lista de bots conocidos
$bots = [
    'Googlebot', 'Bingbot', 'Slurp', 'DuckDuckBot', 'Baiduspider',
    'YandexBot', 'Sogou', 'facebot', 'ia_archiver', 'BadCrawler'
];

$ua = $_SERVER['HTTP_USER_AGENT'] ?? '';
$isBot = false;

// Revisión de User-Agent
foreach ($bots as $botId) {
    if (stripos($ua, $botId) !== false) {
        $isBot = true;
        break;
    }
}

// Si es un bot, le enviamos la "bomba"
if ($isBot) {
    // Registrar intento (opcional)
    $log = "[" . date('Y-m-d H:i:s') . "] Bot detectado: " . $_SERVER['REMOTE_ADDR'] . " - " . $ua . "\n";
    file_put_contents(__DIR__ . '/bot_access.log', $log, FILE_APPEND);

    // Enviar archivo comprimido
    $archivo = __DIR__ . '/bomba_1gb.zip.gz';
    if (file_exists($archivo)) {
        header('Content-Encoding: gzip');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename="bomba_1gb.zip.gz"');
        header('Content-Length: ' . filesize($archivo));
        readfile($archivo);
        exit;
    } else {
        echo "Archivo no encontrado.";
        exit;
    }
}

// Si no es bot, mostrar formulario normal
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login seguro</title>
    <style>
        body { font-family: Arial; background-color: #f4f4f4; text-align: center; padding-top: 100px; }
        form { background: #fff; padding: 20px; display: inline-block; border-radius: 8px; box-shadow: 0 0 10px #ccc; }
    </style>
</head>
<body>
    <h2>Iniciar Sesión</h2>
    <form method="post" action="">
        <input type="text" name="usuario" placeholder="Usuario" required><br><br>
        <input type="password" name="contrasena" placeholder="Contraseña" required><br><br>
        <input type="submit" value="Entrar">
    </form>

<?php
// Procesar login si se enviaron datos
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $usuario = $_POST['usuario'] ?? '';
    $contrasena = $_POST['contrasena'] ?? '';

    // Aquí podrías verificar contra una base de datos real
    if ($usuario === 'admin' && $contrasena === '1234') {
        echo "<p>Bienvenido, $usuario</p>";
    } else {
        echo "<p>Credenciales incorrectas</p>";
    }
}
?>
</body>
</html>
