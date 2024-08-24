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

    <style>
        /* Estilos para el switch */
        .switch {
            position: relative;
            display: inline-block;
            width: 34px;
            height: 20px;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 20px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 12px;
            width: 12px;
            border-radius: 50%;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
        }

        input:checked+.slider {
            background-color: #2196F3;
        }

        input:checked+.slider:before {
            transform: translateX(14px);
        }

        .slider.round {
            border-radius: 20px;
        }

        .slider.round:before {
            border-radius: 50%;
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
                                <h2 class="tm-block-title d-inline-block">Pagos</h2>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover table-striped tm-table-striped-even mt-3">
                                <thead>
                                    <tr class="tm-bg-gray">
                                        <th scope="col">ID Pago</th>
                                        <th scope="col">Cliente ID</th>
                                        <th scope="col">Factura ID</th>
                                        <th scope="col">Monto</th>
                                        <th scope="col">Fecha</th>
                                        <th scope="col">Método de Pago</th>
                                        <th scope="col">Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>101</td>
                                        <td>202</td>
                                        <td>$2,500.00</td>
                                        <td>2024-08-15 10:30</td>
                                        <td>Tarjeta de Crédito</td>
                                        <td>
                                            <label class="switch">
                                                <input type="checkbox" checked>
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>102</td>
                                        <td>203</td>
                                        <td>$1,500.00</td>
                                        <td>2024-08-16 11:00</td>
                                        <td>Transferencia Bancaria</td>
                                        <td>
                                            <label class="switch">
                                                <input type="checkbox">
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>103</td>
                                        <td>204</td>
                                        <td>$3,000.00</td>
                                        <td>2024-08-17 12:45</td>
                                        <td>Pago en Efectivo</td>
                                        <td>
                                            <label class="switch">
                                                <input type="checkbox" checked>
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>104</td>
                                        <td>205</td>
                                        <td>$1,200.00</td>
                                        <td>2024-08-18 14:00</td>
                                        <td>Tarjeta de Crédito</td>
                                        <td>
                                            <label class="switch">
                                                <input type="checkbox">
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>105</td>
                                        <td>206</td>
                                        <td>$1,800.00</td>
                                        <td>2024-08-19 09:30</td>
                                        <td>Transferencia Bancaria</td>
                                        <td>
                                            <label class="switch">
                                                <input type="checkbox" checked>
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>6</td>
                                        <td>106</td>
                                        <td>207</td>
                                        <td>$2,200.00</td>
                                        <td>2024-08-20 16:00</td>
                                        <td>Pago en Efectivo</td>
                                        <td>
                                            <label class="switch">
                                                <input type="checkbox">
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>7</td>
                                        <td>107</td>
                                        <td>208</td>
                                        <td>$3,500.00</td>
                                        <td>2024-08-21 11:15</td>
                                        <td>Tarjeta de Crédito</td>
                                        <td>
                                            <label class="switch">
                                                <input type="checkbox" checked>
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>8</td>
                                        <td>108</td>
                                        <td>209</td>
                                        <td>$2,750.00</td>
                                        <td>2024-08-22 13:45</td>
                                        <td>Transferencia Bancaria</td>
                                        <td>
                                            <label class="switch">
                                                <input type="checkbox">
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>9</td>
                                        <td>109</td>
                                        <td>210</td>
                                        <td>$3,100.00</td>
                                        <td>2024-08-23 10:30</td>
                                        <td>Pago en Efectivo</td>
                                        <td>
                                            <label class="switch">
                                                <input type="checkbox" checked>
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>10</td>
                                        <td>110</td>
                                        <td>211</td>
                                        <td>$4,000.00</td>
                                        <td>2024-08-24 15:00</td>
                                        <td>Tarjeta de Crédito</td>
                                        <td>
                                            <label class="switch">
                                                <input type="checkbox">
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>11</td>
                                        <td>111</td>
                                        <td>212</td>
                                        <td>$1,600.00</td>
                                        <td>2024-08-25 08:00</td>
                                        <td>Transferencia Bancaria</td>
                                        <td>
                                            <label class="switch">
                                                <input type="checkbox" checked>
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>12</td>
                                        <td>112</td>
                                        <td>213</td>
                                        <td>$1,900.00</td>
                                        <td>2024-08-26 14:15</td>
                                        <td>Pago en Efectivo</td>
                                        <td>
                                            <label class="switch">
                                                <input type="checkbox">
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>13</td>
                                        <td>113</td>
                                        <td>214</td>
                                        <td>$2,300.00</td>
                                        <td>2024-08-27 11:30</td>
                                        <td>Tarjeta de Crédito</td>
                                        <td>
                                            <label class="switch">
                                                <input type="checkbox" checked>
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>14</td>
                                        <td>114</td>
                                        <td>215</td>
                                        <td>$2,700.00</td>
                                        <td>2024-08-28 16:00</td>
                                        <td>Transferencia Bancaria</td>
                                        <td>
                                            <label class="switch">
                                                <input type="checkbox">
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>15</td>
                                        <td>115</td>
                                        <td>216</td>
                                        <td>$3,200.00</td>
                                        <td>2024-08-29 09:00</td>
                                        <td>Pago en Efectivo</td>
                                        <td>
                                            <label class="switch">
                                                <input type="checkbox" checked>
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
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