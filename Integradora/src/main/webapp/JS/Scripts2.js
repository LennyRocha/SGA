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
console.log(arrayList);

function enviar(action) {
    mostrarCarga();
    const formulario = document.getElementById('salida');
    const inputs = formulario.querySelectorAll('input[required], select[required], textarea[required]');
    let formularioValido = true;

    inputs.forEach(input => {
        if (!input.value) {
            formularioValido = false;
            input.classList.add('campo-invalido'); // Añade una clase para resaltar el campo vacío
        } else {
            input.classList.remove('campo-invalido');
        }
    });

    if (formularioValido) {
        document.getElementById('validator').value = action;
        formulario.submit(); // Envía el formulario si todos los campos están llenos
    } else {
        Swal.fire({
            icon: 'Error',
            title: '¡Campos incompletos!',
            text: 'Por favor, completa todos los campos obligatorios.',
            confirmButtonText: 'Aceptar',
            confirmButtonColor: '#4A4E69',
            confirmButtonBorderColor: '#4A4E69'
        });
    }
}

function enviarSolicitud(action) {
    mostrarCarga();
    const formulario = document.getElementById('salida');
    const inputs = formulario.querySelectorAll('input[required], select[required], textarea[required]');
    let formularioValido = true;

    inputs.forEach(input => {
        if (!input.value) {
            formularioValido = false;
            input.classList.add('campo-invalido'); // Añade una clase para resaltar el campo vacío
        } else {
            input.classList.remove('campo-invalido');
        }
    });

    if (formularioValido) {
        document.getElementById('validator').value = action;
        formulario.submit(); // Envía el formulario si todos los campos están llenos
    } else {
        Swal.fire({
            icon: 'Error',
            title: '¡Campos incompletos!',
            text: 'Por favor, completa todos los campos obligatorios.',
            confirmButtonText: 'Aceptar',
            confirmButtonColor: '#4A4E69',
            confirmButtonBorderColor: '#4A4E69'
        });
    }
}

const nuevosz3 = document.getElementById("nuevosz3");
const nuevoz3 = document.getElementById("nuevoz3");
const save = document.getElementById("save");

function actualizarMaximo(num) {
    const selectProducto = document.getElementById('Producto'+num);
    const inputCantidad = document.getElementById('Cantidad'+num);
    const inputPrecio = document.getElementById('Precio'+num);
    const stockDisponible = selectProducto.options[selectProducto.selectedIndex].getAttribute('data-stock');
    const stockPrecio = selectProducto.options[selectProducto.selectedIndex].getAttribute('data-price');

    inputCantidad.max = stockDisponible;
    inputPrecio.innerText = stockPrecio;
}

let elMax = 0;
let prec = 0;

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
    input.setAttribute("type", "text");
    input.setAttribute("name", "producto[]");
    input.setAttribute("id", "Producto"+i);
    input.setAttribute("class", "form-select form-control");
    input.setAttribute("style", "color: #75778C;");
    input.setAttribute("onchange", `actualizarMaximo(${i})`);

    // Opción por defecto
    const option2 = document.createElement("option");
    option2.setAttribute("value", "");
    option2.textContent = "Producto "+i;
    option2.setAttribute("disabled", "disabled");
    option2.setAttribute("selected", "selected");
    input.appendChild(option2);
    // Añadir opciones del arrayList
    arrayList.forEach(producto => {
        const option = document.createElement("option");
        option.setAttribute("value", producto.producto_nombre); // Puedes cambiar esto según lo que necesites
        option.setAttribute("data-stock", producto.producto_cantidad);
        option.setAttribute("data-price", producto.producto_precio);
        option.textContent = `${producto.producto_nombre}`;
        elMax = `${producto.producto_cantidad}`
        prec = `${producto.producto_precio}`
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
    //input2.setAttribute("max", elMax);  // Valor máximo
    input2.setAttribute("oninput", `calculateTotal(this,\`+i+\`)`);
    input2.setAttribute("placeholder", "Cantidad " + i);
    input2.setAttribute("class", "form-control");
    input2.setAttribute("required", "required");
    col2.appendChild(input2);

    const col3 = document.createElement("div");
    col3.setAttribute("class", "col-sm");
    const input3 = document.createElement("input");
    input3.setAttribute("type", "tel");
    input3.setAttribute("name", "Precio[]");
    input3.setAttribute("id", "Precio"+i);
    input3.setAttribute("min", "0.00");  // Valor mínimo
    input3.setAttribute("step", "0.01");
    input3.setAttribute("oninput", `calculateTotal(this,${i}); validarNumero(this)`);
    input3.setAttribute("placeholder", "Precio " + i);
    input3.setAttribute("class", "form-control");
    input3.setAttribute("required", "required");
    col3.appendChild(input3);

    const col4 = document.createElement("div");
    col4.setAttribute("class", "col-sm");
    const input4 = document.createElement("select");
    input4.setAttribute("type", "text");
    input4.setAttribute("name", "Unidad[]");
    input4.setAttribute("id", "Unidad" + i);
    input4.setAttribute("placeholder", "Unidad " + i);
    input4.setAttribute("class", "form-select form-control");
    input4.setAttribute("style", "color: #75778C;");
    // Opción por defecto
    const option3 = document.createElement("option");
    option3.setAttribute("value", "");
    option3.textContent = "Unidad "+i;
    option3.setAttribute("disabled", "disabled");
    option3.setAttribute("selected", "selected");
    input4.appendChild(option3);
    // Añadir opciones del arrayList
    arrayListU.forEach(unidad => {
        const option = document.createElement("option");
        option.setAttribute("value", unidad.unidad_id); // Puedes cambiar esto según lo que necesites
        option.textContent = `${unidad.unidad_nombre}`;
        input4.appendChild(option);
    });
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