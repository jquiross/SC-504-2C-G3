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
        .form-group input, .form-group select, .form-group textarea {
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
                                    Añadir Vehículo
                                    <a href="controllers/controllerProductos.php?action=add" class="btn btn-primary btn-sm">Añadir</a>
                                </h2>
                            </div>
                        </div>
                        <form action="controllers/controllerProductos.php?action=add" method="POST" class="tm-edit-product-form">
                            <div class="form-group mb-2">
                                <label for="name" class="form-label">Nombre del Vehículo</label>
                                <input id="name" name="name" type="text" class="form-control validate" placeholder="Nombre del vehículo" required>
                            </div>
                            <div class="form-group mb-2">
                                <label for="description" class="form-label">Descripción</label>
                                <textarea id="description" name="description" class="form-control validate" rows="2" placeholder="Descripción del vehículo" required></textarea>
                            </div>
                            <div class="form-group mb-2">
                                <label for="price" class="form-label">Precio</label>
                                <input id="price" name="price" type="number" step="0.01" class="form-control validate" placeholder="Precio del vehículo" required>
                            </div>
                            <div class="form-group mb-2">
                                <label for="discount" class="form-label">Descuento</label>
                                <input id="discount" name="discount" type="number" step="0.01" class="form-control validate" placeholder="Descuento aplicado" required>
                            </div>
                            <div class="form-group mb-2">
                                <label for="category" class="form-label">Categoría</label>
                                <select class="form-select" id="category" name="category" required>
                                    <option value="" disabled selected>Seleccione una categoría</option>
                                </select>
                            </div>
                            <div class="form-group mb-2">
                                <label for="stock" class="form-label">Unidades en Stock</label>
                                <input id="stock" name="stock" type="number" class="form-control validate" placeholder="Unidades en stock" required>
                            </div>
                            <div class="form-group mb-2">
                                <label for="img_ruta" class="form-label">URL de la Imagen</label>
                                <input id="img_ruta" name="img_ruta" type="text" class="form-control" placeholder="URL de la imagen" required>
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
