<!doctype html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Consesionario</title>
	<meta name="description" content="">

	<meta name="author" content="Web Domus Italia">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="source/bootstrap-3.3.6-dist/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="source/font-awesome-4.5.0/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="style/slider.css">
	<link rel="stylesheet" type="text/css" href="style/mystyle.css">

	<style>
		.whatsapp-button,
		.other-button {
			position: fixed;
			width: 60px;
			height: 60px;
			border-radius: 50px;
			text-align: center;
			font-size: 30px;
			box-shadow: 2px 2px 3px #999;
			z-index: 100;
		}

		.whatsapp-button {
			bottom: 20px;
			/* Posición del primer botón */
			right: 120px;
			/* Ajusta la separación desde el borde derecho */
			background-color: #25d366;
			color: #FFF;
		}

		.other-button {
			bottom: 60px;
			/* 20px más abajo que el primer botón */
			right: 40px;
			/* Ajusta la separación desde el borde derecho */
			background-color: #ff5722;
			/* Cambia el color según el diseño del otro botón */
			color: #FFF;
		}

		.whatsapp-button img,
		.other-button img {
			margin-top: 15px;
			width: 30px;
			height: 30px;
		}
	</style>

</head>

<body>
	<!-- Header -->
	<div class="allcontain">
		<div class="header">
			<ul class="socialicon">
				<li><a href="#"><i class="fa fa-facebook"></i></a></li>
				<li><a href="#"><i class="fa fa-twitter"></i></a></li>
				<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
				<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
			</ul>

			<ul class="logreg">
				<li><a href="login.php">Login </a> </li>
				<li><a href="register.php"><span class="register">Registrarse</span></a></li>
			</ul>
		</div>
		<!-- Navbar Up -->
		<nav class="topnavbar navbar-default topnav">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed toggle-costume" data-toggle="collapse" data-target="#upmenu" aria-expanded="false">
						<span class="sr-only"> Toggle navigaion</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand logo" href="index.php"><img src="image/logo1.png" alt="logo"></a>
				</div>
			</div>
			<div class="collapse navbar-collapse" id="upmenu">
				<ul class="nav navbar-nav" id="navbarontop">
					<li class="active"><a href="index.php">HOME</a> </li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">CATEGORIAS<span class="caret"></span></a>
						<ul class="dropdown-menu dropdowncostume">
							<li><a href="#">Deportivos</a></li>
							<li><a href="#">Clasicos</a></li>
							<li><a href="#">Nuevos</a></li>
						</ul>
					</li>
					<li>
						<a href="aboutUs.html">CONTACTENOS</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
	<!--_______________________________________ Carousel__________________________________ -->
	<div class="allcontain">
		<div id="carousel-up" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner " role="listbox">
				<div class="item active">
					<img src="image/oldcar.jpg" alt="oldcar">
					<div class="carousel-caption">
						<h2>Porsche 356</h2>
						<p>El Porsche 356, fabricado entre 1948 y 1965, es el primer modelo de producción en serie de la marca.<br>
							Con su diseño aerodinámico y elegante, este auto compacto y ligero es conocido por su excelente manejo y rendimiento. Equipado con un motor trasero de cuatro cilindros, el 356 se convirtió en un ícono de los deportivos clásicos, apreciado por su combinación de estilo y agilidad en la carretera.</p>
					</div>
				</div>
				<div class="item">
					<img src="image/porche.jpg" alt="porche">
					<div class="carousel-caption">
						<h2>Porche</h2>
						<p>Vehiculo automovil de la marca Porsche<br>
							alta gama $20 000</p>
					</div>
				</div>
				<div class="item">
					<img src="image/benz.jpg" alt="benz">
					<div class="carousel-caption">
						<h2>Porche</h2>
						<p>Vehiculo automovil de la marca Porsche<br>
							alta gama $20 000</p>
					</div>
				</div>
			</div>
			<nav class="navbar navbar-default midle-nav">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed textcostume" data-toggle="collapse" data-target="#navbarmidle" aria-expanded="false">
						<h1>BUSQUEDA</h1>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="navbarmidle">
					<div class="searchtxt">
						<h1>BUSQUEDA</h1>
					</div>
					<form class="navbar-form navbar-left searchformmargin" role="search">
						<div class="form-group">
							<input type="text" class="form-control searchform" placeholder="Marca">
						</div>
					</form>
					<ul class="nav navbar-nav navbarborder">
						<li class="li-category">
							<a class="btn  dropdown-toggle btn-costume" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Categoría<span class="glyphicon glyphicon-chevron-down downicon"></span></a>
							<ul class="dropdown-menu" id="mydd">
								<li><a href="#">Epic</a></li>
								<li><a href="#">Clasicos</a></li>
								<li><a href="#">Nuevos</a></li>
							</ul>
						</li>
						<li class="li-minyear"><a class="btn  dropdown-toggle btn-costume" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Año Minimo<span class="glyphicon glyphicon-chevron-down downicon"></span></a>
							<ul class="dropdown-menu" id="mydd2">
								<li><a href="#">1950</a></li>
							</ul>
						</li>
						<li class="li-maxyear"><a class="btn dropdown-toggle btn-costume" id="dropdownMenu3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Año máximo<span class="glyphicon glyphicon-chevron-down downicon"></span></a>
							<ul class="dropdown-menu" id="mydd3">
								<li><a href="#">1970</a></li>
								<li><a href="#">1980</a></li>
								<li><a href="#">1990</a></li>
							</ul>
						</li>
						<li class="li-slideprice">
							<p> <label class="slidertxt" for="amount">Precio </label>
								<input class="priceslider" type="text" id="amount" readonly="readonly">
							</p>
							<div id="slider-range"></div>

						</li>
						<li class="li-search"> <button class="searchbutton"><span class="glyphicon glyphicon-search "></span></button></li>
					</ul>

				</div>
			</nav>
		</div>
	</div>
	<!-- ____________________Featured Section ______________________________-->
	<div class="allcontain">
		<div class="feturedsection">
			<h1 class="text-center">&bullet;PRECIOS Y CARACTERISTICAS&bullet;</h1>
		</div>
		<div class="feturedimage">
			<div class="row firstrow">
				<div class="col-lg-6 costumcol colborder1">
					<div class="row costumrow">
						<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 img1colon">
							<img src="image/featurporch.jpg" alt="porsche">
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 txt1colon ">
							<div class="featurecontant">
								<h1>Porshe 911</h1>
								<p>"Luno de los modelos mas iconicos de la marca alemana Porsche. ,<br>
									Motor trasero de 6 cilindros boxer (configuracion clasica del 911). </p>
								<h2>Price &euro;</h2>
								<button id="btnRM" onClick="rmtxt()">Leer más</button>
								<div id="readmore">
									<h1>Porshe Cayenne</h1>
									<p>"Motor trasero de 6 cilindros ,<br>
										Motor turbo alimentado de 3 a 3.8 litros <br>"La potencia varia dependiendo del modelo, ,<br>
										Disponible con traccion trasera "o traccion total un chuzo de auto,,
										Automatica de doble embrague "transmision manual de 7 velocidades
										Aceleracion de 0 a 100 en 3.5s "Carroceria aerodinamica,<br>
									</p>
									<button id="btnRL">Leer menos</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 costumcol colborder2">
					<div class="row costumrow">
						<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 img2colon">
							<img src="image/featurporch1.jpg" alt="porsche1">
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 txt1colon ">
							<div class="featurecontant">
								<h1>Porshe Cayenne</h1>
								<p>"Opciones de doble traccion y mas de 6 marchas ,<br>
									El auto ideal para los solteros </p>
								<h2>Price &euro;</h2>
								<button id="btnRM2">Leer mas</button>
								<div id="readmore2">
									<h1>Car Name</h1>
									<p>"El porshe Cayenne auto clasico muy famoso, ,<br>
										Sale en grandes peliculas <br>"Resistencia aerodinamica unica ,<br>
										Llantas de fabrica profesionales"Con una aerodinamica envidiable ,
										El interior es comodo y acogedor"Full extras automatico o manual
										Parlantes unicos de fabrica, De los porshe el mas economico y unico<br></p>
									<button id="btnRL2">Leer menos</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ________________________LATEST CARS SECTION _______________________-->
		<div class="latestcars">
			<h1 class="text-center">&bullet; ULTIMOS VEHICULOS &bullet;</h1>
			<ul class="nav nav-tabs navbar-left latest-navleft">
				<li role="presentation" class="li-sortby"><span class="sortby">Filtrar por: </span></li>
				<li data-filter=".RECENT" role="presentation"><a href="#mostrecent" class="prcBtnR">Mas reciente </a></li>
				<li data-filter=".POPULAR" role="presentation"><a href="#mostpopular" class="prcBtnR">Mas popular </a></li>
				<li role="presentation"><a href="#" class="alphSort">Alphabético </a></li>
				<li data-filter=".HPRICE" role="presentation"><a href="#" class="prcBtnH">Precio mas alto </a></li>
				<li data-filter=".LPRICE" role="presentation"><a href="#" class="prcBtnL">Precio mas bajo </a></li>
				<li id="hideonmobile">
			</ul>
		</div>
		<br>
		<br>
		<!-- ________________________Latest Cars Image Thumbnail________________-->
		<div class="grid">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
					<div class="txthover">
						<img src="image/car1.jpg" alt="car1">
						<div class="txtcontent">
							<div class="stars">
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
							</div>
							<div class="simpletxt">
								<h3 class="name">
									<div class="simpletxt">
										<h3 class="name">Rolls-Royce Phantom</h3>
										<p>El Rolls-Royce Phantom es el pináculo del lujo automotriz, combinando una ingeniería excepcional con un diseño opulento. Este sedán de ultra-lujo cuenta con un motor V12 y un interior hecho a mano, ofreciendo una experiencia de conducción incomparable y un confort inigualable.</p>
										<h4 class="price"> $10 000</h4>
										<button>Leer más</button><br>
										<div class="wishtxt">
											<p class="paragraph1"> Añadir a la lista de deseos <span class="glyphicon glyphicon-heart"></span> </p>
											<p class="paragraph2">Compare <span class="icon"><img src="image/compicon.png" alt="compicon"></span></p>
										</div>
									</div>
								</h3>
								<p>"Lorem ipsum dolor sit amet, consectetur,<br>
									sed do eiusmod tempor incididunt" </p>
								<h4 class="price"> 1000&euro;</h4>
								<button>Leer más</button><br>
								<div class="wishtxt">
									<p class="paragraph1"> Añadir a la lista de deseos <span class="glyphicon glyphicon-heart"></span> </p>
									<p class="paragraph2">Compare <span class="icon"><img src="image/compicon.png" alt="compicon"></span></p>
								</div>
							</div>
							<div class="stars2">
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 ">
					<div class="txthover">
						<img src="image/car2.jpg" alt="car2">
						<div class="txtcontent">
							<div class="stars">
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
							</div>
							<div class="simpletxt">
								<h3 class="name">Renault</h3>
								<p>"Vehiculo automotriz,<br>
									de gama Alta." </p>
								<h4 class="price">$9000</h4>
								<button>Leer más</button><br>
								<div class="wishtxt">
									<p class="paragraph1"> Añadir a la lista de deseos <span class="glyphicon glyphicon-heart"></span> </p>
									<p class="paragraph2">Compare <span class="icon"><img src="image/compicon.png" alt="compicon"></span></p>
								</div>
							</div>
							<div class="stars2">
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
					<div class="txthover">
						<img src="image/car3.jpg" alt="car3">
						<div class="txtcontent">
							<div class="stars">
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
							</div>
							<div class="simpletxt">
								<h3 class="name">Ford Mustang</h3>
								<p>El Ford Mustang es un ícono del automovilismo estadounidense, conocido por su poderoso motor y su diseño musculoso.<br>
									Este clásico deportivo ofrece una mezcla única de rendimiento y estilo, siendo una elección popular entre los amantes de los autos de alto rendimiento.</p>
								<h4 class="price">$30 000 </h4>
								<button>Leer más</button><br>
								<div class="wishtxt">
									<p class="paragraph1"> Añadir a la lista de deseos <span class="glyphicon glyphicon-heart"></span> </p>
									<p class="paragraph2">Compare <span class="icon"><img src="image/compicon.png" alt="compicon"></span></p>
								</div>
							</div>
							<div class="stars2">
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
					<div class="txthover">
						<img src="image/car4.jpg" alt="car4">
						<div class="txtcontent">
							<div class="stars">
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
							</div>
							<div class="simpletxt">
								<h3 class="name">Rover 75</h3>
								<p>sedán británico conocido por su elegancia clásica y su comodidad de conducción.<br>
									Con un interior lujoso y acabados de alta calidad, el Rover 75 combina un diseño tradicional con tecnología moderna, ofreciendo una experiencia de conducción refinada y sofisticada.</p>
								<h4 class="price">$10 000 </h4>
								<button>Leer más</button><br>
								<div class="wishtxt">
									<p class="paragraph1"> Añadir a la lista de deseos <span class="glyphicon glyphicon-heart"></span> </p>
									<p class="paragraph2">Compare <span class="icon"><img src="image/compicon.png" alt="compicon"></span></p>
								</div>
							</div>
							<div class="stars2">
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
					<div class="txthover">
						<img src="image/car5.jpg" alt="car5">
						<div class="txtcontent">
							<div class="stars">
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
							</div>
							<div class="simpletxt">
								<h3 class="name">Porche</h3>
								<p>Vehiculo automotriz<br>
									de alta gama.</p>
								<h4 class="price">$12 000</h4>
								<button>Leer más</button><br>
								<div class="wishtxt">
									<p class="paragraph1"> Añadir a la lista de deseos <span class="glyphicon glyphicon-heart"></span> </p>
									<p class="paragraph2">Compare <span class="icon"><img src="image/compicon.png" alt="compicon"></span></p>
								</div>
							</div>
							<div class="stars2">
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
					<div class="txthover">
						<img src="image/car6.jpg" alt="car6">
						<div class="txtcontent">
							<div class="stars">
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
							</div>
							<div class="simpletxt">
								<h3 class="name">Porche 911</h3>
								<p>El Porsche 911 es un deportivo legendario que combina un rendimiento excepcional con un diseño icónico.<br>
									Desde su lanzamiento en 1964, el 911 ha sido un símbolo de innovación y excelencia en la ingeniería automotriz, ofreciendo una experiencia de conducción inigualable.</p>
								<h4 class="price">$40 000</h4>
								<button>Leer más</button><br>
								<div class="wishtxt">
									<p class="paragraph1"> Añadir a la lista de deseos <span class="glyphicon glyphicon-heart"></span> </p>
									<p class="paragraph2">Compare <span class="icon"><img src="image/compicon.png" alt="compicon"></span></p>
								</div>
							</div>
							<div class="stars2">
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
					<div class="txthover">
						<img src="image/car7.jpg" alt="car7">
						<div class="txtcontent">
							<div class="stars">
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
							</div>
							<div class="simpletxt">
								<h3 class="name">Chevrolet SS</h3>
								<p>El Chevrolet SS es un sedán deportivo que combina un diseño elegante con un potente motor V8.<br>
									Este vehículo es conocido por su rendimiento robusto, manejo preciso, y una experiencia de conducción emocionante, lo que lo convierte en una joya para los amantes de los autos de alto rendimiento. </p>
								<h4 class="price">$30 000</h4>
								<button>Leer más</button><br>
								<div class="wishtxt">
									<p class="paragraph1"> Añadir a la lista de deseos <span class="glyphicon glyphicon-heart"></span> </p>
									<p class="paragraph2">Compare <span class="icon"><img src="image/compicon.png" alt="compicon"></span></p>
								</div>
							</div>
							<div class="stars2">
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
					<div class="txthover">
						<img src="image/car8.jpg" alt="car8">
						<div class="txtcontent">
							<div class="stars">
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
							</div>
							<div class="simpletxt">
								<h3 class="name">Meclaren</h3>
								<p>superdeportivo de vanguardia que combina un diseño aerodinámico con un rendimiento impresionante.<br>
									Equipado con un motor V8 biturbo, el 720S es capaz de alcanzar velocidades asombrosas, ofreciendo una experiencia de conducción que desafía los límites de lo posible.</p>
								<h4 class="price">$25 000</h4>
								<button>Leer más</button><br>
								<div class="wishtxt">
									<p class="paragraph1"> Añadir a la lista de deseos <span class="glyphicon glyphicon-heart"></span> </p>
									<p class="paragraph2">Compare <span class="icon"><img src="image/compicon.png" alt="compicon"></span></p>
								</div>
							</div>
							<div class="stars2">
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
								<div class="glyphicon glyphicon-star"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- _______________________________News Letter ____________________-->
		<div class="newslettercontent">
			<div class="leftside">
				<img src="image/border.png" alt="border">
				<h1>Boletín informativo</h1>
				<p>Suscríbete a la lista de correo de COLLECTIONCARS para <br>
					recibir actualizaciones sobre nuevas llegadas, ofertas especiales <br>
					y otra información sobre descuentos.</p>
			</div>
			<div class="rightside">
				<img class="newsimage" src="image/newsletter.jpg" alt="newsletter">
				<input type="text" class="form-control" id="subemail" placeholder="EMAIL">
				<button>SUSCRIBETE</button>
			</div>
		</div>
		<!-- ______________________________________________________Bottom Menu ______________________________-->
		<div class="bottommenu">
			<div class="bottomlogo">
				<span class="dotlogo">&bullet;</span><img src="image/collectionlogo1.png" alt="logo1"><span class="dotlogo">&bullet;;</span>
			</div>
			<ul class="nav nav-tabs bottomlinks">
				<li role="presentation"><a href="aboutUs.html" role="button">SOBRE NOSOTROS </a></li>
				<li role="presentation"><a href="#/">CATEGORIAS</a></li>
				<li role="presentation"><a href="contact.html">CONTACTENOS</a></li>
				<li role="presentation"><a href="#/">BOLETÍN INFORMATICO</a></li>
			</ul>
			<p>"Un vehiculo no es un medio de transporte, es arte sobre ruedas"</p>
			<img src="image/line.png" alt="line"> <br>
			<div class="bottomsocial">
				<a href="#"><i class="fa fa-facebook"></i></a>
				<a href="#"><i class="fa fa-twitter"></i></a>
				<a href="#"><i class="fa fa-google-plus"></i></a>
				<a href="#"><i class="fa fa-pinterest"></i></a>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="source/bootstrap-3.3.6-dist/js/jquery.js"></script>
	<script type="text/javascript" src="./js/isotope.js"></script>
	<script type="text/javascript" src="./js/myscript.js"></script>
	<script type="text/javascript" src="./source/bootstrap-3.3.6-dist/js/jquery.1.11.js"></script>
	<script type="text/javascript" src="./source/bootstrap-3.3.6-dist/js/bootstrap.js"></script>
	<a href="http://wa.link/at86om" class="whatsapp-button" target="_blank">
		<img src="https://upload.wikimedia.org/wikipedia/commons/6/6b/WhatsApp.svg" alt="WhatsApp">
	</a>

	<script>
		window.addEventListener('mouseover', initLandbot, {
			once: true
		});
		window.addEventListener('touchstart', initLandbot, {
			once: true
		});
		var myLandbot;

		function initLandbot() {
			if (!myLandbot) {
				var s = document.createElement('script');
				s.type = 'text/javascript';
				s.async = true;
				s.addEventListener('load', function() {
					var myLandbot = new Landbot.Livechat({
						configUrl: 'https://storage.googleapis.com/landbot.online/v3/H-2561965-Y9QK9150RGYNFQ92/index.json',
					});
				});
				s.src = 'https://cdn.landbot.io/landbot-3/landbot-3.0.0.js';
				var x = document.getElementsByTagName('script')[0];
				x.parentNode.insertBefore(s, x);
			}
		}
	</script>
</body>

</html>