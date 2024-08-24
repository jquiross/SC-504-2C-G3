<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
    <!-- https://fonts.google.com/specimen/Open+Sans -->
    <link rel="stylesheet" href="./css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="./css/tooplate.css">

    <style>
        /* Estilos para el interruptor (switch) */
        .form-check {
            display: flex;
            align-items: center;
        }

        .form-check-input {
            margin-right: 10px;
        }

        .form-check-input:checked {
            background-color: #007bff;
            /* Color de fondo cuando está activado */
            border-color: #007bff;
            /* Color del borde cuando está activado */
        }

        .form-check-label {
            margin-bottom: 0;
            /* Alinea el texto con el switch */
        }

        .form-switch {
            display: flex;
            align-items: center;
        }

        .form-switch .form-check-input {
            width: 34px;
            height: 20px;
            cursor: pointer;
            background-color: #d9d9d9;
            /* Color de fondo cuando está desactivado */
            border-radius: 15px;
            position: relative;
        }

        .form-switch .form-check-input:checked {
            background-color: #007bff;
            /* Color de fondo cuando está activado */
        }

        .form-switch .form-check-input::before {
            content: '';
            position: absolute;
            top: 2px;
            left: 2px;
            width: 16px;
            height: 16px;
            background-color: white;
            border-radius: 50%;
            transition: 0.2s;
        }

        .form-switch .form-check-input:checked::before {
            transform: translateX(14px);
            /* Desplaza el círculo cuando está activado */
        }
    </style>
</head>

<body id="reportsPage" class="bg02">
    <div class="" id="home">
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
                                <h2 class="tm-block-title d-inline-block">Citas</h2>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover table-striped tm-table-striped-even mt-3">
                                <thead>
                                    <tr class="tm-bg-gray">
                                        <th scope="col">ID</th>
                                        <th scope="col">Cliente</th>
                                        <th scope="col">Usuario</th>
                                        <th scope="col">Vehículo</th>
                                        <th scope="col">Fecha y Hora</th>
                                        <th scope="col">Tipo</th>
                                        <th scope="col">Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Laura Morales</td>
                                        <td>Juan Pérez</td>
                                        <td>Honda Civic</td>
                                        <td>2024-08-23 14:30</td>
                                        <td>Mantenimiento</td>
                                        <td>
                                            <div class="form-check form-switch">
                                                <input class="form-check-input" type="checkbox" id="switchStatus1" checked>
                                                <label class="form-check-label" for="switchStatus1">Confirmada</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Andrés Fernández</td>
                                        <td>Maria López</td>
                                        <td>Ford Focus</td>
                                        <td>2024-08-24 09:00</td>
                                        <td>Reparación</td>
                                        <td>
                                            <div class="form-check form-switch">
                                                <input class="form-check-input" type="checkbox" id="switchStatus2">
                                                <label class="form-check-label" for="switchStatus2">Pendiente</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Isabella Ruiz</td>
                                        <td>Carlos Gómez</td>
                                        <td>Toyota Corolla</td>
                                        <td>2024-08-25 11:30</td>
                                        <td>Inspección</td>
                                        <td>
                                            <div class="form-check form-switch">
                                                <input class="form-check-input" type="checkbox" id="switchStatus3" checked>
                                                <label class="form-check-label" for="switchStatus3">Confirmada</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>Daniel Martínez</td>
                                        <td>Patricia Castro</td>
                                        <td>Nissan Altima</td>
                                        <td>2024-08-26 15:00</td>
                                        <td>Servicio</td>
                                        <td>
                                            <div class="form-check form-switch">
                                                <input class="form-check-input" type="checkbox" id="switchStatus4" checked>
                                                <label class="form-check-label" for="switchStatus4">Confirmada</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>Camila Castro</td>
                                        <td>Felipe Martínez</td>
                                        <td>Chevrolet Malibu</td>
                                        <td>2024-08-27 10:00</td>
                                        <td>Diagnóstico</td>
                                        <td>
                                            <div class="form-check form-switch">
                                                <input class="form-check-input" type="checkbox" id="switchStatus5">
                                                <label class="form-check-label" for="switchStatus5">En Proceso</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>6</td>
                                        <td>Felipe Gómez</td>
                                        <td>Laura Pérez</td>
                                        <td>Subaru Outback</td>
                                        <td>2024-08-28 16:30</td>
                                        <td>Mantenimiento</td>
                                        <td>
                                            <div class="form-check form-switch">
                                                <input class="form-check-input" type="checkbox" id="switchStatus6" checked>
                                                <label class="form-check-label" for="switchStatus6">Confirmada</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>7</td>
                                        <td>Valentina Ortega</td>
                                        <td>Jorge Rivera</td>
                                        <td>Kia Sorento</td>
                                        <td>2024-08-29 13:00</td>
                                        <td>Servicio</td>
                                        <td>
                                            <div class="form-check form-switch">
                                                <input class="form-check-input" type="checkbox" id="switchStatus7">
                                                <label class="form-check-label" for="switchStatus7">Pendiente</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>8</td>
                                        <td>Héctor Hernández</td>
                                        <td>Paola Morales</td>
                                        <td>Volkswagen Jetta</td>
                                        <td>2024-08-30 12:00</td>
                                        <td>Inspección</td>
                                        <td>
                                            <div class="form-check form-switch">
                                                <input class="form-check-input" type="checkbox" id="switchStatus8" checked>
                                                <label class="form-check-label" for="switchStatus8">Confirmada</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>9</td>
                                        <td>Andrea Fernández</td>
                                        <td>Ricardo Ruiz</td>
                                        <td>Hyundai Elantra</td>
                                        <td>2024-08-31 14:00</td>
                                        <td>Reparación</td>
                                        <td>
                                            <div class="form-check form-switch">
                                                <input class="form-check-input" type="checkbox" id="switchStatus9">
                                                <label class="form-check-label" for="switchStatus9">Pendiente</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>10</td>
                                        <td>Victoria López</td>
                                        <td>Samuel Martínez</td>
                                        <td>Ford Mustang</td>
                                        <td>2024-09-01 09:30</td>
                                        <td>Diagnóstico</td>
                                        <td>
                                            <div class="form-check form-switch">
                                                <input class="form-check-input" type="checkbox" id="switchStatus10" checked>
                                                <label class="form-check-label" for="switchStatus10">Confirmada</label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <script src="./js/bootstrap.bundle.min.js"></script>
</body>

</html>