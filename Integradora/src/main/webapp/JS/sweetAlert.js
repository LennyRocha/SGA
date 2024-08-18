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
        text: 'Usuario registrado.',
        icon: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#4A4E69',
        confirmButtonBorderColor: '#4A4E69',
    });
}