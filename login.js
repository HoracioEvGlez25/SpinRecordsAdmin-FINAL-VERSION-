document.getElementById('loginForm').addEventListener('submit', function (event) {
    event.preventDefault();

    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    // Validación 
    if (username === 'Admin' && password === '123') {
        // Aqui simulamos que inicios sesión guardando en localStorage
        localStorage.setItem('isAuthenticated', 'true');
        window.location.href = 'index.html'; // Redirigir al dashboard
    } else {
        document.getElementById('loginError').classList.remove('d-none');
    }
});

// Redirigir si ya está autenticado
if (localStorage.getItem('isAuthenticated') === 'true') {
    window.location.href = 'index.html';
}
