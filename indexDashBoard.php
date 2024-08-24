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
    <link rel="stylesheet" href="./css/fullcalendar.min.css">
    <!-- https://fullcalendar.io/ -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="./css/tooplate.css">
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
            <div class="row tm-content-row tm-mt-big justify-content-between">
                <div class="col-xl-4 col-lg-6 col-md-12">
                    <div class="bg-white tm-block h-100">
                        <h2 class="tm-block-title">Vehiculos mas vendidos</h2>
                        <canvas id="barChart"></canvas>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-6 col-md-12">
                    <div class="bg-white tm-block h-100">
                        <div class="row">
                            <div class="col-8">
                                <h2 class="tm-block-title d-inline-block">Lista de Vehiculos Populares</h2>
                            </div>
                            <div class="col-4 text-right">
                                <a href="vehiculos.php" class="tm-link-black">Ver Todo</a>
                            </div>
                        </div>
                        <ol class="tm-list-group tm-list-group-alternate-color tm-list-group-pad-big">
                            <li class="tm-list-group-item">
                                Chevrolet Camaro 1969 - 15 unidades vendidas (azul)
                            </li>
                            <li class="tm-list-group-item">
                                Ford Mustang 1965 - 13 unidades vendidas (rojo)
                            </li>
                            <li class="tm-list-group-item">
                                Porsche 911 Classic - 10 unidades vendidas (verde)
                            </li>
                            <li class="tm-list-group-item">
                                Jaguar E-Type 1961 - 6 unidades vendidas (amrillo)
                            </li>
                            <li class="tm-list-group-item">
                                Dodge Charger 1970 - 4 unidades vendidas (naranja)
                            </li>
                            <li class="tm-list-group-item">
                                BMW 2002 Turbo - 2 unidades vendidas (morado)
                            </li>
                        </ol>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-6 col-md-12">
                    <div class="bg-white tm-block h-100">
                        <h2 class="tm-block-title">Calendario</h2>
                        <div id="calendar"></div>
                        <div class="row mt-4">
                            <div class="col-12 text-right">
                                <a href="#" class="tm-link-black">Ver Horarios</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="./js/moment.min.js"></script>
    <!-- https://momentjs.com/ -->
    <script src="./js/utils.js"></script>
    <script src="./js/Chart.min.js"></script>
    <!-- http://www.chartjs.org/docs/latest/ -->
    <script src="./js/fullcalendar.min.js"></script>
    <!-- https://fullcalendar.io/ -->
    <script src="./js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script src="./js/tooplate-scripts.js"></script>
    <script>
        let ctxLine,
            ctxBar,
            ctxPie,
            optionsLine,
            optionsBar,
            optionsPie,
            configLine,
            configBar,
            configPie,
            lineChart;
        barChart;
        // DOM is ready
        $(function() {
            updateChartOptions();
            drawLineChart(); // Line Chart
            drawBarChart(); // Bar Chart
            drawCalendar(); // Calendar

            $(window).resize(function() {
                updateChartOptions();
                updateLineChart();
                updateBarChart();
                reloadPage();
            });
        })
    </script>
</body>

</html>