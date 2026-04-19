prompt --application/pages/page_00394
begin
wwv_flow_api.create_page(
 p_id=>394
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Aplicaci\00F3n Recaudos T\00EDtulos Judiciales')
,p_step_title=>unistr('Aplicaci\00F3n Recaudos T\00EDtulos Judiciales')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/accounting.min.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function buildJsonTitulos() {',
'    ',
'    var region = apex.region(''titulos'');',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("titulos").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = model._data;//view.view$.grid("getSelectedRecords");',
'        ',
'        var jsonTitulos = records.map((titulos) => {',
'            return {"ID_TTLO_JDCIAL" : model.getValue(titulos, "ID_TTLO_JDCIAL"),',
'                    "TTLO_JDCIAL_ESTDO" : model.getValue(titulos, "TTLO_JDCIAL_ESTDO"),',
'                    "ID_INSTNCIA_FLJO" : model.getValue(titulos, "ID_INSTNCIA_FLJO")',
'                   }; ',
'        });',
'        $s(''P244_JSON_TTLOS'', JSON.stringify(jsonTitulos));',
'        console.log(''json_titulos: ''+JSON.stringify(jsonTitulos))',
'        //window.localStorage.setItem(''jsonTitulos'', JSON.stringify(jsonTitulos));',
'    }',
'};',
'',
'function calculaTotal() {',
'        ',
'        var i, records, record, sal, model,',
'            v_vlor_ttal = 0,',
'            total = 0,',
'            vgncia_prdo = '' {"VGNCIA_PRDO":['',',
'            view = apex.region("deuda").widget().interactiveGrid("getCurrentView");',
'            model = view.model;',
'            records = view.getSelectedRecords();',
'            ',
'            //Realizamos un filtro de todos los datos seleccionados del interactive grid que esten en estado Normal',
'            records = records.filter(function (record) {',
'                return ( [''NO'', ''CN''].includes( model.getValue(record, "CDGO_MVNT_FNCRO_ESTDO")) && model.getValue(record, "DSCRPCION_INDCDOR_MVMNTO_BLQDO") === ''No'' ) ',
'            });',
'            ',
'            if ( records.length > 0 ) {',
'             ',
'                for ( i = 0; i < records.length; i++ ) {',
'                    record = records[i];',
'                    v_vlor_ttal = parseFloat(accounting.unformat(model.getValue(record, "VLOR_TTAL"),","));',
'                     console.log(''v_vlor_ttal''+v_vlor_ttal);',
'                    if (v_vlor_ttal > 0) { ',
'                        vgncia_prdo = vgncia_prdo + ''{"vgncia":''      + parseFloat(model.getValue(record, "VGNCIA")) + ',
'                                                    '',"prdo":''        + parseFloat(model.getValue(record, "PRDO")) + ',
'                                                    '',"id_orgen":''    + model.getValue(record, "ID_ORGEN") + ''},'';',
'                        if ( !isNaN(v_vlor_ttal) ) {',
'                            total += v_vlor_ttal;',
'                        }',
'                    }  ',
'                     ',
'               }',
'            } ',
'            ',
'    ',
'            $s("P244_VLOR_TTAL", total);',
'            vgncia_prdo = vgncia_prdo.substring(vgncia_prdo.length-1, 1) ;',
'            vgncia_prdo = vgncia_prdo + '']}''',
'            $s("P244_VGNCIA_PRDO", vgncia_prdo);',
'    ',
'        //Seleccionamos los item no procesados en el interactive grid ',
'        apex.region("deuda").widget().interactiveGrid("setSelectedRecords", records);',
'};',
'',
'//VIEJO',
'/*//var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function calculaTotal() {',
'        var i, record,',
'            v_vlor_ttal = 0,',
'            total = 0,',
'            vgncia_prdo = '' {"VGNCIA_PRDO":['',',
'            view = apex.region("carteraCautelar").widget().interactiveGrid("getCurrentView"),',
'            model = view.model,',
'            //records = view.getSelectedRecords();            ',
'            records = model._data;//.getSelectedRecords();',
'    ',
'            if ( records.length > 0 ) {',
'                for ( i = 0; i < records.length; i++ ) {',
'                    record = records[i];',
'                    vgncia_prdo = vgncia_prdo + ''{"vgncia":''      + parseFloat(model.getValue(record, "VGNCIA")) + ',
'                                                '',"prdo":''        + parseFloat(model.getValue(record, "PRDO")) + ',
'                                                ''},'';',
'                    v_vlor_ttal = parseFloat(accounting.unformat(model.getValue(record, "VLOR_TTAL"),","));',
'                    if ( !isNaN(v_vlor_ttal) ) {',
'                        total += v_vlor_ttal;',
'                    }',
'                }',
'            }',
'            $s("P244_VLOR_TTAL", total);',
'            vgncia_prdo = vgncia_prdo.substring(vgncia_prdo.length-1, 1) ;',
'            vgncia_prdo = vgncia_prdo + '']}''',
'            $s("P244_VGNCIA_PRDO", vgncia_prdo);',
'        //Seleccionamos los item no procesados en el interactive grid ',
'        //apex.region("carteraCautelar").widget().interactiveGrid("setSelectedRecords", records);',
'}',
'',
'/*function buildJsonConcepto(){',
'    ',
'    var region = apex.region(''carteraCautelar'');',
'    ',
'    if(region){',
'        ',
'        var view = apex.region("carteraCautelar").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = model._data;',
'        ',
'        var jsonconceptos = records.map((concepto) => {',
'            return {"vgncia" : model.getValue(concepto, "VGNCIA"),',
'                    "id_prdo" : model.getValue(concepto, "ID_PRDO"),',
'                    "prdo" : model.getValue(concepto,  "PRDO"),',
'                    "id_cncpto" : model.getValue(concepto,  "ID_CNCPTO"),',
'                    "id_impsto" : model.getValue(concepto,  "ID_IMPSTO"),',
'                    "id_impsto_sbmpsto" : model.getValue(concepto,  "ID_IMPSTO_SBMPSTO"),',
'                    "id_sjto_impsto" : model.getValue(concepto,  "ID_SJTO_IMPSTO")',
'                    //"vlor_aplcar" : model.getValue(concepto,  "VLOR_APLCAR").trim().replace(/\./g, "")',
'                   }; ',
'        });',
'        ',
'        window.localStorage.setItem(''jsonconceptos'', JSON.stringify(jsonconceptos));',
'        ',
'        var conceptos = JSON.parse(window.localStorage.jsonconceptos)',
'        ',
'        return conceptos.length',
'        ',
'    }',
'    ',
'}*//*',
'function buildJsonTitulos() {',
'    ',
'    var region = apex.region(''titulos'');',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("titulos").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        var jsonTitulos = records.map((titulos) => {',
'            return {"ID_TTLO_JDCIAL" : model.getValue(titulos, "ID_TTLO_JDCIAL"),',
'                    "ACCION" : model.getValue(titulos, "ACCION")',
'                   }; ',
'        });',
'        $s(''P244_JSON'', JSON.stringify(jsonTitulos));',
'        console.log(''json: ''+JSON.stringify(jsonTitulos))',
'        window.localStorage.setItem(''jsonTitulos'', JSON.stringify(jsonTitulos));',
'    }',
'}',
'',
'function buildJsonCartera() {',
'    ',
'    var region = apex.region(''cartera'');',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("cartera").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        var jsonCartera = records.map((cartera) => {',
'            return {"ID_IMPSTO" : model.getValue(cartera, "ID_IMPSTO"),',
'                    "ID_IMPSTO_SBMPSTO" : model.getValue(cartera, "ID_IMPSTO_SBMPSTO"),',
'                    "ID_SJTO_IMPSTO" : model.getValue(cartera, "ID_SJTO_IMPSTO"),',
'                    "ID_SJTO_RSPNSBLE" : model.getValue(cartera, "ID_SJTO_RSPNSBLE"),',
'                    "VGNCIA" : model.getValue(cartera, "VGNCIA"),',
'                    "ID_PRDO" : model.getValue(cartera, "ID_PRDO"),',
'                    "ID_CNCPTO" : model.getValue(cartera, "ID_CNCPTO")',
'                   }; ',
'        });',
'        $s(''P244_JSON_CRTRAS'', JSON.stringify(jsonCartera));',
'        console.log(''json_cartera: ''+JSON.stringify(jsonCartera))',
'        //window.localStorage.setItem(''jsonCartera'', JSON.stringify(jsonCartera));',
'    }',
'}',
'/*function calcularValor() {',
'    // Obtener la instancia de la grilla interactiva',
'    var grid = apex.region("cartera").widget().interactiveGrid("getViews", "grid");',
'',
'    // Obtener las filas seleccionadas',
'    var selectedRecords = grid.getSelectedRecords();',
'',
'    // Realizar la resta y almacenar el resultado',
'    var resultado = 0; // Inicializa el resultado',
'',
'    selectedRecords.forEach(function(record) {',
'        // Reemplaza ''nombre_columna'' con el nombre de la columna que deseas restar',
'        var valorColumna = parseFloat(record["VLOR_TTAL"]); ',
'        //console.log(''valorColumna: ''+valorColumna);',
'        // Realizar la resta',
'        resultado = valorColumna;',
'    });',
'        //console.log(''resultado: ''+resultado);',
'    ',
'    // Asignar el resultado al elemento de Apex',
'    $s(''P244_VALOR_TTLO_2'', resultado);',
'}*/'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if( apex.region("deuda") )',
'    apex.region("deuda").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");',
'//VIEJO',
'//apex.item("P244_VLOR_ABNO").hide();',
'/*if( apex.region("carteraCautelar") )',
'    apex.region("carteraCautelar").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");*/'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20231116174019'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21610462071081311)
,p_plug_name=>unistr('Gesti\00F3n Recaudos')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'NOT_EXISTS'
,p_plug_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'   from gf_g_ttls_jdcl_impsto_dcmnt a ',
'    join gf_g_titulos_jdcial_impsto b on b.id_ttlo_jdcial_impsto = a.id_ttlo_jdcial_impsto',
'                                                    and b.id_ttlo_jdcial = :P394_ID_TTLO_JDCIAL',
'    join v_re_g_documentos c on c.id_dcmnto = a.id_dcmnto  and c.indcdor_pgo_aplcdo = ''N'';'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21616770407153003)
,p_plug_name=>'<b>Recaudos </b>'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select c.nmro_dcmnto,',
'       d.id_rcdo,',
'       d.fcha_rcdo,',
'       d.fcha_apliccion,',
'       c.fcha_vncmnto,',
'       d.vlor ,',
'       e.nmbre_bnco,',
'       e.nmro_cnta,',
'       d.cdgo_rcdo_estdo,',
'       d.mnsje_rspsta',
'   from gf_g_ttls_jdcl_impsto_dcmnt a ',
'    join gf_g_titulos_jdcial_impsto b on b.id_ttlo_jdcial_impsto = a.id_ttlo_jdcial_impsto',
'                                                    and b.id_ttlo_jdcial = :P394_ID_TTLO_JDCIAL',
'    join v_re_g_documentos c on c.id_dcmnto = a.id_dcmnto',
'    join re_g_recaudos d on d.id_orgen = c.id_dcmnto ',
'    join v_re_g_recaudos_control e on e.id_rcdo_cntrol = d.id_rcdo_cntrol   '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'   from gf_g_ttls_jdcl_impsto_dcmnt a ',
'    join gf_g_titulos_jdcial_impsto b on b.id_ttlo_jdcial_impsto = a.id_ttlo_jdcial_impsto',
'                                                    and b.id_ttlo_jdcial = :P394_ID_TTLO_JDCIAL',
'    join v_re_g_documentos c on c.id_dcmnto = a.id_dcmnto',
'    join re_g_recaudos d on d.id_orgen = c.id_dcmnto;'))
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(21616997464153005)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=140000:17:&SESSION.::&DEBUG.:RP,17:P17_ID_RCDO:#ID_RCDO##ID_DCMNTO#'
,p_detail_link_text=>'<center><span class="fa fa-eye" aria-hidden="true"></span></center>'
,p_owner=>'JPRADA'
,p_internal_uid=>21616997464153005
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21617815292153014)
,p_db_column_name=>'ID_RCDO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Id Rcdo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21617910292153015)
,p_db_column_name=>'FCHA_RCDO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Fecha Recaudo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21618013065153016)
,p_db_column_name=>'FCHA_APLICCION'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Fecha Aplicaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21618196411153017)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Fecha Vencimiento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21618204693153018)
,p_db_column_name=>'VLOR'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Valor '
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21618419606153020)
,p_db_column_name=>'NMRO_CNTA'
,p_display_order=>140
,p_column_identifier=>'O'
,p_column_label=>'Cuenta'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21618363219153019)
,p_db_column_name=>'NMBRE_BNCO'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'Banco'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21618552790153021)
,p_db_column_name=>'CDGO_RCDO_ESTDO'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21618649942153022)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'No. Documento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21682816001466001)
,p_db_column_name=>'MNSJE_RSPSTA'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Respuesta'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(21637158439545299)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'216372'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_DCMNTO:FCHA_RCDO:FCHA_APLICCION:VLOR:NMBRE_BNCO:NMRO_CNTA:CDGO_RCDO_ESTDO:MNSJE_RSPSTA:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65488493769009545)
,p_plug_name=>'<b>Documentos Generados</b>'
,p_region_name=>'cartera'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select c.id_dcmnto,',
'        c.nmbre_impsto,',
'       c.nmro_dcmnto, ',
'       to_char(c.fcha_dcmnto,''DD/MM/YYYY HH12:MI:SS AM'') fcha_dcmnto, ',
'       initcap(c.dscrpcion_dcmnto_tpo) dscrpcion_dcmnto_tpo,',
'       c.vlor_ttal_dcmnto, ',
'       to_char(c.fcha_vncmnto,''DD/MM/YYYY'') fcha_vncmnto,',
'       initcap(c.dscrpcion_indcdor_pgo_aplcdo) dscrpcion_indcdor_pgo_aplcdo,',
'       1 as "IMPRIMIR"     ',
'   from gf_g_ttls_jdcl_impsto_dcmnt a ',
'    join gf_g_titulos_jdcial_impsto b on b.id_ttlo_jdcial_impsto = a.id_ttlo_jdcial_impsto',
'                                                    and b.id_ttlo_jdcial = :P394_ID_TTLO_JDCIAL',
'    join v_re_g_documentos c on c.id_dcmnto = a.id_dcmnto;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'   from gf_g_ttls_jdcl_impsto_dcmnt a ',
'    join gf_g_titulos_jdcial_impsto b on b.id_ttlo_jdcial_impsto = a.id_ttlo_jdcial_impsto',
'                                                    and b.id_ttlo_jdcial = :P394_ID_TTLO_JDCIAL',
'    join v_re_g_documentos c on c.id_dcmnto = a.id_dcmnto;'))
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(65489790586009558)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=140000:6:&SESSION.::&DEBUG.:RP,6:P6_ID_DCMNTO:#ID_DCMNTO#'
,p_detail_link_text=>'<center><span class="fa fa-eye" aria-hidden="true"></span></center>'
,p_owner=>'JPRADA'
,p_internal_uid=>65489790586009558
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22002132861186977)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Dcmnto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22002565070186979)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22002994123186979)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'No. Documento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22003312214186979)
,p_db_column_name=>'FCHA_DCMNTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Fecha Documento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22003712987186980)
,p_db_column_name=>'DSCRPCION_DCMNTO_TPO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Tipo Documento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22004111569186980)
,p_db_column_name=>'VLOR_TTAL_DCMNTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor Total Documento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22004598443186980)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Fecha Vencimiento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22004962668186981)
,p_db_column_name=>'DSCRPCION_INDCDOR_PGO_APLCDO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('\00BFPago Aplicado?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(22005301493186981)
,p_db_column_name=>'IMPRIMIR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Imprimir'
,p_column_link=>'f?p=&APP_ID.:280:&SESSION.::&DEBUG.:280:P280_ID_DCMNTO,P280_NMBRE_RPRTE:#ID_DCMNTO#,#NMRO_DCMNTO##P244_ID_CMNTO#'
,p_column_linktext=>'<span class="fa fa-print" aria-hidden="true"></span>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(65519776653140754)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'220057'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_IMPSTO:NMRO_DCMNTO:FCHA_DCMNTO:DSCRPCION_DCMNTO_TPO:VLOR_TTAL_DCMNTO:FCHA_VNCMNTO:DSCRPCION_INDCDOR_PGO_APLCDO:IMPRIMIR:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(495679851909334038)
,p_plug_name=>unistr('T\00EDtulos Registrados')
,p_region_name=>'titulos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   a.id_ttlo_jdcial',
'        ,a.cdgo_clnte',
'        ,a.id_ttlo_jdcial_crgdo',
'        ,a.nmro_ttlo_jdcial',
'        ,a.fcha_cnsttcion',
'        ,a.vlor',
'        --,a.idntfccion_dmndnte',
'        --,a.nmbre_dmndnte',
'        ,decode(a.id_ttlo_jdcial_area,a.id_ttlo_jdcial_area, c.nmbre_area , ''-'') as id_ttlo_jdcial_area',
'        ,decode(a.cdgo_idntfccion_tpo_dmnddo, a.cdgo_idntfccion_tpo_dmnddo, b.dscrpcion_idntfccion_tpo, ''-'') as cdgo_idntfccion_tpo_dmnddo',
'        ,a.idntfccion_dmnddo',
'        ,a.nmbre_dmnddo',
'        ,a.nmro_ttlo_pdre',
'        ,a.id_ttlo_pdre',
'        ,a.cdgo_entdad_cnsgnnte||'' - ''||d.nmbre_bnco as cdgo_entdad_cnsgnnte',
'        ,a.id_bnco_cnsgnnte',
'        ,decode(a.cdgo_ttlo_jdcial_estdo, a.cdgo_ttlo_jdcial_estdo, f.dscrpcion, ''-'') as cdgo_ttlo_jdcial_estdo',
'        ,a.id_embrgo_rslcion',
'        ,a.id_instncia_fljo_pdre',
'        ,a.id_instncia_fljo',
'        ,a.id_slctud',
'        ,a.cdgo_entdad_rcddr||'' - ''||e.nmbre_bnco as cdgo_entdad_rcddr',
'        ,a.id_bnco_rcddr',
'        ,a.cnsctvo_embrgo',
'from gf_g_titulos_judicial a',
'join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo_dmnddo',
'join df_c_areas c on c.id_area = a.id_ttlo_jdcial_area',
'join df_c_bancos d on d.id_bnco = a.id_bnco_cnsgnnte',
'join df_c_bancos e on e.id_bnco = a.id_bnco_rcddr',
'left join gf_d_titulos_judicial_estdo f on f.cdgo_ttlo_jdcial_estdo = a.cdgo_ttlo_jdcial_estdo',
'--left join mc_g_embargos_resolucion g on g.id_embrgos_rslcion = a.id_embrgo_rslcion',
'--where a.id_instncia_fljo is null',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'--and a.idntfccion_dmnddo = :P394_IDNTFCCION'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495679989739334040)
,p_name=>'ID_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495680135286334041)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495680218492334042)
,p_name=>'ID_TTLO_JDCIAL_CRGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_CRGDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495680312812334043)
,p_name=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_JDCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495680419346334044)
,p_name=>'FCHA_CNSTTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNSTTCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Fecha<br>Constituci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495680557317334045)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495680802970334048)
,p_name=>'ID_TTLO_JDCIAL_AREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_AREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('\00C1rea')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495680970651334050)
,p_name=>'IDNTFCCION_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Identificaci\00F3n<br>Demandado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495681089560334051)
,p_name=>'NMBRE_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Nombre<br>Demandado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495681257629334052)
,p_name=>'NMRO_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_PDRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial Padre')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495681307644334053)
,p_name=>'ID_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_PDRE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495681427331334054)
,p_name=>'CDGO_ENTDAD_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_CNSGNNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Entidad<br>Consignante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495681526849334055)
,p_name=>'ID_BNCO_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_CNSGNNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495681653537334056)
,p_name=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Estado T\00EDtulo<br>Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Consignar;CNS,Devolver;DVL,Fraccionar;FRC,Rechazar;RCH'
,p_lov_display_extra=>true
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
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495681682433334057)
,p_name=>'ID_EMBRGO_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGO_RSLCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495681784046334058)
,p_name=>'ID_INSTNCIA_FLJO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_PDRE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495681948470334059)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495682016625334060)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Id Solicitud<br>PQR'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495682138269334061)
,p_name=>'CDGO_ENTDAD_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_RCDDR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Entidad<br>Recaudadora'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495682182189334062)
,p_name=>'ID_BNCO_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_RCDDR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495827832042989845)
,p_name=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Tipo<br>Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(495856860753604167)
,p_name=>'CNSCTVO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNSCTVO_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'No. Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(495679944189334039)
,p_internal_uid=>495679944189334039
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(495689014099358368)
,p_interactive_grid_id=>wwv_flow_api.id(495679944189334039)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(495689111936358370)
,p_report_id=>wwv_flow_api.id(495689014099358368)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(478982629403804621)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(495827832042989845)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495689639460358372)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(495679989739334040)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495690166989358374)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(495680135286334041)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495690584861358375)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(495680218492334042)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495691119050358377)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(495680312812334043)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495691656682358379)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(495680419346334044)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>88
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495692153022358380)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(495680557317334045)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495693607473358385)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(495680802970334048)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495694663190358388)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(495680970651334050)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495695093129358389)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(495681089560334051)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>163
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495695632825358391)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(495681257629334052)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495696131878358392)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(495681307644334053)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495696608908358394)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(495681427331334054)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495697078693358395)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(495681526849334055)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495697655648358397)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(495681653537334056)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>154
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495698096530358398)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(495681682433334057)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495698586374358400)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(495681784046334058)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495699167967358403)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(495681948470334059)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495699601357358405)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(495682016625334060)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495700168855358407)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(495682138269334061)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>131
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495700584225358409)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(495682182189334062)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(495954533224507577)
,p_view_id=>wwv_flow_api.id(495689111936358370)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(495856860753604167)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(693734374438827958)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'Esta funcionalidad permite:<br><br>',
'Aplicar los pagos de los recibos generados.<br><br>',
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(853232388976655366)
,p_plug_name=>unistr('<b>Proceso Puntual T\00EDtulo Judicial  No. &P394_NMRO_TTLO_JDCIAL.</b>')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1067777153240003478)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21597147362993501)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(1067777153240003478)
,p_button_name=>'BTN_APLICAR_PAGO'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Recaudo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Ã‚Â¿Esta seguro que desea aplicar el pago?'', ''BTN_APLICAR_PAGO'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'   from gf_g_ttls_jdcl_impsto_dcmnt a ',
'    join gf_g_titulos_jdcial_impsto b on b.id_ttlo_jdcial_impsto = a.id_ttlo_jdcial_impsto',
'                                                    and b.id_ttlo_jdcial = :P394_ID_TTLO_JDCIAL',
'    join v_re_g_documentos c on c.id_dcmnto = a.id_dcmnto  and c.indcdor_pgo_aplcdo = ''N'';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-money'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21610532794081312)
,p_name=>'P394_FCHA_RCDO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(21610462071081311)
,p_prompt=>'<b>Fecha Recaudo</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21618719613153023)
,p_name=>'P394_NMRO_TTLO_JDCIAL'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(495679851909334038)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22009551931202501)
,p_name=>'P394_RSPSTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(21616770407153003)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22009690453202502)
,p_name=>'P394_ID_BNCO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(21610462071081311)
,p_prompt=>'<b>Banco</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select cdgo_bnco || '' - '' || nmbre_bnco as d',
'         , id_bnco as r',
'      from df_c_bancos',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and rcddor = ''S''',
'       and cdgo_bnco = 40         --Banco Agrario... ver como se hace parametrizable'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'320'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22009737557202503)
,p_name=>'P394_ID_BNCO_CNTA'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(21610462071081311)
,p_prompt=>'<b>Cuenta</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select nmro_cnta as d',
'       , id_bnco_cnta as r',
'    from df_c_bancos_cuenta',
'   where id_bnco    = :P394_ID_BNCO',
'order by nmro_cnta'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P394_ID_BNCO'
,p_ajax_items_to_submit=>'P394_ID_BNCO,P394_ID_BNCO_CNTA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'320'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(212907657800865219)
,p_name=>'P394_IDNTFCCION_DMNDDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(495679851909334038)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(212908033301865222)
,p_name=>'P394_ID_TTLO_JDCIAL'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(495679851909334038)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(212908484749865223)
,p_name=>'P394_ID_ACTO'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(495679851909334038)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(212908806490865223)
,p_name=>'P394_JSON_TTLOS'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(495679851909334038)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(212909252702865223)
,p_name=>'P394_JSON_CNSGNR'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(495679851909334038)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(212925977306865316)
,p_validation_name=>unistr('identificaci\00F3n no nula')
,p_validation_sequence=>40
,p_validation=>'P394_IDNTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor ingrese un identificaci\00F3n para consultar')
,p_when_button_pressed=>wwv_flow_api.id(18214222714920672)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(21616527199153001)
,p_validation_name=>'Fecha recaudo '
,p_validation_sequence=>50
,p_validation=>'P394_FCHA_RCDO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor seleccione la Fecha de Recaudo.'
,p_when_button_pressed=>wwv_flow_api.id(21597147362993501)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(212937788386865331)
,p_name=>'Al cerrar la modal'
,p_event_sequence=>150
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(212938280311865331)
,p_event_id=>wwv_flow_api.id(212937788386865331)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1067777153240003478)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(212927098584865319)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>unistr('Limpiar Cache de toda la P\00E1gina')
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'261'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(17784932495841284)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(212927440878865319)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aplicar Pagos Documentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    ',
'begin',
'    pkg_gf_titulos_judicial.prc_ap_recaudos_titulos(p_cdgo_clnte	  =>    :F_CDGO_CLNTE,',
'                                                    p_id_ttlo_jdcial  =>    :P394_ID_TTLO_JDCIAL,',
'                                                    p_fcha_rcdo       =>    :P394_FCHA_RCDO, ',
'                                                    p_id_bnco         =>    :P394_ID_BNCO,',
'                                                    p_id_bnco_cnta    =>    :P394_ID_BNCO_CNTA,',
'                                                    p_id_usrio        =>    :F_ID_USRIO, ',
'                                                    o_cdgo_rspsta	  =>    v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta	  =>    :P394_RSPSTA);',
'    if v_cdgo_rspsta > 0 then',
'            raise_application_error(-20001, :P394_RSPSTA);',
'            apex_error.add_error (  p_message          => ''Por favor seleccione al menos una vigencia para registrar cartera.'',',
'                        p_display_location => apex_error.c_inline_in_notification );',
'    else',
'        :P394_RSPSTA := ''Recaudos Aplicados Exitosamente'';',
'    end if;',
'    ',
'end;'))
,p_process_error_message=>'&P394_RSPSTA. '
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(21597147362993501)
,p_process_success_message=>'&P394_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(212926276366865316)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargue de Datos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     select idntfccion_dmnddo',
'            , id_ttlo_jdcial',
'            , nmro_ttlo_jdcial',
'        into :P394_IDNTFCCION_DMNDDO',
'            ,:P394_ID_TTLO_JDCIAL',
'            ,:P394_NMRO_TTLO_JDCIAL',
'       from v_gf_g_titulos_judicial',
'      where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'      and rownum = 1;  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(212928231923865320)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargue Datos Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    select b.id_acto',
'      into :P394_ID_ACTO',
'      from gf_g_titulos_jdcial_dcmnto b',
'      join gf_g_ttls_jdcl_dcmnt_asccn c on b.id_ttlo_jdcial_dcmnto = c.id_ttlo_jdcial_dcmnto',
'      join gf_g_titulos_judicial f on f.id_ttlo_jdcial = c.id_ttlo_jdcial',
'      join gn_d_actos_tipo d on d.id_acto_tpo = b.id_acto_tpo',
'      join gn_d_actos_tipo_tarea e on e.id_acto_tpo = b.id_acto_tpo',
'                                   and e.id_fljo_trea = :F_ID_FLJO_TREA ',
'     where c.id_ttlo_jdcial = :P394_ID_TTLO_JDCIAL--nvl(nvl(json_value(:P394_JSON_CNSGNR, ''$.id_ttlo_jdcial''), json_value(:P394_JSON_DVLVR, ''$.id_ttlo_jdcial'')), json_value(:P394_JSON_FRCCNR, ''$.id_ttlo_jdcial''))',
'       and f.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'       and rownum = 1;',
'exception ',
'    when others then',
'        :P394_ID_ACTO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(212928694396865320)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Construir Json T\00EDtulos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for c_ttlos in (select id_ttlo_jdcial, ',
'                           ttlo_jdcial_estdo,',
'                           id_instncia_fljo ',
'                    from json_table(:P394_JSON_TTLOS, ''$[*]'' ',
'                                     columns (id_ttlo_jdcial            varchar2 path ''$.ID_TTLO_JDCIAL'',',
'                                              ttlo_jdcial_estdo    varchar2 path ''$.TTLO_JDCIAL_ESTDO'',',
'                                              id_instncia_fljo    varchar2 path ''$.ID_INSTNCIA_FLJO''))',
'    )loop',
'            if c_ttlos.ttlo_jdcial_estdo in (''ACN'',''CNS'',''ATJ'') then',
'                select json_arrayagg(',
'                           json_object (',
'                               ''id_ttlo_jdcial'' value id_ttlo_jdcial',
'                           )',
'                       ) as json_titulos',
'                into :P394_JSON_CNSGNR',
'                from (',
'                    /*select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.cdgo_ttlo_jdcial_estdo in (''ACN'', ''CNS'', ''ATJ'')*/',
'                    select id_ttlo_jdcial, ',
'                           ttlo_jdcial_estdo,',
'                           id_instncia_fljo',
'                    from json_table(:P394_JSON_TTLOS, ''$[*]'' ',
'                                     columns (id_ttlo_jdcial            varchar2 path ''$.ID_TTLO_JDCIAL'',',
'                                              ttlo_jdcial_estdo    varchar2 path ''$.TTLO_JDCIAL_ESTDO'',',
'                                              id_instncia_fljo    varchar2 path ''$.ID_INSTNCIA_FLJO'')) a',
'                    where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                    and a.ttlo_jdcial_estdo in (''ACN'', ''CNS'', ''ATJ'')',
'                );',
'            end if;',
'    end loop;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(212926605139865319)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'guardar_cartera'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000);',
'    v_cncptos         clob;',
'    v_exception       exception;',
'begin',
'',
'    for i in 1..apex_application.g_f01.count loop',
'        v_cncptos := v_cncptos || apex_application.g_f01(i);',
'    end loop;',
'    insert into muerto (c_001, t_001, v_001) values (v_cncptos, systimestamp, ''titulos''); commit;',
'   /* pkg_fi_fiscalizacion.prc_rg_fi_g_fsclzcion_sncion(p_cdgo_clnte           => :F_CDGO_CLNTE,',
'                                                      p_id_fsclzcion_expdnte => :P31_ID_FSCLZCION_EXPDNTE,',
'                                                      p_id_acto_tpo          => :P31_ACTO_TPO,',
'                                                      p_json                 => v_cncptos,',
'                                                      o_cdgo_rspsta          => v_cdgo_rspsta,',
'                                                      o_mnsje_rspsta         => v_mnsje_rspsta);',
'    ',
'    if v_cdgo_rspsta > 0 then',
'        raise v_exception;',
'    end if;*/',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'',
'exception',
'    when v_exception then',
'        rollback;',
'        apex_json.open_object;',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
