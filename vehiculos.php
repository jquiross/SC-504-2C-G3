<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
    <link rel="stylesheet" href="./css/fontawesome.min.css">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/tooplate.css">
    <link rel="stylesheet" href="./css/stylesheet">
    <link rel="stylesheet" href="./css/fullcalendar.min.css">

    <style>
        .btn-group {
            display: flex;
        }

        .btn-group .btn {
            margin-right: 5px;
            /* Espacio entre los botones */
        }

        .btn-group .btn:last-child {
            margin-right: 0;
            /* Sin margen derecho en el último botón */
        }
    </style>
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
                <div class="col-xl-8 col-lg-12 tm-md-12 tm-sm-12 tm-col">
                    <div class="bg-white tm-block h-100">
                        <div class="row">
                            <div class="col-md-8 col-sm-12">
                                <h2 class="tm-block-title d-inline-block">Vehículos Retro de Colección</h2>
                            </div>
                            <div class="col-md-4 col-sm-12 text-right">
                                <a href="añadirVehiculo.php" class="btn btn-small btn-primary">Añadir Vehículo</a>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover table-striped tm-table-striped-even mt-3">
                                <thead>
                                    <tr class="tm-bg-gray">
                                        <th scope="col">&nbsp;</th>
                                        <th scope="col">Nombre del Vehículo</th>
                                        <th scope="col" class="text-center">En Stock</th>
                                        <th scope="col" class="text-center">Unidades vendidas</th>
                                        <th scope="col">Fecha de Ingreso</th>
                                        <th scope="col">Acciones</th>
                                        <th scope="col">&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row"></th>
                                        <td class="tm-product-name">Chevrolet Camaro 1969</td>
                                        <td class="text-center">10</td>
                                        <td class="text-center">7</td>
                                        <td>2024-01-15</td>
                                        <td>
                                            <div class="btn-group" role="group">
                                                <a href="editarVehiculo.php?id=1" class="btn btn-warning btn-sm">Editar</a>
                                                <a href="eliminarVehiculo.php?id=1" class="btn btn-danger btn-sm">Eliminar</a>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"></th>
                                        <td class="tm-product-name">Ford Mustang 1965</td>
                                        <td class="text-center">8</td>
                                        <td class="text-center">6</td>
                                        <td>2024-02-20</td>
                                        <td>
                                            <div class="btn-group" role="group">
                                                <a href="editarVehiculo.php?id=2" class="btn btn-warning btn-sm">Editar</a>
                                                <a href="eliminarVehiculo.php?id=2" class="btn btn-danger btn-sm">Eliminar</a>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"></th>
                                        <td class="tm-product-name">Porsche 911 Classic</td>
                                        <td class="text-center">15</td>
                                        <td class="text-center">12</td>
                                        <td>2024-03-10</td>
                                        <td>
                                            <div class="btn-group" role="group">
                                                <a href="editarVehiculo.php?id=3" class="btn btn-warning btn-sm">Editar</a>
                                                <a href="eliminarVehiculo.php?id=3" class="btn btn-danger btn-sm">Eliminar</a>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"></th>
                                        <td class="tm-product-name">Jaguar E-Type 1961</td>
                                        <td class="text-center">5</td>
                                        <td class="text-center">3</td>
                                        <td>2024-04-05</td>
                                        <td>
                                            <div class="btn-group" role="group">
                                                <a href="editarVehiculo.php?id=4" class="btn btn-warning btn-sm">Editar</a>
                                                <a href="eliminarVehiculo.php?id=4" class="btn btn-danger btn-sm">Eliminar</a>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"></th>
                                        <td class="tm-product-name">Dodge Charger 1970</td>
                                        <td class="text-center">7</td>
                                        <td class="text-center">5</td>
                                        <td>2024-05-22</td>
                                        <td>
                                            <div class="btn-group" role="group">
                                                <a href="editarVehiculo.php?id=5" class="btn btn-warning btn-sm">Editar</a>
                                                <a href="eliminarVehiculo.php?id=5" class="btn btn-danger btn-sm">Eliminar</a>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"></th>
                                        <td class="tm-product-name">BMW 2002 Turbo</td>
                                        <td class="text-center">12</td>
                                        <td class="text-center">10</td>
                                        <td>2024-06-18</td>
                                        <td>
                                            <div class="btn-group" role="group">
                                                <a href="editarVehiculo.php?id=6" class="btn btn-warning btn-sm">Editar</a>
                                                <a href="eliminarVehiculo.php?id=6" class="btn btn-danger btn-sm">Eliminar</a>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"></th>
                                        <td class="tm-product-name">Ferrari Dino 246</td>
                                        <td class="text-center">6</td>
                                        <td class="text-center">4</td>
                                        <td>2024-07-10</td>
                                        <td>
                                            <div class="btn-group" role="group">
                                                <a href="editarVehiculo.php?id=7" class="btn btn-warning btn-sm">Editar</a>
                                                <a href="eliminarVehiculo.php?id=7" class="btn btn-danger btn-sm">Eliminar</a>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"></th>
                                        <td class="tm-product-name">Alfa Romeo Spider 1969</td>
                                        <td class="text-center">9</td>
                                        <td class="text-center">7</td>
                                        <td>2024-08-30</td>
                                        <td>
                                            <div class="btn-group" role="group">
                                                <a href="editarVehiculo.php?id=8" class="btn btn-warning btn-sm">Editar</a>
                                                <a href="eliminarVehiculo.php?id=8" class="btn btn-danger btn-sm">Eliminar</a>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"></th>
                                        <td class="tm-product-name">Austin Healey 3000</td>
                                        <td class="text-center">11</td>
                                        <td class="text-center">8</td>
                                        <td>2024-09-25</td>
                                        <td>
                                            <div class="btn-group" role="group">
                                                <a href="editarVehiculo.php?id=9" class="btn btn-warning btn-sm">Editar</a>
                                                <a href="eliminarVehiculo.php?id=9" class="btn btn-danger btn-sm">Eliminar</a>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row justify-content-center">
                <div class="col-xl-4 col-lg-12 tm-md-12 tm-sm-12 tm-col">
                    <div class="bg-white tm-block h-100">
                        <h2 class="tm-block-title d-inline-block">Categorías de Vehículos</h2>
                        <table class="table table-hover table-striped mt-3">
                            <tbody>
                                <tr>
                                    <td>Muscle Cars</td>
                                    <td class="tm-trash-icon-cell"><i class="fas fa-trash-alt tm-trash-icon"></i></td>
                                </tr>
                                <tr>
                                    <td>Sports Cars</td>
                                    <td class="tm-trash-icon-cell"><i class="fas fa-trash-alt tm-trash-icon"></i></td>
                                </tr>
                                <tr>
                                    <td>Classic Cars</td>
                                    <td class="tm-trash-icon-cell"><i class="fas fa-trash-alt tm-trash-icon"></i></td>
                                </tr>
                                <tr>
                                    <td>Convertible Cars</td>
                                    <td class="tm-trash-icon-cell"><i class="fas fa-trash-alt tm-trash-icon"></i></td>
                                </tr>
                                <tr>
                                    <td>Vintage Cars</td>
                                    <td class="tm-trash-icon-cell"><i class="fas fa-trash-alt tm-trash-icon"></i></td>
                                </tr>
                                <tr>
                                    <td>Luxury Cars</td>
                                    <td class="tm-trash-icon-cell"><i class="fas fa-trash-alt tm-trash-icon"></i></td>
                                </tr>
                                <tr>
                                    <td>Racing Cars</td>
                                    <td class="tm-trash-icon-cell"><i class="fas fa-trash-alt tm-trash-icon"></i></td>
                                </tr>
                                <tr>
                                    <td>Collector's Editions</td>
                                    <td class="tm-trash-icon-cell"><i class="fas fa-trash-alt tm-trash-icon"></i></td>
                                </tr>
                                <tr>
                                    <td>Limited Editions</td>
                                    <td class="tm-trash-icon-cell"><i class="fas fa-trash-alt tm-trash-icon"></i></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="./js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script>
        $(function() {
            $('.tm-product-name').on('click', function() {
                window.location.href = "edit-product.html";
            });
        })
    </script>
</body>

</html>