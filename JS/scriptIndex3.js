    getParameter = (key) => {
        address = window.location.search; //url de la ventana actual 
        //Objeto de tipo URLSearchParams
        parameterList = new URLSearchParams(address); 
        //Regresa el valor del parámetro “key”
        return parameterList.get(key);
    }

    //INICIAR SESIÓN
    //extrae un nombre random
    let nombre = document.getElementById("name");
    let extraernombre = getParameter("email1");
    let i = 0;
    while (extraernombre.charAt(i) != '@') {
        i++;
    }
    nombre.innerText = extraernombre.substring(0,i);
    //correo
    let correo = document.getElementById("email");
    correo.innerText = getParameter("email1");
    //Constraseña fuerte o debil
    const contraseña = getParameter("pswrd1");
    let password = document.getElementById("password");
    if (contraseña.length < 5) {
        password.innerText = "Tu contraseña es débil, quiza sea hora de cambiarla";
        } else {
        password.innerText = "Tu contraseña es segura, no deberías de tener problema alguno";
    }