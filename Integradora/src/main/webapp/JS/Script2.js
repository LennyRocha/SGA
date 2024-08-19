const nuevosz = document.getElementById("nuevosz");
const nuevoz = document.getElementById("nuevoz");
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
    input.setAttribute("name", "Producto" + i);
    input.setAttribute("id", "Producto"+i);
    input.setAttribute("placeholder", "Producto " + i);
    input.setAttribute("class", "form-control");
    col1.appendChild(input);

    const col2 = document.createElement("div");
    col2.setAttribute("class", "col-sm");
    const input2 = document.createElement("input");
    input2.setAttribute("type", "number");
    input2.setAttribute("name", "Cantidad" + i);
    input2.setAttribute("id", "Cantidad"+i);
    input2.setAttribute("placeholder", "Cantidad " + i);
    input2.setAttribute("class", "form-control");
    col2.appendChild(input2);

    const col3 = document.createElement("div");
    col3.setAttribute("class", "col-sm");
    const input3 = document.createElement("input");
    input3.setAttribute("type", "text");
    input3.setAttribute("name", "Precio" + i);
    input3.setAttribute("id", "Precio"+i);
    input3.setAttribute("placeholder", "Precio " + i);
    input3.setAttribute("class", "form-control");
    col3.appendChild(input3);

    const col4 = document.createElement("div");
    col4.setAttribute("class", "col-sm");
    const input4 = document.createElement("input");
    input4.setAttribute("type", "text");
    input4.setAttribute("name", "Unidad" + i);
    input4.setAttribute("id", "Unidad"+i);
    input4.setAttribute("placeholder", "Unidad " + i);
    input4.setAttribute("class", "form-control");
    col4.appendChild(input4);


    const col7 = document.createElement("div");
    col7.setAttribute("class", "col-sm");
    const input5 = document.createElement("input");
    input5.setAttribute("type", "text");
    input5.setAttribute("name", "precioT" + i);
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
