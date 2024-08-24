<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Añadir Vehículo</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
    <link rel="stylesheet" href="./css/fontawesome.min.css">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/tooplate.css">
    <link rel="stylesheet" href="./css/stylesheet">
    <style>
        .form-container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .form-container .btn-primary {
            margin-left: 20px;
        }

        .form-group label {
            font-weight: bold;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            border-radius: 4px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004b8d;
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
            <div class="row tm-mt-big justify-content-center">
                <div class="col-xl-6 col-lg-8 col-md-10 col-sm-12">
                    <div class="bg-white tm-block p-3 rounded shadow-sm form-container">
                        <div class="row mb-3">
                            <div class="col-12">
                                <h2 class="tm-block-title">
                                    Añadir Cuenta
                                    <a href="controllers/controllerProductos.php?action=add" class="btn btn-primary btn-sm">Añadir</a>
                                </h2>
                            </div>
                        </div>
                        <form action="controllers/controllerCuentas.php?action=add" method="POST" class="tm-register-account-form">
                            <div class="form-group mb-2">
                                <label for="username" class="form-label">Nombre de Usuario</label>
                                <input id="username" name="username" type="text" class="form-control validate" placeholder="Nombre de usuario" required>
                            </div>
                            <div class="form-group mb-2">
                                <label for="email" class="form-label">Correo Electrónico</label>
                                <input id="email" name="email" type="email" class="form-control validate" placeholder="Correo electrónico" required>
                            </div>
                            <div class="form-group mb-2">
                                <label for="password" class="form-label">Contraseña</label>
                                <input id="password" name="password" type="password" class="form-control validate" placeholder="Contraseña" required>
                            </div>
                            <div class="form-group mb-2">
                                <label for="confirm_password" class="form-label">Confirmar Contraseña</label>
                                <input id="confirm_password" name="confirm_password" type="password" class="form-control validate" placeholder="Confirmar contraseña" required>
                            </div>
                            <div class="form-group mb-2">
                                <label for="role" class="form-label">Rol</label>
                                <select class="form-select" id="role" name="role" required>
                                    <option value="" disabled selected>Seleccione un rol</option>
                                    <!-- Aquí deberías añadir opciones dinámicamente según los roles disponibles -->
                                    <option value="admin">Administrador</option>
                                    <option value="user">Usuario</option>
                                </select>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="./js/jquery-3.3.1.min.js"></script>
        <script src="./js/bootstrap.min.js"></script>
        <script>
            $(function() {
                $('.tm-product-name').on('click', function() {
                    window.location.href = "edit-product.html";
                });
            })
        </script>
    </div>
</body>

</html>