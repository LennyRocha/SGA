function filtrarTabla() {
    var input = document.getElementById('miInput');
    var filter = input.value.toUpperCase();
    var table = document.getElementById('miTabla');
    var tr = table.getElementsByTagName('tr');

    for (var i = 1; i < tr.length; i++) { // Empieza en 1 para saltar la fila de encabezado
        var td = tr[i].getElementsByTagName('td')[0];
        if (td) {
            var txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

document.getElementById('miInput').addEventListener('keyup', filtrarTabla);

document.getElementById('miBoton').addEventListener('click', function() {
    var input = document.getElementById('miInput');
    input.value = ''; // Limpiar el input
    var table = document.getElementById('miTabla');
    var tr = table.getElementsByTagName('tr');

    for (var i = 1; i < tr.length; i++) { // Empieza en 1 para saltar la fila de encabezado
        tr[i].style.display = ""; // Mostrar todas las filas
    }
});

document.addEventListener('DOMContentLoaded', function () {
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })
});