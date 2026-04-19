prompt --application/pages/page_00039
begin
wwv_flow_api.create_page(
 p_id=>39
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Informe de Actos'
,p_step_title=>'Informe de Actos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
''))
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(29508795346068488)
,p_page_template_options=>'#DEFAULT#'
,p_last_upd_yyyymmddhh24miss=>'20191022165126'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2751631016086840)
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
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2751786073086841)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></i></b></h5>',
'<i>Funcionalidad que permite ingresar los actos pertenecientes a los diferentes impuestos.</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95930371089556218)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2742282192918438)
,p_plug_name=>'Regin_Btn'
,p_parent_plug_id=>wwv_flow_api.id(95930371089556218)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96167105525747441)
,p_plug_name=>'Informe de Actos'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto_acto, ',
'       cdgo_impsto_acto, ',
'       nmbre_impsto_acto, ',
'       dscrpcion_actvo,',
'       dscrpcion_tpo_dias,',
'       dias_mrgn_mra,',
'       txto_bse_grvble,',
'       dscrpcion_lqdcion_pblco,',
'       dscrpcion_rqre_ascsda',
'  from v_df_i_impuestos_acto ',
' where id_impsto = :P39_ID_IMPSTO ',
'   and id_impsto_sbmpsto = :P39_ID_SBMPSTO  ',
'order by nmbre_impsto_acto',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P39_ID_IMPSTO,P39_ID_SBMPSTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(96167236828747441)
,p_name=>'Informe de Actos'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:44:&SESSION.::&DEBUG.:RP:P44_ID_IMPSTO_ACTO:#ID_IMPSTO_ACTO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil-alt.png" class="apex-edit-pencil-alt" alt="">'
,p_owner=>'AURUETA'
,p_internal_uid=>96167236828747441
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96167610132747450)
,p_db_column_name=>'ID_IMPSTO_ACTO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Impsto Acto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96169639669747453)
,p_db_column_name=>'CDGO_IMPSTO_ACTO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>unistr('C\00F3digo')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96170062624747453)
,p_db_column_name=>'NMBRE_IMPSTO_ACTO'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97306075981708805)
,p_db_column_name=>'DSCRPCION_TPO_DIAS'
,p_display_order=>27
,p_column_identifier=>'P'
,p_column_label=>unistr('Tipo de d\00EDas<br>margen mora')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96693764533353704)
,p_db_column_name=>'DIAS_MRGN_MRA'
,p_display_order=>37
,p_column_identifier=>'K'
,p_column_label=>unistr('D\00EDas margen<br>de mora')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97305674231708801)
,p_db_column_name=>'TXTO_BSE_GRVBLE'
,p_display_order=>47
,p_column_identifier=>'L'
,p_column_label=>'Texto <br> base gravable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97306129268708806)
,p_db_column_name=>'DSCRPCION_LQDCION_PBLCO'
,p_display_order=>57
,p_column_identifier=>'Q'
,p_column_label=>unistr('Liquidaci\00F3n<br> desde entorno<br> p\00FAblico')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97306261821708807)
,p_db_column_name=>'DSCRPCION_RQRE_ASCSDA'
,p_display_order=>67
,p_column_identifier=>'R'
,p_column_label=>'Requiere<br>asociada'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97305914357708804)
,p_db_column_name=>'DSCRPCION_ACTVO'
,p_display_order=>77
,p_column_identifier=>'O'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(96415756567233218)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'964158'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CDGO_IMPSTO_ACTO:NMBRE_IMPSTO_ACTO:DSCRPCION_TPO_DIAS:DIAS_MRGN_MRA:TXTO_BSE_GRVBLE:DSCRPCION_LQDCION_PBLCO:DSCRPCION_RQRE_ASCSDA:DSCRPCION_ACTVO:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2742185301918437)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2742282192918438)
,p_button_name=>'Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(96686620933275901)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2751631016086840)
,p_button_name=>'BTN_NUEVO_ACTO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Acto'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:44:&SESSION.::&DEBUG.:RP,44::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95930417649556219)
,p_name=>'P39_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(95930371089556218)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto, ',
'       id_impsto ',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar Impuesto-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95930567222556220)
,p_name=>'P39_ID_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(95930371089556218)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto,',
'       id_impsto_sbmpsto',
'  from v_df_i_impuestos_subimpuesto ',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P39_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar Sub-Impuesto-'
,p_lov_cascade_parent_items=>'P39_ID_IMPSTO'
,p_ajax_items_to_submit=>'P39_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95930780552556222)
,p_name=>'Al cerrar dialogo'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95930818887556223)
,p_event_id=>wwv_flow_api.id(95930780552556222)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(96167105525747441)
,p_stop_execution_on_error=>'Y'
);
end;
/
