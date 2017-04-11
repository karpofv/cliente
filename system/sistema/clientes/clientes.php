<link href="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
<link href="<?php echo $ruta_base; ?>assets/plugins/datatables/buttons.dataTables.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery-1.12.4.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jszip.min.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/buttons.print.min.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/buttons.html5.min.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/buttons.colVis.min.js"></script>
<?php
	$codigo = $_POST[codigo];
	$cedula = $_POST[cedula];
	$nombre = utf8_encode($_POST[nombre]);
	$apellido = utf8_encode($_POST[apellido]);
	$edad = utf8_encode($_POST[edad]);
	$sexo = utf8_encode($_POST[sexo]);
	$telefono = utf8_encode($_POST[telef]);
	$correo = utf8_encode($_POST[correo]);
	$direccion = utf8_encode($_POST[direc]);
	$eliminar = $_POST[eliminar];
	$editar = $_POST[editar];
	$insertar = $_POST[insertar];
	/*GUARDAR*/
	if ($insertar=='1'){
		$consulu = paraTodos::arrayConsultanum("*", "cliente", "cli_cedula='$cedula'");
		if ($consulu>0){
			paraTodos::showMsg("Este cliente ya se encuentra registrado", "alert-danger");
		} else{
			paraTodos::arrayInserte("cli_cedula, cli_nombre, cli_apellido, cli_edad, cli_sexo, cli_correo, cli_direccion, cli_telefono", "cliente", "$cedula, '$nombre', '$apellido', $edad, $sexo, '$correo', '$direccion', '$telefono'");
		}
	}
	/*MOSTRAR*/
	if($editar == 1 and $nombre ==""){
        $consulta = paraTodos::arrayConsulta("*", "cliente", "cli_codigo=$codigo");
		foreach($consulta as $row){
            $cedula = $row[cli_cedula];
            $nombre = $row[cli_nombre];
            $apellido = $row[cli_apellido];
            $edad = $row[cli_edad];
            $sexo = $row[cli_sexo];
            $telefono = $row[cli_telefono];
            $correo = $row[cli_correo];
            $direccion = $row[cli_direccion];
        }
	}
	/*UPDATE*/
	if($editar == 1 and $nombre !=""){
		paraTodos::arrayUpdate("cli_cedula='$cedula', cli_nombre='$nombre', cli_apellido='$apellido', cli_edad='$edad', cli_sexo='$sexo', cli_correo='$correo', cli_direccion='$direccion', cli_telefono='$telefono'", "cliente", "cli_codigo=$codigo");
	}
	/*ELIMINAR*/
	if ($eliminar !=''){
		paraTodos::arrayDelete("cli_codigo=$codigo", "cliente");
	}
?>
    <div class="content">
        <div>
            <div class="page-header-title">
                <h4 class="page-title">Usuarios</h4> </div>
        </div>
        <div class="page-content-wrapper ">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-body">
                                <h4 class="m-b-30 m-t-0">Administrar clientes</h4>
                                <div class="row">
                                    <form class="form-horizontal">
                                        <div class="form-group" style="display: block;">
                                            <div class="col-sm-4">
                                            <label class="col-sm-1 control-label" for="cedula">Cédula</label>                                                
                                                <input class="form-control" id="cedula" type="number" value="<?php echo $cedula; ?>"> 
                                                <input class="collapse" id="codigo" type="number" value="<?php echo $codigo; ?>"> 
                                            </div>
                                            <div class="col-sm-2">
                                                <label class="col-sm-1 control-label" for="edad">Edad</label>                                                
                                                <input class="form-control" id="edad" type="number" value="<?php echo $edad; ?>"> 
                                            </div>
                                            <div class="col-sm-4">
                                                <label class="col-sm-1 control-label" for="sexo">Sexo</label>                                                
                                                <select class="form-control" id="sexo">
                                                <?php
                                                    combos::CombosSelect("1", "$sexo", "id, Nombre", "sexo", "id", "Nombre", "1=1");
                                                ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group" style="display: block;">
                                            <div class="col-sm-6">
                                                <label class="col-sm-1 control-label" for="nombre">Nombres</label>                                                
                                                <input class="form-control" id="nombre" type="text" value="<?php echo $nombre;?>">
                                            </div>
                                            <div class="col-sm-6">
                                                <label class="col-sm-1 control-label" for="apellido">Apellidos</label>                                                
                                                <input class="form-control" id="apellido" type="text" value="<?php echo $apellido;?>">
                                            </div>                                            
                                        </div>
                                        <div class="form-group" style="display: block;">
                                            <div class="col-sm-6">
                                                <label class="col-sm-1 control-label" for="telefono">Teléfono</label>                                                
                                                <input class="form-control" id="telefono" type="text" value="<?php echo $telefono;?>">
                                            </div>
                                            <div class="col-sm-6">
                                                <label class="col-sm-1 control-label" for="correo">Correo</label>                                                
                                                <input class="form-control" id="correo" type="text" value="<?php echo $correo;?>">
                                            </div>                                            
                                        </div>
                                        <div class="form-group" style="display: block;">
                                            <div class="col-sm-12">
                                                <label class="col-sm-1 control-label" for="direccion">Dirección</label>                                                
                                                <input class="form-control" id="direccion" type="text" value="<?php echo $direccion;?>">
                                            </div>                                    
                                        </div>
                                        <div class="box-footer">
                                            <input id="enviar" type="button" value="Guardar" class="btn btn-primary col-md-offset-5" onclick="
<?php
						if($editar==""){
?>
                            $.ajax({
								url:'accion.php',
								type:'POST',
								data:{
									dmn 	: <?php echo $idMenut;?>,
									cedula 	: $('#cedula').val(),
									nombre 	: $('#nombre').val(),
									apellido 	: $('#apellido').val(),
									sexo 	: $('#sexo').val(),
									edad 	: $('#edad').val(),
									telef 	: $('#telefono').val(),
									correo 	: $('#correo').val(),
									direc 	: $('#direccion').val(),
									insertar: 1,
									ver 	: 2
								},
								success : function (html) {
									$('#page-content').html(html);
									$('#codigo').val('');
									$('#cedula').val('');
									$('#nombre').val('');
									$('#apellido').val('');
									$('#edad').val('');
									$('#telefono').val('');
									$('#correo').val('');
									$('#direccion').val('');
								},
							}); return false;
<?php
						} else {
?>
                            $.ajax({
								url:'accion.php',
								type:'POST',
								data:{
									dmn 	: <?php echo $idMenut;?>,
									codigo 	: $('#codigo').val(),
									cedula 	: $('#cedula').val(),
									nombre 	: $('#nombre').val(),
									apellido 	: $('#apellido').val(),
									sexo 	: $('#sexo').val(),
									edad 	: $('#edad').val(),
									telef 	: $('#telefono').val(),
									correo 	: $('#correo').val(),
									direc 	: $('#direccion').val(),
									editar: 1,
									ver 	: 2
								},
								success : function (html) {
									$('#page-content').html(html);
									$('#codigo').val('');
									$('#cedula').val('');
									$('#nombre').val('');
									$('#apellido').val('');
									$('#edad').val('');
									$('#telefono').val('');
									$('#correo').val('');
									$('#direccion').val('');
								},
							}); return false;
<?php
					}
?>
                   "> </div>
                                    </form>
                                </div>
                                <div class="row">
                                    <table id="clientes" class="table-hover display" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <td class="text-center"><strong>Cédula</strong></td>
                                                <td class="text-center"><strong>Nombre y Apellido</strong></td>
                                                <td class="text-center"><strong>Edad</strong></td>
                                                <td class="text-center"><strong>Sexo</strong></td>
                                                <td class="text-center"><strong>Teléfono</strong></td>
                                                <td class="text-center"><strong>Correo</strong></td>
                                                <td class="text-center"><strong>Dirección</strong></td>
                                                <td class="text-center"><strong>Editar</strong></td>
                                                <?php
                                                    if($accPermisos[D]==1){
                                                ?>
                                                <td class="text-center"><strong>Eliminar</strong></td>
                                                <?php
                                                    }
                                                ?>
                                            </tr>
                                        </thead>
                                        <tbody>
<?php
								            $consulsol = paraTodos::arrayConsulta("*", "cliente c, sexo s", "cli_sexo=s.id");
								            foreach($consulsol as $row){
?>
                                            <tr>
                                                <td class="text-center">
                                                    <?php echo $row[cli_cedula];?>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo utf8_decode($row[cli_nombre]." ".$row[cli_apellido]);?>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo utf8_decode($row[cli_edad]);?>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo utf8_decode($row[Nombre]);?>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo utf8_decode($row[cli_telefono]);?>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo utf8_decode($row[cli_correo]);?>
                                                </td>
                                                <td class="text-center">
                                                    <?php echo utf8_decode($row[cli_direccion]);?>
                                                </td>
                                                <td class="text-center">
                                                    <a href="javascript:void(0);" onclick="$.ajax({
                                                        url:'accion.php',
                                                        type:'POST',
                                                        data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigo 	: <?php echo $row[cli_codigo];?>,
                                                            editar 	: 1,
                                                            ver 	: 2
                                                        },
                                                        success : function (html) {
                                                            $('#page-content').html(html);
                                                        },
                                                    }); return false;"><i class="fa fa-edit"></i>
									               </a>
                                                </td>
                                                <?php
                                                    if($accPermisos[D]==1){
                                                ?>                                                
                                                <td class="text-center">
                                                    <a href="javascript:void(0);" onclick="$.ajax({
                                                        url:'accion.php',
                                                        type:'POST',
                                                        data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigo 	: <?php echo $row[cli_codigo];?>,
                                                            eliminar : 1,
                                                            ver 	: 2
                                                        },
                                                        success : function (html) {
                                                            $('#page-content').html(html);
                                                        },
                                                    }); return false;"><i class="fa fa-eraser"></i>
									               </a>
                                                </td>
                                                <?php
                                                    }
                                                ?>                                                
                                            </tr>
<?php
								            }
?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
$('#clientes').DataTable({
    scrollX: 300
    , scroller: true
    , dom: 'Bfrtip'
    , buttons: [{
        extend: 'excelHtml5',
        exportOptions: {
            columns: ':visible'
        }
    },
    {
        extend: 'print',
        text: 'Imprimir',
        title: '',
        exportOptions: {
            columns: ':visible'
        },
        customize: function (win) {
            $(win.document.body).css('font-size', '8pt').prepend('<div><h4 style="text-align:center">Clientes registrados</h4></div>');
            $(win.document.body).find('table').addClass('compact').css('font-size', 'inherit');
        }
    },
    {
        extend: 'colvis',
        text: 'Columnas visibles'
    }]
});
    </script>
