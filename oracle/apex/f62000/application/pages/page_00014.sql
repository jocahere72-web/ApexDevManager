prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(323679016569283847)
,p_name=>unistr('Condici\00F3n de Transici\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Condici\00F3n de Transici\00F3n')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render_function(){',
'    var fnc = $(''#P14_ID_FUNCION'').val();',
'',
'    $("#P14_PARAMETRO_FUNCION_RIGHT option").each(function(i,o){        ',
'        fnc = fnc.replace(''$param'' + (i+1), '':'' + $(o).val() + '':'');   ',
'    });',
'',
'    $(''#P14_OBJTO_CNDCION'').val(fnc);',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'textarea {',
'  resize: none !important;',
'  pointer-events: none;',
'}',
'',
'#P14_MNSJE { ',
'  pointer-events: auto !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20191107110333'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21377688901088605)
,p_plug_name=>unistr('Condiciones de Transici\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(39298132994898311)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.id_fljo_trnscion_cndcion,',
'         a.id_fljo_trnscion,',
'         nvl(d.nmbre_atrbto, a.objto_cndcion) nmbre_atrbto,',
'         b.dscrpcion,',
'         vlor1,',
'         vlor2,',
'         cmprta_lgca,',
'         orden_agrpcion,',
'         case when a.tpo_cndcion = ''F'' then',
'              ''Funcion''',
'              when a.tpo_cndcion = ''A'' then',
'              ''Atributo''',
'              when a.tpo_cndcion = ''P'' then',
'              ''Parametro''',
'          end tpo_cndcion',
'     from wf_d_flujos_trnscion_cndcion a',
'     join df_s_operadores_tipo b ',
'       on a.id_oprdor_tpo = b.id_oprdor_tpo',
'left join v_wf_d_tareas_atributo c',
'       on c.id_trea_atrbto = a.id_trea_atrbto',
'left join wf_d_atributos d',
'       on d.id_atrbto = c.id_atrbto',
' where id_fljo_trnscion = :P14_ID_FLJO_TRNSCION'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
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
 p_id=>wwv_flow_api.id(21377717837088606)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:14:&SESSION.:SAVE:&DEBUG.:RP,14:P14_ID_FLJO_TRNSCION_CNDCION,P14_ID_FLJO_TRNSCION:#ID_FLJO_TRNSCION_CNDCION#,#ID_FLJO_TRNSCION#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'MCARO'
,p_internal_uid=>21377717837088606
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21377817214088607)
,p_db_column_name=>'ID_FLJO_TRNSCION_CNDCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Fljo Trnscion Cndcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21377957656088608)
,p_db_column_name=>'ID_FLJO_TRNSCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Fljo Trnscion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29891768749207224)
,p_db_column_name=>'NMBRE_ATRBTO'
,p_display_order=>30
,p_column_identifier=>'I'
,p_column_label=>'Objeto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29891913294207226)
,p_db_column_name=>'TPO_CNDCION'
,p_display_order=>40
,p_column_identifier=>'K'
,p_column_label=>unistr('Tipo Condci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21378213428088611)
,p_db_column_name=>'VLOR1'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Valor 1'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21378335807088612)
,p_db_column_name=>'VLOR2'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor 2'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21378411916088613)
,p_db_column_name=>'CMPRTA_LGCA'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Compuerta L\00F3gica')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21378543796088614)
,p_db_column_name=>'ORDEN_AGRPCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Agrupaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29891829247207225)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Operador'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(21385545182240767)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'213856'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TPO_CNDCION:NMBRE_ATRBTO:DSCRPCION:VLOR1:VLOR2:CMPRTA_LGCA:ORDEN_AGRPCION:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21378682398088615)
,p_plug_name=>unistr('Nueva condici\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(39299295614898312)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(29891196222207218)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(21378682398088615)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(39351872500898344)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P14_ID_FLJO_TRNSCION_CNDCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(29891342620207220)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(21378682398088615)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(39351872500898344)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(29891217276207219)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(21378682398088615)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(39351872500898344)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_condition=>'P14_ID_FLJO_TRNSCION_CNDCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21379109710088620)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(21378682398088615)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(39351872500898344)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P14_ID_FLJO_TRNSCION_CNDCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(30274670838836527)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(21378682398088615)
,p_button_name=>'BTN_NUEVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(39351872500898344)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nueva Condici\00F3n')
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:RP,14:P14_ID_FLJO_TRNSCION:&P14_ID_FLJO_TRNSCION.'
,p_button_condition=>'P14_ID_FLJO_TRNSCION_CNDCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21378793342088616)
,p_name=>'P14_TPO_CNDCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(21378682398088615)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tipo de Condici\00F3n')
,p_source=>'TPO_CNDCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Atributo;A,Par\00E1metro;P,Funci\00F3n;F')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(39351319077898342)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21378890219088617)
,p_name=>'P14_ID_TREA_ATRBTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(21378682398088615)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tarea atributo'
,p_source=>'ID_TREA_ATRBTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_atrbto,',
'       a.id_trea_atrbto',
'  from v_wf_d_tareas_atributo a ',
'  join wf_d_atributos b ',
'    on b.id_atrbto = a.id_atrbto',
'  join v_wf_d_flujos_transicion c',
'    on a.id_trea = c.id_trea_orgen',
' where c.id_fljo_trnscion = :P14_ID_FLJO_TRNSCION;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(39351319077898342)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21379714574088626)
,p_name=>'P14_ID_PARAMETRO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(21378682398088615)
,p_prompt=>unistr('Par\00E1metro')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.item_name d,',
'       e.item_name b',
'  from v_wf_d_flujos_transicion a',
'  join wf_d_flujos_tarea b',
'    on a.id_fljo_trea = b.id_fljo_trea',
'  join wf_d_tareas c',
'    on c.id_trea = b.id_trea',
'  join sg_g_aplicaciones d',
'    on c.id_aplccion = d.id_aplccion',
'  join apex_application_page_items e',
'    on e.application_id =  d.nmro_aplccion',
'   and e.page_id = c.nmro_pgna',
'   where a.id_fljo_trnscion = :P14_ID_FLJO_TRNSCION ;    '))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(39351319077898342)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21379840195088627)
,p_name=>'P14_ID_FUNCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(21378682398088615)
,p_prompt=>unistr('Funci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select object_name || '' version '' || overload d,  ',
'         object_name || ''('' || listagg(argument_name || '' => $param'' || position ,'' ,'') within group (order by position) || '')'' b',
'    from user_arguments ',
'   where package_name = ''PKG_WF_FUNCIONES''',
'     and argument_name is not null',
'group by object_name,',
'         overload ;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(39351319077898342)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21379929413088628)
,p_name=>'P14_PARAMETRO_FUNCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(21378682398088615)
,p_prompt=>unistr('Par\00E1metro funci\00F3n')
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select distinct e.item_name d,',
'          e.item_name b',
'     from v_wf_d_flujos_transicion a',
'     join wf_d_flujos_tarea b',
'       on a.id_fljo_trea = b.id_fljo_trea',
'     join wf_d_tareas c',
'       on c.id_trea = b.id_trea',
'     join sg_g_aplicaciones d',
'       on c.id_aplccion = d.id_aplccion',
'     join apex_application_page_items e',
'       on e.application_id = d.nmro_aplccion',
'      and e.page_id = c.nmro_pgna',
'left join wf_d_flujos_trnscion_cndcion f',
'       on f.id_fljo_trnscion_cndcion = :P14_ID_FLJO_TRNSCION_CNDCION',
'      and f.objto_cndcion like ''%'' || e.item_name || ''%''',
'    where a.id_fljo in ( select f.id_fljo from v_wf_d_flujos_transicion f where f.id_fljo_trnscion = :P14_ID_FLJO_TRNSCION )',
'      and f.id_fljo_trnscion_cndcion is null',
' ',
'union all  ',
'',
'   select distinct e.item_name d,',
'          e.item_name b',
'     from v_wf_d_flujos_transicion a',
'     join wf_d_flujos_tarea b',
'       on a.id_fljo_trea = b.id_fljo_trea',
'     join wf_d_tareas c',
'       on c.id_trea = b.id_trea',
'     join sg_g_aplicaciones d',
'       on c.id_aplccion = d.id_aplccion',
'     join apex_application_items e',
'       on e.application_id =  d.nmro_aplccion',
'left join wf_d_flujos_trnscion_cndcion f',
'       on f.id_fljo_trnscion_cndcion = :P14_ID_FLJO_TRNSCION_CNDCION',
'      and f.objto_cndcion like ''%'' || e.item_name || ''%''',
'    where a.id_fljo_trnscion = :P14_ID_FLJO_TRNSCION ',
'      and f.id_fljo_trnscion_cndcion is null;'))
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(39351056969898342)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'ALL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21380058822088629)
,p_name=>'P14_ID_OPRDOR_TPO'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(21378682398088615)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Operador'
,p_source=>'ID_OPRDOR_TPO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_TIPO_OPERADORES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
' DSCRPCION D,',
' ID_OPRDOR_TPO R FROM ',
'DF_S_OPERADORES_TIPO',
'ORDER BY 2'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(39351319077898342)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21380169436088630)
,p_name=>'P14_VLOR1'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(21378682398088615)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Valor 1'
,p_source=>'VLOR1'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(39351319077898342)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21380215132088631)
,p_name=>'P14_VLOR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(21378682398088615)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Valor 2'
,p_source=>'VLOR2'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(39351056969898342)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21380790527088636)
,p_name=>'P14_OBJTO_CNDCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(21378682398088615)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Funci\00F3n con par\00E1metros')
,p_source=>'OBJTO_CNDCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cHeight=>3
,p_cattributes_element=>'disabled'
,p_field_template=>wwv_flow_api.id(39351056969898342)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29889576671207202)
,p_name=>'P14_ORDEN_AGRPCION'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(21378682398088615)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Orden de agrupaci\00F3n')
,p_source=>'ORDEN_AGRPCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:1;1,2;2,3;3,4;4,5;5,6;6,7;7,8;8,9;9'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(39351319077898342)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29889679744207203)
,p_name=>'P14_ID_FLJO_TRNSCION_CNDCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(21378682398088615)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_FLJO_TRNSCION_CNDCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29892158349207228)
,p_name=>'P14_FLJO_TRNSCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(21378682398088615)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&P14_ID_FLJO_TRNSCION.'
,p_source=>'ID_FLJO_TRNSCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30272050071836501)
,p_name=>'P14_CMPRTA_LGCA'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(21378682398088615)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Compuerta L\00F3gica')
,p_source=>'CMPRTA_LGCA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Y;AND,O;OR'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>4
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(39351056969898342)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56780229513933801)
,p_name=>'P14_MNSJE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(21378682398088615)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Mensaje'
,p_source=>'MNSJE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>1000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(39351056969898342)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110354466137565127)
,p_name=>'P14_ID_FLJO_TRNSCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(21378682398088615)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(29890481554207211)
,p_validation_name=>'validar id tarea atributo'
,p_validation_sequence=>30
,p_validation=>'(:P14_TPO_CNDCION = ''A'' and :P14_ID_TREA_ATRBTO is not null) or (:P14_TPO_CNDCION <> ''A'' )'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Error debe seleccionar un atributo'
,p_associated_item=>wwv_flow_api.id(21378890219088617)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(29890709205207214)
,p_validation_name=>'validar parametro'
,p_validation_sequence=>40
,p_validation=>'(:P14_TPO_CNDCION = ''P'' and :P14_ID_PARAMETRO is not null) or (:P14_TPO_CNDCION <> ''P'' )'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Debe seleccionar un parametro'
,p_associated_item=>wwv_flow_api.id(21379714574088626)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(29890841519207215)
,p_validation_name=>unistr('validar funci\00F3n')
,p_validation_sequence=>50
,p_validation=>'(:P14_TPO_CNDCION = ''F'' and :P14_ID_FUNCION is not null) or (:P14_TPO_CNDCION <> ''F'' )'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Debe seleccionar una funci\00F3n')
,p_associated_item=>wwv_flow_api.id(21379840195088627)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(29890982286207216)
,p_validation_name=>unistr('validar par\00E1metros de funci\00F3n ')
,p_validation_sequence=>60
,p_validation=>'(:P14_TPO_CNDCION = ''F'' and :P14_ID_FUNCION is not null and :P14_PARAMETRO_FUNCION is not null) or (:P14_TPO_CNDCION <> ''F'' )'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Debe seleccionar los par\00E1metros de la funci\00F3n')
,p_associated_item=>wwv_flow_api.id(21379929413088628)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(29891613066207223)
,p_validation_name=>unistr('validar cantidad argumentos de la funci\00F3n')
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'v_cnt_param number ; ',
'v_cnt_fnc number ;  ',
'',
'begin',
'    select count(1)',
'      into v_cnt_param',
'      from dual connect by regexp_substr(:P14_PARAMETRO_FUNCION, ''[^:]+'', 1, level) is not null ;',
'',
' select count(1)',
'   into v_cnt_fnc',
'   from dual connect by regexp_substr(:P14_OBJTO_CNDCION, ''[^,]+'', 1, level) is not null ;  ',
'  ',
'  return v_cnt_param = v_cnt_fnc;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Debe seleccionar la misma cantidad de par\00E1metros de la funci\00F3n')
,p_associated_item=>wwv_flow_api.id(21379929413088628)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21378909690088618)
,p_name=>'al cambiar tipo igual A'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_TPO_CNDCION'
,p_condition_element=>'P14_TPO_CNDCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'A'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21379556257088624)
,p_event_id=>wwv_flow_api.id(21378909690088618)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_ID_TREA_ATRBTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21379684821088625)
,p_event_id=>wwv_flow_api.id(21378909690088618)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_ID_TREA_ATRBTO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21380807048088637)
,p_name=>'al cambiar tipo igual P'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_TPO_CNDCION'
,p_condition_element=>'P14_TPO_CNDCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'P'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21380961517088638)
,p_event_id=>wwv_flow_api.id(21380807048088637)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_ID_PARAMETRO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21381005138088639)
,p_event_id=>wwv_flow_api.id(21380807048088637)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_ID_PARAMETRO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21381198172088640)
,p_name=>'al cambiar tipo igual F'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_TPO_CNDCION'
,p_condition_element=>'P14_TPO_CNDCION'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'F'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21381218779088641)
,p_event_id=>wwv_flow_api.id(21381198172088640)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_ID_FUNCION,P14_PARAMETRO_FUNCION,P14_OBJTO_CNDCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21381365355088642)
,p_event_id=>wwv_flow_api.id(21381198172088640)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_ID_FUNCION,P14_PARAMETRO_FUNCION,P14_OBJTO_CNDCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21381596248088644)
,p_event_id=>wwv_flow_api.id(21381198172088640)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_ID_OPRDOR_TPO'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'1'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21380330089088632)
,p_name=>'al cambiar operador'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_ID_OPRDOR_TPO'
,p_condition_element=>'P14_ID_OPRDOR_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'11'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21380452496088633)
,p_event_id=>wwv_flow_api.id(21380330089088632)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_VLOR2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21380597714088634)
,p_event_id=>wwv_flow_api.id(21380330089088632)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_VLOR2'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21380699274088635)
,p_event_id=>wwv_flow_api.id(21380330089088632)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_VLOR2'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21381749570088646)
,p_name=>unistr('al hacer click par\00E1metros')
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_PARAMETRO_FUNCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21381982798088648)
,p_event_id=>wwv_flow_api.id(21381749570088646)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'render_function();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21381884608088647)
,p_event_id=>wwv_flow_api.id(21381749570088646)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'apex_util.set_session_state (p_name => ''P14_OBJTO_CNDCION'', p_value => :P14_OBJTO_CNDCION);'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29338312512434705)
,p_name=>unistr('al hacer doble click par\00E1metros')
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_PARAMETRO_FUNCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29338575045434707)
,p_event_id=>wwv_flow_api.id(29338312512434705)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'render_function();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29338495940434706)
,p_event_id=>wwv_flow_api.id(29338312512434705)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'apex_util.set_session_state (p_name => ''P14_OBJTO_CNDCION'', p_value => :P14_OBJTO_CNDCION);'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29338631857434708)
,p_name=>unistr('al presionar una tecla par\00E1metros')
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_PARAMETRO_FUNCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'keydown'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29338819312434710)
,p_event_id=>wwv_flow_api.id(29338631857434708)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'render_function();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29338700551434709)
,p_event_id=>wwv_flow_api.id(29338631857434708)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'apex_util.set_session_state (p_name => ''P14_OBJTO_CNDCION'', p_value => :P14_OBJTO_CNDCION);'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21382050698088649)
,p_name=>'al cambiar funcion'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_ID_FUNCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29338083831434702)
,p_event_id=>wwv_flow_api.id(21382050698088649)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'render_function();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29337912555434701)
,p_event_id=>wwv_flow_api.id(21382050698088649)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'apex_util.set_session_state (p_name => ''P14_OBJTO_CNDCION'', p_value => :P14_OBJTO_CNDCION);'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29891489300207221)
,p_name=>'al hacer click en cancelar'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(29891342620207220)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29891584459207222)
,p_event_id=>wwv_flow_api.id(29891489300207221)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29892437717207231)
,p_name=>unistr('al cambiar par\00E1metros ')
,p_event_sequence=>210
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_ID_PARAMETRO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29892539593207232)
,p_event_id=>wwv_flow_api.id(29892437717207231)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>' $(''#P14_OBJTO_CNDCION'').val($(''#P14_ID_PARAMETRO'').val());'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29892635273207233)
,p_event_id=>wwv_flow_api.id(29892437717207231)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'apex_util.set_session_state (p_name => ''P14_OBJTO_CNDCION'', p_value => :P14_OBJTO_CNDCION);'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29889845265207205)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'fecth Row of WF_D_FLUJOS_TRNSCION_CNDCION'
,p_attribute_02=>'WF_D_FLUJOS_TRNSCION_CNDCION'
,p_attribute_03=>'P14_ID_FLJO_TRNSCION_CNDCION'
,p_attribute_04=>'ID_FLJO_TRNSCION_CNDCION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'select id_fljo_trnscion_cndcion from wf_d_flujos_trnscion_cndcion where id_fljo_trnscion_cndcion  = :P14_ID_FLJO_TRNSCION_CNDCION'
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(29892317539207230)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('al cargar la pagina con tipo funci\00F3n o par\00E1metro')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_condicion varchar2(1000);',
'',
'begin',
'    if :P14_TPO_CNDCION = ''F'' then',
'        select objto_cndcion ',
'          into v_condicion',
'          from wf_d_flujos_trnscion_cndcion ',
'         where id_fljo_trnscion_cndcion = :P14_ID_FLJO_TRNSCION_CNDCION;',
'        ',
'        begin',
'            select object_name || ''('' || listagg(argument_name || '' => $param'' || position ,'' ,'') within group (order by position ) || '')'' b',
'              into :P14_ID_FUNCION',
'              from user_arguments ',
'             where package_name = ''PKG_WF_FUNCIONES''',
'               and argument_name is not null',
'               and object_name = regexp_substr(v_condicion,''[^\(]+'', 1, 1)',
'          group by object_name,',
'                   overload',
'            having count(1) = (select count(1) from dual connect by regexp_substr(v_condicion, ''[^,]+'', 1, level) is not null );',
'        exception ',
'            when others then ',
'                :P14_ID_FUNCION := null;',
'        end;',
'        select listagg(trim(regexp_replace(regexp_substr(regexp_substr(v_condicion, ''[^,]+'', 1, level), ''[^=>]+'', 1,2),''\)|\:'','''')),'':'') within group (order by level )',
'          into :P14_PARAMETRO_FUNCION',
'          from dual ',
'       connect by regexp_substr(v_condicion, ''[^,]+'', 1, level) is not null ;',
'                     ',
'    elsif :P14_TPO_CNDCION = ''P'' then',
'        ',
'        :P14_ID_PARAMETRO := :P14_OBJTO_CNDCION;',
'        ',
'    end if;  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'select * from wf_d_flujos_trnscion_cndcion where id_fljo_trnscion_cndcion  = :P14_ID_FLJO_TRNSCION_CNDCION'
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21379286739088621)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of WF_D_FLUJOS_TRNSCION_CNDCION'
,p_attribute_02=>'WF_D_FLUJOS_TRNSCION_CNDCION'
,p_attribute_03=>'P14_ID_FLJO_TRNSCION_CNDCION'
,p_attribute_04=>'ID_FLJO_TRNSCION_CNDCION'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Proceso realizado con \00E9xito')
);
end;
/
