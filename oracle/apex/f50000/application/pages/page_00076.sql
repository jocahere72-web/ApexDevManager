prompt --application/pages/page_00076
begin
wwv_flow_api.create_page(
 p_id=>76
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Informe de Conceptos'
,p_step_title=>'Informe de Conceptos'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).on("scroll",function() {',
'  apex.navigation.dialog.close(true);',
'});'))
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20201222101359'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2751896786086842)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P76_ID_IMPSTO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2751962141086843)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'Funcionalidad que permite ingresar, consultar, modificar y eliminar los conceptos de un tributo.<br><br>',
unistr('<b>1.</b> Consultar los conceptos de un tributo debe seleccionar el tributo de la lista en par\00E1metros de b\00FAsqueda y hacer clic en el bot\00F3n consultar.'),
'<br><br>	',
unistr('<b>2.</b> Ingresar un nuevo concepto debe seleccionar el tributo y hacer clic en el bot\00F3n Nuevo Concepto, se mostrar\00E1 una ventana para diligenciar los datos relacionados al concepto del tributo seleccionado al finalizar hacer clic en el bot\00F3n Inserta')
||'r.<br><br>	',
unistr('<b>3.</b> Modificar y/o eliminar un Concepto hacer clic en el \00EDcono de l\00E1piz del concepto, se mostrar\00E1 una ventana con los datos del concepto seleccionado, realizar la acci\00F3n deseada y finalizar haciendo clic en los botones Aplicar Cambios y/o Elimin')
||unistr('ar, si no desea ejecutar ninguna acci\00F3n hacer clic en el bot\00F3n Cancelar.'),
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(97495557685352015)
,p_plug_name=>'Informe de Conceptos'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_cncpto,',
'       cdgo_cncpto,',
'       dscrpcion,',
'       ctgria_cncpto,',
'       dscrpcion_sncion,',
'       dscrpcion_unco,',
'       dscrpcion_actvo,',
'       dscrpcion_cncpto_tpo,',
'       dscrpcion_cncpto_rlcnal',
'  from v_df_i_conceptos ',
' where id_impsto= :P76_ID_IMPSTO',
'   and cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P76_ID_IMPSTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(97495653726352015)
,p_name=>'Informe de Conceptos'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>unistr('La cantidad de filas m\00E1xima para este reporte es de #MAX_ROW_COUNT# filas.  Por favor aplicar un filtro para reducir la consulta realizada.')
,p_no_data_found_message=>'No se encontraron Registris'
,p_max_rows_per_page=>'50'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:77:&SESSION.::&DEBUG.:RP:P77_ID_CNCPTO:#ID_CNCPTO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'AURUETA'
,p_internal_uid=>97495653726352015
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97496057616352020)
,p_db_column_name=>'ID_CNCPTO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Cncpto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97497209369352026)
,p_db_column_name=>'CDGO_CNCPTO'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>unistr('C\00F3digo')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97497622809352026)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>30
,p_column_identifier=>'E'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(40421139790601416)
,p_db_column_name=>'CTGRIA_CNCPTO'
,p_display_order=>40
,p_column_identifier=>'N'
,p_column_label=>unistr('Categor\00EDa del Concepto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173829035816867415)
,p_db_column_name=>'DSCRPCION_CNCPTO_TPO'
,p_display_order=>50
,p_column_identifier=>'L'
,p_column_label=>'Tipo de Concepto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(173829105234867416)
,p_db_column_name=>'DSCRPCION_CNCPTO_RLCNAL'
,p_display_order=>60
,p_column_identifier=>'M'
,p_column_label=>'Concepto Relacional'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97306819465708813)
,p_db_column_name=>'DSCRPCION_SNCION'
,p_display_order=>70
,p_column_identifier=>'I'
,p_column_label=>unistr('\00BFSanci\00F3n?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97306981123708814)
,p_db_column_name=>'DSCRPCION_UNCO'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>unistr('\00BF\00DAnico?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97307016285708815)
,p_db_column_name=>'DSCRPCION_ACTVO'
,p_display_order=>90
,p_column_identifier=>'K'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(97501341018367308)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'975014'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CDGO_CNCPTO:DSCRPCION:CTGRIA_CNCPTO:DSCRPCION_CNCPTO_TPO:DSCRPCION_CNCPTO_RLCNAL:DSCRPCION_SNCION:DSCRPCION_UNCO:DSCRPCION_ACTVO:'
,p_sort_column_1=>'CDGO_CNCPTO'
,p_sort_direction_1=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(193429823918920769)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29541487623068504)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97307340863708818)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2751896786086842)
,p_button_name=>'BTN_NUEVO_CONCEPTO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Concepto'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:77:&SESSION.::&DEBUG.:RP,77:P77_ID_IMPSTO:&P76_ID_IMPSTO.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(23277382460996202)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(193429823918920769)
,p_button_name=>'CONSULTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="margin-top:-7px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>9
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97499701731364558)
,p_name=>'P76_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(193429823918920769)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccionar Tributo'
,p_colspan=>5
,p_grid_column=>4
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo para consultar los conceptos del tributo.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(97307105596708816)
,p_name=>'Al cerrar dialogo'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97307252490708817)
,p_event_id=>wwv_flow_api.id(97307105596708816)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(97495557685352015)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23277434149996203)
,p_name=>unistr('al hacer clic en el bot\00F3n consultar')
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(23277382460996202)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23277505341996204)
,p_event_id=>wwv_flow_api.id(23277434149996203)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$redirect([''P76_ID_IMPSTO''], [$v(''P76_ID_IMPSTO'')]);'
,p_stop_execution_on_error=>'Y'
);
end;
/
