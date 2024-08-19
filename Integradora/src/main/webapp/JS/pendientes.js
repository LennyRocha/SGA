document.addEventListener('DOMContentLoaded', function () {
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })
});

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