<?php include('../header.php'); ?>
<link rel="stylesheet" type="text/css" href="Administracion.css">
<script src="Administracion.js"></script>
</script>
<fieldset>
  <legend class="titulo_modal">Datos Contractuales</legend>
  <div class="row">
    <div class="col-md-6">

      <div class="row">
          <div class="form-group row col-md-6">
            <label for="CrearOtroSI_NumContratoViva" class="col-md-6"><span style="color:red">*</span>Número de Contrato VIVA</label>
            <div class="col-md-6">
                <input type="text" class="form-control" onkeyup="BuscarContratoPropio()" autocomplete="off" id="CrearOtroSI_NumContratoViva" name="CrearOtroSI_NumContratoViva" required>
                <ul class="list-group list-group-flush ul-overlay" style="display:none;" id="CrearOtroSI_ListaNumContratoViva"></ul>
            </div>
          </div>
          <div class="form-group row col-md-6" style="padding:0px;">
            <label for="CrearOtroSI_NumContratoContratante"  class="col-md-7">Número de Contrato Contratante</label>
            <div class="col-md-5">
                <input type="text" class="form-control form-control-plaintext" readonly autocomplete="off" id="CrearOtroSI_NumContratoContratante" name="CrearOtroSI_NumContratoContratante" required>
            </div>
          </div>
      </div>
      <div class="form-group row">
        <label for="CrearOtroSI_nombreContratante" class="col-md-3"><span style="color:red">*</span>Contratante</label>
        <div class="col-md-6">
            <input type="text" class="form-control form-control-plaintext" readonly autocomplete="off" id="CrearOtroSI_nombreContratante" name="CrearOtroSI_nombreContratante" required>
        </div>
      </div>
    </div>
    <div class="col-md-6">

        <div class="row">
            <div class="form-group row col-md-6">
                <label for="CrearOtroSI_fechaIni" class="col-md-4" style="padding: 0px;"><span style="color:red">*</span>Fecha de Inicio</label>
                <div class="col-md-8">
                    <input type="date" class="form-control form-control-plaintext" readonly autocomplete="off" id="CrearOtroSI_fechaIni" name="CrearOtroSI_fechaIni" required>
                </div>
            </div>
            <div class="form-group row col-md-6">
                <label for="CrearOtroSI_fechaFin" class="col-md-4" style="padding: 0px;"><span style="color:red">*</span>Fecha de Fin</label>
                <div class="col-md-8">
                    <input type="date" class="form-control form-control-plaintext" readonly autocomplete="off" id="CrearOtroSI_fechaFin" name="CrearOtroSI_fechaFin" required>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group row col-md-8">
                <div class="form-group row col-md-10">
                    <label for="CrearOtroSI_Monto" class="col-md-4" style="padding: 0px;"><span style="color:red">*</span>Monto Contrato</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control Monto form-control-plaintext" readonly autocomplete="off" id="CrearOtroSI_Monto" name="CrearOtroSI_Monto" placeholder="$0.00" required>
                    </div>
                </div>
                <div class="form-group row col-md-6">
                  <label for="CrearContrato_TP_Honorarios" class="col-md-4" style="padding: 0px;"><span style="color:red">*</span>Tipo de pago<br>Honorarios</label>
                  <div class="col-md-8">
                      <input type="text"  class="form-control" readonly  id="CrearOtroSI_TP_Honorarios" name="CrearOtroSI_TP_Honorarios" required>
                      <input type="hidden" id="CrearOtroSI_TP_Honorarios_codigo" >
                  </div>
              </div>
            </div>
            <div class="form-group row col-md-4">
                <center> 
                    <div class="col-md-4">
                        <button class="btn btn-success" id="btnModalHistoricoOtroSi" data-toggle="tooltip" data-placement="top" title="Historicos Otro SI" onclick="$('#Btn_ModalHistoricoOtroSi').click()" disabled="true"><i class="fa-solid fa-magnifying-glass"></i></button>

                        <button id="Btn_ModalHistoricoOtroSi" data-toggle="modal" data-target="#ModalHistoricoOtroSi" style="display:none;">x</button>
                    </div>
                    <div class="col-md-4">
                        <button class="btn btn-success" id="btnModalNuevoOtroSi" data-bs-toggle="tooltip" data-toggle="tooltip" data-placement="top" onclick="$('#Btn_ModalAgregarOtroSi').click()" title="Generar Otro SI" disabled="true"><i class="fa-solid fa-file-circle-plus"></i></button>

                        <button id="Btn_ModalAgregarOtroSi" style="display:none;" data-toggle="modal" data-target="#ModalAgregarOtroSi">x</button>
                    </div>
                </center>
            </div>
        </div>
    </div>
    <div class="col-md-12">
      <div class="form-group">
        <label for="CrearOtroSI_objetoContrato"><span style="color:red">*</span>Objeto del Contrato</label>
        <textarea autocomplete="off" class="form-control form-control-plaintext" readonly id="CrearOtroSI_objetoContrato" name="CrearOtroSI_objetoContrato" rows="3" required></textarea>
      </div>
    </div>
  </div>
</fieldset>




<div class="row">
  <div class="col-md-6">
    <fieldset class="border p-2" style="width: 100%; margin-top: 20px;">
      <legend class="w-auto titulo_modal">Cliente</legend>
      <div class="form-group row">
        <label for="CrearOtroSI_dpto" class="col-sm-2 col-form-label"><span style="color:red">*</span>Departamento</label>
        <div class="col-sm-4">
          <input type="text" class="form-control form-control-plaintext" readonly autocomplete="off" id="CrearOtroSI_dpto" name="CrearOtroSI_dpto">
        </div>
        <label for="CrearOtroSI_mpio" class="col-sm-2 col-form-label"><span style="color:red">*</span>Municipio</label>
        <div class="col-sm-4">
           <input type="text" class="form-control form-control-plaintext" readonly autocomplete="off" id="CrearOtroSI_mpio" name="CrearOtroSI_mpio">
        </div>
      </div>
      <div class="form-group row">
        <label for="CrearOtroSI_PersonaContacto" class="col-sm-2 col-form-label"><span style="color:red">*</span>Persona de contacto</label>
        <div class="col-sm-10">
          <input type="text" class="form-control form-control-plaintext" readonly autocomplete="off" id="CrearOtroSI_PersonaContacto" name="CrearOtroSI_PersonaContacto">
        </div>
      </div>
      <div class="form-group row">
        <label for="CrearOtroSI_NumeroContacto" class="col-sm-2 col-form-label"><span style="color:red">*</span>Número de contacto</label>
        <div class="col-sm-4">
          <input type="text" class="form-control form-control-plaintext" readonly autocomplete="off" id="CrearOtroSI_NumeroContacto" name="CrearOtroSI_NumeroContacto">
        </div>
        <label for="CrearOtroSI_CorreoContacto" class="col-sm-2 col-form-label"><span style="color:red">*</span>Correo de contacto</label>
        <div class="col-sm-4">
          <input type="email" class="form-control form-control-plaintext" readonly autocomplete="off" id="CrearOtroSI_CorreoContacto" name="CrearOtroSI_CorreoContacto">
        </div>
      </div>
    </fieldset>
  </div>
  <div class="col-md-6">
    <fieldset class="border p-2" style="width: 100%; margin-top: 20px;">
      <legend class="w-auto titulo_modal">Documentos Cargados</legend>
        <table id="GridContratoArchivosCargados" class="table-striped tabla-alternada-centrada">
          <thead>
            <tr>
              <th><center>#</center></th>
              <th><center>Nombre Archivo</center></th>
              <th><center>Tipo de Archivo</center></th>
              <th><center>Tamaño</center></th>
              <th><center>Descargar</center></th>
            </tr>
          </thead>
        </table>
    </fieldset>
  </div>
</div>



<!-- Modal agregar Otro SI -->
<div class="modal fade" id="ModalAgregarOtroSi" tabindex="-1" role="dialog" aria-labelledby="ModalAgregarOtroSiLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="ModalAgregarOtroSiLabel">Nuevo Otro SI</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="form-group">
            <label for="nuevaFechaFin">Nueva Fecha Fin:</label>
            <input class="form-control" type="date" id="CrearOtroSI_nuevaFechaFin" name="CrearOtroSI_nuevaFechaFin">
          </div>

          <input type="hidden" Id="IdContrato">

          <div class="form-group">
            <label for="montoAdicionar">Monto a Adicionar:</label>
            <input class="form-control" type="text" id="CrearOtroSI_montoAdicionar" name="CrearOtroSI_montoAdicionar">
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="CerrarModal" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" onclick="GuardarOtroSiContrato()">Guardar Otro SI</button>
      </div>
    </div>
  </div>
</div>
<!-- Fin Modal agregar Otro SI -->


<!-- Modal historico Otro SI -->
<div class="modal fade" id="ModalHistoricoOtroSi" tabindex="-1" role="dialog" aria-labelledby="ModalHistoricoOtroSiLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title titulo_modal" id="ModalHistoricoOtroSiLabel">Historico Otro SI</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table id="GridContratoOtroSiCargados" class="table-striped tabla-alternada-centrada">
          <thead>
            <tr>
              <th><center>#</center></th>
              <th><center>Fecha OtroSi</center></th>
              <th><center>Adición</center></th>
              <th><center>Prorroga</center></th>
              <th><center>Usuario</center></th>
            </tr>
          </thead>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="CerrarModal" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>
<!-- Fin Modal historico Otro SI -->


<script type="text/javascript">
    $(document).ready(function(){
        CargarDeptos("CrearOtroSI_dpto");
        maquillarNumero(document.getElementById("CrearOtroSI_montoAdicionar"));
        CargarTipoAdjuntoContrato();


        $('#GridContratoArchivosCargados').DataTable({
          "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
          },
          "pageLength": 50,
          "lengthChange": false,
          "searching": false,
          "dom": '<"datatable-header"l>rtip',
          "drawCallback": function(settings) {
            $('div.dataTables_length').hide();
          }
        });


        $('#GridContratoOtroSiCargados').DataTable({
          "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
          },
          "pageLength": 50,
          "lengthChange": false,
          "searching": false,
          "dom": '<"datatable-header"l>rtip',
          "drawCallback": function(settings) {
            $('div.dataTables_length').hide();
          }
        });
      $('[data-toggle="tooltip"]').tooltip();
        
    });
</script>

<?php include('../footer.php'); ?>