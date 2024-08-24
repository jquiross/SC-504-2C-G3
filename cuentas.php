<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
    <!-- https://fonts.google.com/specimen/Open+Sans -->
    <link rel="stylesheet" href="css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/tooplate.css">
</head>

<body id="reportsPage" class="container-fluid">
    <div class="container-fluid" id="home">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-xl navbar-light bg-light">
                        <a class="navbar-brand" href="indexDashBoard.php">
                            <i class="fas fa-3x fa-tachometer-alt tm-site-icon"></i>
                            <h1 class="tm-site-title mb-0">Dashboard</h1>
                        </a>
                        <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mx-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="vehiculos.php">Vehiculos</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="cuentas.php">Cuentas</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="citas.php">Citas</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="pagos.php">Pagos</a>
                                </li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link d-flex" href="index.php">
                                        <i class="far fa-user mr-2 tm-logout-icon"></i>
                                        <span>Cerrar Sesión</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <!-- row -->
            <div class="row tm-content-row tm-mt-big justify-content-center">
                <div class="col-xl-8 col-lg-12 tm-md-12 tm-sm-12">
                    <div class="bg-white tm-block">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Cuentas</h2>
                                <a href="añadircuenta.php" class="btn btn-primary float-right">Añadir Cuentas</a>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover table-striped tm-table-striped-even mt-3">
                                <thead>
                                    <tr class="tm-bg-gray">
                                        <th scope="col">ID</th>
                                        <th scope="col">Nombre</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Rol ID</th>
                                        <th scope="col">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Laura Morales</td>
                                        <td>laura.morales@example.com</td>
                                        <td>1</td>
                                        <td>
                                            <a href="editarUsuario.php?id=1" class="btn btn-warning btn-sm">Editar</a>
                                            <a href="eliminarUsuario.php?id=1" class="btn btn-danger btn-sm">Eliminar</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Andrés Fernández</td>
                                        <td>andres.fernandez@example.com</td>
                                        <td>2</td>
                                        <td>
                                            <a href="editarUsuario.php?id=2" class="btn btn-warning btn-sm">Editar</a>
                                            <a href="eliminarUsuario.php?id=2" class="btn btn-danger btn-sm">Eliminar</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Isabella Ruiz</td>
                                        <td>isabella.ruiz@example.com</td>
                                        <td>1</td>
                                        <td>
                                            <a href="editarUsuario.php?id=3" class="btn btn-warning btn-sm">Editar</a>
                                            <a href="eliminarUsuario.php?id=3" class="btn btn-danger btn-sm">Eliminar</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>Daniel Martínez</td>
                                        <td>daniel.martinez@example.com</td>
                                        <td>3</td>
                                        <td>
                                            <a href="editarUsuario.php?id=4" class="btn btn-warning btn-sm">Editar</a>
                                            <a href="eliminarUsuario.php?id=4" class="btn btn-danger btn-sm">Eliminar</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>Camila Castro</td>
                                        <td>camila.castro@example.com</td>
                                        <td>2</td>
                                        <td>
                                            <a href="editarUsuario.php?id=5" class="btn btn-warning btn-sm">Editar</a>
                                            <a href="eliminarUsuario.php?id=5" class="btn btn-danger btn-sm">Eliminar</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>6</td>
                                        <td>Felipe Gómez</td>
                                        <td>felipe.gomez@example.com</td>
                                        <td>1</td>
                                        <td>
                                            <a href="editarUsuario.php?id=6" class="btn btn-warning btn-sm">Editar</a>
                                            <a href="eliminarUsuario.php?id=6" class="btn btn-danger btn-sm">Eliminar</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>7</td>
                                        <td>Valentina Ortega</td>
                                        <td>valentina.ortega@example.com</td>
                                        <td>3</td>
                                        <td>
                                            <a href="editarUsuario.php?id=7" class="btn btn-warning btn-sm">Editar</a>
                                            <a href="eliminarUsuario.php?id=7" class="btn btn-danger btn-sm">Eliminar</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>8</td>
                                        <td>Santiago López</td>
                                        <td>santiago.lopez@example.com</td>
                                        <td>2</td>
                                        <td>
                                            <a href="editarUsuario.php?id=8" class="btn btn-warning btn-sm">Editar</a>
                                            <a href="eliminarUsuario.php?id=8" class="btn btn-danger btn-sm">Eliminar</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>9</td>
                                        <td>Mariana Silva</td>
                                        <td>mariana.silva@example.com</td>
                                        <td>1</td>
                                        <td>
                                            <a href="editarUsuario.php?id=9" class="btn btn-warning btn-sm">Editar</a>
                                            <a href="eliminarUsuario.php?id=9" class="btn btn-danger btn-sm">Eliminar</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>10</td>
                                        <td>Tomás Herrera</td>
                                        <td>tomas.herrera@example.com</td>
                                        <td>3</td>
                                        <td>
                                            <a href="editarUsuario.php?id=10" class="btn btn-warning btn-sm">Editar</a>
                                            <a href="eliminarUsuario.php?id=10" class="btn btn-danger btn-sm">Eliminar</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <script src="js/jquery-3.3.1.min.js"></script>
            <!-- https://jquery.com/download/ -->
            <script src="js/bootstrap.min.js"></script>
            <!-- https://getbootstrap.com/ -->
</body>

</html>