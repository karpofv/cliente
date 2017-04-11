<?php
include_once 'includes/layout/headp.php';
require 'includes/conf/general_parameters.php';
    if (isset($_GET['salir'])) {
        $salir = $_GET['salir'];
?>
        <div id='notysuccess' class='alert bg-green alert-dismissible' style='margin-top: 6%;'> <strong></strong>
            <?php
        echo $logout[$salir];
?> <a href='#' class='close pull-right' data-dismiss='alert' aria-label='close' onclick='cerrar()'><i class="glyph-icon icon-clock-os-circle"></i></a> </div>
        <?php
    }
?>
<div class="login-page">
    <div class="form">
    <?php
    if (isset($_GET['error_login'])) {
        $error = $_GET['error_login'];
?>
    <div id='notysuccess' class='alert bg-google alert-dismissible' style='margin-top: 6%;'> <strong>Accion!</strong>
        <?php 
        echo $error_login_ms[$error]; 
?> <a href='#' class='close pull-right' data-dismiss='alert' aria-label='close' onclick='cerrar()'><i class="glyph-icon icon-clock-os-circle"></i></a> </div>
    <?php
    }    
    ?>        
        <form action="index2.php" id="login-validation" class="col-md-3 center-margin" method="post" enctype="multipart/form-data">
            <input title="¡Mensaje!" name="user" id="user" type="text" class="form-control float-left mrg25R popover-button-default" placeholder="Ingrese su usuario" required="required">
            <input title="Ingrese su Clave de Acceso" type="password" name="pass" id="pass" class="form-control" id="exampleInputPassword1" placeholder="Ingresa tu clave" required="required">
            <button>Ingresar</button>
        </form>
    </div>
</div>
<script>
    function cerrar() {
        $("#notysuccess").fadeOut("slow", function () {
            $("#notysuccess").remove();
        });
    }
</script>
<script>
    $('.message a').click(function () {
        $('form').animate({
            height: "toggle"
            , opacity: "toggle"
        }, "slow");
    });
</script>
</body>
</html>