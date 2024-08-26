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

const nuevosz3 = document.getElementById("nuevosz3");
const nuevoz3 = document.getElementById("nuevoz3");
const save = document.getElementById("save");

let i = 2;

const svgString = `
<svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path fill-rule="evenodd" clip-rule="evenodd" d="M2 8C2 7.72386 2.22386 7.5 2.5 7.5H13.5C13.7761 7.5 14 7.72386 14 8C14 8.27614 13.7761 8.5 13.5 8.5H2.5C2.22386 8.5 2 8.27614 2 8Z" fill="black"/>
</svg>
`;

nuevoz3.addEventListener("click", () => {
    const wrapper = document.createElement("div");
    wrapper.setAttribute("class", "row-wrapper");

    const div = document.createElement("div");
    div.setAttribute("class", "row");

    const br = document.createElement("br");

    const col1 = document.createElement("div");
    col1.setAttribute("class", "col-sm");
    const input = document.createElement("select");
    input.setAttribute("name", "producto[]");
    input.setAttribute("id", "Producto" + i);
    input.setAttribute("placeholder", "Producto " + i);
    input.setAttribute("class", "form-control");
    // Suponiendo que tienes una lista de productos (listP) en JavaScript
    listP.forEach(p => {
        const option = document.createElement("option");
        option.setAttribute("value", p.producto_id);  // O `p.getProducto_id()` dependiendo de cómo obtienes el ID
        option.textContent = p.producto_nombre;  // O `p.getProducto_nombre()` dependiendo de cómo obtienes el nombre
        input.appendChild(option);
    });
    col1.appendChild(input);

    const col2 = document.createElement("div");
    col2.setAttribute("class", "col-sm");
    const input2 = document.createElement("input");
    input2.setAttribute("type", "number");
    input2.setAttribute("name", "Cantidad[]");
    input2.setAttribute("id", "Cantidad" + i);
    input2.setAttribute("min", "0");  // Valor mínimo
    input2.setAttribute("oninput", `calculateTotal(this,\`+i+\`)`);
    input2.setAttribute("placeholder", "Cantidad " + i);
    input2.setAttribute("class", "form-control");
    col2.appendChild(input2);

    const col3 = document.createElement("div");
    col3.setAttribute("class", "col-sm");
    const input3 = document.createElement("input");
    input3.setAttribute("type", "tel");
    input3.setAttribute("name", "Precio[]");
    input3.setAttribute("id", "Precio" + i);
    input3.setAttribute("min", "0.00");  // Valor mínimo
    input3.setAttribute("step", "0.01");
    input3.setAttribute("oninput", `calculateTotal(this,${i}); validarNumero(this)`);
    input3.setAttribute("placeholder", "Precio " + i);
    input3.setAttribute("class", "form-control");
    col3.appendChild(input3);

    const col4 = document.createElement("div");
    col4.setAttribute("class", "col-sm");
    const input4 = document.createElement("input");
    input4.setAttribute("type", "text");
    input4.setAttribute("name", "Unidad[]");
    input4.setAttribute("id", "Unidad" + i);
    input4.setAttribute("placeholder", "Unidad " + i);
    input4.setAttribute("class", "form-control");
    col4.appendChild(input4);

    const col7 = document.createElement("div");
    col7.setAttribute("class", "col-sm");
    const input5 = document.createElement("input");
    input5.setAttribute("type", "text");
    input5.setAttribute("name", "PrecioT[]");
    input5.setAttribute("id", "PrecioT" + i);
    input5.setAttribute("placeholder", "Precio Total " + i);
    input5.setAttribute("class", "form-control");
    input5.setAttribute("readonly", "readonly");
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

    nuevosz3.appendChild(wrapper);

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