getParameter = (key) => {
    address = window.location.search; //url de la ventana actual 
    //Objeto de tipo URLSearchParams
    parameterList = new URLSearchParams(address); 
    //Regresa el valor del parámetro “key”
    return parameterList.get(key);
}

//CREAR UNA CUENTA
//nombre
let nombre2 = document.getElementById("name");
nombre2.innerText = getParameter("nombre");
//correo
let correo2 = document.getElementById("email");
correo2.innerText = getParameter("correo");
//Constraseña fuerte o debil
const contraseña2 = getParameter("contraseña");
let password2 = document.getElementById("password");
if (contraseña2.length < 5) {
    password2.innerText = "Tu contraseña es débil, quiza deberías cambiarla en otro momento";
} else {
    password2.innerText = "Tu contraseña es segura, no deberías de tener problemas";
}