<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="conexion.Base"%>
<%@page import="javax.servlet.http.*" %>
<%@page import="java.io.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../estilos_css/estilos_hijo/css_recompensas_hijo.css" rel="stylesheet" type="text/css"/>
        <link href="../estilos_css/estilos_hijo/css_recompensas1_hijo.css" rel="stylesheet" type="text/css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Gayathri:wght@100;400;700&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300;400;700&display=swap" rel="stylesheet">
        <link rel="icon" href="../img/icono_cafe_logo.svg" type="image/x-icon" sizes="16x16 32x32 48x48">
        <title>Recompensas - CastorWay</title>
    </head>
    <body>
        <nav class="sidebar">
            <div class="logo-section menu-item" id = "logoNavbar">
                <img src="../img/logo_letras_castorway.svg" alt="Logo" class="icon" id = "iconoNavLogo">
            </div>
            <div class="icon-section">
                <div class="menu-item">
                    <a href="home_hijo.jsp" class = "a_nav"> 
                        <img class="icon icon1" src="../img/icono_casita.svg">
                        <span class="textNav">Inicio</span>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="actividades_hijo.jsp" class = "a_nav">
                        <img class="icon icon1" src="../img/icono_actividades.svg">
                        <span class="textNav">Actividades</span>
                    </a>
                </div>
                <div class="menu-item">
                    <a class="a_nav" href="calendario_hijo.jsp">
                        <img class="icon icon1" src="../img/icono_calendario.svg">
                        <span class="textNav">Calendario</span>
                    </a>
                </div>
                <div class="menu-item">
                    <a class="a_nav" href="diario_hijo.jsp">
                        <img class="icon icon1" src="../img/icono_diario.svg">
                        <span class="textNav">Diario</span>
                    </a>
                </div>
                <div class="menu-item">
                    <a class="a_nav" href="chat_hijo.jsp">
                        <img class="icon icon1" src="../img/icono_chat.svg">
                        <span class="textNav">Chat</span>
                    </a>
                </div>
                <div class="menu-item" id = "div_nav_home">
                    <a href="recompensas_hijo.jsp" class="a_nav">
                        <img class="icon icon1" src="../img/icono_recompensa.svg">
                        <span class="textNav">Recompensas</span>
                    </a>
                </div>
            </div>
            <div class="bottom-section">
                <div class="menu-item toggle">
                    <img class="icon icon1" src="../img/icono_MenuDesplegable.svg">
                </div>
                <div class="menu-item toggle">
                    <img class="icon icon1" src="../img/icono_setings.svg">
                </div>
            </div>
        </nav>
        <div class="content">
            <div class="secondary-nav">
                <div class = "izquierda-secondary-nav">
                    <a href="#">Recompensas</a>
                </div>
                <div class = "derecha-secondary-nav">
                    <a href="#"><img src="../img/iconito_notifiNotificacion.svg" class = "imgNavSecondary"></a>
                    <div class="sec-nav-perfil">
                        <%
                            session = request.getSession(false);
                            String usuario = (String) session.getAttribute("usuario");

                            if (session == null || usuario == null) {
                                response.sendRedirect("../formularios_sesion/inicio_sesion_hijo.jsp");
                                return; // Stop further processing
                            }
                        %>
                        <a href="#"><%=usuario%></a>

                        <a href=""> <img src="../img/icono_Perfil.svg" class = "imgNavSecondary"></a>
                    </div>
                </div>
            </div>
            <div class="principal">

                <div class="imagen" 
                     style="background-image: url('./..//img/Cator fondito.svg');
                     background-repeat: no-repeat; background-position: center;
                     background-size: cover; position: relative; width: 100%; height: 100%; overflow-y: hidden;">

                    <div class="flechitas" id="reclamados">
                        <div class="Premio1">Premios Reclamados</div>
                        <div class="flechas-container">
                            <div class="fle" onclick="window.location.href = 'recompensas1_hijo.jsp';" style="cursor: pointer;">
                                <img src="../img/Izquierda.svg">
                            </div>
                            <div class="fle" onclick="window.location.href = 'recompensas1_hijo.jsp';" style="cursor: pointer;">
                                <img src="../img/Derecha.svg">
                            </div>    
                        </div>
                    </div>
                </div>





                <div class="recom">
                    <%
                        Base bd = new Base();
                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        PreparedStatement pstmt6 = null;
                        ResultSet rs0 = null;
                        ResultSet rs = null;

                        session = request.getSession(false);
                        String codPresa = (String) session.getAttribute("codPresa");
                        String nombreUsuario = (String) session.getAttribute("usuario");

                        if (codPresa == null || nombreUsuario == null) {
                    %>
                    <div class="mensaje-sin-seleccion" id="div-conrainer-img-hijono-seleccionado">
                        <div id="div-conrainer-img-hijono-seleccionado-text">
                            <p id="text-hijo-no-seleccionado">Por favor, proporciona codPresa y nombre de usuario para continuar.</p>
                        </div>
                        <div id="div-conrainer-img-hijono-seleccionado-img">
                            <img src="../img/Castor.svg" style="height:14vw; width:auto;" alt="Seleccionar usuario" id="img-hijo-no-seleccionado">
                        </div>
                    </div>
                    <%
                    } else {
                        try {
                            bd.conectar();
                            conn = bd.getConn();

                            // Consulta para obtener el idKit usando codPresa y nombreUsuario
                            String userQuery = "SELECT idKit FROM Kit WHERE codPresa = ? AND nombreUsuario = ?";
                            pstmt = conn.prepareStatement(userQuery);
                            pstmt.setString(1, codPresa);
                            pstmt.setString(2, nombreUsuario);
                            rs = pstmt.executeQuery();

                            String idKit = null;

                            if (rs.next()) {
                                idKit = rs.getString("idKit");
                            }

                            if (idKit == null) {
                    %>
                    <div class="mensaje-sin-seleccion" id="div-conrainer-img-hijono-seleccionado">
                        <div id="div-conrainer-img-hijono-seleccionado-text">
                            <p id="text-hijo-no-seleccionado">No se encontró una cuenta de Kit para los datos proporcionados.</p>
                        </div>
                        <div id="div-conrainer-img-hijono-seleccionado-img">
                            <img src="../img/Castor.svg" style="height:14vw; width:auto;" alt="Seleccionar usuario" id="img-hijo-no-seleccionado">
                        </div>
                    </div>
                    <%
                    } else {
                        // Consulta para obtener premios
                        String query = "SELECT DISTINCT p.* FROM premios p "
                                + "JOIN relPrem rp ON p.idCastor = rp.idCastor "
                                + "WHERE rp.idKit = ?";
                        pstmt6 = conn.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                        pstmt6.setInt(1, Integer.parseInt(idKit));
                        rs0 = pstmt6.executeQuery();

                        if (!rs0.next()) {
                    %>
                    <div class="mensaje-sin-premios">
                        <div><p class="no-premios">No hay premios disponibles para esta cuenta de Kit.</p></div>
                        <div id="div-container-nopremio-img">
                            <img src="../img/Castor.svg" alt="Seleccionar usuario" id="img-hijo-no-premio">
                        </div>
                    </div>
                    <%
                    } else {
                        rs0.beforeFirst();
                    %>
                    <div class="conte">
                        <div class="fav">
                            <p class="favo">Tus favoritos</p>
                        </div>
                        <div class="Iz">
                            <img src="../img/Izquierda.svg" class="flecha-izquierda" onclick="moverIzquierda()" style="cursor: pointer;">
                        </div>
                        <div class="prem">
                            <%
                                // Consultar premios activos
                                String query5 = "SELECT DISTINCT p.* FROM premios p "
                                        + "JOIN relPrem rp ON p.idPremio = rp.idPremio "
                                        + "WHERE rp.idKit = ? "
                                        + "AND p.estadoPremio = 1 "
                                        + "ORDER BY p.Favorito DESC";
                                try (PreparedStatement pstmt5 = conn.prepareStatement(query5)) {
                                    pstmt5.setInt(1, Integer.parseInt(idKit));
                                    ResultSet rs5 = pstmt5.executeQuery();
                                    while (rs5.next()) {
                                        String nombrePremio = rs5.getString("nombrePremio");
                                        String rutaImagenHabito = rs5.getString("rutaImagenHabito");
                                        int estadoPremio = rs5.getInt("estadoPremio");
                                        int favorito = rs5.getInt("Favorito");

                                        String imagenEstado = (estadoPremio == 0) ? "../img/PremioSinReclamar.svg" : "../img/PremioReclamado.svg";
                                        String imagenFav = (favorito == 0) ? "../img/NoFavorito.svg" : "../img/Favorito.svg";
                            %>
                            <div class="premio" data-id="<%= rs5.getInt("idPremio")%>" data-favorito="<%= favorito%>" data-kit="<%= idKit%>">
                                <div class="Imal"><img src="<%= rutaImagenHabito%>" id="imgPremio"></div>
                                <div class="Nomel"><p class="nomPremio"><%= nombrePremio%></p></div>
                                <div class="Sele">
                                    <img src="<%= imagenEstado%>" class="estadoImagen">
                                    <img src="<%= imagenFav%>" class="estadoPremio" style="cursor:pointer;" onclick="cambiarEstado(this, 'favorito');">
                                </div>
                            </div>
                            <%
                                        // Manejo de la actualización de estado y favorito
                                        String idPremioParam = request.getParameter("idPremio");
                                        String favoritoParam = request.getParameter("favorito");

                                        if (idPremioParam != null && favoritoParam != null) {
                                            int premioId = Integer.parseInt(idPremioParam);
                                            int nuevoFavorito = Integer.parseInt(favoritoParam);
                                            

                                            // Actualización en la base de datos
                                            String updateQuery = "UPDATE premios SET Favorito = ? WHERE idPremio = ?";
                                            try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
                                                updateStmt.setInt(1, nuevoFavorito);
                                                updateStmt.setInt(2, premioId);
                                                
                                                int rowsAffected = updateStmt.executeUpdate();
                                                if (rowsAffected > 0) {
                                                    out.println("Actualización exitosa para el premio ID: " + premioId);
                                                } else {
                                                    out.println("No se realizó ninguna actualización para el premio ID: " + premioId);
                                                }
                                            } catch (SQLException e) {
                                                e.printStackTrace();
                                                out.println("Error al actualizar el premio: " + e.getMessage());
                                            }
                                        }
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                    out.println("Error al acceder a la base de datos: " + e.getMessage());
                                }
                            %>
                        </div>

                        <div class="Der">
                            <img src="../img/Derecha.svg" class="flecha-derecha" onclick="moverDerecha()" style="cursor: pointer;">
                        </div>
                    </div>
                    <%
                            }
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    %>
                    <div class="mensaje-error">
                        <p>Error al acceder a la base de datos: <%= e.getMessage()%></p>
                    </div>
                    <%
                            } finally {
                                // Cerrar recursos
                                if (rs != null) try {
                                    rs.close();
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                                if (rs0 != null) try {
                                    rs0.close();
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                                if (pstmt != null) try {
                                    pstmt.close();
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                                if (pstmt6 != null) try {
                                    pstmt6.close();
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                                if (conn != null) try {
                                    bd.cierraConexion();
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        }
                    %>
                </div>
            </div>
        </div>

        <script src="../codigo_js/codigo_javascript_hijo/js_recompensas_hijo.js" type="text/javascript"></script>
        <script>
                                let currentIndex = 0; // Índice de inicio
                                let premios = []; // Declarar la variable premios aquí

// Función para mostrar premios
                                function mostrarPremios() {
                                    const flechaIzquierda = document.querySelector('.flecha-izquierda');
                                    const flechaDerecha = document.querySelector('.flecha-derecha');

                                    // Mostrar premios según el índice actual
                                    premios.forEach((premio, index) => {
                                        premio.style.display = (index >= currentIndex && index < currentIndex + 4) ? 'block' : 'none';
                                    });

                                    // Mostrar u ocultar las flechas según el índice actual
                                    flechaIzquierda.style.display = currentIndex > 0 ? 'block' : 'none';
                                    flechaDerecha.style.display = (currentIndex + 4 < premios.length) ? 'block' : 'none';

                                    // Mostrar mensaje si no hay premios
                                    if (premios.length === 0) {
                                        const mensajeDiv = document.createElement('div');
                                        mensajeDiv.className = 'mensaje-sin-prem';
                                        mensajeDiv.innerHTML = '<p>No hay premios reclamados.</p>';
                                        document.querySelector('.prem').appendChild(mensajeDiv);
                                        flechaIzquierda.style.display = 'none';
                                        flechaDerecha.style.display = 'none';
                                    }
                                }

                                document.addEventListener('DOMContentLoaded', function () {
                                    // Obtener todos los premios al cargar
                                    premios = document.querySelectorAll('.premio');

                                    // Inicializa la vista de premios al cargar
                                    mostrarPremios();

                                    // Asignar funciones de movimiento a las flechas
                                    const flechaIzquierda = document.querySelector('.flecha-izquierda');
                                    const flechaDerecha = document.querySelector('.flecha-derecha');

                                    flechaDerecha.addEventListener('click', moverDerecha);
                                    flechaIzquierda.addEventListener('click', moverIzquierda);
                                });

                                function moverDerecha() {
                                    if (currentIndex + 4 < premios.length) {
                                        currentIndex += 4; // Aumentar el índice
                                        mostrarPremios(); // Mostrar los nuevos premios
                                        console.log("Deslizando a la derecha, índice actual: ", currentIndex);
                                    }
                                }

                                function moverIzquierda() {
                                    if (currentIndex > 0) {
                                        currentIndex -= 4; // Disminuir el índice
                                        mostrarPremios(); // Mostrar los nuevos premios
                                        console.log("Deslizando a la izquierda, índice actual: ", currentIndex);
                                    }
                                }

                                function cambiarEstado(element, tipo) {
                                    var premioElement = element.closest('.premio');
                                    var imgFavorito = premioElement.querySelector('.estadoPremio');
                                    
                                    var favoritoActual = parseInt(premioElement.getAttribute('data-favorito'));
                                    var idPremio = premioElement.getAttribute('data-id');

                                   if (tipo === 'favorito') {
                                        var nuevoFavorito = favoritoActual === 0 ? 1 : 0;
                                        imgFavorito.src = nuevoFavorito === 1 ? "../img/Favorito.svg" : "../img/NoFavorito.svg";
                                        premioElement.setAttribute('data-favorito', nuevoFavorito);

                                        console.log(`Enviando favorito: idPremio=${idPremio}, favorito=${nuevoFavorito}`);

                                        fetch('recompensas_hijo.jsp?idPremio=' + idPremio + '&favorito=' + nuevoFavorito)
                                                .then(response => {
                                                    if (!response.ok)
                                                        throw new Error('Network response was not ok');
                                                    return response.text();
                                                })
                                                .then(data => {
                                                    console.log("Favorito actualizado: " + data);
                                                    actualizarContenido();
                                                    location.reload();// Actualiza el contenido de forma imperceptible
                                                })
                                                .catch(error => console.error('Error al actualizar favorito:', error));
                                    }
                                }

// Función para actualizar el contenido de premios
                                function actualizarContenido() {
                                    fetch('recompensas_hijo.jsp') // Realiza una llamada para obtener el contenido actualizado
                                            .then(response => response.text())
                                            .then(data => {
                                                const contenedorPremios = document.querySelector('.prem');
                                                contenedorPremios.innerHTML = ''; // Limpia el contenedor antes de actualizarlo
                                                contenedorPremios.innerHTML = data; // Reemplaza el contenido existente
                                                actualizarOrden();
                                                mostrarPremios(); // Actualiza el orden después de cambiar el contenido
                                            })
                                            .catch(error => console.error('Error al obtener contenido actualizado:', error));
                                }



// Función para actualizar el orden de los premios
                                function actualizarOrden() {
                                    const premiosContainer = document.querySelector('.prem');
                                    const premios = Array.from(premiosContainer.getElementsByClassName('premio'));

                                    // Ordenar solo por 'Favorito'
                                    premios.sort((a, b) => {
                                        const favoritoA = parseInt(a.getAttribute('data-favorito'));
                                        const favoritoB = parseInt(b.getAttribute('data-favorito'));

                                        // Ordenar primero por favorito (descendente)
                                        return favoritoB - favoritoA;
                                    });

                                    // Limpiar el contenedor y volver a agregar los elementos ordenados
                                    premiosContainer.innerHTML = '';
                                    premios.forEach(premio => premiosContainer.appendChild(premio));
                                }




        </script>
    </body>
</html>