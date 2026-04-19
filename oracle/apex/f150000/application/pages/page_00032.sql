prompt --application/pages/page_00032
begin
wwv_flow_api.create_page(
 p_id=>32
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Copia Pagina 1 para no afectar la que se usa actualmente'
,p_step_title=>'Copia Pagina 1 para no afectar la que se usa actualmente'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/tooltipster/dist/js/tooltipster.bundle.js',
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/emisionRecibo.js',
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/app.js'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*apex.jQuery(apex.gPageContext$).on("apexreadyend", async function (e) {',
'    apex.item(''btn_atras'').hide();',
'    jsonConfig = await cargarConfig();',
'    if($v(''P7_ID_IMPSTO'') && $v(''P7_ID_IMPSTO_SBMPSTO'')){',
'        cargarOpciones($v(''P7_ID_IMPSTO''),$v(''P7_ID_IMPSTO_SBMPSTO''));',
'    }else{',
'        cargarImpuestos();',
'    }',
'});*/'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/tooltipster/dist/css/tooltipster.bundle.min.css',
'https://fonts.googleapis.com/css?family=Roboto:400,500,900,700,100italic,300italic,400italic,500italic,700italic,900italic,300,100',
'#IMAGE_PREFIX#javascript/infortributos/Portal/css/impuestos.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#container, #menu_predial{',
'    background: url(#IMAGE_PREFIX#css/infortributos/imagenes/clientes/23001/FONDO_RECTANGULO-05.png);',
'    background-size: 100% 100%;',
'    padding: 5px 30px;',
'    min-height: 300px;',
'}',
'',
'#Rentas{',
'    background: none !important;',
'}',
'',
'',
'.t-Region-header{',
'    background: #409fff !important;',
'    color: #ffffff;',
'    width: 100%;',
'}',
'',
'.center {',
'  margin: auto;',
'  width: 60%;',
'  border: 3px solid #73AD21;',
'  padding: 0px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JAGUAS'
,p_last_upd_yyyymmddhh24miss=>'20211102134842'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3751470283474346)
,p_plug_name=>'<b>RENTAS VARIAS Y OTROS INGRESOS</b>'
,p_region_name=>'menu_predial'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P32_ID_MNU'
,p_plug_display_when_cond2=>'5'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3751640155474348)
,p_plug_name=>'Consulta de Liquidaciones'
,p_parent_plug_id=>wwv_flow_api.id(3751470283474346)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="f?p=&APP_ID.:205:&APP_SESSION.:::205:P205_ID_IMPSTO:230013"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BOTON-1-EMISION_RECIBOS_PSE.png" alt="Consulta de Liquidaciones"></a></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85317719081950864)
,p_plug_name=>'Menu_Principal'
,p_region_name=>'container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P32_ID_MNU is null or :P32_ID_MNU = 1'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(83566923174055408)
,p_plug_name=>'RENTAS'
,p_region_name=>'Rentas'
,p_parent_plug_id=>wwv_flow_api.id(85317719081950864)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center><a href="f?p=&APP_ID.:32:&APP_SESSION.::::P32_ID_MNU:5">',
'<img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/RENTAS.png" alt="No Imagen"></a></center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85329775788239764)
,p_plug_name=>'Predial'
,p_region_name=>'Predial'
,p_parent_plug_id=>wwv_flow_api.id(85317719081950864)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="f?p=&APP_ID.:1:&APP_SESSION.::::P32_ID_MNU:2"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/IMPUESTO_PREDIAL_UNIFICADO.png" alt="No Imagen"></a></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85329908985239765)
,p_plug_name=>'Industria'
,p_parent_plug_id=>wwv_flow_api.id(85317719081950864)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center><a href="f?p=&APP_ID.:1:&APP_SESSION.::::P32_ID_MNU:3"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/IMPUESTO_INDUSTRIA_COMERCIO.png" alt="No Imagen"></a></center>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85329979324239766)
,p_plug_name=>'PQR'
,p_parent_plug_id=>wwv_flow_api.id(85317719081950864)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center><a href="f?p=&APP_ID.:301:&APP_SESSION.::::F_CDGO_CLNTE:23001">',
'<img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/PQR.png" alt="No Imagen"></a></center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86568276381151665)
,p_plug_name=>'vehiculo'
,p_parent_plug_id=>wwv_flow_api.id(85317719081950864)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center><a href="f?p=&APP_ID.:1:&APP_SESSION.::::P32_ID_MNU:4"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/CIRCULACION_Y_TRANSITO.png" alt="No Imagen"></a></center>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(101491886332389066)
,p_plug_name=>'NORMATIVIDAD'
,p_parent_plug_id=>wwv_flow_api.id(85317719081950864)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center><a href="f?p=&APP_ID.:40:&APP_SESSION.::::F_CDGO_CLNTE:23001">',
'<img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/NORMATIVA-55.png" alt="No Imagen"></a></center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85331094310239777)
,p_plug_name=>'<b>INDUSTRIA Y COMERCIO</b>'
,p_region_name=>'menu_predial'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P32_ID_MNU'
,p_plug_display_when_cond2=>'3'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85364841667023567)
,p_plug_name=>'Estados de Cuenta'
,p_parent_plug_id=>wwv_flow_api.id(85331094310239777)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="f?p=&APP_ID.:5:&APP_SESSION.:::5:P5_ID_IMPSTO,P5_ID_IMPSTO_SBMPSTO:230012,2300122"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BOTON-1-ESTADO_CUENTA.png" alt="No Imagen"></a></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85364991944023568)
,p_plug_name=>unistr('Emisi\00F3n de Recibos')
,p_parent_plug_id=>wwv_flow_api.id(85331094310239777)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="f?p=&APP_ID.:4:&APP_SESSION.:::4:P4_ID_IMPSTO,P4_ID_IMPSTO_SBMPSTO:230012,2300122"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BOTON-1-EMISION_RECIBOS_PSE.png" alt="No Imagen"></a></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85365077831023569)
,p_plug_name=>'Formulario ICA'
,p_parent_plug_id=>wwv_flow_api.id(85331094310239777)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="f?p=&APP_ID.:8:&APP_SESSION.:::8:P8_ID_IMPSTO,P8_ID_IMPSTO_SBMPSTO:230012,2300122"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BOTON-4-REGISTRO_FORMULARIOS_INDUSTRIA_COMERCIO.png" alt="No Imagen"></a></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85365218220023570)
,p_plug_name=>'Formulario RETEICA'
,p_parent_plug_id=>wwv_flow_api.id(85331094310239777)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="f?p=&APP_ID.:8:&APP_SESSION.:::8:P8_ID_IMPSTO,P8_ID_IMPSTO_SBMPSTO:230012,23001154"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BOTON-5-REGISTRO_FORMULARIO_RETEICA.png" alt="No Imagen"></a></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85365272984023571)
,p_plug_name=>'Imprimir Acuerdo Pago'
,p_parent_plug_id=>wwv_flow_api.id(85331094310239777)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="f?p=&APP_ID.:100:&APP_SESSION.:::100:P100_ID_IMPSTO,P100_ID_IMPSTO_SBMPSTO:230012,2300122"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BOTON-6-IMPRIMIR_CUOTAS_ACUERDOS_PAGO_INDUSTRIA.png"></a></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85365363157023572)
,p_plug_name=>'Consulta Acuerdo Pago'
,p_parent_plug_id=>wwv_flow_api.id(85331094310239777)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="f?p=&APP_ID.:116:&APP_SESSION.:::116:P116_ID_IMPSTO,P116_ID_IMPSTO_SBMPSTO:230012,2300122"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BOTON-3-CONSULTA_ACUERDOS_INDUSTRIA_COMERCIO.png"></a></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85458834923953064)
,p_plug_name=>unistr('Gesti\00F3n de Declaraciones ')
,p_parent_plug_id=>wwv_flow_api.id(85331094310239777)
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>unistr('<center><a href="f?p=&APP_ID.:21:&APP_SESSION.:::21:P21_ID_IMPSTO,F_CDGO_CLNTE:230012,23001"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/GESTI\00D3N_DECLARACIONES_BOT\00D3N-07-07.png" alt="No Imagen"></a></center>')
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(101340453881694466)
,p_plug_name=>'Formulario ICA'
,p_parent_plug_id=>wwv_flow_api.id(85331094310239777)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="f?p=&APP_ID.:28:&APP_SESSION.:::::"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BOTON-4-REGISTRO_FORMULARIOS_INDUSTRIA_COMERCIO.png" alt="No Imagen"></a></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85381635398432669)
,p_plug_name=>'Regresar'
,p_plug_display_sequence=>110
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center><a href="f?p=&APP_ID.:32:&APP_SESSION.::::P32_ID_MNU:1">',
'<img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BOTON_REGRESAR-02.png" alt="No Imagen"></a></center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P32_ID_MNU'
,p_plug_display_when_cond2=>'2:3:4'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85406647148437864)
,p_plug_name=>'<b>IMPUESTO PREDIAL UNIFICADO ICONO</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--noUI:t-Region--scrollBody:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>2
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="center">',
'    <img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/ICONO-IMPUESTO_PREDIAL.png" alt="No Imagen">',
'</div>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86569635942151679)
,p_plug_name=>'<b>IMPUESTO PREDIAL UNIFICADO</b>'
,p_region_name=>'menu_predial'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P32_ID_MNU'
,p_plug_display_when_cond2=>'2'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85330765754239774)
,p_plug_name=>'Estados de Cuenta'
,p_parent_plug_id=>wwv_flow_api.id(86569635942151679)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="f?p=&APP_ID.:5:&APP_SESSION.:::5:P5_ID_IMPSTO,P5_ID_IMPSTO_SBMPSTO:230011,2300111"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BOTON-1-ESTADO_CUENTA.png" alt="No Imagen"></a></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85381172331432664)
,p_plug_name=>unistr('Proyecci\00F3n de Acuerdos de Pago')
,p_parent_plug_id=>wwv_flow_api.id(86569635942151679)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="f?p=&APP_ID.:110:&APP_SESSION.:::110:P110_ID_IMPSTO,P110_ID_IMPSTO_SBMPSTO:230011,2300111"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BOTON-2-ACUERDOS_PAGO_INDUSTRIA_COMERCIO.png" alt="No Imagen"></a></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85381283141432665)
,p_plug_name=>'Consulta de Acuerdos de Pago'
,p_parent_plug_id=>wwv_flow_api.id(86569635942151679)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="f?p=&APP_ID.:116:&APP_SESSION.:::116:P116_ID_IMPSTO,P116_ID_IMPSTO_SBMPSTO:230011,2300111"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/CONSULTA_ACUERDOS_INDUSTRIA_COMERCIO.png" alt="No Imagen"></a></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85381384353432666)
,p_plug_name=>'Imprimir Cuotas de Acuerdos de Pago'
,p_parent_plug_id=>wwv_flow_api.id(86569635942151679)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="f?p=&APP_ID.:100:&APP_SESSION.:::100:P100_ID_IMPSTO,P100_ID_IMPSTO_SBMPSTO:230011,2300111"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BOTON-6-IMPRIMIR_CUOTAS_ACUERDOS_PAGO_INDUSTRIA.png" alt="No Imagen"></a></'
||'center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86570100766151683)
,p_plug_name=>unistr('Emisi\00F3n de Recibos')
,p_parent_plug_id=>wwv_flow_api.id(86569635942151679)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="f?p=&APP_ID.:4:&APP_SESSION.:::4:P4_ID_IMPSTO,P4_ID_IMPSTO_SBMPSTO:230011,2300111"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BOTON-1-EMISION_RECIBOS_PSE.png" alt="No Imagen"></a></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(91763816374159266)
,p_plug_name=>'PSE'
,p_parent_plug_id=>wwv_flow_api.id(86569635942151679)
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="https://www.avalpaycenter.com/wps/portal/portal-de-pagos/web/pagos-aval/resultado-busqueda/realizar-pago?idConv=00013663&origen=buscar" target="_blank"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BTN-PSE.png" w'
||'idth="145" height="215" alt="No Imagen"></a></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86569847727151681)
,p_plug_name=>unistr('<b>CIRCULACI\00D3N Y TR\00C1NSITO</b>')
,p_region_name=>'menu_predial'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P32_ID_MNU'
,p_plug_display_when_cond2=>'4'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85330857264239775)
,p_plug_name=>unistr('Emisi\00F3n de Recibos')
,p_parent_plug_id=>wwv_flow_api.id(86569847727151681)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="f?p=&APP_ID.:4:&APP_SESSION.:::4:P4_ID_IMPSTO,P4_ID_IMPSTO_SBMPSTO:230017,2300177"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BOTON-1-EMISION_RECIBOS_PSE.png" alt="No Imagen"></a></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86570215369151684)
,p_plug_name=>'Estados de Cuenta'
,p_parent_plug_id=>wwv_flow_api.id(86569847727151681)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="f?p=&APP_ID.:5:&APP_SESSION.:::5:P5_ID_IMPSTO,P5_ID_IMPSTO_SBMPSTO:230017,2300177"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BOTON-1-ESTADO_CUENTA.png" alt="No Imagen"></a></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(196988907715530861)
,p_plug_name=>'Impuestos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(83768022909532970)
,p_plug_name=>'instructivos'
,p_parent_plug_id=>wwv_flow_api.id(196988907715530861)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_FRMLRIO_INSTRCTVO',
'       ,ID_FRMLRIO',
'    -- ,FILE_BLOB',
'       ,FILE_NAME',
'     --,FILE_MIMETYPE',
'      ,1 DESCARGAR',
'  from GI_D_FORMULARIOS_INSTRUCTIVO',
'  '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
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
 p_id=>wwv_flow_api.id(83768556291532976)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>83768556291532976
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79831034016581111)
,p_db_column_name=>'ID_FRMLRIO_INSTRCTVO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Frmlrio Instrctvo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79831457640581114)
,p_db_column_name=>'ID_FRMLRIO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Frmlrio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79831896956581114)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'INSTRUCTIVOS'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(79832222450581114)
,p_db_column_name=>'DESCARGAR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:GI_D_FORMULARIOS_INSTRUCTIVO:FILE_BLOB:ID_FRMLRIO_INSTRCTVO::FILE_MIMETYPE:FILE_NAME:::attachment::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(84101655799809948)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'798326'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_FRMLRIO_INSTRCTVO:ID_FRMLRIO:FILE_NAME:DESCARGAR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85330203109239768)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_api.id(196988907715530861)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(194991959865769579)
,p_plug_name=>'contenido'
,p_parent_plug_id=>wwv_flow_api.id(196988907715530861)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.p(''<div id="contenido"></div>'');',
'',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3751570465474347)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(3751470283474346)
,p_button_name=>'New_1_1_2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'New'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP,1::'
,p_button_condition=>'P32_ID_MNU_PDRE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79818236338581083)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(85331094310239777)
,p_button_name=>'New_1_1'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'New'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP,1::'
,p_button_condition=>'P32_ID_MNU_PDRE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79821685327581091)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(85406647148437864)
,p_button_name=>'New_1_2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'New'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP,1::'
,p_button_condition=>'P32_ID_MNU_PDRE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79822366359581092)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(86569635942151679)
,p_button_name=>'New_1_1_1'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'New'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP,1::'
,p_button_condition=>'P32_ID_MNU_PDRE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79824871209581096)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(86569847727151681)
,p_button_name=>'New_1_1_1_1'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'New'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP,1::'
,p_button_condition=>'P32_ID_MNU_PDRE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79830330882581106)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(194991959865769579)
,p_button_name=>'btn_atras'
,p_button_static_id=>'btn_atras'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79826447270581098)
,p_name=>'P32_CDGO_CLNTE_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(85330203109239768)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79826835291581103)
,p_name=>'P32_ID_IMPSTO_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(85330203109239768)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79827219063581103)
,p_name=>'P32_ID_IMPSTO_SBMPSTO_1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(85330203109239768)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79827625689581104)
,p_name=>'P32_ID_MNU_PDRE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(85330203109239768)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79828074304581104)
,p_name=>'P32_NVEL_MNU'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(85330203109239768)
,p_item_default=>'1'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79828457398581104)
,p_name=>'P32_CDGO_CLNTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(85330203109239768)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79828877260581104)
,p_name=>'P32_ID_IMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(85330203109239768)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79829281983581105)
,p_name=>'P32_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(85330203109239768)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79829696598581105)
,p_name=>'P32_ID_MNU'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(85330203109239768)
,p_item_default=>'1'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(79833066324581129)
,p_name=>unistr('al hacer clic en el bot\00F3n atr\00E1s')
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(79830330882581106)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(79833511605581132)
,p_event_id=>wwv_flow_api.id(79833066324581129)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'cargarImpuestos();'
,p_stop_execution_on_error=>'Y'
);
end;
/
