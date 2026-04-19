prompt --application/pages/page_00272
begin
wwv_flow_api.create_page(
 p_id=>272
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Paz y Salvo por Tributo'
,p_step_title=>'Paz y Salvo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'String.prototype.initCap = function () {',
unistr('   return this.toLowerCase().replace(/(?:^|\005Cs)[a-z\00E1\00E9\00ED\00FA\00F3]/g, function (m) {'),
'      return m.toUpperCase();',
'   });',
'};'))
,p_javascript_code_onload=>'ocultarAyudaD();'
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
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(177374633629050691)
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20230330145928'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(117991384040149241)
,p_plug_name=>unistr('Par\00E1metros')
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(117994965594149277)
,p_plug_name=>unistr('Par\00E1metros')
,p_parent_plug_id=>wwv_flow_api.id(117991384040149241)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(118760396589511739)
,p_plug_name=>'Estado de Cuenta'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with responsable as',
' (select b.id_sjto_impsto,',
'         b.prmer_nmbre || '' '' || b.sgndo_nmbre || '' '' || b.prmer_aplldo || '' '' ||',
'         b.sgndo_aplldo as rspnsble,',
'         b.idntfccion idntfccion_rspnsble,',
'         ''R'' cdgo_sjto_tpo',
'    from si_i_sujetos_responsable b',
'    join v_si_i_sujetos_impuesto e',
'      on e.id_sjto_impsto = b.id_sjto_impsto',
'   where b.prncpal_s_n = ''S''',
'     and b.actvo = ''S''',
'  union',
'  select d.id_sjto_impsto, d.nmbre_rzon_scial, f.idntfccion_sjto, ''P''',
'    from si_i_personas d',
'    join v_si_i_sujetos_impuesto f',
'      on f.id_sjto_impsto = d.id_sjto_impsto)',
'select g.idntfccion_rspnsble,',
'       g.rspnsble,',
'       a.idntfccion_sjto,',
'       a.idntfccion_antrior,',
'       a.id_sjto_impsto,',
'       a.drccion',
'  from v_si_i_sujetos_impuesto a',
'  join df_i_impuestos_subimpuesto c',
'    on a.id_impsto = c.id_impsto',
'  join responsable g',
'    on g.id_sjto_impsto = a.id_sjto_impsto',
'   and decode(a.cdgo_sjto_tpo, ''E'', ''P'', ''R'') = g.cdgo_sjto_tpo',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_impsto = :P272_ID_IMPSTO',
'   and c.id_impsto_sbmpsto = :P272_ID_IMPSTO_SBIMPSTO',
'   and a.idntfccion_sjto = :P272_IDNTFCCION_SJTO',
'',
'/* select b.idntfccion_rspnsble ',
'      , (b.prmer_nmbre||'' ''||  b.sgndo_nmbre||'' ''||b.prmer_aplldo||'' ''||b.prmer_nmbre) as rspnsble',
'      , b.idntfccion_sjto',
'      , b.idntfccion_antrior',
'      , a.id_sjto_impsto',
'      , a.drccion',
'   from v_si_i_sujetos_impuesto    a',
'   join v_si_i_sujetos_responsable b on a.id_sjto_impsto = b.id_sjto_impsto',
'   join df_i_impuestos_subimpuesto c on a.id_impsto      = c.id_impsto',
'  where a.cdgo_clnte                = :F_CDGO_CLNTE',
'    and a.id_impsto                 = :P272_ID_IMPSTO',
'    and c.id_impsto_sbmpsto         = :P272_ID_IMPSTO_SBIMPSTO',
'    and b.prncpal_s_n               = ''S''',
'    and b.actvo                     = ''S''',
'    --and trim(a.drccion)             like ''%''||nvl(:P272_DRCCION,trim(a.drccion))||''%''',
'    and a.idntfccion_sjto           = :P272_IDNTFCCION_SJTO',
'    /*and a.idntfccion_antrior        = nvl(:P272_RFRNCIA_ANTRIOR,a.idntfccion_antrior)',
'    and trim(b.idntfccion_rspnsble) = nvl(:P272_IDNTFCCION_RSPNSBLE,trim(b.idntfccion_rspnsble))*/',
'    --or a.id_sjto_impsto =  :P272_IDNTFCCION_SJTO',
'   -- and trim(b.idntfccion_rspnsble) = nvl(:P272_IDNTFCCION_SJTO,trim(b.idntfccion_rspnsble));*/'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'   from v_si_i_sujetos_impuesto    a',
'   join v_si_i_sujetos_responsable b on a.id_sjto_impsto = b.id_sjto_impsto',
'   join df_i_impuestos_subimpuesto c on a.id_impsto      = c.id_impsto',
'  where a.cdgo_clnte                = :F_CDGO_CLNTE',
'    and a.id_impsto                 = :P272_ID_IMPSTO',
'    and c.id_impsto_sbmpsto         = :P272_ID_IMPSTO_SBIMPSTO',
'    and b.prncpal_s_n               = ''S''',
'    and b.actvo=''S''',
'    --and trim(a.drccion)             like ''%''||nvl(:P272_DRCCION,trim(a.drccion))||''%''',
'    and a.idntfccion_sjto           = nvl(:P272_IDNTFCCION_SJTO,a.idntfccion_sjto)',
'    --and a.idntfccion_antrior        = nvl(:P272_RFRNCIA_ANTRIOR,a.idntfccion_antrior)',
'    --and trim(b.idntfccion_rspnsble) = nvl(:P272_IDNTFCCION_RSPNSBLE,trim(b.idntfccion_rspnsble));',
'    or a.id_sjto_impsto =  :P272_ID_SJTO_IMPSTO;'))
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
 p_id=>wwv_flow_api.id(118886312342088645)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn Dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_detail_link=>'f?p=&APP_ID.:273:&SESSION.::&DEBUG.:RP,33:P273_ID_SJTO_IMPSTO:#ID_SJTO_IMPSTO#'
,p_detail_link_text=>'&"Ver".<span class="fa fa-eye"></span>'
,p_owner=>'AMOLINA'
,p_internal_uid=>118886312342088645
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59564162701884888)
,p_db_column_name=>'IDNTFCCION_RSPNSBLE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59564585380884898)
,p_db_column_name=>'RSPNSBLE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Nombre / Raz\00F3n Social')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59564951066884898)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Identificaci\00F3n Sujeto ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59565353184884898)
,p_db_column_name=>'IDNTFCCION_ANTRIOR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Idntfccion Antrior'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59565798544884899)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59408949359262712)
,p_db_column_name=>'DRCCION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Direcci\00F3n ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(118903456568410523)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'595661'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'IDNTFCCION_RSPNSBLE:RSPNSBLE:IDNTFCCION_SJTO:IDNTFCCION_ANTRIOR:ID_SJTO_IMPSTO:DRCCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(164367629492232971)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<br><br>',
'Funcionalidad que permite generar un Paz y Salvo.',
unistr('	<br><br>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(59558003564884873)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(117994965594149277)
,p_button_name=>'Btn_Cnsultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(188782777429617301)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(117994965594149277)
,p_button_name=>'BTN_CONSULTA_PARAMETROS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Consulta Par\00E1metros')
,p_button_position=>'BODY'
,p_button_css_classes=>'BTN-CONSULTAR'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(188782950813617303)
,p_branch_name=>'Ir a Busqueda Sujeto Impuesto'
,p_branch_action=>'f?p=71000:3:&SESSION.::&DEBUG.:RP:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_NMBRE_ITEM_IMPSTO:&APP_ID.,&APP_PAGE_ID.,P272_IDNTFCCION_SJTO,&P272_ID_IMPSTO.,P272_ID_IMPSTO&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(188782777429617301)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59557321796884865)
,p_name=>'P272_TPO_BSQUEDA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(117991384040149241)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59558442988884874)
,p_name=>'P272_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(117994965594149277)
,p_prompt=>'Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione un Tributo de la lista a consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59559326767884880)
,p_name=>'P272_ID_IMPSTO_SBIMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(117994965594149277)
,p_prompt=>'Sub-Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_impsto_sbmpsto as d',
'      , id_impsto_sbmpsto     as r',
'   from df_i_impuestos_subimpuesto',
'  where id_impsto = :P272_ID_IMPSTO;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P272_ID_IMPSTO'
,p_ajax_items_to_submit=>'P272_ID_IMPSTO_SBIMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione un Sub-Tributo de la lista a consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59560288099884881)
,p_name=>'P272_IDNTFCCION_SJTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(117994965594149277)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_colspan=>4
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Digite la referencia catastral del predio.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188783027353617304)
,p_name=>'P272_ID_SJTO_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(117994965594149277)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Digite la referencia catastral del predio.'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(59566959092884921)
,p_validation_name=>'Validar Parametros'
,p_validation_sequence=>10
,p_validation=>'(:P272_IDNTFCCION_SJTO is not null)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Para realizar la consulta debe digitar por lo menos un parametro adicional al Tributo y  Sub-Tributo.'
,p_always_execute=>'Y'
,p_validation_condition=>'(:P272_ID_IMPSTO is not null and :P272_ID_IMPSTO_SBIMPSTO is not null)'
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(59558003564884873)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
