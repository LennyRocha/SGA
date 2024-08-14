            const nuevos = document.getElementById("nuevos");
            const nuevo = document.getElementById("nuevo");
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
              input.setAttribute("name", "Producto" + i);
              input.setAttribute("id", "Producto"+i);
              input.setAttribute("placeholder", "Producto " + i);
              input.setAttribute("class", "form-control");
              input.setAttribute("required", "required");
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
              col4.setAttribute("class", "col");
              const input4 = document.createElement("input");
              input4.setAttribute("type", "text");
              input4.setAttribute("name", "Unidad" + i);
              input4.setAttribute("id", "Unidad"+i);
              input4.setAttribute("placeholder", "Unidad " + i);
              input4.setAttribute("class", "form-control");
              col4.appendChild(input4);

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