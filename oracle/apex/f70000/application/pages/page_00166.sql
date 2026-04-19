prompt --application/pages/page_00166
begin
wwv_flow_api.create_page(
 p_id=>166
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Consulta de Configuraci\00F3n de Plusval\00EDa')
,p_step_title=>unistr('Consulta de Configuraci\00F3n de Plusval\00EDa')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20201006134630'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112397715273622794)
,p_plug_name=>unistr('<b>Configuraciones Plusval\00EDa</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_plsvlia_cnfgrcion    ',
'		, cdgo_clnte           ',
unistr('		, decode(indcdor_mdfca_archvo,''S'', ''S\00ED'', ''N'', ''No'' ) indcdor_mdfca_archvo  '),
'        , ( select LISTAGG(nmbre_bnco, '','') WITHIN GROUP (ORDER BY nmbre_bnco)',
'              from df_c_bancos ',
'             where id_bnco in ( select cdna ',
'                                  from table ( pkg_gn_generalidades.fnc_ca_split_table ( p_cdna => bnco_rcddor, ',
'													                                     p_crcter_dlmtdor => '':''  ) ) )  ) as bnco_rcddor',
'		, user_dgta            ',
'		, fcha_dgta            ',
'		, user_mdfca           ',
'		, fcha_mdfca           ',
'from gi_d_plusvalia_configurcion',
'where cdgo_clnte = :F_CDGO_CLNTE'))
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
 p_id=>wwv_flow_api.id(112397825757622795)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:167:&SESSION.::&DEBUG.:RP,167:P167_ID_PLSV_CNFGRCION:#ID_PLSVLIA_CNFGRCION##ID_RNTA_CNFGRCION##ID_DFNCION_RNTA#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'LOBREDOR'
,p_internal_uid=>112397825757622795
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93073650953835909)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Cdgo Clnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92954791901064506)
,p_db_column_name=>'INDCDOR_MDFCA_ARCHVO'
,p_display_order=>30
,p_column_identifier=>'U'
,p_column_label=>'Indicador Modifica<br>Archivo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93517910940184907)
,p_db_column_name=>'BNCO_RCDDOR'
,p_display_order=>40
,p_column_identifier=>'V'
,p_column_label=>'Banco<br>Recaudador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93077243782835939)
,p_db_column_name=>'USER_DGTA'
,p_display_order=>50
,p_column_identifier=>'P'
,p_column_label=>'User Dgta'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93077696071835939)
,p_db_column_name=>'FCHA_DGTA'
,p_display_order=>60
,p_column_identifier=>'Q'
,p_column_label=>'Fcha Dgta'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93078084684835940)
,p_db_column_name=>'USER_MDFCA'
,p_display_order=>70
,p_column_identifier=>'R'
,p_column_label=>'User Mdfca'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(93078429321835942)
,p_db_column_name=>'FCHA_MDFCA'
,p_display_order=>80
,p_column_identifier=>'S'
,p_column_label=>'Fcha Mdfca'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(92954613201064505)
,p_db_column_name=>'ID_PLSVLIA_CNFGRCION'
,p_display_order=>90
,p_column_identifier=>'T'
,p_column_label=>'Id Plsvlia Cnfgrcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(112416603036718167)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'930788'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>':USER_DGTA:FCHA_DGTA:USER_MDFCA:FCHA_MDFCA:ID_PLSVLIA_CNFGRCION:INDCDOR_MDFCA_ARCHVO:BNCO_RCDDOR'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112398770465622805)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
 p_id=>wwv_flow_api.id(112398937913622806)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
unistr('    <p align="justify">Funcionalidad que permite consultar las diferentes configuraciones de cada cliente conforme al proceso de liquidaci\00F3n de rentas varias.</p><br>'),
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(93079508317835979)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(112398770465622805)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.:RP,75::'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(93079941505836004)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(112398770465622805)
,p_button_name=>'BTN_NVA_CNFGRCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nueva Configuraci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gi_d_plusvalia_configurcion',
' where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(93080747430836056)
,p_branch_name=>unistr('Ir a P\00E1gina 167')
,p_branch_action=>'f?p=&APP_ID.:167:&SESSION.::&DEBUG.:RP,167::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(93079941505836004)
,p_branch_sequence=>10
);
end;
/
