prompt --application/pages/page_00138
begin
wwv_flow_api.create_page(
 p_id=>138
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Gesti\00F3n de Solicitudes de Liquidaciones de Rentas')
,p_step_title=>unistr('Gesti\00F3n de Solicitudes de Liquidaciones de Rentas')
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#region-flotante").draggable();',
'',
'let consultarSujeto = (event, expresion) => {',
'',
'    if (event.key == "Enter") {',
'        ',
'        if ($v(''P138_IDNTFCCION'') != ''''){',
'           // return apex.submit({ request: ''BTN_CONSULTAR'', submitIfEnter: event});   ',
'             $(''#BTN_CONSULTAR'').click();',
'        }else{',
'           Swal.fire({',
unistr('                //icon: ''Validaci\00F3n'','),
unistr('               title: ''<H2 >Validaci\00F3n</H2>'','),
unistr('                html: `<h4>Digite una Identificaci\00F3n</h4>`'),
'           }); ',
'        }',
'    }',
'    ',
'    return validarExpresion(event, expresion);',
'};'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ocultarAyudaD();',
'apex.jQuery(apex.gPageContext$).on("apexreadyend", async function (e) {',
'if($v(''P138_RSPSTA'') == ''0'' )  {',
'    apex.item( "informacion_basica" ).hide();',
'}',
'if($v(''P138_RSPSTA'') == ''1'' || $v(''P200_RSPSTA'') == ''2''  ){',
'    apex.item( "informacion_basica" ).show();',
'}',
'',
'});',
''))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
'  }'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20250623180719'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10151609171323315)
,p_plug_name=>'Contrato Externo'
,p_region_name=>'region-flotante'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10250824502341518)
,p_plug_name=>'Tab Container'
,p_parent_plug_id=>wwv_flow_api.id(10151609171323315)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10151792594323316)
,p_plug_name=>'Contrato'
,p_parent_plug_id=>wwv_flow_api.id(10250824502341518)
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
 p_id=>wwv_flow_api.id(10153284790323331)
,p_plug_name=>'Sujeto Impuesto'
,p_parent_plug_id=>wwv_flow_api.id(10250824502341518)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76091780263885036)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>	'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76091871732885037)
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
unistr('    <p align="center"><b>Liquidaci\00F3n de Rentas Varias.</b> <br> <br> </p>'),
unistr('      Mediante esta opci\00F3n se permite realizar el proceso de liquidaci\00F3n de rentas<br><br>  </p>'),
unistr('      El proceso de liquidaci\00F3n de renta se compone de los siguientes pasos:'),
'      <li>Consulta del Sujeto Tributo (contribuyente).</li>',
unistr('      <li>Actos y/o Informaci\00F3n Adicional.</li>'),
'      <li>Datos de Base Gravable / Fecha de Vencimiento. </li>',
'      <li>Adjuntos.</li>',
unistr('      <li>Resumen y registro de liquidaci\00F3n. </li> <br><br>'),
'    ',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76091905513885038)
,p_plug_name=>unistr('Widzard Liquidaci\00F3n de Rentas')
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(164085715180707699)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(76379350032438234)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(164098974360707738)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76092263354885041)
,p_plug_name=>'Consulta de Sujeto'
,p_region_name=>'consulta_sujeto'
,p_parent_plug_id=>wwv_flow_api.id(76091905513885038)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76385610911575203)
,p_plug_name=>unistr('Informaci\00F3n')
,p_region_name=>'informacion_basica'
,p_parent_plug_id=>wwv_flow_api.id(76091905513885038)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P138_ID_SJTO_IMPSTO is not null or :P138_ID_SJTO is not null'
,p_attribute_01=>'P138_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76387278197575219)
,p_plug_name=>unistr('Informaci\00F3 Rentas')
,p_parent_plug_id=>wwv_flow_api.id(76091905513885038)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76092513369885044)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(76092263354885041)
,p_button_name=>'BTN_CONSULTAR'
,p_button_static_id=>'BTN_CONSULTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P138_ID_RNTA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76092677508885045)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(76092263354885041)
,p_button_name=>'BTN_CONSULTA_PARAMETROS'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Consulta x Par\00E1metros')
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=71000:3:&SESSION.::&DEBUG.:RP:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_VLDAR_CRTRA,P3_IMPSTO_SBMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO:&APP_ID.,&APP_PAGE_ID.,P138_ID_SJTO_IMPSTO,&P138_ID_IMPSTO.,N,&P138_ID_IMPSTO_SBMPSTO.,P138_ID_IMPSTO,P138_ID_IMPSTO_SBMPSTO'
,p_button_condition=>'P138_ID_RNTA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>9
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22129451800862501)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(76092263354885041)
,p_button_name=>'BTN_REGISTRARSE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'       Nuevo Sujeto          '
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:270:&SESSION.::&DEBUG.:RP,270:P270_ID_IMPSTO,P270_IDNTFCCION,P270_VLDR_RGSTRO:&P138_ID_IMPSTO.,&P138_IDNTFCCION.,RGSTRO'
,p_button_condition=>'P138_ID_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-user-plus'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10150965408323308)
,p_button_sequence=>180
,p_button_plug_id=>wwv_flow_api.id(76092263354885041)
,p_button_name=>'BTN_ACTUALIZAR_EMAIL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Actualizar E-Mail - Celular'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:2024003:&SESSION.::&DEBUG.:RP,2024003:P2024003_ID_IMPSTO,P2024003_IDNTFCCION,P2024003_BRANCH,P2024003_ID_SJTO_IMPSTO:&P138_ID_IMPSTO.,&P138_IDNTFCCION.,&APP_PAGE_ID.,&P138_ID_SJTO_IMPSTO.'
,p_button_condition=>'P138_ID_SJTO_IMPSTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10151392915323312)
,p_button_sequence=>190
,p_button_plug_id=>wwv_flow_api.id(76092263354885041)
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
 p_id=>wwv_flow_api.id(10154481125323343)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(10151609171323315)
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
 p_id=>wwv_flow_api.id(76092198372885040)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(76091905513885038)
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
 p_id=>wwv_flow_api.id(76092094887885039)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(76091905513885038)
,p_button_name=>'NEXT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(76386145489575208)
,p_branch_name=>unistr('Ir a la P\00E1gina 139 - Acto')
,p_branch_action=>'f?p=&APP_ID.:139:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(76092094887885039)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(77075245794293017)
,p_branch_name=>unistr('Ir a la P\00E1gina 89/136 - Informe de rentas')
,p_branch_action=>'P138_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(76092198372885040)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5065349620697101)
,p_name=>'P138_EXSTE_OTRO_IMPSTO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(76092263354885041)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5067503008697123)
,p_name=>'P138_INDCDOR_VLOR_AUX_LQDCION'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(76092263354885041)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5068798025697135)
,p_name=>'P138_LBEL_VLOR_AUX_LQDCION'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(76092263354885041)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5069654209697144)
,p_name=>'P138_INDCDOR_LQDA_MLTPLES_ACTOS'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(76387278197575219)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10150607866323305)
,p_name=>'P138_EMAIL'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(76092263354885041)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10150773880323306)
,p_name=>'P138_TLFNO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(76092263354885041)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10150847401323307)
,p_name=>'P138_ID_RNTA_CNTRTO_EXTRNO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(76092263354885041)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10151908712323318)
,p_name=>'P138_NMRO_CNTRTO_EXT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(10151792594323316)
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
 p_id=>wwv_flow_api.id(10152040875323319)
,p_name=>'P138_VLOR_CNTRTO_INCLYE_IVA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(10151792594323316)
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
 p_id=>wwv_flow_api.id(10152152951323320)
,p_name=>'P138_OBJTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(10151792594323316)
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
 p_id=>wwv_flow_api.id(10152240949323321)
,p_name=>'P138_DRCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(10151792594323316)
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
 p_id=>wwv_flow_api.id(10152365138323322)
,p_name=>'P138_FCHA_FIN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(10151792594323316)
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
 p_id=>wwv_flow_api.id(10152487223323323)
,p_name=>'P138_VLOR_IVA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(10151792594323316)
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
 p_id=>wwv_flow_api.id(10152511931323324)
,p_name=>'P138_NMBRE_DPNDNCIA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(10151792594323316)
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
 p_id=>wwv_flow_api.id(10152656265323325)
,p_name=>'P138_FCHA_FRMA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(10151792594323316)
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
 p_id=>wwv_flow_api.id(10152812133323327)
,p_name=>'P138_VLOR_CNTRTO_SIN_IVA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(10151792594323316)
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
 p_id=>wwv_flow_api.id(10152971400323328)
,p_name=>'P138_TPO_CNTRTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(10151792594323316)
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
 p_id=>wwv_flow_api.id(10153003413323329)
,p_name=>'P138_DSCRPCION_FRMA_PGO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(10151792594323316)
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
 p_id=>wwv_flow_api.id(10153119304323330)
,p_name=>'P138_ESTDO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(10151792594323316)
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
 p_id=>wwv_flow_api.id(10153350239323332)
,p_name=>'P138_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(10153284790323331)
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
 p_id=>wwv_flow_api.id(10153471948323333)
,p_name=>'P138_TLFNO_EXT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(10153284790323331)
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
 p_id=>wwv_flow_api.id(10153585077323334)
,p_name=>'P138_NMBRE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(10153284790323331)
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
 p_id=>wwv_flow_api.id(10153656590323335)
,p_name=>'P138_TPO_RGMEN'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(10153284790323331)
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
 p_id=>wwv_flow_api.id(10153761894323336)
,p_name=>'P138_NMRO_IDNTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(10153284790323331)
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
 p_id=>wwv_flow_api.id(10153882086323337)
,p_name=>'P138_DRCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(10153284790323331)
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
 p_id=>wwv_flow_api.id(10153922899323338)
,p_name=>'P138_NMBRE_DPRTMNTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(10153284790323331)
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
 p_id=>wwv_flow_api.id(10154142295323340)
,p_name=>'P138_CORREO_EXT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(10153284790323331)
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
 p_id=>wwv_flow_api.id(10154245277323341)
,p_name=>'P138_NMBRE_MNCPIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(10153284790323331)
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
 p_id=>wwv_flow_api.id(10154330227323342)
,p_name=>'P138_TPO_PRSNA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(10153284790323331)
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
 p_id=>wwv_flow_api.id(10154745737323346)
,p_name=>'P138_DRCION_DIAS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(10151792594323316)
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
 p_id=>wwv_flow_api.id(10154804170323347)
,p_name=>'P138_FCHA_INCIO_CNTRTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(10151792594323316)
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
 p_id=>wwv_flow_api.id(10154982178323348)
,p_name=>'P138_RSPNSBLE_DE_IVA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(10153284790323331)
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
 p_id=>wwv_flow_api.id(10155038962323349)
,p_name=>'P138_CNSCTVO_RP'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(10151792594323316)
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
 p_id=>wwv_flow_api.id(10155168254323350)
,p_name=>'P138_FCHA_RP'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(10151792594323316)
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
 p_id=>wwv_flow_api.id(11867305211348704)
,p_name=>'P138_INDCDOR_MNJA_SCRSAL'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(76387278197575219)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11867538076348706)
,p_name=>'P138_ID_SJTO_SCRSAL'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(76092263354885041)
,p_prompt=>'Sucursal'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre, id_sjto_scrsal',
'from si_i_sujetos_sucursal',
'where id_sjto_impsto = :P138_ID_SJTO_IMPSTO',
'order by nmbre;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'P138_INDCDOR_MNJA_SCRSAL'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76092314917885042)
,p_name=>'P138_IDNTFCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(76092263354885041)
,p_prompt=>unistr('Identificaci\00F3n del Contribuyente')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return consultarSujeto(event,''letraNumero'');"   '
,p_display_when=>'P138_ID_RNTA'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el valor correspondiente al sujeto con el que se desea registrar la renta.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76092749878885046)
,p_name=>'P138_ID_SJTO_IMPSTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(76092263354885041)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76092872071885047)
,p_name=>'P138_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(76092263354885041)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione un Tributo-- '
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tributo correspondiente a la renta que desea registrar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76092929990885048)
,p_name=>'P138_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(76092263354885041)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ''['' || a.cdgo_impsto_sbmpsto || ''] '' || a.nmbre_impsto_sbmpsto',
'        , a.id_impsto_sbmpsto',
'     from df_i_impuestos_subimpuesto         a',
'    where  a.actvo = ''S'' and (',
'    (:P138_ID_ENTDAD_USRIO is not null and :P138_ID_ENTDAD is null and id_impsto_sbmpsto in (select p.id_impsto_sbmpsto ',
'                                                                                                  from df_i_grupos_acto_impsto_act   m ',
'                                                                                                  join df_c_grupos_acto_entidad      n on m.id_grpo_acto    = n.id_grpo_acto',
'                                                                                                  join v_sg_g_usuarios               o on n.id_entdad        = o.id_entdad',
'                                                                                                  join df_i_impuestos_acto           p on m.id_impsto_acto   = p.id_impsto_acto',
'                                                                                                 where o.id_usrio                    = :F_ID_USRIO)',
'          )',
'          ',
'     or (:P138_ID_ENTDAD_USRIO is null and :P138_ID_ENTDAD is not null and id_impsto_sbmpsto in (select c.id_impsto_sbmpsto',
'                                                                                                from df_c_grupos_acto_entidad  a',
'                                                                                                join df_i_grupos_acto_impsto_act  b on a.id_grpo_acto     = b.id_grpo_acto',
'                                                                                                join df_i_impuestos_acto          c on b.id_impsto_acto   = c.id_impsto_acto',
'                                                                                               where a.id_entdad                  = :P138_ID_ENTDAD )',
'        )   ',
'   ',
'    or (:P138_ID_ENTDAD_USRIO is null and :P138_ID_ENTDAD is null and a.id_impsto_sbmpsto in (select id_impsto_sbmpsto',
'                                                                                          from table (pkg_sg_autorizacion.fnc_sub_impuestos_x_usuario(p_cdgo_clnte => :F_CDGO_CLNTE,',
'                                                                                                                                                      p_id_usrio   => :F_ID_USRIO)                                                                        '
||'                             )',
'                                                                                                where id_impsto                     = :P138_ID_IMPSTO',
'                                                                                              )',
'       ))',
' order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione un Sub-Tributo-- '
,p_lov_cascade_parent_items=>'P138_ID_IMPSTO'
,p_ajax_items_to_submit=>'P138_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el sub-tributo correspondiente a la renta que desea registrar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76385959445575206)
,p_name=>'P138_RSPSTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(76092263354885041)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76386083370575207)
,p_name=>'P138_ID_SJTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(76092263354885041)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76387313008575220)
,p_name=>'P138_VGNCIA_ACTUAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(76387278197575219)
,p_prompt=>'Vgncia Actual'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76387411245575221)
,p_name=>'P138_PRDO_ACTUAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(76387278197575219)
,p_prompt=>'Prdo Actual'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76540192105204518)
,p_name=>'P138_USA_INDCDOR_EXTRNJRO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(76387278197575219)
,p_prompt=>'Usa Indcdor Extrnjro'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76540261703204519)
,p_name=>'P138_USA_INDCDOR_MXTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(76387278197575219)
,p_prompt=>'Usa Indcdor Mxto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76540357138204520)
,p_name=>'P138_LBEL_FCHA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(76387278197575219)
,p_prompt=>'Lbel Fcha'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76757791650970040)
,p_name=>'P138_INDCDOR_RQRE_ADJNTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(76387278197575219)
,p_prompt=>'Indcdor Rqre Adjnto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76825876093950315)
,p_name=>'P138_INDCDOR_RQRE_AUTRZCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(76387278197575219)
,p_prompt=>'Indcdor Rqre Autrzcion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77075408224293019)
,p_name=>'P138_ID_RNTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(76387278197575219)
,p_prompt=>'Id Rnta'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77077802119293043)
,p_name=>'P138_BRANCH'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(76387278197575219)
,p_prompt=>'Branch'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77078029044293045)
,p_name=>'P138_ID_ENTDAD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(76092263354885041)
,p_prompt=>'Entidad Contratante'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rzon_scial || '' ['' || idntfccion || ''] ''  nmbre_rzon_scial',
'        , id_entdad',
'     from df_s_entidades',
'     where cdgo_entdad_tpo = ''EMN''',
' order by nmbre_rzon_scial;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when=>':P138_INDCDOR_RQRE_ENTDAD = ''S'' and :P138_ID_ENTDAD_USRIO is null'
,p_display_when_type=>'SQL_EXPRESSION'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79882749271484511)
,p_name=>'P138_NMRO_RNTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(76092263354885041)
,p_prompt=>unistr('N\00B0 Liquidaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P138_ID_RNTA'
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
 p_id=>wwv_flow_api.id(86460520441089002)
,p_name=>'P138_CDGO_RNTA_ESTDO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(76092263354885041)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92263724396839102)
,p_name=>'P138_INDCDOR_LQDCCION_ADCNAL'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(76387278197575219)
,p_prompt=>'Indcdor Lqdccion Adcnal'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92263864379839103)
,p_name=>'P138_INDCDOR_EXNCION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(76387278197575219)
,p_prompt=>'Indcdor Exncion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92263953162839104)
,p_name=>'P138_ID_IMPSTO_ACTO_EXNCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(76387278197575219)
,p_prompt=>'New'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94973057589449003)
,p_name=>'P138_INDCDOR_CNTRTO_GSLNA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(76387278197575219)
,p_prompt=>'Indcdor Cntrto Gslna'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100958172483432420)
,p_name=>'P138_ID_ENTDAD_USRIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(76092263354885041)
,p_prompt=>'Entidad Asociada al Usuario'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_ENTIDADES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_rzon_scial || '' ['' || idntfccion || ''] ''  nmbre_rzon_scial',
'        , id_entdad',
'     from df_s_entidades ',
' order by nmbre_rzon_scial;'))
,p_lov_display_null=>'YES'
,p_display_when=>':P138_INDCDOR_RQRE_ENTDAD = ''S'' and :P138_ID_ENTDAD_USRIO is not null'
,p_display_when_type=>'SQL_EXPRESSION'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100958354092432422)
,p_name=>'P138_INDCDOR_RQRE_ENTDAD'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(76387278197575219)
,p_prompt=>'Requiere Entidad'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102339461073460924)
,p_name=>'P138_INDCDOR_MNJA_CNTRTO_ESE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(76387278197575219)
,p_prompt=>'Indcdor Mnja Cntrto Ese'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(76387572272575222)
,p_computation_sequence=>20
,p_computation_item=>'P138_VGNCIA_ACTUAL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte => :F_CDGO_CLNTE, p_cdgo_dfncion_clnte_ctgria => ''GFN'', p_cdgo_dfncion_clnte => ''VAC'') vgncia_actual',
'     from dual; '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(76387626301575223)
,p_computation_sequence=>30
,p_computation_item=>'P138_PRDO_ACTUAL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte => :F_CDGO_CLNTE, p_cdgo_dfncion_clnte_ctgria => ''GFN'', p_cdgo_dfncion_clnte => ''PAC'') prdo_actual',
'     from dual'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(77078270842293047)
,p_computation_sequence=>40
,p_computation_item=>'P138_ID_ENTDAD_USRIO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id_entdad',
'     from v_sg_g_usuarios',
'    where id_usrio        = :F_ID_USRIO'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(11867461641348705)
,p_computation_sequence=>50
,p_computation_item=>'P138_INDCDOR_MNJA_SCRSAL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select  indcdor_mnja_scrsal',
'     from v_gi_d_rntas_cnfgrcion_sbmpst   ',
'     where cdgo_clnte                       = :F_CDGO_CLNTE',
'      and id_impsto_sbmpsto                 = :P138_ID_IMPSTO_SBMPSTO',
''))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(76386271152575209)
,p_validation_name=>'Sujeto Impuesto No nulo'
,p_validation_sequence=>10
,p_validation=>':P138_ID_SJTO_IMPSTO is not null or :P138_ID_SJTO is not null'
,p_validation_type=>'SQL_EXPRESSION'
,p_error_message=>'Por favor consulte un Sujeto Impuesto'
,p_validation_condition=>'BTN_CONSULTAR,NEXT'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(76092314917885042)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(100958211118432421)
,p_validation_name=>'Entidad no nula'
,p_validation_sequence=>20
,p_validation=>'P138_ID_ENTDAD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione una entidad'
,p_validation_condition=>':P138_INDCDOR_RQRE_ENTDAD = ''S'' and :P138_ID_ENTDAD_USRIO is null'
,p_validation_condition_type=>'SQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(76092094887885039)
,p_associated_item=>wwv_flow_api.id(77078029044293045)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(103393226934947803)
,p_validation_name=>'Sub-impuesto no nulo'
,p_validation_sequence=>30
,p_validation=>'P138_ID_IMPSTO_SBMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione un #LABEL#'
,p_when_button_pressed=>wwv_flow_api.id(76092094887885039)
,p_associated_item=>wwv_flow_api.id(76092929990885048)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(11867604841348707)
,p_validation_name=>'Sucrusal No nula'
,p_validation_sequence=>40
,p_validation=>'P138_ID_SJTO_SCRSAL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione una Sucursal'
,p_validation_condition=>':P138_INDCDOR_MNJA_SCRSAL = ''S'' AND :P138_ID_IMPSTO_SBMPSTO <> 23001163'
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(76092094887885039)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76093108747885050)
,p_name=>'Consulta de Sujeto Impuesto'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(76092513369885044)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76385431221575201)
,p_event_id=>wwv_flow_api.id(76093108747885050)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    v_id_sjto               si_c_sujetos.id_sjto%type;',
'    v_email                 v_si_i_sujetos_impuesto.email%type;',
'    v_tlfno                 v_si_i_sujetos_impuesto.tlfno%type;',
'    ',
'begin',
unistr('    -- Se consulta si la identificaci\00F3n consultada existe para el impuesto'),
'    begin ',
'        select a.id_sjto_impsto ',
'             , a.email',
'             , c.cllar',
'          into v_id_sjto_impsto',
'             , v_email   ',
'             , v_tlfno',
'          from v_si_i_sujetos_impuesto    a',
'          join si_i_personas              b on a.id_sjto_impsto    = b.id_sjto_impsto',
'          left join si_i_sujetos_responsable   c on a.id_sjto_impsto = c.id_sjto_impsto',
'              and prncpal_s_n             = ''S''',
'         where cdgo_clnte                 = :F_CDGO_CLNTE',
'           and id_impsto                  = :P138_ID_IMPSTO',
'           and a.idntfccion_sjto          = :P138_IDNTFCCION;',
'        ',
'        -- Si existe se retorna el id del sujeto impuesto',
'        apex_util.set_session_state(''P138_RSPSTA'', ''1'');',
'        apex_util.set_session_state(''P138_ID_SJTO_IMPSTO'', v_id_sjto_impsto);  ',
'        apex_util.set_session_state(''P138_EXSTE_OTRO_IMPSTO'', ''N'');',
'        apex_util.set_session_state(''P138_EMAIL'', v_email);',
'        apex_util.set_session_state(''P138_TLFNO'', v_tlfno);',
'',
'    exception',
'        when no_data_found then ',
unistr('            -- Si no existe como sujeto impuesto se consulta la identificaci\00F3n en sujeto para verificar si existe en otro impuesto '),
'            begin ',
'                select id_sjto ',
'                     , id_sjto_impsto',
'                  into v_id_sjto',
'                     , v_id_sjto_impsto',
'                  from v_si_i_sujetos_impuesto',
'                 where cdgo_clnte         = :F_CDGO_CLNTE',
'                   and idntfccion_sjto    = :P138_IDNTFCCION',
'                   and cdgo_sjto_tpo      = ''E''  -- Debe ser persona ',
'                   and rownum             = 1;',
unistr('                -- Si existe la identificaci\00F3n en sujeto se debe crear como sujeto impuesto para renta de manera automatica   '),
'                apex_util.set_session_state(''P138_RSPSTA'', ''2'');',
'                apex_util.set_session_state(''P138_ID_SJTO'', v_id_sjto);',
'                apex_util.set_session_state(''P138_ID_SJTO_IMPSTO'', v_id_sjto_impsto);',
'                apex_util.set_session_state(''P138_EXSTE_OTRO_IMPSTO'',''S'');',
'                    ',
'            exception',
'                when others then ',
unistr('                -- Si No existe la identificaci\00F3n en sujeto se debe solicitar la informaci\00F3n para crearlo como sujeto impuesto'),
'                    :P138_RSPSTA                := ''0'';',
'                    :P138_ID_SJTO_IMPSTO        := null;',
'                    apex_util.set_session_state(''P138_RSPSTA'', ''0'');',
'                    apex_util.set_session_state(''P138_ID_SJTO_IMPSTO'', null);',
'                    apex_util.set_session_state(''P138_EXSTE_OTRO_IMPSTO'', ''N'');',
'           end;',
'',
'        when others then ',
'            apex_util.set_session_state(''P138_RSPSTA'', ''0'');',
'            apex_util.set_session_state(''P138_ID_SJTO_IMPSTO'', null);',
'            apex_util.set_session_state(''P138_EXSTE_OTRO_IMPSTO'', ''N'');',
'    end;',
'end;'))
,p_attribute_02=>'P138_ID_IMPSTO,P138_IDNTFCCION,P138_EMAIL,P138_TLFNO'
,p_attribute_03=>'P138_ID_SJTO_IMPSTO,P138_RSPSTA,P138_ID_SJTO,P138_EXSTE_OTRO_IMPSTO,P138_EMAIL,P138_TLFNO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76385812616575205)
,p_event_id=>wwv_flow_api.id(76093108747885050)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P138_RSPSTA'') == ''1'' ){',
'    // Si existe el sujeto impuesto',
'    //apex.submit();',
unistr('    var v_mnsje = ''<h3>Su correo electr\00F3nico registrado es: ''+apex.item("P138_EMAIL").getValue()+''<br> Su celular es: ''+apex.item("P138_TLFNO").getValue()+'', si los datos no corresponden, debe actualizarlo en el bot\00F3n "Actualizar E-Mail - Tel\00E9fono" p')
||unistr('ara realizar su liquidaci\00F3n.</h3>'';'),
'',
'    Swal.fire({',
'         icon: ''information'',',
'         title:  ''<H2 >RENTAS VARIAS</H2>'',',
'         html: v_mnsje ',
'        }).then((result) => {',
'         apex.submit();',
'     });',
'}',
'else if  ($v(''P138_RSPSTA'') == ''0'' ){',
'    // No existe el sujeto impuesto',
'     apex.submit();',
'    Swal.fire({',
'        icon: ''error'',',
'        title:  ''<H2 >RENTAS VARIAS</H2>'',',
'        html: ''<H4>El Sujeto Tributo ingresado NO existe.</H4>''        ',
'    //    apex.item(''BTN_REGISTRARSE'').show();',
'    });',
unistr('    // Se ocultan las regiones de informaci\00F3n b\00E1sica'),
'   ',
'}',
'else if  ($v(''P138_RSPSTA'') == ''2'' ){',
'    // No existe el sujeto impuesto pero si el sujeto impuesto ',
'    apex.submit();',
'}',
'',
'',
';',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6212374630084404)
,p_name=>'Al cambiar el subimpuesto'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P138_ID_IMPSTO_SBMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6212406433084405)
,p_event_id=>wwv_flow_api.id(6212374630084404)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11889268515635206)
,p_event_id=>wwv_flow_api.id(6212374630084404)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P138_ID_SJTO_SCRSAL'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'NULL'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10151097206323309)
,p_name=>unistr('Validaci\00F3n de Correo Contribuyente  ')
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(76092094887885039)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10151181946323310)
,p_event_id=>wwv_flow_api.id(10151097206323309)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var email = $v(''P138_EMAIL'');',
'var telefono = $v(''P138_TLFNO'');',
'',
'if ( email === null || email.trim() === '''' ||  telefono === null || telefono.trim() === ''''){',
unistr('    var v_mensaje = ''<h3> Sr. Contribuyente, correo electr\00F3nico y celular son obligatorios. Para continuar con el proceso, debe ingresar a la opci\00F3n: <br> "Actualizar E-Mail - Celular" <br> y diligenciar los datos </h3>'';'),
'',
'    Swal.fire({',
'        icon: ''information'',',
'        title: ''<h2>RENTAS VARIAS</h2>'',',
'        html: v_mensaje,',
'        confirmButtonText: ''Aceptar''',
'    });',
'    ',
'    // Evitar que se haga el submit del formulario',
'    return false;',
'} else {',
unistr('    // Hacer submit con el nombre del bot\00F3n asociado al branch (NEXT en este caso)'),
'    apex.submit(''NEXT'');',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5070017766697148)
,p_event_id=>wwv_flow_api.id(10151097206323309)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P139_ID_IMPSTO_ACTO,P139_ACTOS_SLCCNDOS,P139_FCHA_EXPDCION,P141_LBEL_BSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10151473936323313)
,p_name=>'Al dar click Boton BTN_CNTRTO_EXTRNO'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10151392915323312)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10151599710323314)
,p_event_id=>wwv_flow_api.id(10151473936323313)
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
 p_id=>wwv_flow_api.id(10154582746323344)
,p_name=>'Al dar click BTN_CERRAR'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10154481125323343)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10154633948323345)
,p_event_id=>wwv_flow_api.id(10154582746323344)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#region-flotante").removeClass("visible");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76539575280204512)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar impuesto / Sub impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_impsto            number;',
'    v_id_impsto_sbmpsto    number;',
'    v_id_entdad            number;',
'    ',
'begin',
'    -- Se consulta el id del impuesto de rentas para el cliente',
'    select id_impsto',
'      into v_id_impsto',
'      from gi_d_rentas_configuracion',
'    where cdgo_clnte        = :F_CDGO_CLNTE;',
'    ',
'    :P138_ID_IMPSTO           := v_id_impsto;',
'    ',
'    -- Se consulta si el usuario logeado tiene una entidad asociada',
'    begin ',
'       select b.id_entdad',
'         into v_id_entdad',
'         from v_sg_g_usuarios       a',
'         join df_c_funcionarios     b on a.id_fncnrio   = b.id_fncnrio',
'        where a.cdgo_clnte          = :F_CDGO_CLNTE',
'          and a.id_usrio            = :F_ID_USRIO;',
'    exception',
'        when others then ',
'               v_id_entdad    := null;',
'    end;        ',
'    :P138_ID_ENTDAD_USRIO       := v_id_entdad;',
'    ',
'    if v_id_entdad is not null and :P138_ID_IMPSTO_SBMPSTO is null then',
'        begin ',
'            select min(c.id_impsto_sbmpsto) ',
'              into v_id_impsto_sbmpsto',
'              from df_c_grupos_acto_entidad      a',
'              join df_i_grupos_acto_impsto_act   b on a.id_grpo_acto = b.id_grpo_acto',
'              join v_df_i_impuestos_acto         c on b.id_impsto_acto   = c.id_impsto_acto',
'             where id_entdad                     = v_id_entdad;',
'        exception',
'            when others then ',
'                v_id_impsto_sbmpsto    := null;',
'        end;',
'        :P138_ID_IMPSTO_SBMPSTO       := v_id_impsto_sbmpsto;',
'        ',
'        begin',
'            select a.indcdor_rqre_adjnto',
'                 , a.indcdor_rqre_autrzcion',
'                 , a.indcdor_lqda_mltples_actos',
'             into :P138_INDCDOR_RQRE_ADJNTO',
'                , :P138_INDCDOR_RQRE_AUTRZCION',
'                , :P138_INDCDOR_LQDA_MLTPLES_ACTOS',
'             from df_i_impuestos_subimpuesto    a',
'            where a.id_impsto_sbmpsto           = v_id_impsto_sbmpsto;',
'          exception',
'             when others then ',
'                 :P138_INDCDOR_RQRE_ADJNTO       :=  ''N'';',
'                 :P138_INDCDOR_RQRE_AUTRZCION    :=  ''N'';',
'                 :P138_INDCDOR_LQDA_MLTPLES_ACTOS := ''N'';',
'         end;',
'    end if;    ',
'     ',
'exception ',
'    when others then ',
'        :P138_ID_IMPSTO                := null;',
'        :P138_ID_IMPSTO_SBMPSTO        := null;',
'        :P138_INDCDOR_RQRE_ADJNTO      := ''N'';',
'        :P138_INDCDOR_RQRE_AUTRZCION   := ''N'';',
'        :P138_INDCDOR_LQDA_MLTPLES_ACTOS := ''N'';',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P138_ID_RNTA is null'
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(77075566040293020)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Informaci\00F3n de Rentas ')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    select a.id_rnta',
'         , a.nmro_rnta',
'         , a.id_impsto',
'         , a.id_impsto_sbmpsto',
'         , a.id_sjto_impsto',
'         , a.id_sbmpsto_ascda',
'         , a.txto_ascda',
'         , a.indcdor_usa_extrnjro',
'         , a.indcdor_usa_mxto',
'         , a.indcdor_cntrto_gslna',
'         , a.indcdor_exncion',
'         , a.fcha_expdcion',
'         , trunc(a.fcha_vncmnto)',
'         , trim(to_char(a.vlor_bse_grvble, ''999G999G999G999G999G999G990D99'')) -- a.vlor_bse_grvble',
'         , case',
'             when a.id_rnta_antrior is null then ',
'                 ''N''',
'             else',
'                 ''S''',
'            end as indcdor_lqdcion_adcnal',
'         , ''[{"ID_RNTA":"'' || a.id_rnta_antrior|| ''"}]''',
'         , a.cdgo_rnta_estdo',
' 	     , a.indcdor_cntrto_ese',
'         ,  trim(to_char(a.vlor_cntrto_ese, ''999G999G999G999G999G999G990D99'')) vlor_cntrto_ese',
'         , id_entdad',
'	    into :P138_ID_RNTA',
'        , :P138_NMRO_RNTA',
'        , :P138_ID_IMPSTO',
'        , :P138_ID_IMPSTO_SBMPSTO',
'        , :P138_ID_SJTO_IMPSTO',
'        , :P139_ID_IMPSTO_ASCDA',
'        , :P139_TXTO_ASCDA',
'        , :P139_INDCDOR_USA_EXTRNJRO',
'        , :P139_INDCDOR_USA_MXTO',
'        , :P139_INDCDOR_CNTRTO_GSLNA',
'        , :P141_INDCDOR_EXNCION',
'        , :P139_FCHA_EXPDCION',
'        , :P141_FCHA_VNCMNTO',
'        , :P141_VLOR_BSE_GRVBLE',
'        , :P141_INDCDOR_LDCCION_ADCNAL',
'        , :P141_ID_RNTA_ANTRIOR',
'        , :P138_CDGO_RNTA_ESTDO',
'        , :P139_INDCDOR_MNJA_CNTRTO_ESE',
'        , :P141_VLOR_CNTRTO_ESE',
'        , :P138_ID_ENTDAD',
'     from v_gi_g_rentas          a',
'    where a.id_rnta            = :P138_ID_RNTA;',
'    ',
'    ',
'    select id_impsto_acto',
'      into :P139_ID_IMPSTO_ACTO',
'      from gi_g_rentas_acto',
'     where id_rnta            = :P138_ID_RNTA;',
'     ',
'    apex_collection.create_or_truncate_collection( p_collection_name => ''ADJUNTOS_RENTA'');',
'        ',
'    for c_adjntos in (select * from gi_g_rentas_adjnto where id_rnta = :P138_ID_RNTA) loop',
'        apex_collection.add_member( p_collection_name   => ''ADJUNTOS_RENTA''',
'                                  , p_n001              => c_adjntos.id_sbmpto_adjnto_tpo ',
'                                  , p_c001              => c_adjntos.obsrvcion',
'                                  , p_c002              => c_adjntos.file_name',
'                                  , p_c003              => c_adjntos.file_mimetype',
'                                  , p_blob001           => c_adjntos.file_blob',
'                                  );',
'    ',
'    end loop;',
'    ',
'    ',
'    select json_arrayagg( json_object(key ''ID_CNCPTO'' is id_cncpto))json_cncptos ',
'      into :P141_CONCEPTOS_RENTA',
'      from (',
'       select c.id_cncpto',
'         from gi_g_rentas                   a',
'         join gi_g_rentas_acto              b on a.id_rnta      = b.id_rnta',
'         join v_gi_g_rentas_acto_concepto   c on b.id_rnta_acto = c.id_rnta_acto',
'        where a.id_rnta                     = :P138_ID_RNTA',
'       );',
'       ',
'        select  a.email',
'             , c.cllar',
'      into  :P138_EMAIL ',
'         , :P138_TLFNO',
'      from v_si_i_sujetos_impuesto         a',
'      join si_i_personas                   b on a.id_sjto_impsto = b.id_sjto_impsto',
'      left join si_i_sujetos_responsable   c on a.id_sjto_impsto = c.id_sjto_impsto',
'      and prncpal_s_n                         = ''S''',
'     where cdgo_clnte                   = :F_CDGO_CLNTE',
'       and a.id_sjto_impsto             = :P138_ID_SJTO_IMPSTO;',
'       ',
'exception',
'    when others then ',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P138_ID_RNTA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76540032385204517)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta Configuraci\00F3n de Rentas')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select indcdor_usa_extrnjro',
'         , indcdor_usa_mxto',
unistr('         , initcap(nvl(lbel_fcha_expdcion, ''Expedici\00F3n''))'),
'     into :P138_USA_INDCDOR_EXTRNJRO',
'        , :P138_USA_INDCDOR_MXTO',
'        , :P138_LBEL_FCHA',
'     from gi_d_rentas_configuracion',
'    where cdgo_clnte = :F_CDGO_CLNTE;',
'    ',
'    select a.indcdor_rqre_adjnto',
'         , a.indcdor_rqre_autrzcion',
'         , a.indcdor_lqda_mltples_actos',
'      into :P138_INDCDOR_RQRE_ADJNTO',
'         , :P138_INDCDOR_RQRE_AUTRZCION',
'         , :P138_INDCDOR_LQDA_MLTPLES_ACTOS',
'      from df_i_impuestos_subimpuesto    a',
'     where a.id_impsto_sbmpsto           = :P138_ID_IMPSTO_SBMPSTO;',
'exception',
'    when others then',
'        :P93_INDCDOR_EXTRNJRO        := ''N'';',
'        :P93_INDCDOR_MXTO            := ''N'';',
unistr('        :P93_LBEL_FCHA               := ''Expedici\00F3n'';'),
'        :P138_INDCDOR_RQRE_ADJNTO    := ''N'';',
'        :P138_INDCDOR_RQRE_AUTRZCION := ''N'';',
'        :P138_INDCDOR_LQDA_MLTPLES_ACTOS := ''N'';',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92263600741839101)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta Configuraci\00F3n de Subimpuesto')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('	-- Consulta configuraci\00F3n del sub-impuesto'),
'	begin ',
'		select a.indcdor_lqdccion_adcnal',
'			 , a.indcdor_exncion',
'			 , a.id_impsto_acto_exncion',
'			 , a.indcdor_rqre_entdad',
'			 , a.indcdor_cntrto_gslna',
'			 , a.indcdor_mnja_cntrto_ese',
'             , a.indcdor_vlor_aux_lqdcion',
'             , a.lbel_vlor_aux_lqdcion',
'		  into :P138_INDCDOR_LQDCCION_ADCNAL',
'			 , :P138_INDCDOR_EXNCION',
'			 , :P138_ID_IMPSTO_ACTO_EXNCION',
'			 , :P138_INDCDOR_RQRE_ENTDAD',
'			 , :P138_INDCDOR_CNTRTO_GSLNA',
'			 , :P138_INDCDOR_MNJA_CNTRTO_ESE',
'             , :P138_INDCDOR_VLOR_AUX_LQDCION',
'             , :P138_LBEL_VLOR_AUX_LQDCION',
'		  from v_gi_d_rntas_cnfgrcion_sbmpst    a',
'		 where cdgo_clnte						= :F_CDGO_CLNTE',
'		   and id_impsto						= :P138_ID_IMPSTO',
'		   and id_impsto_sbmpsto				= :P138_ID_IMPSTO_SBMPSTO;',
'	exception',
'		when no_data_found then',
'			:P138_INDCDOR_LQDCCION_ADCNAL    := ''N'';',
'			:P138_INDCDOR_EXNCION            := ''N'';',
'			:P138_ID_IMPSTO_ACTO_EXNCION     := null;',
'			:P138_INDCDOR_RQRE_ENTDAD        := ''N'';',
'			:P138_INDCDOR_VLOR_AUX_LQDCION   := ''N''; ',
'            :P138_LBEL_VLOR_AUX_LQDCION      := null;  ',
unistr('			-- Consulta Configuraci\00F3n del cliente'),
'			begin',
'			   select a.indcdor_mnja_cntrto_ese',
'					, a.indcdor_mnja_cntrto_ese',
'				 into :P138_INDCDOR_CNTRTO_GSLNA',
'					, :P138_INDCDOR_MNJA_CNTRTO_ESE',
'				 from gi_d_rentas_configuracion a',
'				where cdgo_clnte                = :F_CDGO_CLNTE;',
'			exception',
'				when others then',
'					:P138_INDCDOR_CNTRTO_GSLNA    	:= null;',
'					:P138_INDCDOR_MNJA_CNTRTO_ESE	:= ''N'';',
unistr('			end; -- Fin Consulta Configuraci\00F3n del cliente'),
'		when others then',
'			:P138_INDCDOR_LQDCCION_ADCNAL    := ''N'';',
'			:P138_INDCDOR_EXNCION            := ''N'';',
'			:P138_ID_IMPSTO_ACTO_EXNCION     := null;',
'			:P138_INDCDOR_RQRE_ENTDAD        := ''N'';',
'			:P138_INDCDOR_CNTRTO_GSLNA		 := null;',
'			:P138_INDCDOR_MNJA_CNTRTO_ESE	 := ''N'';',
unistr('	end; -- Fin Consulta configuraci\00F3n del sub-impuesto')))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P138_ID_IMPSTO_SBMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5107267797790008)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar coleccion CONCEPTO_SELECCIONADO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    APEX_COLLECTION.DELETE_COLLECTION(',
'        p_collection_name => ''CONCEPTO_SELECCIONADO'');',
'',
'exception',
'    when others then',
'        null;',
'End;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P138_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10151881480323317)
,p_process_sequence=>70
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
'                 :P138_NMRO_CNTRTO_EXT',
'                ,:P138_OBJTO',
'                ,:P138_FCHA_FRMA',
'                ,:P138_FCHA_INCIO_CNTRTO',
'                ,:P138_FCHA_FIN',
'                ,:P138_VLOR_CNTRTO_INCLYE_IVA',
'                ,:P138_VLOR_CNTRTO_SIN_IVA',
'                ,:P138_VLOR_IVA',
'                ,:P138_TPO_CNTRTO',
'                ,:P138_DRCION_DIAS',
'                ,:P138_DSCRPCION_FRMA_PGO',
'                ,:P138_DRCION ',
'                ,:P138_NMBRE_DPNDNCIA',
'                ,:P138_NMBRE ',
'                ,:P138_DRCCION',
'                ,:P138_TLFNO_EXT',
'                ,:P138_CORREO_EXT',
'                ,:P138_TPO_PRSNA',
'                ,:P138_CDGO_IDNTFCCION_TPO',
'                ,:P138_NMRO_IDNTFCCION',
'                ,:P138_NMBRE_DPRTMNTO',
'                ,:P138_NMBRE_MNCPIO',
'                ,:P138_TPO_RGMEN',
'                ,:P138_ESTDO',
'                ,:P138_RSPNSBLE_DE_IVA ',
'                ,:P138_CNSCTVO_RP        ',
'                ,:P138_FCHA_RP   ',
'        from gi_g_rentas_contrato_externo a',
'            where a.id_rnta_cntrto_extrno =  :P138_ID_RNTA_CNTRTO_EXTRNO;',
'exception',
'    when others then',
'        :P138_NMRO_CNTRTO_EXT				:= null;',
'        :P138_OBJTO                         := null;',
'        :P138_FCHA_FRMA                     := null;',
'        :P138_FCHA_FIN                      := null;',
'        :P138_FCHA_INCIO_CNTRTO             := null;',
'        :P138_VLOR_CNTRTO_INCLYE_IVA        := null;',
'        :P138_VLOR_CNTRTO_SIN_IVA           := null;',
'        :P138_VLOR_IVA                      := null;',
'        :P138_TPO_CNTRTO                    := null;',
'        :P138_DRCION_DIAS                   := null;',
'        :P138_DSCRPCION_FRMA_PGO            := null;',
'        :P138_DRCION                        := null;',
'        :P138_NMBRE_DPNDNCIA                := null;',
'        :P138_NMBRE                         := null;',
'        :P138_DRCCION                       := null;',
'        :P138_TLFNO_EXT                     := null;',
'        :P138_CORREO_EXT                    := null;',
'        :P138_TPO_PRSNA                     := null;',
'        :P138_CDGO_IDNTFCCION_TPO           := null;',
'        :P138_NMRO_IDNTFCCION               := null;',
'        :P138_NMBRE_DPRTMNTO                := null;',
'        :P138_NMBRE_MNCPIO                  := null;',
'        :P138_TPO_RGMEN                     := null;',
'        :P138_ESTDO                         := null; ',
'        :P138_RSPNSBLE_DE_IVA               := null; ',
'        :P138_CNSCTVO_RP                    := null; ',
'        :P138_FCHA_RP                       := null; ',
'end;',
'',
' '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P138_ID_RNTA_CNTRTO_EXTRNO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
