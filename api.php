<?php
/**
 * PAYCOMET JET IFRAME callback
 * Tracking ID: SSX-7MS-JX3J
 *
 * @author PAYCOMET
 * @copyright Copyright (c) 2019, PAYCOMET
 * @version 1.1 2019-11-07
 */
 
$jetID 			= "** yourJETID";
$merchantCode   = "** yourmerchantcode";
$terminal       = "** terminalnumber";
$password       = "** yourpassword";

if (isset($_POST["paytpvToken"])) {
    date_default_timezone_set("Europe/Madrid");

    $token = $_POST["paytpvToken"];

    if ($token && strlen($token) == 64) {

        $endPoint       			= "https://api.paycomet.com/gateway/xml-bankstore?wsdl";
        $productDescription         = "XML_BANKSTORE TEST productDescription";
        $owner                      = "XML_BANKSTORE TEST owner";

        $signature
            = hash("sha512",
                $merchantCode
                .$token
                .$jetID
                .$terminal
                .$password
        );


        $ip				= $_SERVER["REMOTE_ADDR"];

        try {
            $context = stream_context_create(array(
                'ssl' => array(
                    'verify_peer' => false,
                    'verify_peer_name' => false,
                    'allow_self_signed' => true
                )
            ));

            $clientSOAP = new SoapClient($endPoint, array('stream_context' => $context));
            $addUserTokenResponse
                = $clientSOAP->add_user_token(
                    $merchantCode,
                    $terminal,
                    $token,
                    $jetID,
                    $signature,
                    $ip
				);					

			if ($addUserTokenResponse["DS_ERROR_ID"] == "0") {
				// OK
				echo " Proceso correcto. Se ha obtenido el token";
				var_dump($addUserTokenResponse);		
				
				$order = "MERCHANTORDER-" . date("Y/m/d h:I:s");

				$signature
					= hash("sha512",
						$merchantCode
						.$addUserTokenResponse["DS_IDUSER"]
						.$addUserTokenResponse["DS_TOKEN_USER"]
						.$terminal
						.$_POST["amount"]
						.$order
						.$password
				);
				$productDescription     = "XML_BANKSTORE TEST productDescription";
				$owner                  = "XML_BANKSTORE TEST owner";

				$executePurchaseResponse
					= $clientSOAP->execute_purchase(
						$merchantCode,
						$terminal,
						$addUserTokenResponse["DS_IDUSER"],
						$addUserTokenResponse["DS_TOKEN_USER"],
						$_POST["amount"],
						$order,
						"EUR",
						$signature,
						$ip,
						$productDescription,
						$owner
					);

				if ($executePurchaseResponse["DS_RESPONSE"] == "1") {
					// OK
					var_dump("COMPRA CORRECTA");
					return true;
				} else {
					//KO
					var_dump("Error al obtener el ejecutar la compra");
					var_dump($executePurchaseResponse["DS_ERROR_ID"]);
					return false;
				}

				var_dump($executePurchaseResponse);

			} else {
				var_dump("Error al obtener el token");
				var_dump($addUserTokenResponse["DS_ERROR_ID"]);
				return false;
			}
        } catch(SoapFault $e){
            var_dump($e);
        }
    } else {
        var_dump("Error, no se ha obtenido token");
        return false;
    }
    return false;
}
?>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
</head>
<body>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
	<div class="container">
			<div class="row">
				<aside class="col-sm-6">
					<p><h1>Envio de datos hacia PayPal</h1> </p>

					<article class="card">
						<div class="card-body p-5">
								<p>
								<h3> Datos de prueba </h3>
								Tarjeta : 4539 2320 7664 8253 <br/>
								CVC: 123 <br/>
								Caducidad: 05 / 25 <br/>
								</p>
							<p class="alert alert-success">Some text success or error</p>

							<form role="form" id="paycometPaymentForm" method="POST">
							<input type="hidden" name="amount" value="1234">
							<input type="hidden" data-paycomet="jetID" value="<?php echo $jetID; ?>">
							<div class="form-group">
								<label for="username">Full name (on the card)</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fa fa-user"></i></span>
									</div>
									<input type="text" class="form-control" name="username" data-paycomet="cardHolderName" placeholder="" required="">
								</div> <!-- input-group.// -->
							</div> <!-- form-group.// -->

							<div class="form-group">
								<label for="cardNumber">Card number</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fa fa-credit-card"></i></span>
									</div>
									<div id="paycomet-pan" style="padding:0px; height:36px;"></div>
									<input paycomet-style="width: 100%; height: 21px; font-size:14px; padding-left:7px; padding-top:8px; border:0px;" paycomet-name="pan">
								</div> <!-- input-group.// -->
							</div> <!-- form-group.// -->

							<div class="row">
								<div class="col-sm-8">
									<div class="form-group">
										<label><span class="hidden-xs">Expiration</span> </label>
										<div class="form-inline">
											<select class="form-control" style="width:45%" data-paycomet="dateMonth">
												<option>MM</option>
												<option value="01">01 - January</option>
												<option value="02">02 - February</option>
												<option value="03">03 - March</option>
												<option value="04">04 - April</option>
												<option value="05">05 - May</option>
												<option value="06">06 - June</option>
												<option value="07">07 - July</option>
												<option value="08">08 - August</option>
												<option value="09">09 - September</option>
												<option value="10">10 - October</option>
												<option value="11">11 - November</option>
												<option value="12">12 - December</option>
											</select>
											<span style="width:10%; text-align: center"> / </span>
											<select class="form-control" style="width:45%" data-paycomet="dateYear">
												<option>YY</option>
												<option value="20">2020</option>
												<option value="21">2021</option>
												<option value="22">2022</option>
												<option value="23">2023</option>
												<option value="24">2024</option>
												<option value="25">2025</option>
												<option value="26">2026</option>
												<option value="27">2027</option>
												<option value="28">2028</option>
												<option value="29">2029</option>
												<option value="30">2030</option>
											</select>
										</div>
									</div>
								</div>

								<div class="col-sm-4">
									<div class="form-group">
										<label data-toggle="tooltip" title=""
											data-original-title="3 digits code on back side of the card">CVV <i
												class="fa fa-question-circle"></i></label>
										<div id="paycomet-cvc2" style="height: 36px; padding:0px;"></div>
										<input paycomet-name="cvc2" paycomet-style="border:0px; width: 100%; height: 21px; font-size:12px; padding-left:7px; padding-tap:8px;" class="form-control" required="" type="text">
									</div> <!-- form-group.// -->
								</div>

							</div> <!-- row.// -->
							<button class="subscribe btn btn-primary btn-block" type="submit"> Confirm </button>
						</form>
							<div id="paymentErrorMsg">

							</div>
						</div> <!-- card-body.// -->
					</article> <!-- card.// -->
				</aside>
			</div>
		</div>
		<script src="https://api.paycomet.com/gateway/paycomet.jetiframe.js?lang=es"></script>
</body>

</html>