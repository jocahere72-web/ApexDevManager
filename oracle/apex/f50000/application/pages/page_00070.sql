prompt --application/pages/page_00070
begin
wwv_flow_api.create_page(
 p_id=>70
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Esquema Predios'
,p_step_title=>'Esquema Predios'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'//buttonCollapse(''t_Button_rightControlButton'');'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20220103164404'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55627759727594527)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:margin-top-lg'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"><br></center></i> </b></h5>',
'<br>',
'Funcionalidad que permite ingresar, consultar, modificar y eliminar los esquemas de los predios.<br>',
'<b>Agregar nuevo Esquema predio :</b><br>',
unistr('Clic al bot\00F3n Nuevo Esquema Predio, seguido abre p\00E1gina modal donde se permite diligenciar los datos de un nuevo esquema predio.<br><br>'),
'<b>Modificar y Eliminar Esquema predio</b>:<br>',
unistr('Clic columna del \00EDcono de l\00E1piz del esquema a modificar o eliminar, Abre p\00E1gina modal donde se permite modificar, eliminar y visualizar los datos del esquema predio seleccionado.<br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(683258040256163028)
,p_plug_name=>'Esquema Predio'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_prdio_esqma,',
'       nmbre_impsto_sbmpsto,',
'       to_date (fcha_incial, ''dd/mm/yyyy'') fcha_incial,',
'       to_date (fcha_fnal, ''dd/mm/yyyy'') fcha_fnal,',
'       dscrpcion_prdio_clsfccion,',
'       dscrpcion_prdio_uso_slo,',
'       dscrpcion_prdio_dstno,',
'       dscrpcion_estrto,',
'       trfa,',
'       e.lmte_mnma,',
'       e.lmte_mxma,',
'       (select e.cdgo_indcdor_tpo||'' (''||to_char(a.fcha_dsde,''dd/mm/yyyy'')||''-''||to_char(a.fcha_hsta,''dd/mm/yyyy'')||'')'' from df_s_indicadores_economico a where a.id_indcdor_ecnmco = e.id_indcdor_ecnmco) indcdor_ecnmco',
'  from v_gi_d_predios_esquema e',
'where cdgo_clnte            =  :F_CDGO_CLNTE',
'  and (( id_impsto          =  :P70_IMPUESTO) or :P70_IMPUESTO is null)',
'  and ((id_impsto_sbmpsto   =  :P70_SUB_IMPUESTO) or :P70_SUB_IMPUESTO is null)',
'  and ((cdgo_prdio_clsfccion  = nvl(:P70_CLASIFICACION_PREDIO, cdgo_prdio_clsfccion)) or (:P70_CLASIFICACION_PREDIO is null))',
'  and ((id_prdio_uso_slo      = nvl(:P70_DSCRPCION_PRDIO_USO_SLO, id_prdio_uso_slo)) or (:P70_DSCRPCION_PRDIO_USO_SLO is null))',
'  and ((id_prdio_dstno     = nvl(:P70_DSCRPCION_PRDIO_DSTNO, id_prdio_dstno)) or (:P70_DSCRPCION_PRDIO_DSTNO is null))',
'  and ((cdgo_estrto     = nvl(:P70_DSCRPCION_ESTRTO, cdgo_estrto)) or (:P70_DSCRPCION_ESTRTO is null))',
'  and (TRUNC(fcha_incial)   >= TRUNC(TO_DATE(:P70_FECHA_INICIAL,''DD/MM/YYYY'')) OR :P70_FECHA_INICIAL IS NULL)',
'  and (TRUNC(fcha_fnal)     <= TRUNC(TO_DATE(:P70_FECHA_FIN,''DD/MM/YYYY'')) OR :P70_FECHA_FIN IS NULL)',
'   ',
'  ',
'',
'/* select id_prdio_esqma,',
'       nmbre_impsto_sbmpsto,',
'       to_date (fcha_incial, ''dd/mm/yyyy'') fcha_incial,',
'       to_date (fcha_fnal, ''dd/mm/yyyy'') fcha_fnal,',
'       dscrpcion_prdio_clsfccion,',
'       dscrpcion_prdio_uso_slo,',
'       dscrpcion_prdio_dstno,',
'       dscrpcion_estrto,',
'       trfa',
'  from v_gi_d_predios_esquema',
' where cdgo_clnte                =  :F_CDGO_CLNTE',
'   and (( id_impsto              =  :P70_IMPUESTO) or :P70_IMPUESTO is null)',
'   and ((id_impsto_sbmpsto       =  :P70_SUB_IMPUESTO) or :P70_SUB_IMPUESTO is null)',
'   and ((cdgo_prdio_clsfccion    =  :P70_CLASIFICACION_PREDIO) or :P70_CLASIFICACION_PREDIO is null)',
'   and ((dscrpcion_prdio_uso_slo =  :P70_DSCRPCION_PRDIO_USO_SLO) or :P70_DSCRPCION_PRDIO_USO_SLO is null)',
'   and ((dscrpcion_prdio_dstno   =  :P70_DSCRPCION_ESTRTO) or :P70_DSCRPCION_ESTRTO is null)',
'   and ((dscrpcion_estrto        =  :P70_CLASIFICACION_PREDIO) or :P70_CLASIFICACION_PREDIO is null)',
'   and (TRUNC(fcha_incial)       >= TRUNC(TO_DATE(:P70_FECHA_INICIAL,''DD/MM/YYYY'')) OR :P70_FECHA_INICIAL IS NULL) ',
'   and (TRUNC(fcha_fnal)         <= TRUNC(TO_DATE(:P70_FECHA_FIN,''DD/MM/YYYY'')) OR :P70_FECHA_FIN IS NULL)*/',
'   ',
'   /* and ((fcha_incial        between  :P70_FECHA_INICIAL and :P70_FECHA_FIN) or  :P70_FECHA_INICIAL is null)',
'   and ((fcha_fnal          between  :P70_FECHA_INICIAL and :P70_FECHA_FIN ) or :P70_FECHA_FIN is null) */',
'',
' ',
''))
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
 p_id=>wwv_flow_api.id(171673883622042050)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No existe datos para Esquema Predio'
,p_max_rows_per_page=>'50'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:75:&SESSION.::&DEBUG.:RP:P75_ID_PRDIO_ESQMA:#ID_PRDIO_ESQMA#'
,p_detail_link_text=>'<center><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt=""></center>'
,p_owner=>'JALCOCER'
,p_internal_uid=>171673883622042050
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172353818650465801)
,p_db_column_name=>'ID_PRDIO_ESQMA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id prdio esqma'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172354139116465804)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Sub Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172354252503465805)
,p_db_column_name=>'FCHA_INCIAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Fecha Inicial'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172354331989465806)
,p_db_column_name=>'FCHA_FNAL'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Fecha Final'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172354434081465807)
,p_db_column_name=>'DSCRPCION_PRDIO_CLSFCCION'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Clasificaci\00F3n Predio')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(172354535381465808)
,p_db_column_name=>'DSCRPCION_PRDIO_USO_SLO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Uso Suelo Predio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55625449596594504)
,p_db_column_name=>'DSCRPCION_PRDIO_DSTNO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Destino<br>Predio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55627568248594525)
,p_db_column_name=>'DSCRPCION_ESTRTO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Estrato'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86821549193932404)
,p_db_column_name=>'LMTE_MNMA'
,p_display_order=>110
,p_column_identifier=>'O'
,p_column_label=>unistr('Base M\00EDnima')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86821628230932405)
,p_db_column_name=>'LMTE_MXMA'
,p_display_order=>120
,p_column_identifier=>'P'
,p_column_label=>unistr('Base M\00E1xima')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(86821429740932403)
,p_db_column_name=>'INDCDOR_ECNMCO'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>'Indicador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55627621174594526)
,p_db_column_name=>'TRFA'
,p_display_order=>140
,p_column_identifier=>'K'
,p_column_label=>'Tarifa'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(172380876242510831)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1723809'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_PRDIO_ESQMA:NMBRE_IMPSTO_SBMPSTO:FCHA_INCIAL:FCHA_FNAL:DSCRPCION_PRDIO_CLSFCCION:DSCRPCION_PRDIO_USO_SLO:DSCRPCION_PRDIO_DSTNO:DSCRPCION_ESTRTO:TRFA:INDCDOR_ECNMCO:LMTE_MNMA:LMTE_MXMA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(685692442924291010)
,p_plug_name=>'<b>Opciones</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(892806213958306296)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29541487623068504)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(171933330399205079)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(685692442924291010)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&P70_BRANCH_APP.:&P70_BRANCH_PAGE.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(172355377200465816)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(685692442924291010)
,p_button_name=>'Btn_nuevo'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo<br> Esquema Predio'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:75:&SESSION.::&DEBUG.:RP,75::'
,p_icon_css_classes=>'fa-window-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(57283110238903003)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(685692442924291010)
,p_button_name=>'Btn_nuevo_masivo'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo <br> Esquema Predio <br> Masivo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:152:&SESSION.::&DEBUG.:RP,75::'
,p_icon_css_classes=>'fa-window-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(47696612914190711)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(892806213958306296)
,p_button_name=>'BTN_LMPIAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Restablecer'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:RP,70::'
,p_icon_css_classes=>'fa-undo-alt'
,p_button_cattributes=>'style="margin: 9px;"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(47696963166190751)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(892806213958306296)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(171956248072205193)
,p_branch_name=>'Regresar'
,p_branch_action=>'P70_BRANCH_PAGE'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_when_button_id=>wwv_flow_api.id(171933330399205079)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47697327161190756)
,p_name=>'P70_IMPUESTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(892806213958306296)
,p_prompt=>'<b>Tributo</b>'
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
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47698282592190788)
,p_name=>'P70_SUB_IMPUESTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(892806213958306296)
,p_prompt=>'<b>Sub-Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where id_impsto = :P70_IMPUESTO',
' order by 1',
'  '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P70_IMPUESTO'
,p_ajax_items_to_submit=>'P70_IMPUESTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el subtributo'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47699014734190788)
,p_name=>'P70_CLASIFICACION_PREDIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(892806213958306296)
,p_prompt=>unistr('<b>Clasificaci\00F3n Predio</b>')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CLASIFICACION_PREDIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_prdio_clsfccion d,',
'       cdgo_prdio_clsfccion  r   ',
'  from df_s_predios_clasificacion',
'  order by cdgo_prdio_clsfccion'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione de la lista la clasificaci\00F3n del predio.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47699926368190789)
,p_name=>'P70_FECHA_INICIAL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(892806213958306296)
,p_prompt=>'<b>Fecha Inicial</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false"'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha inicial para el c\00E1lculo del destino.')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47700807193190789)
,p_name=>'P70_FECHA_FIN'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(892806213958306296)
,p_prompt=>'<b>Fecha Fin</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha final para el c\00E1lculo del destino.')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47701786478190789)
,p_name=>'P70_BRANCH_PAGE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(892806213958306296)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47702156422190790)
,p_name=>'P70_BRANCH_APP'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(892806213958306296)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56955223686600309)
,p_name=>'P70_DSCRPCION_PRDIO_USO_SLO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(892806213958306296)
,p_prompt=>'<b>Uso Suelo Predio</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_PREDIO_USO_SUELO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d ,',
'       id_prdio_uso_slo r',
'  from df_c_predios_uso_suelo',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el uso del predio.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56955369515600310)
,p_name=>'P70_DSCRPCION_PRDIO_DSTNO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(892806213958306296)
,p_prompt=>'<b>Destino Predio</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d ,',
'        id_prdio_dstno r',
'   from df_i_predios_destino',
'   where cdgo_clnte            =  :F_CDGO_CLNTE',
'    and id_impsto = :P70_IMPUESTO',
'   order by dscrpcion'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P70_IMPUESTO'
,p_ajax_items_to_submit=>'P70_IMPUESTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el destino del predio.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56955401005600311)
,p_name=>'P70_DSCRPCION_ESTRTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(892806213958306296)
,p_prompt=>'<b>Estrato</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_ESTRATO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_estrto d,',
'        cdgo_estrto r',
'   from df_s_estratos',
'   order by r;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P70_IMPUESTO'
,p_ajax_items_to_submit=>'P70_IMPUESTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el estrato.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(172355754328465820)
,p_name=>'Refresh_region_esquema_predio'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(683258040256163028)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(172355813562465821)
,p_event_id=>wwv_flow_api.id(172355754328465820)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(683258040256163028)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(172355901874465822)
,p_name=>'Refresh_btn_nuevo'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(172355377200465816)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(172356092517465823)
,p_event_id=>wwv_flow_api.id(172355901874465822)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(683258040256163028)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(55627384560594523)
,p_name=>'al cambiar, ejecuta js'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P70_FECHA_INICIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(55627493863594524)
,p_event_id=>wwv_flow_api.id(55627384560594523)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P70_FECHA_FIN").datepicker( ''option'' , ''minDate'' , $("#P70_FECHA_INICIAL").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47853554677794607)
,p_name=>'Al cerrar modal '
,p_event_sequence=>70
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47853688973794608)
,p_event_id=>wwv_flow_api.id(47853554677794607)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(683258040256163028)
,p_stop_execution_on_error=>'Y'
);
end;
/
