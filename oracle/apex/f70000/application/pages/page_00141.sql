prompt --application/pages/page_00141
begin
wwv_flow_api.create_page(
 p_id=>141
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Proyecci\00F3n')
,p_step_title=>unistr('Proyecci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#region-flotante").draggable();',
'',
'var sel = [];',
'',
'',
'function marcarBotonesDesdeJSON() {',
'    let jsonString = apex.item("P141_CNCPTOS_SLCCNDOS").getValue();',
'    let registros = JSON.parse(jsonString || "[]");',
'    // Recorremos el JSON',
'   ',
'    registros.forEach(function(item) {',
'      const id = item.ID_IMPSTO_ACTO_CNCPTO;',
'     ',
'        if (id) {',
unistr('        // Buscar el bot\00F3n con ese id'),
'        const $btn = $(`button[data-id_impsto_acto_cncpto="${id}"]`);',
'',
'        if ($btn.length > 0) {',
'          const $span = $btn.find("span");',
'',
unistr('          // Cambiar el \00EDcono y color del span (\00EDcono)'),
'          $span.removeClass("fa-square-o").addClass("fa-check-square-o");',
'          $span.css("color", "green");',
'',
unistr('         // alert(''Marcado bot\00F3n con ID ''+id);'),
'        } ',
'      }',
'    });',
'}',
'',
'',
'function obtener_conceptos_seleccionados(){',
'',
'        const grid = apex.region(''conceptos'').widget().interactiveGrid(''getViews'', ''grid'');',
'        const model = grid.model;',
'        const seleccionados = [];',
'',
'        // Recorrer los registros del modelo',
'        model.forEach((record, index) => {',
'        const id_impsto_acto_cncpto = model.getValue(record, ''ID_IMPSTO_ACTO_CNCPTO'');',
'        const iconoClase = $(`button[data-id_impsto_acto_cncpto="${id_impsto_acto_cncpto}"]`).find(''span'').attr(''class'');',
'        ',
'        //alert(''Entro model.getValue(record, "ID_IMPSTO_ACTO_CNCPTO")''+ model.getValue(record, "ID_IMPSTO_ACTO_CNCPTO"));',
'            ',
'        //se pregunta si no es nulo, ya que el IG tiene division de control y totalizado y es un registro que recorre    ',
'        if (id_impsto_acto_cncpto) {',
'            if (iconoClase.includes(''fa-check-square-o'')) {  //si esta chequeado, se adiciona en el json',
'                 seleccionados.push({',
'                    ID_CNCPTO:             model.getValue(record, "ID_CNCPTO"),',
'                    ID_IMPSTO_ACTO:        model.getValue(record, "ID_IMPSTO_ACTO"),',
'                    FCTOR:                 model.getValue(record, "FCTOR"),',
'                    CNCPTO_OBLGTRIO:       model.getValue(record, "CNCPTO_OBLGTRIO"),',
'                    BSE_GRVBLE:            model.getValue(record, "BSE_GRVBLE"),',
'                    ID_IMPSTO_ACTO_CNCPTO: model.getValue(record, "ID_IMPSTO_ACTO_CNCPTO")',
'                }); ',
'            }    ',
'          // alert(''Entro model.getValue(record, "BSE_GRVBLE")''+ model.getValue(record, "BSE_GRVBLE") + ''FCTOR '' + model.getValue(record, "FCTOR"));',
'        }',
'    });',
' ',
'   // Guardar el JSON en el item',
'    apex.item("P141_CNCPTOS_SLCCNDOS").setValue(JSON.stringify(seleccionados));',
'',
'     // Pasar a JSON',
'     var jsonOutput = JSON.stringify(seleccionados, null, 2);',
'',
'    model.save();',
'    ',
'    window.localStorage.setItem(''jsonConceptosSeleccionadosbotoncambiado'', jsonOutput);   ',
'  }',
'',
'',
'function toggleIcon(button) {',
' ',
unistr('    var span = $(button).find(''span''); // Encuentra el elemento <span> dentro del bot\00F3n'),
'    var obligatorio = button.getAttribute(''data-cncpto_oblgtrio'');',
'	 ',
'    //alert(obligatorio); ',
'    ',
'	const registros = []; ',
'    ',
'    if ( obligatorio === ''N'' ) {',
'        //alert(obligatorio); ',
'        if (span.hasClass(''fa-check-square-o'')) {',
'			// Se UnChecked',
'            span.removeClass(''fa-check-square-o'').addClass(''fa-square-o'');	',
'        } else {',
'			// Se Checked',
'            span.removeClass(''fa-square-o'').addClass(''fa-check-square-o'');',
'        }',
'   }',
'   ',
'	// Armo los Seleccionados',
'	const botones = document.querySelectorAll(''button#micheck'');',
'    ',
'    //alert( botones.length );',
'	botones.forEach((boton, index) => { ',
'		//alert(index + '' Data-id_impsto_acto_cncpto:'' + boton.dataset.id_impsto_acto_cncpto + ''   Data-cncpto_oblgtrio:'' + boton.dataset.cncpto_oblgtrio + '' boton.dataset.bse_grvble '' + boton.dataset.bse_grvble);',
'		',
'		if ( index < (botones.length-1) ) {',
'			if ( boton.querySelector(''span'').className === "fa fa-check-square-o" ){',
'				const registro = {',
'					ID_CNCPTO:               boton.dataset.id_cncpto,',
'					ID_IMPSTO_ACTO:          boton.dataset.id_impsto_acto,',
'					FCTOR:                   boton.dataset.fctor,',
'					INDCDOR_CNCPTO_OBLGTRIO: boton.dataset.cncpto_oblgtrio,',
'					BSE_GRVBLE:              boton.dataset.bse_grvble,',
'                    ID_IMPSTO_ACTO_CNCPTO:   boton.dataset.id_impsto_acto_cncpto',
'				};',
'				registros.push(registro);',
'			}',
'		}',
'	});',
'    ',
'    //Parametros del JSON.stringify',
unistr('	//null -- no excluir ni modificar nada del objeto. Todo se incluye tal como est\00E1.'),
unistr('    //2 -- espacios de indentaci\00F3n para que el JSON resultante sea m\00E1s legible (formato bonito).'),
'	const jsonOutput = JSON.stringify(registros, null, 2);  ',
'   // $s(''P141_CNCPTOS_SLCCNDOS'',  JSON.stringify(registros));',
'    apex.item("P141_CNCPTOS_SLCCNDOS").setValue(jsonOutput);',
'	console.log("json: " + jsonOutput);',
'    ',
'',
unistr('    //Se env\00EDa ese valor al servidor para que quede en sesi\00F3n'),
'     apex.server.process("GUARDAR_JSON_SESION", {',
'      pageItems: "#P141_CNCPTOS_SLCCNDOS"',
'      }, {',
'          dataType: "text",  // esto evita el parsererror especifica que NO esperas un JSON:',
'          success: function() {',
unistr('            console.log("Guardado correctamente en sesi\00F3n");'),
'          },',
'          error: function(_, __, error) {',
unistr('            console.error("Error al guardar en sesi\00F3n:", error);'),
'          }',
'        });',
'    ',
'    ',
'    window.localStorage.setItem(''jsonConceptosSeleccionadosboton'', jsonOutput);',
'}',
'',
'',
'function validar_sel() {',
'    ',
'    var region = apex.region("conceptos");',
'    ',
'    if (region) {',
'        ',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'',
'											  ',
'        var records_ = view.view$.grid("getSelectedRecords");//todos los seleccionados',
'        var records = model._data; //todos los datos de la grilla',
'        ',
'',
'        console.log(''------->  ANTES records.length  ''+ records.length);',
'        console.log(''------->  ANTES records_.length  ''+ records_.length);',
'',
'        ',
'        //REALIZAMOS UN FILTRO DE TODOS LOS DATOS SELECCIONADOS DEL INTERACTIVE GRID QUE NO ESTEN PROCESADOS',
'        records = records.filter(function (record) {',
'            return model.getValue(record, "INDCDOR_CNCPTO_OBLGTRIO").v === ''S''',
'													   ',
'											',
'			 ',
'        });',
'        ',
'         console.log(''------->  records.length ''+ records.length);',
'        ',
'        records_.filter(function (record) {',
'            return model.getValue(record, "INDCDOR_CNCPTO_OBLGTRIO").v !== ''S''',
'        }).forEach(function (f){',
'            records.push(f);',
'			 ',
'        });',
'  ',
'         console.log(''------->  records_.length ''+ records_.length);',
'        ',
'        ',
'        //SELECCIONAMOS LOS ITEM NO PROCESADOS EN EL INTERACTIVE GRID',
'        //console.log(records);',
'        region.widget().interactiveGrid("setSelectedRecords", records);',
'        return;',
'    }',
'}',
'',
'',
' ',
'',
'',
'function apenascargue(){',
'    var id_rnta_antrior = [];',
'    var cncptos_rnta = [];',
'    ',
'    // trae el valor del json',
'    if($v(''P141_ID_RNTA_ANTRIOR'')){',
'        try{',
'            // convierte en tipo json',
'            id_rnta_antrior = JSON.parse($v(''P141_ID_RNTA_ANTRIOR''));                    ',
'        }catch(e){',
'            id_rnta_antrior = [];',
'        }',
'    } ',
unistr('    //si el json est\00E1 lleno '),
'    if (id_rnta_antrior.length > 0){  ',
'        // construye la vista',
'        var view = apex.region(''luquidaciones_anteriores'').widget().interactiveGrid("getCurrentView"); ',
'        // recorremos el json trayendo el valor',
'        id_rnta_antrior = id_rnta_antrior.map(m => Number(m.ID_RNTA));',
'        // construyo el modelo a partir de la vista',
'        var model = view.model;        ',
'        // trae todos los registros del modelo',
'        var records = model._data;',
'        console.log(id_rnta_antrior, records);',
'        // recorre los registros y retorna los que coincidan con el valor del json',
'        records = records.filter((f)=> {',
'            return id_rnta_antrior.indexOf(Number(model.getValue(f, ''ID_RNTA''))) > -1',
'        });',
'       ',
'        //setea los valores de los registros',
'        view.setSelectedRecords(records);  ',
'    }',
'    ',
'    if($v(''P141_CONCEPTOS_RENTA'')){',
'        try{',
'            // convierte en tipo json',
'            cncptos_rnta = JSON.parse($v(''P141_CONCEPTOS_RENTA''));                    ',
'        }catch(e){',
'            cncptos_rnta = [];',
'        }',
'    }',
'    ',
unistr('    //si el json est\00E1 lleno '),
'    if (cncptos_rnta.length > 0){  ',
'        // construye la vista',
'        var view = apex.region(''conceptos'').widget().interactiveGrid("getCurrentView"); ',
'        // recorremos el json trayendo el valor',
'        cncptos_rnta = cncptos_rnta.map(m => Number(m.ID_CNCPTO));',
'        // construyo el modelo a partir de la vista',
'        var model = view.model;        ',
'        // trae todos los registros del modelo',
'        var records = model._data;',
'        console.log(cncptos_rnta, records);',
'        // recorre los registros y retorna los que coincidan con el valor del json',
'        records = records.filter((f)=> {',
'            return cncptos_rnta.indexOf(Number(model.getValue(f, ''ID_CNCPTO''))) > -1',
'        });',
'       ',
'        //setea los valores de los registros',
'        view.setSelectedRecords(records);  ',
'    }',
'}',
'',
'function seleccionar_liquidacion(this_) {',
'',
'    if (this_.data.selectedRecords.length === 0) {',
'        return;',
'    };',
'',
'    var i, records, record, model, no_pgdas, id_rnta, ',
'        view = apex.region("luquidaciones_anteriores").widget().interactiveGrid("getCurrentView");',
'    model = view.model;',
'    records = view.getSelectedRecords();',
'',
'    records = records.filter(function (record) {',
'        return model.getValue(record, "CNTDAD_RNTAS_NO_PGDAS")',
'    });',
'     ',
'    if (records.length > 0) {',
'        for (i = 0; i < records.length; i++) {',
'',
'            record = records[i];',
'            id_rnta = parseFloat(model.getValue(record, "ID_RNTA"));',
'            no_pgdas = model.getValue(record, "CNTDAD_RNTAS_NO_PGDAS")',
'            ',
'        }',
'    }',
'',
'    if (no_pgdas > 0) {',
'        Swal.fire({',
'            icon: ''error'',',
'            title:  ''<H2 >RENTAS VARIAS</H2>'',',
unistr('            html: ''<H4>No es posible seleccionar esta liquidaci\00F3n, existen liquidaciones adicionales pendientes por pagar.</H4>'''),
'        });',
'       apex.region("luquidaciones_anteriores").widget().interactiveGrid("setSelectedRecords", []);',
'    } else {',
'        apex.region("luquidaciones_anteriores").widget().interactiveGrid("setSelectedRecords", records);',
'    }',
'}',
'',
'function seleccion_conceptos_obligatorios(){',
'    var cncptos_oblgtrios = [];',
'    // trae el valor del json',
'    if($v(''P141_CNCPTOS_OBLGTRIOS'')){',
'        try{',
'            // convierte en tipo json',
'            cncptos_oblgtrios = JSON.parse($v(''P141_CNCPTOS_OBLGTRIOS''));                    ',
'        }catch(e){',
'            cncptos_oblgtrios = [];',
'        }        ',
'    } ',
'    ',
unistr('    //si el json est\00E1 lleno '),
'    if (cncptos_oblgtrios.length > 0){ ',
'        var view = apex.region(''conceptos'').widget().interactiveGrid("getCurrentView"); ',
'        // recorremos el json trayendo el valor',
'        ',
'        //cncptos_oblgtrios = cncptos_oblgtrios.map(m => Number(m.ID_CNCPTO));',
'',
'        cncptos_oblgtrios = cncptos_oblgtrios.map(m => ({id_cncpto : Number(m.ID_CNCPTO), id_impsto_acto: Number(m.ID_IMPSTO_ACTO)}));',
'        ',
'        ',
'        // construyo el modelo a partir de la vista',
'        var model = view.model;        ',
'        // trae todos los registros del modelo',
'        var records = model._data;        ',
'        // recorre los registros y retorna los que coincidan con el valor del json',
'        records = records.filter((f)=> {',
'            return cncptos_oblgtrios.indexOf(Number(model.getValue(f, ''ID_CNCPTO''))) > -1',
'            console.log(''conceptos: '' + cncptos_oblgtrios, records);',
'        });',
'       ',
'        //setea los valores de los registros',
'        view.setSelectedRecords(records);  ',
'        ',
'    }     ',
'}',
'',
'function conceptos_renta(){',
'    var cncptos_rnta = [];',
'    ',
'    if($v(''P141_CONCEPTOS_RENTA'')){',
'        try{',
'            // convierte en tipo json',
'            cncptos_rnta = JSON.parse($v(''P141_CONCEPTOS_RENTA''));                    ',
'        }catch(e){',
'            cncptos_rnta = [];',
'        }',
'    }',
'    ',
unistr('    //si el json est\00E1 lleno '),
'    if (cncptos_rnta.length > 0){  ',
'        // construye la vista',
'        var view = apex.region(''conceptos'').widget().interactiveGrid("getCurrentView"); ',
'        // recorremos el json trayendo el valor',
'        cncptos_rnta = cncptos_rnta.map(m => Number(m.ID_CNCPTO));',
'        // construyo el modelo a partir de la vista',
'        var model = view.model;        ',
'        // trae todos los registros del modelo',
'        var records = model._data;',
'        console.log(cncptos_rnta, records);',
'        // recorre los registros y retorna los que coincidan con el valor del json',
'        records = records.filter((f)=> {',
'            return cncptos_rnta.indexOf(Number(model.getValue(f, ''ID_CNCPTO''))) > -1',
'        });',
'       ',
'        //setea los valores de los registros',
'        view.setSelectedRecords(records);  ',
'    }',
'}',
'',
'',
'',
'//function generar_proyeccion() {      apex.submit({request:"BTN_GENERAR_PROYECCION"});}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apenascargue();',
'//seleccion_conceptos_obligatorios();',
'//validar_sel();',
'',
'if($v(''P138_INDCDOR_LQDCCION_ADCNAL'') === ''S''){    ',
'    apex.region("luquidaciones_anteriores").widget().interactiveGrid("setSelectedRecords", []);',
'}',
'ocultarAyudaD();',
'',
'if($v(''P141_CONCEPTOS_RENTA'')){',
'    conceptos_renta();',
'}',
'',
' '))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none;',
'}',
'',
'.wrap-cell {',
'    max-height: 64px;',
'    white-space: normal;',
'    overflow: hidden;',
'}',
'',
'',
' #region-flotante {',
'    position: fixed;',
unistr('    top: 100px; /* Ajusta la posici\00F3n vertical */'),
unistr('    right: 20px; /* Ajusta la posici\00F3n horizontal */'),
unistr('    width: 700px; /* Ancho de la regi\00F3n */'),
'    background-color: #ffffff; /* Color de fondo */',
'    border: 1px solid #ccc; /* Borde */',
'    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Sombra para efecto flotante */',
unistr('    z-index: 1000; /* Asegura que est\00E9 por encima de otros elementos */'),
'    padding: 15px; /* Espaciado interno */',
'    display: none; /* Inicialmente oculta */',
'}',
'#region-flotante.visible {',
unistr('    display: block; /* Mostrar cuando se a\00F1ade la clase ''visible'' */'),
'}',
'',
'',
'#region-flotante {',
'    transition: all 0.3s ease;',
'    opacity: 0;',
'}',
'',
'#region-flotante.visible {',
'    opacity: 1;',
'} ',
'',
'.mi-estilo-personalizado {',
'  background-color: #e0f7fa;',
'  color: #006064;',
'  border: 1px solid #004d40;',
'  font-size: 16px;',
'}',
'',
'.estilo-cool {',
'    border: none;',
'    color: white;',
'    font-size: 12px; ',
'    padding: 5px; ',
'    background-color: transparent;',
'    box-shadow: none;',
'     font-weight: bold;',
'  }',
'/*',
'.ui-dialog, .ui-widget {',
'   visibility: hidden; visible;*/',
'    /*display : none;',
'}*/',
'',
' ',
' button#micheck {',
'  background-color: transparent !important;',
'  border: none !important;',
'  box-shadow: none !important;',
'}',
''))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20250623182554'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20434141178966695)
,p_plug_name=>'Contrato Externo'
,p_region_name=>'region-flotante'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20434324601966696)
,p_plug_name=>'Contrato'
,p_parent_plug_id=>wwv_flow_api.id(20434141178966695)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20435816797966711)
,p_plug_name=>'Sujeto Impuesto'
,p_parent_plug_id=>wwv_flow_api.id(20434141178966695)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(229116145012992162)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>	'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(229116236481992163)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
unistr('    <p align="center"><b>Liquidaci\00F3n de Rentas Varias.</b> <br> <br> '),
unistr('      Proyecci\00F3n<br><br>  </p>'),
unistr('      <p align="justify">En este paso se debe ingresar el valor de la base gravable en el caso que se requiera, la fecha de suscripci\00F3n o expedici\00F3n y la fecha de vencimiento. <br><br>'),
unistr('      Luego de ingresar la informaci\00F3n anterior en la regi\00F3n inferior se muestra la proyecci\00F3n de la liquidaci\00F3n.</p>'),
'    ',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(229116270262992164)
,p_plug_name=>unistr('Widzard Liquidaci\00F3n de Rentas')
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(164085715180707699)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(76379350032438234)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(164098974360707738)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76541860334204535)
,p_plug_name=>unistr('Proyecci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(229116270262992164)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11020800207370601)
,p_plug_name=>'Conceptos'
,p_parent_plug_id=>wwv_flow_api.id(76541860334204535)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76542512739204542)
,p_plug_name=>'<b>Conceptos</b>'
,p_region_name=>'conceptos'
,p_parent_plug_id=>wwv_flow_api.id(11020800207370601)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct',
'        a.id_cncpto',
'        , a.cdgo_cncpto',
'        , '' ''||a.nmbre_impsto_acto   nmbre_impsto_acto',
'        , a.cdgo_cncpto || '' - '' || a.dscrpcion_cncpto  dscrpcion_cncpto',
'        , a.id_impsto_acto',
'        , a.vlor_lqddo',
'        , nvl(a.vlor_intres_mra,0) vlor_intres_mra',
'        , nvl(a.vlor_ttal,0) vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.dias_mra',
'        , a.txto_trfa',
'        , TRIM(a.bse_grvble) bse_grvble',
'        , nvl(a.vlor_pgdo,0) vlor_pgdo',
'        , a.indcdor_cncpto_oblgtrio',
'        , a.indcdor_utlza_bse_pntual',
'        , a.indcdor_rqre_fctor',
'        , nvl(fctor,1) fctor',
'        , a.indcdor_cncpto_oblgtrio cncpto_oblgtrio',
'        , a.id_impsto_acto_cncpto',
'        , case ',
'           when a.indcdor_cncpto_oblgtrio = ''S'' then',
'               ''fa fa-check-square-o''',
'           when a.indcdor_cncpto_oblgtrio = ''N'' then',
'               ''fa fa-square-o''',
'           else',
'               ''fa fa-square-o''',
'           end icono',
'     from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte 			        => :F_CDGO_CLNTE',
'                                                            , p_id_impsto					=> :P138_ID_IMPSTO',
'                                                            , p_id_impsto_sbmpsto			=> :P138_ID_IMPSTO_SBMPSTO',
'                                                            , p_id_impsto_acto				=> :P139_ID_IMPSTO_ACTO',
'                                                            , p_id_sjto_impsto            	=> :P138_ID_SJTO_IMPSTO',
'                                                            -- , p_json_cncptos				=> null',
'                                                         /*   , p_json_cncptos				=>  case',
'                                                                                                  when :P141_TTAL_UTLZA_BSE_PNTUAL = 0 and  :P141_TTAL_RQRE_FCTOR = 0 then',
'                                                                                                      null',
'                                                                                                  else',
'                                                                                                      :P141_CNCPTOS_SLCCNDOS ',
'                                                                                                  end  */ ',
'                                                           , p_json_cncptos				=>  case',
'                                                                                                  when :P141_INDCDOR_CMBIO_JSON_CNCPTOS = 0   then',
'                                                                                                      null',
'                                                                                                  else',
'                                                                                                      :P141_CNCPTOS_SLCCNDOS ',
'                                                                                                  end ',
'                                                            , p_vlor_bse					=> to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                            , p_indcdor_usa_extrnjro		=> nvl(:P139_INDCDOR_USA_EXTRNJRO, ''N'')',
'                                                            , p_indcdor_usa_mxto			=> nvl(:P139_INDCDOR_USA_MXTO, ''N'')',
'                                                            , p_fcha_expdcion				=> to_date(:P139_FCHA_EXPDCION)',
'                                                            , p_fcha_vncmnto				=> to_date(:P141_FCHA_VNCMNTO)',
'                                                            , p_indcdor_lqdccion_adcnal   	=> :P141_INDCDOR_LDCCION_ADCNAL  ',
'                                                            , p_id_rnta_antrior		    	=> :P141_ID_RNTA_ANTRIOR',
'                                                           -- , p_indcdor_cntrto_gslna      => :P139_INDCDOR_CNTRTO_GSLNA)',
'                                                            , p_indcdor_cntrto_gslna      	=> decode(:P139_CNTRO_TPO, ''GSLNA'', ''S'',''N'')',
'                                                            , p_vlor_aux_lqdcion      	    => to_number(:P141_VLOR_AUX_LQDCION, ''999G999G999G999G999G999G990D99'')',
'                                                            , p_id_impsto_acto_slccndo 	    => :P139_ACTOS_SLCCNDOS',
'                                                             )',
'                ) a',
' where abs(a.vlor_lqddo)   > 0 '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(6273591318449902)
,p_name=>'VLOR_PGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_PGDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor  <br> Pagado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10736802123457707)
,p_name=>'INDCDOR_UTLZA_BSE_PNTUAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_UTLZA_BSE_PNTUAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('\00BFUsa Base <br> Puntual?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(5646119019866897)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10737828679457717)
,p_name=>'ID_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Impsto Acto'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>293
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10738309909457722)
,p_name=>'FCTOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCTOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Factor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_item_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');"'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'SQL_EXPRESSION'
,p_readonly_condition=>':INDCDOR_RQRE_FCTOR = ''N'''
,p_readonly_for_each_row=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10920501880431113)
,p_name=>'INDCDOR_RQRE_FCTOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_RQRE_FCTOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('\00BFRequiere <br> Factor?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(5646119019866897)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11022255151370615)
,p_name=>'NMBRE_IMPSTO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Impuesto Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>251
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11834782658327910)
,p_name=>'miCheckBox'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button',
'    id = "micheck"',
'    type="button" ',
'    class="a-Button a-Button--noLabel a-Button--iconTextButton"  ',
'    title="Chequear"',
'        ',
'    data-id_cncpto="&ID_CNCPTO."',
'    data-id_impsto_acto="&ID_IMPSTO_ACTO."',
'    data-fctor="&FCTOR." ',
'    data-cncpto_oblgtrio="&CNCPTO_OBLGTRIO."',
'    data-bse_grvble="&BSE_GRVBLE." ',
'    data-id_impsto_acto_cncpto="&ID_IMPSTO_ACTO_CNCPTO." ',
'',
'    onclick="toggleIcon(this)"> ',
'    <span class="&ICONO." style="color:blue; background-color:transparent;"></span>',
'</button>'))
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11834896511327911)
,p_name=>'ICONO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ICONO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Icono'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>20
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11834960835327912)
,p_name=>'CNCPTO_OBLGTRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNCPTO_OBLGTRIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Cncpto Oblgtrio'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>1
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12060168790521903)
,p_name=>'ID_IMPSTO_ACTO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_ACTO_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Impsto Acto Cncpto'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>230
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76542759747204544)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'<div class="wrap-cell">&DSCRPCION_CNCPTO.</div>'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76542843757204545)
,p_name=>'FCHA_VNCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_VNCMNTO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de <br>Vencimiento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76542906162204546)
,p_name=>'DIAS_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('D\00EDas <br> Mora')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76543071261204547)
,p_name=>'TXTO_TRFA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_TRFA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tarifa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>200
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76543284872204549)
,p_name=>'VLOR_LQDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor<br> Liquidado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76543392278204550)
,p_name=>'VLOR_INTRES_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Interes de<br> Mora'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76661662491599801)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor <br> Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76827099343950327)
,p_name=>'BSE_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BSE_GRVBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Base <br>Gravable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_item_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');"'
,p_is_required=>false
,p_max_length=>40
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'SQL_EXPRESSION'
,p_readonly_condition=>':INDCDOR_UTLZA_BSE_PNTUAL = ''N'''
,p_readonly_for_each_row=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(100915089297162107)
,p_name=>'CDGO_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Cdgo Cncpto'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>5
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(100917758531162134)
,p_name=>'INDCDOR_CNCPTO_OBLGTRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_CNCPTO_OBLGTRIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('\00BFConcepto <br> Obligatorio?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(5646119019866897)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(100918221574162139)
,p_name=>'ID_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNCPTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(76542693828204543)
,p_internal_uid=>76542693828204543
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
' /*',
'    config.initActions = function(actions) {',
'        setTimeout(function() {',
'            var region = apex.region(config.regionStaticId);',
'            var view = region.widget().interactiveGrid("getViews", "grid");',
'            var model = view.model;',
'',
'            // Verifica si hay cambios (modo 19.1 compatible)',
'            function tieneCambios(model) {',
'                return model.getChanges().length > 0;',
'            }',
'',
'            // Detecta clic fuera del grid',
'            $(document).on("mousedown", function(e) {',
'                if (!$(e.target).closest(view.view$).length) {',
'                    if (tieneCambios(model)) {',
'                        model.save(); // Guarda para evitar alerta',
'                    }',
'                }',
'            });',
unistr('        }, 1000); // Espera a que el grid est\00E9 listo 1 seg'),
'    };',
'*/',
'    return config;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(76667374581616873)
,p_interactive_grid_id=>wwv_flow_api.id(76542693828204543)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(76667448756616873)
,p_report_id=>wwv_flow_api.id(76667374581616873)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(748418681328)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(11834782658327910)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1898551264866)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(10737828679457717)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10032930426907)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(100915089297162107)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>119
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(14964472493879)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(10738309909457722)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>55
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6281766509454105)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(6273591318449902)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>68
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10765687633787170)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(10736802123457707)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10997709704248034)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(10920501880431113)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11073321412001661)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(11022255151370615)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>232
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12001210649734598)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(11834896511327911)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12004499257803843)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(11834960835327912)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12068783547593574)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(12060168790521903)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76667932287616877)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(76542759747204544)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>270
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76668414831616880)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(76542843757204545)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76668939037616882)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(76542906162204546)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>66
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76669397806616884)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(76543071261204547)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>107
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76670362950616887)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(76543284872204549)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76670882026616889)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(76543392278204550)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76671382303616890)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(76661662491599801)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>82
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77026749118288339)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(76827099343950327)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101893048796346529)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(100917758531162134)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(101929833022954542)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(100918221574162139)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>43
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(111936000003)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_execution_seq=>10
,p_name=>'Requiere Factor'
,p_background_color=>'#85C1F2'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(10920501880431113)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>unistr('S\00ED')
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(1316521014937)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_execution_seq=>5
,p_name=>'Base Puntual'
,p_background_color=>'#ADCDED'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(10736802123457707)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>unistr('S\00ED')
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(34383000004)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(6273591318449902)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(704508002546)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(76661662491599801)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(821758002551)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(76543392278204550)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(966853002551)
,p_view_id=>wwv_flow_api.id(76667448756616873)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(76543284872204549)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76755671608970019)
,p_plug_name=>'<b>Liquidaciones Anteriores</b>'
,p_region_name=>'luquidaciones_anteriores'
,p_parent_plug_id=>wwv_flow_api.id(76541860334204535)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with c_pgos as ',
'               ( select id_rnta, sum(vlor_ttal) vlor_ttal',
'               from ',
'                       (select nvl(m.id_rnta_antrior, m.id_rnta) id_rnta',
'                                 , sum(p.vlor_hber) vlor_ttal',
'                              from v_gi_g_rentas                 m',
'                              join gi_g_liquidaciones            n on m.id_lqdcion       = n.id_lqdcion',
'                              join gf_g_movimientos_financiero   o on n.id_lqdcion       = o.id_orgen',
'                               and o.cdgo_mvnt_fncro_estdo       = ''NO''',
'                              join gf_g_movimientos_detalle      p on o.id_mvmnto_fncro  = p.id_mvmnto_fncro',
'                               and p.cdgo_mvmnto_tpo             = ''PC''',
'                             where m.cdgo_clnte                  = :F_CDGO_CLNTE',
'                               and m.id_impsto                   = :P138_ID_IMPSTO',
'                               and m.id_impsto_sbmpsto           = :P138_ID_IMPSTO_SBMPSTO',
'                               and m.id_sjto_impsto              = :P138_ID_SJTO_IMPSTO',
'                               and m.indcdor_mgrdo               is null',
'                           group by nvl(m.id_rnta_antrior, m.id_rnta)',
'                           union all',
'                            select nvl(m.id_rnta_antrior, m.id_rnta) id_rnta',
'                                 , sum(o.vlor_lqddo) vlor_ttal',
'                              from v_gi_g_rentas                 m',
'                              join gi_g_rentas_acto              n on m.id_rnta       = n.id_rnta',
'                              join gi_g_rentas_acto_concepto     o on n.id_rnta_acto  = o.id_rnta_acto',
'                             where m.cdgo_clnte                  = :F_CDGO_CLNTE',
'                               and m.id_impsto                   = :P138_ID_IMPSTO',
'                               and m.id_impsto_sbmpsto           = :P138_ID_IMPSTO_SBMPSTO',
'                               and m.id_sjto_impsto              = :P138_ID_SJTO_IMPSTO',
'                               and n.id_impsto_acto              in ( --= :P139_ID_IMPSTO_ACTO',
'                                                                    select  id_impsto_acto   ',
'                                                                    from json_table(:P139_ACTOS_SLCCNDOS,  ''$[*]'' columns',
'                                                                                    id_impsto_acto number path ''$.ID_IMPSTO_ACTO'' ',
'                                                                                    )',
'                                                                     )',
'                               and m.indcdor_mgrdo               is not null                  ',
'                           group by nvl(m.id_rnta_antrior, m.id_rnta)  ',
'                       )',
'                  group by id_rnta',
'                )',
' ',
'   select distinct a.id_rnta',
'        , ''<span class="fa fa-eye"></span>''  ver',
'        , a.dscrpcion_ascda',
'        , a.txto_ascda',
'        , a.vlor_bse_grvble',
'        , c.vlor_ttal',
'        , trunc(a.fcha_rgstro) fcha_rgstro',
'        , trunc(a.fcha_expdcion)  fcha_expdcion',
'        , (select count(id_rnta) from gi_g_rentas m where m.id_rnta_antrior = a.id_rnta and m.cdgo_rnta_estdo    in (''LQD'', ''APB'')) cntdad_rntas',
'        , (select nvl(sum(vlor_bse_grvble),0) from gi_g_rentas m where m.id_rnta_antrior = a.id_rnta and m.cdgo_rnta_estdo in (''LQD'', ''APB'')) ttal_adcnla',
'        , (select count(m.id_rnta) ',
'             from gi_g_rentas m ',
'            where (m.id_rnta              = a.id_rnta or m.id_rnta_antrior   = a.id_rnta)',
'               and m.indcdor_rnta_pgda    = ''N'' ',
'               and m.cdgo_rnta_estdo      in (''LQD'', ''APB''))  cntdad_rntas_no_pgdas',
'        , case when d.id_rnta is not null then 1 else 0 end id_rnta_antrior ',
'     from v_gi_g_rentas                 a',
'     join gi_g_rentas_acto              b on a.id_rnta  = b.id_rnta',
'     left join c_pgos                   c on c.id_rnta  = a.id_rnta',
'     left join (select id_rnta from json_table(:P141_ID_RNTA_ANTRIOR,''$[*]''columns id_rnta path ''$.ID_RNTA'')) d on a.id_rnta = d.id_rnta',
'     where a.cdgo_clnte                 = :F_CDGO_CLNTE',
'       and a.id_impsto                  = :P138_ID_IMPSTO',
'       and a.id_impsto_sbmpsto          = :P138_ID_IMPSTO_SBMPSTO',
'       and a.id_sjto_impsto             = :P138_ID_SJTO_IMPSTO',
'       and b.id_impsto_acto             in ( --= :P139_ID_IMPSTO_ACTO',
'                                            select  id_impsto_acto   ',
'                                            from json_table(:P139_ACTOS_SLCCNDOS,  ''$[*]'' columns',
'                                                            id_impsto_acto number path ''$.ID_IMPSTO_ACTO'' ',
'                                                            )',
'                                           )',
'       and a.cdgo_rnta_estdo            in (''LQD'', ''APB'')',
'       --and a.cdgo_mvnt_fncro_estdo      = ''NO''',
'       and a.id_rnta_antrior            is null'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P138_INDCDOR_LQDCCION_ADCNAL = ''S'''
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(6212665340084407)
,p_name=>'ID_RNTA_ANTRIOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RNTA_ANTRIOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Id Rnta Antrior'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76755815262970021)
,p_name=>'ID_RNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76755925000970022)
,p_name=>'DSCRPCION_ASCDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ASCDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Asociada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>200
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76756080752970023)
,p_name=>'TXTO_ASCDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_ASCDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Texto Asociada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76756111269970024)
,p_name=>'VLOR_BSE_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_BSE_GRVBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Base Gravable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76756251163970025)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha de Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76756347929970026)
,p_name=>'Selector'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76757169696970034)
,p_name=>'CNTDAD_RNTAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNTDAD_RNTAS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Liquidacion <br> Adicionales')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(76757220428970035)
,p_name=>'TTAL_ADCNLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TTAL_ADCNLA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total Adiciones'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(77073619276293001)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total Pagado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(92805114857750030)
,p_name=>'VER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&VER.'
,p_link_target=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:RP,162:P162_ID_RNTA_ANTRIOR,P162_ID_RNTA:&ID_RNTA.,&ID_RNTA.'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(92807147329750050)
,p_name=>'CNTDAD_RNTAS_NO_PGDAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNTDAD_RNTAS_NO_PGDAS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total Liquidaciones <br> No pagadas'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(105720316036279222)
,p_name=>'FCHA_EXPDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_EXPDCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fcha Expdcion'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(76755751928970020)
,p_internal_uid=>76755751928970020
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(76799659471334336)
,p_interactive_grid_id=>wwv_flow_api.id(76755751928970020)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>5
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(76799743692334337)
,p_report_id=>wwv_flow_api.id(76799659471334336)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(1470760047517)
,p_view_id=>wwv_flow_api.id(76799743692334337)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(6212665340084407)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76800242481334339)
,p_view_id=>wwv_flow_api.id(76799743692334337)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(76755815262970021)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76800763750334340)
,p_view_id=>wwv_flow_api.id(76799743692334337)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(76755925000970022)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>237
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76801267077334342)
,p_view_id=>wwv_flow_api.id(76799743692334337)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(76756080752970023)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76801718481334343)
,p_view_id=>wwv_flow_api.id(76799743692334337)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(76756111269970024)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76802284500334345)
,p_view_id=>wwv_flow_api.id(76799743692334337)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(76756251163970025)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76816737572726607)
,p_view_id=>wwv_flow_api.id(76799743692334337)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(76757169696970034)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(76817215032726613)
,p_view_id=>wwv_flow_api.id(76799743692334337)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(76757220428970035)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77079609597293307)
,p_view_id=>wwv_flow_api.id(76799743692334337)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(77073619276293001)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92853413763835952)
,p_view_id=>wwv_flow_api.id(76799743692334337)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(92805114857750030)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>72
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92925557461589796)
,p_view_id=>wwv_flow_api.id(76799743692334337)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(92807147329750050)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>127
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(106540257827812423)
,p_view_id=>wwv_flow_api.id(76799743692334337)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(105720316036279222)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(102340892139460938)
,p_plug_name=>'Contrato de Combustible'
,p_parent_plug_id=>wwv_flow_api.id(76541860334204535)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164070834422707671)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P139_CNTRO_TPO'
,p_plug_display_when_cond2=>'GSLNA'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79654496431676114)
,p_plug_name=>unistr('Informaci\00F3n Renta')
,p_parent_plug_id=>wwv_flow_api.id(229116270262992164)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164070834422707671)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10295358556651484)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(76541860334204535)
,p_button_name=>'BTN_CNTRTO_EXTRNO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success:t-Button--link'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Contrato Externo'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P138_ID_RNTA_CNTRTO_EXTRNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10282858509643380)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(20434141178966695)
,p_button_name=>'BTN_CERRAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Cerrar'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76625284012321636)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(229116270262992164)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de cancelar? Al cancelar se perdera todos los cambios que no se han guardado'',''CANCEL'');'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76542431254204541)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(76542512739204542)
,p_button_name=>'BTN_GENERAR_PROYECCION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Generar Proyecci\00F3n')
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P141_TTAL_UTLZA_BSE_PNTUAL > 0 or :P141_TTAL_RQRE_FCTOR > 0'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-gears'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10736959244457708)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(76542512739204542)
,p_button_name=>'BTN_LIMPIAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--padLeft:t-Button--padRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Limpiar'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P141_TTAL_UTLZA_BSE_PNTUAL > 0  or :P141_TTAL_RQRE_FCTOR > 0'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-eraser'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76624865461321634)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(229116270262992164)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-angle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76625619707321636)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(229116270262992164)
,p_button_name=>'PREVIUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103612327707757)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:139:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(77076182472293026)
,p_branch_name=>unistr('Ir a la P\00E1gina 89/136  - Informe  Liquidaciones de Rentas')
,p_branch_action=>'P138_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(76625284012321636)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(76632629724321671)
,p_branch_name=>unistr('Ir a la P\00E1gina 142 / Siguiente / Adjunto')
,p_branch_action=>'f?p=&APP_ID.:142:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(76624865461321634)
,p_branch_sequence=>20
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P138_INDCDOR_RQRE_ADJNTO'
,p_branch_condition_text=>'S'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(76757871504970041)
,p_branch_name=>unistr('Ir a la P\00E1gina 143 / Siguiente / Resumen')
,p_branch_action=>'f?p=&APP_ID.:143:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(76624865461321634)
,p_branch_sequence=>30
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P138_INDCDOR_RQRE_ADJNTO'
,p_branch_condition_text=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5067734114697125)
,p_name=>'P141_VLOR_AUX_LQDCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(76541860334204535)
,p_prompt=>'&P138_LBEL_VLOR_AUX_LQDCION. '
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');" onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:2});"'
,p_colspan=>4
,p_display_when=>'P138_INDCDOR_VLOR_AUX_LQDCION'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Digite el valor con el que se va a buscar la tarifa para calcular la liquidaci\00F3n')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10283585755643381)
,p_name=>'P141_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(20435816797966711)
,p_prompt=>unistr('Tipo Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10283905912643382)
,p_name=>'P141_NMRO_IDNTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(20435816797966711)
,p_prompt=>unistr('No. Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10284309562643382)
,p_name=>'P141_NMBRE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(20435816797966711)
,p_prompt=>'Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>70
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10284740466643382)
,p_name=>'P141_DRCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(20435816797966711)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10285108716643382)
,p_name=>'P141_TLFNO_EXT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(20435816797966711)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10285547729643382)
,p_name=>'P141_CORREO_EXT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(20435816797966711)
,p_prompt=>'Correo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10285951751643383)
,p_name=>'P141_NMBRE_DPRTMNTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(20435816797966711)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10286309436643383)
,p_name=>'P141_NMBRE_MNCPIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(20435816797966711)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10286778526643383)
,p_name=>'P141_TPO_RGMEN'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(20435816797966711)
,p_prompt=>'Tipo Regimen'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10287197768643383)
,p_name=>'P141_TPO_PRSNA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(20435816797966711)
,p_prompt=>'Tipo Persona'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10287522987643384)
,p_name=>'P141_RSPNSBLE_DE_IVA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(20435816797966711)
,p_prompt=>unistr('\00BFResponsable de IVA?')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10288227128643384)
,p_name=>'P141_NMRO_CNTRTO_EXT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(20434324601966696)
,p_prompt=>'No. Contrato'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10288609486643384)
,p_name=>'P141_OBJTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(20434324601966696)
,p_prompt=>'Objeto'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>70
,p_cHeight=>5
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10289068645643385)
,p_name=>'P141_FCHA_INCIO_CNTRTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(20434324601966696)
,p_prompt=>'Fecha Inicio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10289482182643385)
,p_name=>'P141_FCHA_FIN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(20434324601966696)
,p_prompt=>'Fecha Fin'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10289894605643385)
,p_name=>'P141_FCHA_FRMA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(20434324601966696)
,p_prompt=>'Fecha Firma'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10290208888643385)
,p_name=>'P141_VLOR_CNTRTO_INCLYE_IVA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(20434324601966696)
,p_prompt=>'Valor con IVA'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10290653431643386)
,p_name=>'P141_VLOR_CNTRTO_SIN_IVA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(20434324601966696)
,p_prompt=>'Valor sin IVA'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10291070693643386)
,p_name=>'P141_VLOR_IVA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(20434324601966696)
,p_prompt=>'Iva'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10291487399643386)
,p_name=>'P141_TPO_CNTRTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(20434324601966696)
,p_prompt=>'Tipo Contrato'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>70
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10291837406643386)
,p_name=>'P141_DRCION_DIAS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(20434324601966696)
,p_prompt=>unistr('Duraci\00F3n Dias')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10292273687643387)
,p_name=>'P141_DRCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(20434324601966696)
,p_prompt=>unistr('Duraci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10292661296643387)
,p_name=>'P141_DSCRPCION_FRMA_PGO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(20434324601966696)
,p_prompt=>'Forma de Pago'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10293009450643387)
,p_name=>'P141_NMBRE_DPNDNCIA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(20434324601966696)
,p_prompt=>'Dependencia'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10293453557643387)
,p_name=>'P141_CNSCTVO_RP'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(20434324601966696)
,p_prompt=>'Consecutivo RP'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10293899915643388)
,p_name=>'P141_FCHA_RP'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(20434324601966696)
,p_prompt=>'Fecha RP'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10294212341643388)
,p_name=>'P141_ESTDO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(20434324601966696)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'estilo-cool'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10736373410457702)
,p_name=>'P141_TTAL_UTLZA_BSE_PNTUAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(76542512739204542)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10736628806457705)
,p_name=>'P141_INDCDOR_CMBIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(76542512739204542)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10738663782457725)
,p_name=>'P141_TTAL_RQRE_FCTOR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(76542512739204542)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11023414336370627)
,p_name=>'P141_INDCDOR_CMBIO_JSON_CNCPTOS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(76542512739204542)
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76541956284204536)
,p_name=>'P141_FCHA_EXPDCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(76541860334204535)
,p_use_cache_before_default=>'NO'
,p_prompt=>'&P138_LBEL_FCHA.'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'P139_FCHA_EXPDCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>13
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha de suscripci\00F3n del hecho generador.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76542003739204537)
,p_name=>'P141_FCHA_VNCMNTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(76541860334204535)
,p_prompt=>'Fecha de Pago'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha de vencimiento para el pago de la liquidaci\00F3n del hecho generador.')
,p_attribute_02=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76542159570204538)
,p_name=>'P141_VLOR_BSE_GRVBLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(76541860334204535)
,p_prompt=>'&P141_LBEL_BSE.'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');" onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:2});"'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Consiste en la base o monto para hallar el valor liquidado de la renta correspondiente, se tienen en cuenta cantidades, valores de acto y/o n\00FAmero de eventos.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76542257433204539)
,p_name=>'P141_LBEL_BSE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(76541860334204535)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select txto_bse_grvble',
'     from df_i_impuestos_acto',
'    where id_impsto                = :P138_ID_IMPSTO',
'      and id_impsto_sbmpsto        = :P138_ID_IMPSTO_SBMPSTO',
'      and id_impsto_acto          in ( --= :P139_ID_IMPSTO_ACTO',
'                                        select  id_impsto_acto   ',
'                                        from json_table( :P139_ACTOS_SLCCNDOS  ,  ''$[*]'' columns',
'                                                        id_impsto_acto number path ''$.ID_IMPSTO_ACTO'' ',
'                                                        )',
'                                     )',
' fetch first 1 rows only  ;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76755515547970018)
,p_name=>'P141_INDCDOR_LDCCION_ADCNAL'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(76541860334204535)
,p_item_default=>'N'
,p_prompt=>unistr('\00BFLiquidaci\00F3n Adicional?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_display_when=>'P138_INDCDOR_LQDCCION_ADCNAL'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" si esta solicitud de liquidaci\00F3n es adicional a un hecho generador liquidado anteriormente y "No" si es la primera solicitud de liquidaci\00F3n del hecho generador.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76756886442970031)
,p_name=>'P141_ID_RNTA_ANTRIOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(76755671608970019)
,p_prompt=>'Id Rnta Antrior'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79561621991385525)
,p_name=>'P141_INDCDOR_EXNCION'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(76541860334204535)
,p_item_default=>'N'
,p_prompt=>unistr('\00BFSolicita Exenci\00F3n?')
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_display_when=>'P138_INDCDOR_EXNCION'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" para solicitar una exenci\00F3n.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79654538909676115)
,p_name=>'P141_NMRO_RNTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(79654496431676114)
,p_prompt=>unistr('N\00B0 Liquidaci\00F3n')
,p_source=>'P138_NMRO_RNTA'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_column=>5
,p_display_when=>'P138_NMRO_RNTA'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100917816883162135)
,p_name=>'P141_CNCPTOS_OBLGTRIOS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(76541860334204535)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100918725612162144)
,p_name=>'P141_CNCPTOS_SLCCNDOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(76541860334204535)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100918911995162146)
,p_name=>'P141_CONCEPTOS_RENTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(76542512739204542)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102340128956460931)
,p_name=>'P141_VLOR_CNTRTO_ESE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(76541860334204535)
,p_prompt=>'VALOR DEL CONTRATO'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''numeroEntero'');" onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});"'
,p_colspan=>4
,p_display_when=>'P139_CNTRO_TPO'
,p_display_when2=>'ESE'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Consiste en la base o monto para hallar el valor liquidado de la renta correspondiente, se tienen en cuenta cantidades, valores de acto y/o n\00FAmero de eventos.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102340983966460939)
,p_name=>'P141_CDGO_TRCRO_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(102340892139460938)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de Tercero'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_trcro_tpo ',
'      from v_si_i_sujetos_responsable    a',
'      join v_si_c_terceros               b on a.cdgo_clnte   = b.cdgo_clnte',
'       and a.idntfccion_rspnsble         = b.idntfccion',
'     where a.id_sjto_impsto              = :P138_ID_SJTO_IMPSTO',
'       and prncpal_s_n                   = ''S''',
'       and cdgo_trcro_tpo                is not null;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_TERCERO_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_trcro_tpo as r',
'  from df_s_terceros_tipo',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102341097415460940)
,p_name=>'P141_MRGEN_UTLDAD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(102340892139460938)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Margen de Utilidad'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select mrgen_utldad',
'     from df_s_margen_utilidad_gslna',
'    where cdgo_trcro_tpo               = :P141_CDGO_TRCRO_TPO',
'      and :P141_FCHA_EXPDCION         between fcha_incio and fcha_fin;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102341120203460941)
,p_name=>'P141_VLOR_GLON_GSLNA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(102340892139460938)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Valor del Gal\00F3n de Gasolina')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(vlor_glon_gslna, ''999G999G999G999G999G999'')',
'     from df_s_margen_utilidad_gslna',
'    where cdgo_trcro_tpo               = :P141_CDGO_TRCRO_TPO',
'      and :P141_FCHA_EXPDCION         between fcha_incio and fcha_fin;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102341247955460942)
,p_name=>'P141_NMRO_GLNES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(102340892139460938)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00FAmero de Galones')
,p_source=>'to_char( round(to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D00'') / to_number(:P141_VLOR_GLON_GSLNA, ''999G999G999G999G999G999G990D00''), 0),''999G999G999G999G999G999'')'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105721223375279231)
,p_name=>'P141_FCHA_EXPDCION_ANTRIOR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(76755671608970019)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105721548074279234)
,p_name=>'P141_FCHA_PGO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(76541860334204535)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106795496610926001)
,p_name=>'P141_NMRO_RNTA_EXSTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(79654496431676114)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106795514679926002)
,p_name=>'P141_FCHA_EXPDCION_EXSTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(79654496431676114)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106795671233926003)
,p_name=>'P141_VLOR_BSE_GRVBLE_EXSTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(79654496431676114)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106795783630926004)
,p_name=>'P141_NMBRE_TRCRO_EXSTE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(79654496431676114)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106795867549926005)
,p_name=>'P141_FCHA_RGSTRO_EXSTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(79654496431676114)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106795974542926006)
,p_name=>'P141_FCHA_VNCMNTO_DCMNTO_EXSTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(79654496431676114)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106796034108926007)
,p_name=>'P141_ID_USRIO_EXSTE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(79654496431676114)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106796101785926008)
,p_name=>'P141_RSPSTA_EXSTE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(79654496431676114)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(84651685733004703)
,p_computation_sequence=>20
,p_computation_item=>'P141_VLOR_BSE_GRVBLE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'1'
,p_compute_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_trfa_esqma',
'     from v_gi_d_tarifas_esquema            a',
'    where a.cdgo_clnte                      = :F_CDGO_CLNTE',
'      and a.id_impsto                       = :P138_ID_IMPSTO',
'      and a.id_impsto_sbmpsto               = :P138_ID_IMPSTO_SBMPSTO',
'      and a.id_impsto_acto                  in ( --= :P139_ID_IMPSTO_ACTO',
'                                               select  id_impsto_acto   ',
'                                               from json_table(:P139_ACTOS_SLCCNDOS,  ''$[*]'' columns',
'                                                                id_impsto_acto number path ''$.ID_IMPSTO_ACTO'' ',
'                                                              )',
'                                                )',
'      and a.vgncia                          = extract(year from to_date(:P139_FCHA_EXPDCION))',
unistr('      -- Se valida que la tarifa este entre la fecha de expedici\00F3n'),
'      and (trunc(to_date(:P139_FCHA_EXPDCION))  between trunc(fcha_incial) ',
'                                                and trunc(fcha_fnal))',
unistr('      -- Se valida que la fecha de expedici\00F3n este entre las fecha del indicador economico de la tarifa si usa indicador'),
'      and (trunc(to_date(:P139_FCHA_EXPDCION))  between trunc(fcha_dsde_cdgo_indcdor_tpo) ',
'                                                and trunc(fcha_hsta_cdgo_indcdor_tpo)',
'        or cdgo_indcdor_tpo is null)',
unistr('      -- Se valida que la fecha de expedici\00F3n este entre las fecha del indicador economico de la base si usa indicador para la base'),
'      and (trunc(to_date(:P139_FCHA_EXPDCION))  between trunc(fcha_dsde_cdgo_indcdor_tpo_bse) ',
'                                                and trunc(fcha_hsta_cdgo_indcdor_tpo_bse)',
'        or cdgo_indcdor_tpo_bse is null)',
unistr('      -- Se valida que la fecha de expedici\00F3n este entre las fecha del indicador economico de la liquidaci\00F3n si usa indicador para la liquidaci\00F3n'),
'      and (trunc(to_date(:P139_FCHA_EXPDCION))  between trunc(fcha_dsde_cdgo_indcdor_tpo_lqd) ',
'                                                and trunc(fcha_hsta_cdgo_indcdor_tpo_lqd) ',
'        or cdgo_indcdor_tpo_lqdccion is null)',
'      and a.indcdor_usa_bse                     = ''S'''))
,p_compute_when_type=>'NOT_EXISTS'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(102340223666460932)
,p_computation_sequence=>30
,p_computation_item=>'P141_LBEL_BSE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'BASE DEL CONTRATO'
,p_compute_when=>':P139_CNTRTO_TPO = ''ESE'''
,p_compute_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(105721393912279232)
,p_computation_sequence=>40
,p_computation_item=>'P141_FCHA_PGO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_gi_rentas.fnc_cl_fcha_vncmnto_lqdcion    ( p_cdgo_clnte           =>  :F_CDGO_CLNTE',
'                                             , p_indcdor_usa_extrnjro =>  :P139_INDCDOR_USA_EXTRNJRO',
'                                             , p_id_impsto_sbmpsto    =>  :P138_ID_IMPSTO_SBMPSTO    ',
'                                             , p_id_impsto_acto       =>  :P139_ID_IMPSTO_ACTO',
'                                             , p_fcha_expdcion        =>  :P139_FCHA_EXPDCION)  ',
''))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(105722266503279241)
,p_computation_sequence=>50
,p_computation_item=>'P141_FCHA_VNCMNTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
'    select  pkg_gi_rentas.fnc_cl_fecha_documento_pago ( p_cdgo_clnte				=>    :F_CDGO_CLNTE',
'                                                        , p_id_impsto				=>    :P138_ID_IMPSTO',
'                                                        , p_id_impsto_sbmpsto		=>    :P138_ID_IMPSTO_SBMPSTO',
'                                                        , p_id_impsto_acto			=>    ( --= :P139_ID_IMPSTO_ACTO',
'                                                                                            select  id_impsto_acto   ',
'                                                                                            from json_table(:P139_ACTOS_SLCCNDOS,  ''$[*]'' columns',
'                                                                                                            id_impsto_acto number path ''$.ID_IMPSTO_ACTO'' ',
'                                                                                                            )',
'                                                                                             fetch first 1 rows only',
'                                                                                             )',
'                                                        , p_indcdor_usa_extrnjro	=>    :P139_INDCDOR_USA_EXTRNJRO ',
'                                                        , p_fcha_expdcion			=>    :P139_FCHA_EXPDCION) a ',
'   from dual;',
''))
,p_compute_when=>'P141_FCHA_VNCMNTO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(10736425016457703)
,p_computation_sequence=>60
,p_computation_item=>'P141_TTAL_UTLZA_BSE_PNTUAL'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select count(1) ',
'     from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte 			        => :F_CDGO_CLNTE',
'                                                            , p_id_impsto					=> :P138_ID_IMPSTO',
'                                                            , p_id_impsto_sbmpsto			=> :P138_ID_IMPSTO_SBMPSTO',
'                                                            , p_id_impsto_acto				=> :P139_ID_IMPSTO_ACTO',
'                                                            , p_id_sjto_impsto            	=> :P138_ID_SJTO_IMPSTO',
'                                                            , p_json_cncptos				=> null',
'                                                            , p_vlor_bse					=> to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                            , p_indcdor_usa_extrnjro		=> nvl(:P139_INDCDOR_USA_EXTRNJRO, ''N'')',
'                                                            , p_indcdor_usa_mxto			=> nvl(:P139_INDCDOR_USA_MXTO, ''N'')',
'                                                            , p_fcha_expdcion				=> to_date(:P139_FCHA_EXPDCION,''DD/MM/YYYY'')',
'                                                            , p_fcha_vncmnto				=> to_date(:P141_FCHA_VNCMNTO,''DD/MM/YYYY'')',
'                                                            , p_indcdor_lqdccion_adcnal   	=> :P141_INDCDOR_LDCCION_ADCNAL  ',
'                                                            , p_id_rnta_antrior		    	=> :P141_ID_RNTA_ANTRIOR',
'                                                            , p_indcdor_cntrto_gslna      	=> :P139_INDCDOR_CNTRTO_GSLNA',
'                                                            , p_id_impsto_acto_slccndo 	    => :P139_ACTOS_SLCCNDOS',
'                                                             )',
'                ) a',
'     where  a.indcdor_utlza_bse_pntual    = ''S'''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(10738581321457724)
,p_computation_sequence=>70
,p_computation_item=>'P141_TTAL_RQRE_FCTOR'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select count(1) ',
'     from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte 			        => :F_CDGO_CLNTE',
'                                                            , p_id_impsto					=> :P138_ID_IMPSTO',
'                                                            , p_id_impsto_sbmpsto			=> :P138_ID_IMPSTO_SBMPSTO',
'                                                            , p_id_impsto_acto				=> :P139_ID_IMPSTO_ACTO',
'                                                            , p_id_sjto_impsto            	=> :P138_ID_SJTO_IMPSTO',
'                                                            , p_json_cncptos				=> null',
'                                                            , p_vlor_bse					=> to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                            , p_indcdor_usa_extrnjro		=> nvl(:P139_INDCDOR_USA_EXTRNJRO, ''N'')',
'                                                            , p_indcdor_usa_mxto			=> nvl(:P139_INDCDOR_USA_MXTO, ''N'')',
'                                                            , p_fcha_expdcion				=> to_date(:P139_FCHA_EXPDCION,''DD/MM/YYYY'')',
'                                                            , p_fcha_vncmnto				=> to_date(:P141_FCHA_VNCMNTO,''DD/MM/YYYY'')',
'                                                            , p_indcdor_lqdccion_adcnal   	=> :P141_INDCDOR_LDCCION_ADCNAL  ',
'                                                            , p_id_rnta_antrior		    	=> :P141_ID_RNTA_ANTRIOR',
'                                                            , p_indcdor_cntrto_gslna      	=> :P139_INDCDOR_CNTRTO_GSLNA',
'                                                            , p_id_impsto_acto_slccndo 	    => :P139_ACTOS_SLCCNDOS',
'                                                             )',
'                ) a',
'     where  a.indcdor_rqre_fctor    = ''S'''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(10736525093457704)
,p_computation_sequence=>80
,p_computation_item=>'P141_INDCDOR_CMBIO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'0'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(11023646247370629)
,p_computation_sequence=>90
,p_computation_item=>'P141_INDCDOR_CMBIO_JSON_CNCPTOS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'0'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(100917949057162136)
,p_computation_sequence=>100
,p_computation_item=>'P141_CNCPTOS_OBLGTRIOS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select json_arrayagg(json_object( key ''ID_CNCPTO'' is a.id_cncpto,',
'                                     key ''ID_IMPSTO_ACTO'' is a.id_impsto_acto,',
'                                     key ''ID_IMPSTO_ACTO_CNCPTO'' is a.id_impsto_acto_cncpto) )cncptos',
'     from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte 			        => :F_CDGO_CLNTE',
'                                                            , p_id_impsto					=> :P138_ID_IMPSTO',
'                                                            , p_id_impsto_sbmpsto			=> :P138_ID_IMPSTO_SBMPSTO',
'                                                            , p_id_impsto_acto				=> :P139_ID_IMPSTO_ACTO',
'                                                            , p_id_sjto_impsto            	=> :P138_ID_SJTO_IMPSTO',
'                                                            , p_json_cncptos				=> null',
'                                                            , p_vlor_bse					=> to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                            , p_indcdor_usa_extrnjro		=> nvl(:P139_INDCDOR_USA_EXTRNJRO, ''N'')',
'                                                            , p_indcdor_usa_mxto			=> nvl(:P139_INDCDOR_USA_MXTO, ''N'')',
'                                                            , p_fcha_expdcion				=> to_date(:P139_FCHA_EXPDCION)',
'                                                            , p_fcha_vncmnto				=> to_date(:P141_FCHA_VNCMNTO)',
'                                                            , p_indcdor_lqdccion_adcnal   	=> :P141_INDCDOR_LDCCION_ADCNAL  ',
'                                                            , p_id_rnta_antrior		    	=> :P141_ID_RNTA_ANTRIOR',
'                                                            , p_indcdor_cntrto_gslna      	=> :P139_INDCDOR_CNTRTO_GSLNA',
'                                                            , p_vlor_aux_lqdcion      	    => to_number(:P141_VLOR_AUX_LQDCION, ''999G999G999G999G999G999G990D99'')',
'                                                            , p_id_impsto_acto_slccndo 	    => :P139_ACTOS_SLCCNDOS ',
'                                                             ) ',
'                ) a',
'     where abs(vlor_lqddo)               > 0',
'       and a.indcdor_cncpto_oblgtrio    = ''S'''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(12060294559521904)
,p_computation_sequence=>110
,p_computation_item=>'P141_CNCPTOS_SLCCNDOS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P141_CNCPTOS_OBLGTRIOS'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(11833806124327901)
,p_validation_name=>'Validar cambios en Base Gravable y Factor'
,p_validation_sequence=>10
,p_validation=>'P141_INDCDOR_CMBIO'
,p_validation2=>'0'
,p_validation_type=>'ITEM_IN_VALIDATION_EQ_STRING2'
,p_error_message=>unistr('Se han realizado cambios, por favor genere la proyecci\00F3n.')
,p_when_button_pressed=>wwv_flow_api.id(76624865461321634)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(76826536824950322)
,p_validation_name=>'Valor de Base no nula'
,p_validation_sequence=>20
,p_validation=>'P141_VLOR_BSE_GRVBLE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe ingresar el &P141_LBEL_BSE.'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(76624865461321634)
,p_associated_item=>wwv_flow_api.id(76542159570204538)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5067802134697126)
,p_validation_name=>'Valor Auxiliar Liquidacion'
,p_validation_sequence=>30
,p_validation=>'P141_VLOR_AUX_LQDCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Debe ingresar el Valor Auxiliar de Liquidaci\00F3n')
,p_always_execute=>'Y'
,p_validation_condition=>'P138_INDCDOR_VLOR_AUX_LQDCION'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(76624865461321634)
,p_associated_item=>wwv_flow_api.id(5067734114697125)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(76826418945950321)
,p_validation_name=>unistr('Fecha de Expedici\00F3n No nula')
,p_validation_sequence=>40
,p_validation=>'P141_FCHA_EXPDCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar la &P138_LBEL_FCHA.'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(76624865461321634)
,p_associated_item=>wwv_flow_api.id(76541956284204536)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(76826661012950323)
,p_validation_name=>'Fecha de Vencimiento no Nula'
,p_validation_sequence=>50
,p_validation=>'P141_FCHA_VNCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar la fecha de vencimiento'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(76624865461321634)
,p_associated_item=>wwv_flow_api.id(76542003739204537)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4253041806589308)
,p_validation_name=>'Validar que la fecha de vencimiento este en el rango de tasas mora'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' v_fcha_vlda          varchar2(1);',
' v_gnra_intres_mra    varchar2(1);',
' v_fcha_vncmnto       date;',
'begin    ',
'   ',
'    begin         ',
'         select distinct a.gnra_intres_mra, min(a.fcha_vncmnto)',
'           into v_gnra_intres_mra, v_fcha_vncmnto ',
'           from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte 			    => :F_CDGO_CLNTE',
'                                                                  , p_id_impsto					=> :P138_ID_IMPSTO',
'                                                                  , p_id_impsto_sbmpsto			=> :P138_ID_IMPSTO_SBMPSTO',
'                                                                  , p_id_impsto_acto			=> :P139_ID_IMPSTO_ACTO',
'                                                                  , p_id_sjto_impsto            => :P138_ID_SJTO_IMPSTO',
'                                                                 -- , p_json_cncptos				=> null',
'                                                                  , p_json_cncptos				=> :P141_CNCPTOS_SLCCNDOS',
'                                                                  , p_vlor_bse					=> to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                                  , p_indcdor_usa_extrnjro		=> nvl(:P139_INDCDOR_USA_EXTRNJRO, ''N'')',
'                                                                  , p_indcdor_usa_mxto			=> nvl(:P139_INDCDOR_USA_MXTO, ''N'')',
'                                                                  , p_fcha_expdcion				=> to_date(:P141_FCHA_EXPDCION)',
'                                                                  , p_fcha_vncmnto				=> to_date(:P141_FCHA_VNCMNTO)',
'                                                                  , p_indcdor_lqdccion_adcnal   => :P141_INDCDOR_LDCCION_ADCNAL  ',
'                                                                  , p_id_rnta_antrior		    => :P141_ID_RNTA_ANTRIOR',
'                                                              --  , p_indcdor_cntrto_gslna      => :P139_INDCDOR_CNTRTO_GSLNA)',
'                                                                  , p_indcdor_cntrto_gslna    	=> decode(:P139_CNTRO_TPO, ''GSLNA'', ''S'',''N'')',
'                                                                  , p_vlor_aux_lqdcion           =>to_number(:P141_VLOR_AUX_LQDCION, ''999G999G999G999G999G999G990D99'')',
'                                                                  , p_id_impsto_acto_slccndo     => :P139_ACTOS_SLCCNDOS',
'                                                                   ) ',
'                ) a',
'             where abs(vlor_lqddo) > 0',
'               and a.gnra_intres_mra = ''S''',
'             group by  a.gnra_intres_mra;   ',
'       ',
'       if v_gnra_intres_mra = ''S'' then ',
'       ',
'           if v_fcha_vncmnto < :P141_FCHA_VNCMNTO   then',
'                 v_fcha_vlda := pkg_gn_generalidades.fnc_vl_fcha_vncmnto_tsas_mra (:F_CDGO_CLNTE, :P138_ID_IMPSTO, to_date(:P141_FCHA_VNCMNTO));',
'',
'                if v_fcha_vlda = ''S'' then',
'                   return true;',
'                else',
'                   return false;  ',
'                end if;',
'            else',
'                return true;',
'            end if;',
'        else',
'            return true;',
'        end if;',
'        ',
'    exception',
'        when no_data_found then',
'            return true; ',
'        when others then',
'            return false;',
'    end;',
'   ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('La fecha de pago seleccionada se encuentra fuera del rango de tasa mora parametrizado. Por favor, verifique y seleccione una fecha v\00E1lida que posea tasa mora.')
,p_validation_condition=>'P141_FCHA_VNCMNTO'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(76756727543970030)
,p_validation_name=>unistr('Si es una liquidaci\00F3n adicional debe estar seleccionada la iquidaci\00F3n anterior')
,p_validation_sequence=>70
,p_validation=>'P141_ID_RNTA_ANTRIOR'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Debe seleccionar una liquidaci\00F3n anterior para poder continuar')
,p_always_execute=>'Y'
,p_validation_condition=>'P141_INDCDOR_LDCCION_ADCNAL'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(76624865461321634)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4253116798589309)
,p_validation_name=>unistr('Validar que la proyecci\00F3n se valida')
,p_validation_sequence=>80
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct',
'          a.cdgo_cncpto || '' - '' || a.dscrpcion_cncpto  dscrpcion_cncpto',
'        , a.vlor_lqddo',
'        , a.vlor_intres_mra',
'        , a.vlor_ttal vlor_ttal',
'        , a.fcha_vncmnto',
'        , a.dias_mra',
'        , a.txto_trfa',
'        , a.bse_grvble',
'        , a.vlor_pgdo',
'     from table (pkg_gi_rentas.fnc_cl_concepto_preliquidacion(p_cdgo_clnte 			        => :F_CDGO_CLNTE',
'                                                            , p_id_impsto					=> :P138_ID_IMPSTO',
'                                                            , p_id_impsto_sbmpsto			=> :P138_ID_IMPSTO_SBMPSTO',
'                                                            , p_id_impsto_acto				=> :P139_ID_IMPSTO_ACTO',
'                                                            , p_id_sjto_impsto            	=> :P138_ID_SJTO_IMPSTO',
'                                                            --,p_json_cncptos				=> null',
'                                                            , p_json_cncptos				=> :P141_CNCPTOS_SLCCNDOS',
'                                                            , p_vlor_bse					=> to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'                                                            , p_indcdor_usa_extrnjro		=> nvl(:P139_INDCDOR_USA_EXTRNJRO, ''N'')',
'                                                            , p_indcdor_usa_mxto			=> nvl(:P139_INDCDOR_USA_MXTO, ''N'')',
'                                                            , p_fcha_expdcion				=> to_date(:P141_FCHA_EXPDCION)',
'                                                            , p_fcha_vncmnto				=> to_date(:P141_FCHA_VNCMNTO)',
'                                                            , p_indcdor_lqdccion_adcnal   	=> :P141_INDCDOR_LDCCION_ADCNAL  ',
'                                                            , p_id_rnta_antrior		    	=> :P141_ID_RNTA_ANTRIOR',
'                                                            , p_indcdor_cntrto_gslna      	=> :P139_INDCDOR_CNTRTO_GSLNA',
'                                                            , p_vlor_aux_lqdcion      	    => to_number(:P141_VLOR_AUX_LQDCION, ''999G999G999G999G999G999G990D99'')',
'                                                            , p_id_impsto_acto_slccndo 	    => :P139_ACTOS_SLCCNDOS',
'                                                             )',
'                ) a',
' where abs(a.vlor_lqddo)   > 0'))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('Proyecci\00F3n no valida')
,p_when_button_pressed=>wwv_flow_api.id(76624865461321634)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(102855549269131201)
,p_validation_name=>'Valida que valor del contrato sea mayor que la base'
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'begin',
'    if   to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'') >  to_number(:P141_VLOR_CNTRTO_ESE, ''999G999G999G999G999G999G990D99'')   then',
'        return false;',
'    else',
'        return true ;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El valor total del contrato debe ser mayor que el valor base del contrato.'
,p_validation_condition=>'P139_CNTRO_TPO'
,p_validation_condition2=>'ESE'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(76624865461321634)
,p_associated_item=>wwv_flow_api.id(102340128956460931)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5067926346697127)
,p_validation_name=>'Valida que valor total del contrato sea mayor al valor base de liquidacion'
,p_validation_sequence=>100
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if   to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'') >  to_number(:P141_VLOR_AUX_LQDCION, ''999G999G999G999G999G999G990D99'')   then',
'        return false;',
'    else',
'        return true ;',
'    end if;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'El valor total del contrato debe ser mayor que el Valor del Contrato Antes de IVA'
,p_validation_condition=>'P138_INDCDOR_VLOR_AUX_LQDCION'
,p_validation_condition2=>'S'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(76624865461321634)
,p_associated_item=>wwv_flow_api.id(5067734114697125)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(102856681767131212)
,p_validation_name=>' valor del contrato no sea nulo'
,p_validation_sequence=>110
,p_validation=>'P141_VLOR_CNTRTO_ESE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe ingresar el valor total del contrato'
,p_validation_condition=>'P139_CNTRO_TPO'
,p_validation_condition2=>'ESE'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(76624865461321634)
,p_associated_item=>wwv_flow_api.id(102340128956460931)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(105721129836279230)
,p_validation_name=>'Validar Fecha de suscripcion contrato adicional'
,p_validation_sequence=>120
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'    v_id_rnta number;',
'Begin',
'',
'        select id_rnta ',
'        into v_id_rnta',
'        from json_table(:P141_ID_RNTA_ANTRIOR,''$[*]''columns id_rnta path ''$.ID_RNTA'')  ;',
'',
'        if v_id_rnta is not null then',
'            select fcha_expdcion',
'            into :P141_FCHA_EXPDCION_ANTRIOR',
'            from gi_g_rentas',
'            where id_rnta = v_id_rnta;',
'',
'            if to_date(:P141_FCHA_EXPDCION_ANTRIOR) <= to_date(:P141_FCHA_EXPDCION) then',
'                 return true;',
'            else',
'                return false;',
'            end if; ',
'        end if;',
'End;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('La fecha de suscripci\00F3n debe ser mayor que la del contrato padre.')
,p_validation_condition=>'P141_ID_RNTA_ANTRIOR'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_when_button_pressed=>wwv_flow_api.id(76624865461321634)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(105723178054279250)
,p_validation_name=>'Valida no exista liquidacion del mismo contrato'
,p_validation_sequence=>130
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'	select a.nmro_rnta',
'			, a.fcha_expdcion',
'			, a.vlor_bse_grvble',
'			, a.id_usrio',
'            , c.nmbre_trcro',
'			, a.fcha_rgstro',
'			, a.fcha_vncmnto_dcmnto',
'	INTO',
'		:P141_NMRO_RNTA_EXSTE',
'		,:P141_FCHA_EXPDCION_EXSTE',
'		,:P141_VLOR_BSE_GRVBLE_EXSTE',
'		,:P141_ID_USRIO_EXSTE',
'		,:P141_NMBRE_TRCRO_EXSTE',
'		,:P141_FCHA_RGSTRO_EXSTE',
'		,:P141_FCHA_VNCMNTO_DCMNTO_EXSTE',
'	from gi_g_rentas  a',
'		join gi_g_rentas_acto b on a.id_rnta = b.id_rnta',
'        join v_sg_g_usuarios c on a.id_usrio = c.id_usrio',
'	where a.cdgo_clnte          = :F_CDGO_CLNTE',
'		and a.id_impsto         = :P138_ID_IMPSTO',
'		and a.id_impsto_sbmpsto = :P138_ID_IMPSTO_SBMPSTO',
'		and b.id_impsto_acto   in ( --= :P139_ID_IMPSTO_ACTO',
'                                    select  id_impsto_acto   ',
'                                    from json_table(:P139_ACTOS_SLCCNDOS,  ''$[*]'' columns',
'                                                id_impsto_acto number path ''$.ID_IMPSTO_ACTO'' ',
'                                                  )',
'                                  )',
'		and a.id_sjto_impsto    = :P138_ID_SJTO_IMPSTO',
'		and a.fcha_expdcion     = :P141_FCHA_EXPDCION',
'		and a.vlor_bse_grvble   = to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'		and a.id_entdad         = nvl(:P138_ID_ENTDAD, :P138_ID_ENTDAD_USRIO)',
'        and a.cdgo_rnta_estdo   in (''APB'', ''LQD'')',
'        and rownum = 1;',
'		',
'		',
unistr('		:P141_RSPSTA_EXSTE := :F_NMBRE_USRIO || ''. '' || ''Con base en la informaci\00F3n de la liquidaci\00F3n '),
unistr('								que est\00E1 intentando procesar, hemos encontrado que ya existe una liquidaci\00F3n '),
unistr('								en el sistema con No. '' || :P141_NMRO_RNTA_EXSTE || ''  con fecha de suscripci\00F3n  ''||'),
'								:P141_FCHA_EXPDCION_EXSTE || '' con una base de '' ||  to_number(:P141_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'') ||',
'	 							'' registrada previamente por el/la funcionario(a) ''  || :P141_NMBRE_TRCRO_EXSTE ||',
unistr('								'' el d\00EDa '' || :P141_FCHA_RGSTRO_EXSTE || '' la cual tiene fecha de vencimiento hasta el '' ||'),
unistr('								:P141_FCHA_VNCMNTO_DCMNTO_EXSTE || '' . Por este motivo, no es posible continuar con esta liquidaci\00F3n. '';'),
'								',
'		return false;	',
'							',
'exception ',
'	when no_data_found then ',
'		return true;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'&P141_RSPSTA_EXSTE.'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(76624865461321634)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5069465066697142)
,p_validation_name=>'Valida que existan conceptos seleccionados'
,p_validation_sequence=>140
,p_validation=>'P141_CNCPTOS_SLCCNDOS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor, seleccione al menos un concepto'
,p_when_button_pressed=>wwv_flow_api.id(76624865461321634)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76756469549970027)
,p_name=>'Mostrar liquidaciones anteriores si el ind liquidacion adiciona es S'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P141_INDCDOR_LDCCION_ADCNAL'
,p_condition_element=>'P141_INDCDOR_LDCCION_ADCNAL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76756578694970028)
,p_event_id=>wwv_flow_api.id(76756469549970027)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(76755671608970019)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76756601226970029)
,p_event_id=>wwv_flow_api.id(76756469549970027)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(76755671608970019)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76757487029970037)
,p_event_id=>wwv_flow_api.id(76756469549970027)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P141_ID_RNTA_ANTRIOR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76756929496970032)
,p_name=>'Setear el id de la renta anterior al seleccionar una fila'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(76755671608970019)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76757076395970033)
,p_event_id=>wwv_flow_api.id(76756929496970032)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'seleccionar_liquidacion(this);',
'',
'if(this.data.selectedRecords.length > 0) {        ',
'    var model = this.data.model;',
'    var records = this.data.selectedRecords; ',
'    var id_rnta;',
'',
'        var json = records.map(function (record){',
'            return {''ID_RNTA'':  model.getValue(record, ''ID_RNTA'') };',
'        });         ',
'    ',
'        $s(''P141_ID_RNTA_ANTRIOR'', JSON.stringify(json));',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100914825873162105)
,p_event_id=>wwv_flow_api.id(76756929496970032)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P141_ID_RNTA_ANTRIOR'
,p_attribute_03=>'P141_ID_RNTA_ANTRIOR'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100914972270162106)
,p_event_id=>wwv_flow_api.id(76756929496970032)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(76542512739204542)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100914638858162103)
,p_name=>'Al dar clic BTN_GENERAR_PROYECCION'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(76542431254204541)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12060752050521909)
,p_event_id=>wwv_flow_api.id(100914638858162103)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//alert(''entro a conceptos seleccionados'');',
'obtener_conceptos_seleccionados();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11023508768370628)
,p_event_id=>wwv_flow_api.id(100914638858162103)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'null;',
':P141_INDCDOR_CMBIO_JSON_CNCPTOS := 1;',
':P141_INDCDOR_CMBIO := 0;'))
,p_attribute_02=>'P141_INDCDOR_CMBIO_JSON_CNCPTOS,P141_INDCDOR_CMBIO,P141_CNCPTOS_SLCCNDOS'
,p_attribute_03=>'P141_INDCDOR_CMBIO_JSON_CNCPTOS,P141_INDCDOR_CMBIO,P141_CNCPTOS_SLCCNDOS'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10920410795431112)
,p_event_id=>wwv_flow_api.id(100914638858162103)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(76542512739204542)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12061309565521915)
,p_event_id=>wwv_flow_api.id(100914638858162103)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//alert(''entro al ultimo js del boton'');',
'',
'setTimeout(function () {',
'  marcarBotonesDesdeJSON();',
'}, 400);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100915632505162113)
,p_name=>unistr('Actualizaci\00F3n de Pagina al cambiar')
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P141_FCHA_VNCMNTO,P141_INDCDOR_LDCCION_ADCNAL,P141_VLOR_BSE_GRVBLE, P141_VLOR_AUX_LQDCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10738152165457720)
,p_event_id=>wwv_flow_api.id(100915632505162113)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P141_CNCPTOS_SLCCNDOS'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100915913205162116)
,p_event_id=>wwv_flow_api.id(100915632505162113)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100918002159162137)
,p_name=>'Seleccionar los Conceptos Obligatorios'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P141_CNCPTOS_OBLGTRIOS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100918145719162138)
,p_event_id=>wwv_flow_api.id(100918002159162137)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'seleccion_conceptos_obligatorios();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10250014052341510)
,p_name=>'Al dar click BTN_CERRAR'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10282858509643380)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10250150064341511)
,p_event_id=>wwv_flow_api.id(10250014052341510)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#region-flotante").removeClass("visible");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10250256118341512)
,p_name=>'Al dar click Boton BTN_CNTRTO_EXTRNO'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10295358556651484)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10250376476341513)
,p_event_id=>wwv_flow_api.id(10250256118341512)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var region = $("#region-flotante");',
'region.toggleClass("visible");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10737079735457709)
,p_name=>'Limpiar item conceptos seleccionados'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10736959244457708)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10737173639457710)
,p_event_id=>wwv_flow_api.id(10737079735457709)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P141_CNCPTOS_SLCCNDOS'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10737249115457711)
,p_event_id=>wwv_flow_api.id(10737079735457709)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10737653354457715)
,p_name=>'Cuando cambia la base gravable y/o factor'
,p_event_sequence=>150
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_api.id(76542512739204542)
,p_triggering_element=>'BSE_GRVBLE,FCTOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10737729151457716)
,p_event_id=>wwv_flow_api.id(10737653354457715)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'null;',
':P141_INDCDOR_CMBIO := 1;'))
,p_attribute_02=>'P141_CNCPTOS_SLCCNDOS,P141_INDCDOR_CMBIO'
,p_attribute_03=>'P141_CNCPTOS_SLCCNDOS,P141_INDCDOR_CMBIO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10737966227457718)
,p_name=>'Bloquear el TAB en la region de conceptos'
,p_event_sequence=>160
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10738086378457719)
,p_event_id=>wwv_flow_api.id(10737966227457718)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//Bloquea la tecla TAB',
'/*$("#conceptos").on("keydown", function(event) {',
'    if (event.key === "Tab") {',
'        event.preventDefault();',
'    }',
'});',
'*/',
'',
'$("#conceptos").on("keydown", function(event) {',
'    if (event.key === "Tab") {',
'        event.preventDefault(); // Evita el cambio de foco',
'        var enterEvent = new KeyboardEvent("keydown", {',
'            key: "Enter",',
'            code: "Enter",',
'            keyCode: 13,',
'            which: 13,',
'            bubbles: true',
'        });',
'        event.target.dispatchEvent(enterEvent);',
'    }',
'});',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10281516634610059)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Impuesto acto concepto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select min( a.id_impsto_acto)',
'     into :P139_ID_IMPSTO_ACTO',
'     from v_df_i_impuestos_acto         a',
'    where a.id_impsto_acto              in ( select c.id_impsto_acto',
'                                               from df_c_grupos_acto_entidad      a',
'                                               join df_i_grupos_acto_impsto_act   b on a.id_grpo_acto     = b.id_grpo_acto',
'                                               join df_i_impuestos_acto           c on b.id_impsto_acto   = c.id_impsto_acto',
'                                              where a.id_entdad                   = nvl(:P138_ID_ENTDAD_USRIO, :P138_ID_ENTDAD)',
'                                                 and c.id_impsto_sbmpsto          = :P138_ID_IMPSTO_SBMPSTO',
'                                                 and (:P138_ID_ENTDAD_USRIO       is not null ',
'                                                   or :P138_ID_ENTDAD             is not null)',
'                                            )',
'    or (:P138_ID_ENTDAD_USRIO is null and :P138_ID_ENTDAD is null and a.id_impsto = :P138_ID_IMPSTO and a.id_impsto_sbmpsto = :P138_ID_IMPSTO_SBMPSTO)',
' order by a.nmbre_impsto_acto;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P138_ID_ENTDAD is not null and :P139_ID_IMPSTO_ACTO is null and 1 = 2'
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10249986381341509)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Informacion Contrato Externo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'        select   a.nmro_cntrto',
'                ,a.objto',
'                ,a.fcha_frma',
'                ,a.fcha_incio_cntrto',
'                ,a.fcha_fin',
'                ,a.vlor_cntrto_inclye_iva',
'                ,a.vlor_cntrto_sin_iva',
'                ,a.vlor_iva',
'                ,a.tpo_cntrto',
'                ,a.drcion_dias',
'                ,a.dscrpcion_frma_pgo',
'                ,a.drcion',
'                ,a.cdgo_dpndncia ||'' ''|| a.nmbre_dpndncia',
'                ,a.prmer_nmbre || '' '' || a.sgndo_nmbre || '' '' || a.prmer_aplldo || '' '' || a.sgndo_aplldo',
'                ,a.drccion',
'                ,a.tlfno',
'                ,a.correo ',
'                ,decode(a.tpo_prsna,''N'', ''Natural'', ''J'', ''Juridica'', ''Otro'') tpo_prsna',
'                ,(select dscrpcion_idntfccion_tpo from df_s_identificaciones_tipo where cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo)',
'                ,a.nmro_idntfccion ',
'                , (select nmbre_dprtmnto from df_s_departamentos where cdgo_dprtmnto  = a.cdgo_dprtmnto ) nmbre_dprtmnto',
'                , (select nmbre_mncpio   from df_s_municipios where cdgo_mncpio =  a.cdgo_mncpio)  nmbre_mncpio ',
'                ,a.tpo_rgmen',
'                ,a.estdo',
'                ,a.rspnsble_de_iva',
'                ,a.cnsctvo_rp',
'                ,a.fcha_rp',
'            into',
'                 :P141_NMRO_CNTRTO_EXT',
'                ,:P141_OBJTO',
'                ,:P141_FCHA_FRMA',
'                ,:P141_FCHA_INCIO_CNTRTO',
'                ,:P141_FCHA_FIN',
'                ,:P141_VLOR_CNTRTO_INCLYE_IVA',
'                ,:P141_VLOR_CNTRTO_SIN_IVA',
'                ,:P141_VLOR_IVA',
'                ,:P141_TPO_CNTRTO',
'                ,:P141_DRCION_DIAS',
'                ,:P141_DSCRPCION_FRMA_PGO',
'                ,:P141_DRCION ',
'                ,:P141_NMBRE_DPNDNCIA',
'                ,:P141_NMBRE ',
'                ,:P141_DRCCION',
'                ,:P141_TLFNO_EXT',
'                ,:P141_CORREO_EXT',
'                ,:P141_TPO_PRSNA',
'                ,:P141_CDGO_IDNTFCCION_TPO',
'                ,:P141_NMRO_IDNTFCCION',
'                ,:P141_NMBRE_DPRTMNTO',
'                ,:P141_NMBRE_MNCPIO',
'                ,:P141_TPO_RGMEN',
'                ,:P141_ESTDO',
'                ,:P141_RSPNSBLE_DE_IVA ',
'                ,:P141_CNSCTVO_RP        ',
'                ,:P141_FCHA_RP   ',
'        from gi_g_rentas_contrato_externo a',
'            where a.id_rnta_cntrto_extrno =  :P138_ID_RNTA_CNTRTO_EXTRNO;',
'exception',
'    when others then',
'        :P141_NMRO_CNTRTO_EXT				:= null;',
'        :P141_OBJTO                         := null;',
'        :P141_FCHA_FRMA                     := null;',
'        :P141_FCHA_FIN                      := null;',
'        :P141_FCHA_INCIO_CNTRTO             := null;',
'        :P141_VLOR_CNTRTO_INCLYE_IVA        := null;',
'        :P141_VLOR_CNTRTO_SIN_IVA           := null;',
'        :P141_VLOR_IVA                      := null;',
'        :P141_TPO_CNTRTO                    := null;',
'        :P141_DRCION_DIAS                   := null;',
'        :P141_DSCRPCION_FRMA_PGO            := null;',
'        :P141_DRCION                        := null;',
'        :P141_NMBRE_DPNDNCIA                := null;',
'        :P141_NMBRE                         := null;',
'        :P141_DRCCION                       := null;',
'        :P141_TLFNO_EXT                     := null;',
'        :P141_CORREO_EXT                    := null;',
'        :P141_TPO_PRSNA                     := null;',
'        :P141_CDGO_IDNTFCCION_TPO           := null;',
'        :P141_NMRO_IDNTFCCION               := null;',
'        :P141_NMBRE_DPRTMNTO                := null;',
'        :P141_NMBRE_MNCPIO                  := null;',
'        :P141_TPO_RGMEN                     := null;',
'        :P141_ESTDO                         := null; ',
'        :P141_RSPNSBLE_DE_IVA               := null; ',
'        :P141_CNSCTVO_RP                    := null; ',
'        :P141_FCHA_RP                       := null; ',
'end;',
'',
' '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P138_ID_RNTA_CNTRTO_EXTRNO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(11835959030327922)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GUARDAR_JSON_SESION'
,p_process_sql_clob=>'NULL;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
