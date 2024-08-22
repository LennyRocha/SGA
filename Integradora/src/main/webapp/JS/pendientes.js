document.addEventListener('DOMContentLoaded', function () {
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })
});

function enviarFormulario(action,id) {
    mostrarCarga();
    document.getElementById('validator_' + id).value = action;
    console.log(document.getElementById('validator_' + id).value);
    setTimeout(function() {
        document.getElementById('pendienteE_' + id).submit();
    }, 100); // 100 milisegundos de retraso
}

function quitarFormulario(action,id) {
    mostrarCarga();
    document.getElementById('validator_' + id).value = action;
    setTimeout(function() {
        document.getElementById('pendienteE_' + id).submit();
    }, 100); // 100 milisegundos de retraso
}

const entradas = document.getElementById("entradas");
const salidas = document.getElementById("salidas");

function selectBreadcrumb(element) {
    // Remove 'selected' class from all breadcrumb items
    var breadcrumbs = document.querySelectorAll('.breadcrumb li');
    breadcrumbs.forEach(function(breadcrumb) {
        breadcrumb.classList.remove('selected');
    });

    // Add 'selected' class to the clicked breadcrumb item
    element.parentElement.classList.add('selected');

    // Get the value of the selected breadcrumb
    var selectedValue = element.parentElement.getAttribute('data-value');
    console.log("Selected breadcrumb value:", selectedValue);

    // Perform different operations based on the selected value
    // Example:
    if (selectedValue === "1") {
        console.log("Home selected");
        entradas.style.display = "block";
        salidas.style.display = "none";
        // Perform operation for Entradas
    } else if (selectedValue === "2") {
        console.log("Library selected");
        salidas.style.display = "block";
        entradas.style.display = "none";
        // Perform operation for Salidas
    }

    // Store the selected value in the hidden input field
    document.getElementById('selectedBreadcrumbValue').value = selectedValue;
}

function getQueryParams() {
    const params = {};
    window.location.search.substring(1).split('&').forEach(param => {
        const [key, value] = param.split('=');
        params[key] = value;
    });
    return params;
}

// Check for the 'alert' query parameter
const params = getQueryParams();

if (params.alert === 'success') {
    Swal.fire({
        title: '¡Exito!',
        text: 'Pendiente eliminado, huevon.',
        icon: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#4A4E69',
        confirmButtonBorderColor: '#4A4E69',
    });
}

function mostrarCarga() {
    Swal.fire({
        title: 'Abriendo...',
        text: 'Por favor espera',

        timer: 5000, // La alerta se cerrará automáticamente después de 5 segundos
        timerProgressBar: true,
        willOpen: () => {
            Swal.showLoading();
        },
    });
}

function mostrarLaCarga() {
    Swal.fire({
        title: 'Borrando...',
        text: 'Por favor espera',

        timer: 5000, // La alerta se cerrará automáticamente después de 5 segundos
        timerProgressBar: true,
        willOpen: () => {
            Swal.showLoading();
        },
    });
}