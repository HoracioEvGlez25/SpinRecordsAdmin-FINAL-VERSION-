// Array para almacenar clientes
let clientes = [];

// Mostrar formulario de agregar cliente
function mostrarFormulario() {
    document.getElementById('addClient').style.display = 'block';
}

// Ocultar formulario de agregar cliente
function ocultarFormulario() {
    document.getElementById('addClient').style.display = 'none';
}

// Guardar cliente en el array y actualizar la lista
function guardarCliente(event) {
    event.preventDefault(); // Evitar recarga de página

    // Obtener valores del formulario
    const nombre = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const telefono = document.getElementById('phone').value;
    const direccion = document.getElementById('address').value;

    // Crear objeto cliente
    const cliente = {
        nombre,
        email,
        telefono,
        direccion,
        fecha: new Date()
    };

    // Agregar cliente al array y actualizar lista
    clientes.push(cliente);
    mostrarClientes();

    // Limpiar y ocultar el formulario
    document.querySelector('form').reset();
    ocultarFormulario();
}

// Calcular tiempo transcurrido
function calcularTiempo(fecha) {
    const ahora = new Date();
    const minutos = Math.floor((ahora - fecha) / 60000);
    return minutos;
}

// Mostrar la lista de clientes en formato de tarjeta
function mostrarClientes() {
    const listaClientesDiv = document.getElementById('listaClientes');
    listaClientesDiv.innerHTML = ''; // Limpiar contenido previo

    clientes.forEach((cliente, index) => {
        const clienteDiv = document.createElement('div');
        clienteDiv.className = 'cliente-card';

        // Inicial del nombre
        const inicial = cliente.nombre.charAt(0).toUpperCase();
        const avatarDiv = document.createElement('div');
        avatarDiv.className = 'cliente-avatar';
        avatarDiv.innerText = inicial;

        // Información del cliente
        const infoDiv = document.createElement('div');
        infoDiv.className = 'cliente-info';
        infoDiv.innerHTML = `
            <p class="cliente-titulo">Nuevo cliente agregado</p>
            <p><strong>Nombre:</strong> ${cliente.nombre}</p>
            <p><strong>Email:</strong> ${cliente.email}</p>
            <p><strong>Teléfono:</strong> ${cliente.telefono}</p>
            <p><strong>Dirección:</strong> ${cliente.direccion}</p>
            <p class="cliente-time">Hace ${calcularTiempo(cliente.fecha)} minutos</p>
        `;

        // Botón de eliminación
        const deleteButton = document.createElement('span');
        deleteButton.className = 'cliente-delete';
        deleteButton.innerHTML = '🗑️';
        deleteButton.onclick = () => eliminarCliente(index);

        // Agregar elementos al div principal
        clienteDiv.appendChild(avatarDiv);
        clienteDiv.appendChild(infoDiv);
        clienteDiv.appendChild(deleteButton);
        listaClientesDiv.appendChild(clienteDiv);
    });
}

// Eliminar cliente de la lista
function eliminarCliente(index) {
    clientes.splice(index, 1); // Eliminar cliente del array
    mostrarClientes(); // Actualizar lista
}
// Guardar cliente en el array y actualizar la lista
function guardarCliente(event) {
    event.preventDefault(); // Evitar recarga de página

    // Obtener valores del formulario
    const nombre = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const telefono = document.getElementById('phone').value;
    const direccion = document.getElementById('address').value;

    // Crear objeto cliente
    const cliente = {
        nombre,
        email,
        telefono,
        direccion,
        fecha: new Date()
    };

    // Agregar cliente al array y actualizar lista
    clientes.push(cliente);
    mostrarClientes();

    // Limpiar el formulario
    document.querySelector('form').reset();

    // Ocultar el formulario después de guardar
    ocultarFormulario();
}
