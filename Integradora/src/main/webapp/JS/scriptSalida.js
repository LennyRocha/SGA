const nuevos = document.getElementById("nuevos");
const nuevo = document.getElementById("nuevo");
const save = document.getElementById("save");
let i = 2;

const svgString = `
<svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path fill-rule="evenodd" clip-rule="evenodd" d="M2 8C2 7.72386 2.22386 7.5 2.5 7.5H13.5C13.7761 7.5 14 7.72386 14 8C14 8.27614 13.7761 8.5 13.5 8.5H2.5C2.22386 8.5 2 8.27614 2 8Z" fill="black"/>
</svg>
`;

nuevo.addEventListener("click", () => {

    const wrapper = document.createElement("div");
    wrapper.setAttribute("class", "row-wrapper");

    const div = document.createElement("div");
    div.setAttribute("class", "row");

    const br = document.createElement("br");

    const col1 = document.createElement("div");
    col1.setAttribute("class", "col-sm");
    const input = document.createElement("input");
    input.setAttribute("type", "text");
    input.setAttribute("name", "producto[]");
    input.setAttribute("id", "Producto"+i);
    input.setAttribute("placeholder", "Producto " + i);
    input.setAttribute("class", "form-control");
    col1.appendChild(input);

    const col2 = document.createElement("div");
    col2.setAttribute("class", "col-sm");
    const input2 = document.createElement("input");
    input2.setAttribute("type", "number");
    input2.setAttribute("name", "Cantidad[]");
    input2.setAttribute("id", "Cantidad"+i);
    input2.setAttribute("oninput", "calculateTotal(this,"+i+")");
    input2.setAttribute("placeholder", "Cantidad " + i);
    input2.setAttribute("class", "form-control");
    col2.appendChild(input2);

    const col3 = document.createElement("div");
    col3.setAttribute("class", "col-sm");
    const input3 = document.createElement("input");
    input3.setAttribute("type", "text");
    input3.setAttribute("name", "Precio[]");
    input3.setAttribute("id", "Precio"+i);
    input3.setAttribute("oninput", "validarNumero(this); calculateTotal(this,"+i+")");
    input3.setAttribute("placeholder", "Precio " + i);
    input3.setAttribute("class", "form-control");
    col3.appendChild(input3);

    const col4 = document.createElement("div");
    col4.setAttribute("class", "col-sm");
    const input4 = document.createElement("input");
    input4.setAttribute("type", "text");
    input4.setAttribute("name", "Unidad[]");
    input4.setAttribute("id", "Unidad"+i);
    input4.setAttribute("placeholder", "Unidad " + i);
    input4.setAttribute("class", "form-control");
    col4.appendChild(input4);


    const col7 = document.createElement("div");
    col7.setAttribute("class", "col-sm");
    const input5 = document.createElement("input");
    input5.setAttribute("type", "text");
    input5.setAttribute("name", "precioT[]");
    input5.setAttribute("id", "precioT"+i);
    input5.setAttribute("placeholder", "Precio Total " + i);
    input5.setAttribute("class", "form-control");
    col7.appendChild(input5);

    const col5 = document.createElement("div");
    col5.setAttribute("class", "col-sm");
    const button = document.createElement("a");
    button.innerHTML = svgString;
    button.setAttribute("name", "quitar" + i);
    button.setAttribute("id", i);
    button.setAttribute("class", "btn btn-outline-danger");
    button.setAttribute("type", "button");
    button.setAttribute("onclick", "borrar(this);");
    col5.appendChild(button);

    const col6 = document.createElement("div");
    col6.setAttribute("class", "col-auto");
    const label = document.createElement("label");
    label.setAttribute("id", "numero");
    label.innerText = i;
    col6.appendChild(label);

    div.appendChild(col6);
    div.appendChild(col1);
    div.appendChild(col2);
    div.appendChild(col3);
    div.appendChild(col4);
    div.appendChild(col7);
    div.appendChild(col5);
    wrapper.appendChild(div);
    wrapper.appendChild(br);

    nuevos.appendChild(wrapper);

    i++;
});

function borrar(element) {
    element.parentElement.parentElement.parentElement.remove();
    i--;


}

document.addEventListener('DOMContentLoaded', function () {
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })
});

var today = new Date().toISOString().split('T')[0];
document.getElementById("fecha").setAttribute('min', today);

function validarNumero(input) {
    input.value = input.value.replace(/[^0-9.]/g, '');
}

function getQueryParams() {
    const params = {};
    window.location.search.substring(1).split('&').forEach(param => {
        const [key, value] = param.split('=');
        params[key] = value;
    });
    return params;
}

const params = getQueryParams();

if (params.alert === 'si') {
    Swal.fire({
        title: '¡Exito!',
        text: 'Salida exitosa.',
        icon: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#4A4E69',
        confirmButtonBorderColor: '#4A4E69',
    });
}

if (params.alert === 'chi') {
    Swal.fire({
        title: '¡Exito!',
        text: 'Salida guardada correctamente.',
        icon: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#4A4E69',
        confirmButtonBorderColor: '#4A4E69',
    });
}

if (params.alert === 'succesfull') {
    Swal.fire({
        title: '¡Exito!',
        text: 'Salida recuperada exitosamente.',
        icon: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#4A4E69',
        confirmButtonBorderColor: '#4A4E69',
    });
}

if (params.alert === 'succes') {
    Swal.fire({
        title: '¡Exito!',
        text: 'Salida eliminada.',
        icon: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#4A4E69',
        confirmButtonBorderColor: '#4A4E69',
    });
}

function mostrarCarga() {
    Swal.fire({
        title: 'Procesando...',
        text: 'Por favor espera',

        timer: 5000, // La alerta se cerrará automáticamente después de 5 segundos
        timerProgressBar: true,
        willOpen: () => {
            Swal.showLoading();
        },
    });
}

function enviarSolicitudSalida(action) {
    mostrarCarga();
    document.getElementById('validator').value = action;
    document.getElementById('salida').submit();
}

function enviar(action) {
    mostrarCarga();
    document.getElementById('validator').value = action;
    document.getElementById('salida').submit();
}

function enviarSolicitud(action) {
    mostrarCarga();
    document.getElementById('validator').value = action;
    document.getElementById('salida').submit();
}

function calculateTotal(element, num) {
    const row = element.closest('div');
    const cantidad = row.querySelector('.Cantidad'+num).value;
    const precio = row.querySelector('.Precio'+num).value;
    const precioTotal = row.querySelector('.precioT'+num);

    precioTotal.value = cantidad * precio;

    updateTotals(num);
}

function updateTotals(num) {
    const rows = document.querySelectorAll('#calc div');
    let totalProductos = 0;
    let montoTotal = 0;

    rows.forEach(row => {
        const cantidad = parseFloat(row.querySelector('.cantidad'+num).value) || 0;
        const precioTotal = parseFloat(row.querySelector('.precioT'+num).value) || 0;

        totalProductos += cantidad;
        montoTotal += precioTotal;
    });

    document.getElementById('precFin').value = totalProductos;
    document.getElementById('precFin').value = montoTotal;
}

function doSomething(element, num){
    validarNumero(element)
    calculateTotal(element,num)
}