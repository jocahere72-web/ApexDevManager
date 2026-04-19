prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'Consulta General'
,p_step_title=>'Consulta General'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/leaflet@1.9.2/dist/leaflet.js?v=202511181635',
''))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function irAPagina(idOpcion){',
'    var url = ''f?p=#APP_ID#:3:#SESSION#::NO:RP,3:P3_ID_SJTO_IMPSTO:#P_ITEM#'';',
'',
'    url = url.replace(''#APP_ID#'', $v(''pFlowId''));',
'    url = url.replace(''#SESSION#'', $v(''pInstance''));',
'    url = url.replace(''#P_ITEM#'', $v(''P2_ID_SJTO_IMPSTO''));',
'    var myWindow = window.open(url, "", "width=1024,height=600");',
'}',
'',
'',
''))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/leaflet@1.9.2/dist/leaflet.css?v=202511181635',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.BTN-CONSULTAR{',
'    margin-top: 7px;',
'}',
'',
'.t-MediaList--cols.t-MediaList--4cols .t-MediaList-item {',
'    width: 24%;',
'}',
'',
'.t-MediaList--cols .t-MediaList-item {',
'    border-radius: 19px;',
'    border-color: inherit;',
'    position: relative;',
'    border-style: solid;',
'    border-width: 0.5px 0.5px 0.5px 0;',
'    -webkit-box-shadow: 4px 3px 33px -16px rgba(89, 89, 89, 0.58);',
'    -moz-box-shadow: 4px 3px 33px -16px rgba(89,89,89,1);',
'    box-shadow: 0px 0px 30px -16px rgba(89, 89, 89, 0.35);',
'    margin: 5px;',
'    border-color: #efefef;',
'}',
'',
'',
'#mapaLeaflet {',
'    height: 420px !important;',
'}'))
,p_step_template=>wwv_flow_api.id(52096727161074788)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251121172110'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5805785013215027)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(52129532999074802)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
'<br>',
'<i><p>Funcionalidad que permite realizar una consulta general asociada a un Sujeto Tributo.</p> ',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dirijase al Manual de Usuario.</p>'),
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23396766047655705)
,p_plug_name=>unistr('B\00FAsqueda Sujeto Tributo')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(52118495675074798)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23396864918655706)
,p_plug_name=>'Opciones Right'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(52129532999074802)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Opciones <i class="fa fa-gear" aria-hidden="true"></i></center></b></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(23396934946655707)
,p_name=>'Impuestos'
,p_template=>wwv_flow_api.id(52129532999074802)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'t-MediaList--showIcons:u-colors:t-MediaList--cols t-MediaList--4cols:t-MediaList--large force-fa-lg:t-Report--hideNoPagination'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_sjto_impsto, ',
'        id_impsto, ',
'        id_sjto, ',
'        nmbre_impsto as LIST_TITLE,',
'        null as LIST_BADGE,',
'        apex_util.prepare_url(''f?p=''||:APP_ID||'':2:''||:APP_SESSION||''::NO::P2_ID_SJTO_IMPSTO:''||id_sjto_impsto) LINK,',
'        ''fa ''||icno ICON_CLASS,',
'        ''u-color-''|| ( ora_hash(nmbre_impsto,45) + 1 ) ICON_COLOR_CLASS',
'from v_si_i_sujetos_impuesto',
'where cdgo_clnte      = :F_CDGO_CLNTE and',
'     (idntfccion_sjto = nvl(:P2_IDNTFCCION, idntfccion_sjto) or ',
'      mtrcla_inmblria = nvl(:P2_IDNTFCCION, mtrcla_inmblria)) and',
'      id_sjto_impsto  = nvl(:P2_ID_SJTO_IMPSTO, id_sjto_impsto);'))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(:P2_ID_SJTO_IMPSTO is null and :P2_IDNTFCCION is not null)or',
'(:P2_IDNTFCCION is not null and :P2_ID_SJTO_IMPSTO is null)'))
,p_display_condition_type=>'SQL_EXPRESSION'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(52151066011074814)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>unistr('<center><h5>No hay registros disponibles para la identificaci\00F3n digitada, por favor verifique</h5></center>')
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23397053622655708)
,p_query_column_id=>1
,p_column_alias=>'ID_SJTO_IMPSTO'
,p_column_display_sequence=>1
,p_column_heading=>'Id Sjto Impsto'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23397144344655709)
,p_query_column_id=>2
,p_column_alias=>'ID_IMPSTO'
,p_column_display_sequence=>2
,p_column_heading=>'Id Impsto'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23397270013655710)
,p_query_column_id=>3
,p_column_alias=>'ID_SJTO'
,p_column_display_sequence=>3
,p_column_heading=>'Id Sjto'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23397428827655712)
,p_query_column_id=>4
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>4
,p_column_heading=>'List Title'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23397598751655713)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>5
,p_column_heading=>'List Badge'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23397784934655715)
,p_query_column_id=>6
,p_column_alias=>'LINK'
,p_column_display_sequence=>6
,p_column_heading=>'Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23398242122655720)
,p_query_column_id=>7
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>7
,p_column_heading=>'Icon Class'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23398439685655722)
,p_query_column_id=>8
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>8
,p_column_heading=>'Icon Color Class'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23398686801655724)
,p_plug_name=>'Sujeto Tributo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(52129532999074802)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P2_ID_SJTO_IMPSTO'
,p_attribute_01=>'P2_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(23399187804655729)
,p_name=>'Opciones'
,p_template=>wwv_flow_api.id(52129532999074802)
,p_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'t-MediaList--showIcons:u-colors:t-MediaList--cols t-MediaList--4cols:t-MediaList--large force-fa-lg:t-Report--hideNoPagination'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select dscrpcion                                   LIST_TITLE,',
'       ''fa ''||icno                                 ICON_CLASS,',
'       ''u-color-''|| ( ora_hash(dscrpcion,45) + 1 ) ICON_COLOR_CLASS,',
'       prepare_url_popup(p_app_id => :APP_ID, ',
'                         p_app_page_id => page, ',
'                         p_id => id_opcion, ',
'                         p_items => ''P''||page||''_ID_SJTO_IMPSTO,P''||page||''_DSCRPCION,P''||page||''_ICNO'',',
'                         p_values => :P2_ID_SJTO_IMPSTO||'',''||dscrpcion||'',''||icno, ',
'                         p_options => ''name:"''||dscrpcion||''", width:1100, height:500'') LINK',
'from cg_opciones',
'where actvo = ''S''',
'order by orden asc',
'*/',
'select dscrpcion                                   LIST_TITLE,',
'       ''fa ''||icno                                 ICON_CLASS,',
'       ''u-color-''|| ( ora_hash(dscrpcion,45) + 1 ) ICON_COLOR_CLASS',
'           ,APEX_UTIL.PREPARE_URL(',
'							p_url => ''f?p='' || :APP_ID || '':''||page||'':''||:app_session||''::NO::''|| ''P''||page||''_ID_SJTO_IMPSTO,P''||page||''_DSCRPCION,P''||page||''_ICNO''||'':''||:P2_ID_SJTO_IMPSTO||'',''||dscrpcion||'',''||icno ',
'							) LINK',
'from cg_opciones',
'where actvo = ''S''',
'order by orden asc;'))
,p_display_when_condition=>'P2_ID_SJTO_IMPSTO'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(52151066011074814)
,p_query_num_rows=>20
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23399695286655734)
,p_query_column_id=>1
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'List Title'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23399793882655735)
,p_query_column_id=>2
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>2
,p_column_heading=>'Icon Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(23399828830655736)
,p_query_column_id=>3
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>3
,p_column_heading=>'Icon Color Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(24207431184799445)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>4
,p_column_heading=>'Link'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23397859821655716)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(23396864918655706)
,p_button_name=>'BTN_NUEVA_CONSULTA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(52181736486074832)
,p_button_image_alt=>'Nueva Consulta'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9270998483364523)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(23396864918655706)
,p_button_name=>'BTN_SUCURSALES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(52181736486074832)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sucursales'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.:RP,35:P35_ID_SJTO_IMPSTO:&P2_ID_SJTO_IMPSTO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from   si_i_sujetos_sucursal',
'where id_sjto_impsto = :P2_ID_SJTO_IMPSTO;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-network-hub'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(137007691364739438)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(23396864918655706)
,p_button_name=>'BTN_CNSLTA_RUES'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(52181736486074832)
,p_button_image_alt=>'Consulta Rues'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=69000:9998:&SESSION.::&DEBUG.:RP:P9998_IDNTFCCION,P9998_NMRO_APP,P9998_NMRO_PGNA:&P2_IDNTFCCION.,&APP_ID.,&APP_PAGE_ID.'
,p_button_condition=>':P2_ID_SJTO_IMPSTO is not null and :P2_CDGO_SJTO_TPO = ''E'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-cloud-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(11763325475565328)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(23396864918655706)
,p_button_name=>'BTN_UBICACION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(52181736486074832)
,p_button_image_alt=>unistr('Ubicaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:2025005:&SESSION.::&DEBUG.:RP,2025005:P2025005_ID_SJTO_IMPSTO:&P2_ID_SJTO_IMPSTO.'
,p_button_condition=>':P2_CDGO_SJTO_TPO = ''P'' and :P2_EXSTEN_CRDNDAS = ''S'''
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-solid fa-map-pin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23580819527693204)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(23396766047655705)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(52181736486074832)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_button_css_classes=>'BTN-CONSULTAR'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>6
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23581277238693205)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(23396766047655705)
,p_button_name=>'BTN_CONSULTA_PARAMETROS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(52181736486074832)
,p_button_image_alt=>unistr('Consulta Par\00E1metros')
,p_button_position=>'BODY'
,p_button_css_classes=>'BTN-CONSULTAR'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>8
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(23598303053703974)
,p_branch_name=>'Ir a Busqueda Sujeto Impuesto'
,p_branch_action=>'f?p=71000:3:&SESSION.::&DEBUG.:RP:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO:&APP_ID.,&APP_PAGE_ID.,P2_ID_SJTO_IMPSTO,&P2_ID_IMPSTO.,P2_ID_IMPSTO,&P2_ID_IMPSTO_SBMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(23581277238693205)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15803446104925920)
,p_name=>'P2_EXSTEN_CRDNDAS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(23396766047655705)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15803512764925921)
,p_name=>'P2_CDGO_SJTO_TPO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(23396766047655705)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23398793190655725)
,p_name=>'P2_NMBRE_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(23398686801655724)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P2_ID_SJTO_IMPSTO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(52181048495074831)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23582807062693206)
,p_name=>'P2_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(23396766047655705)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23583258508693206)
,p_name=>'P2_IDNTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(23396766047655705)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>5
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(52181001212074831)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48804961553045427)
,p_name=>'P2_ID_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(23396766047655705)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48805068690045428)
,p_name=>'P2_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(23396766047655705)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(15803625582925922)
,p_computation_sequence=>10
,p_computation_item=>'P2_EXSTEN_CRDNDAS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'SELECT ''N'' FROM DUAL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(15801862682925904)
,p_name=>'page load prueba'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23398836949655726)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Recuperacion automatica de filas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select nmbre_impsto, idntfccion_sjto, cdgo_sjto_tpo',
'    into :P2_NMBRE_IMPSTO, :P2_IDNTFCCION, :P2_CDGO_SJTO_TPO',
'    from v_si_i_sujetos_impuesto',
'    where id_sjto_impsto = :P2_ID_SJTO_IMPSTO;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P2_ID_SJTO_IMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15803336613925919)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar existen coordenadas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ''S''',
'into :P2_EXSTEN_CRDNDAS',
'from si_i_predios   ',
'where  id_sjto_impsto = :P2_ID_SJTO_IMPSTO',
'and lttud  is not null ',
'and lngtud is not null ;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P2_CDGO_SJTO_TPO'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'P'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23397968284655717)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Borrar Estado de Sesion'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(23397859821655716)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23398912848655727)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Borrar Estado de Sesion Sujeto Impuesto'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P2_ID_SJTO_IMPSTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P2_IDNTFCCION,BTN_CONSULTAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
