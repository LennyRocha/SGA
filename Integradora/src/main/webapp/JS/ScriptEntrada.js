const nuevosz = document.getElementById("nuevosz");
const nuevoz = document.getElementById("nuevoz");
const save = document.getElementById("save");
let i = 2;

const svgString = `
            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M2 8C2 7.72386 2.22386 7.5 2.5 7.5H13.5C13.7761 7.5 14 7.72386 14 8C14 8.27614 13.7761 8.5 13.5 8.5H2.5C2.22386 8.5 2 8.27614 2 8Z" fill="black"/>
            </svg>
            `;

nuevoz.addEventListener("click", () => {
    const wrappers = document.createElement("div");
    wrappers.setAttribute("class", "row-wrapper");

    const divs = document.createElement("div");
    divs.setAttribute("class", "row");

    const br = document.createElement("br");

    const col1 = document.createElement("div");
    col1.setAttribute("class", "col-sm");
    const input = document.createElement("input");
    input.setAttribute("type", "text");
    input.setAttribute("name", "producto[]");
    input.setAttribute("id", "Producto" + i);
    input.setAttribute("placeholder", "Producto " + i);
    input.setAttribute("class", "form-control");
    input.setAttribute("required", "required");
    col1.appendChild(input);

    const col2 = document.createElement("div");
    col2.setAttribute("class", "col-sm");
    const input2 = document.createElement("input");
    input2.setAttribute("type", "number");
    input2.setAttribute("name", "Cantidad[]");
    input2.setAttribute("id", "Cantidad" + i);
    input2.setAttribute("placeholder", "Cantidad " + i);
    input2.setAttribute("class", "form-control");
    col2.appendChild(input2);

    const col3 = document.createElement("div");
    col3.setAttribute("class", "col-sm");
    const input3 = document.createElement("input");
    input3.setAttribute("type", "text");
    input3.setAttribute("name", "Precio[]");
    input3.setAttribute("id", "Precio" + i);
    input3.setAttribute("placeholder", "Precio " + i);
    input3.setAttribute("class", "form-control");
    col3.appendChild(input3);

    const col5 = document.createElement("div");
    col5.setAttribute("class", "col");
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

    divs.appendChild(col6);
    divs.appendChild(col1);
    divs.appendChild(col2);
    divs.appendChild(col3);
    //divs.appendChild(col4);
    divs.appendChild(col5);
    wrappers.appendChild(divs);
    wrappers.appendChild(br);

    nuevosz.appendChild(wrappers);

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

const saveP = document.getElementById("producto");
const watch = document.getElementById("watch");

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
        text: 'Entrada exitosa.',
        icon: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#4A4E69',
        confirmButtonBorderColor: '#4A4E69',
    });
}

if (params.alert === 'chi') {
    Swal.fire({
        title: '¡Exito!',
        text: 'Entrada guardada correctamente.',
        icon: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#4A4E69',
        confirmButtonBorderColor: '#4A4E69',
    });
}

if (params.alert === 'succesfull') {
    Swal.fire({
        title: '¡Exito!',
        text: 'Entrada recuperada exitosamente.',
        icon: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#4A4E69',
        confirmButtonBorderColor: '#4A4E69',
    });
}

if (params.alert === 'succes') {
    Swal.fire({
        title: '¡Exito!',
        text: 'Entrada eliminada.',
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

function enviarSolicitud(action) {
    mostrarCarga();
    document.getElementById('validator').value = action;
    document.getElementById('entrada').submit();
}

function enviar(action) {
    mostrarCarga();
    document.getElementById('validator').value = action;
    document.getElementById('entrada').submit();
}