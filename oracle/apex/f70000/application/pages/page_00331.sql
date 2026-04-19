prompt --application/pages/page_00331
begin
wwv_flow_api.create_page(
 p_id=>331
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Param\00E9tricas Usuarios Telefon\00EDa')
,p_step_title=>unistr('Param\00E9tricas Usuarios Telefon\00EDa')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'VROMERO'
,p_last_upd_yyyymmddhh24miss=>'20240714164230'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(160109138575732801)
,p_plug_name=>unistr('Usuarios Asociados a Empresa De Telefon\00EDa ')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    id_usrio_tlfnia,',
'    cdgo_clnte,',
'    case cdgo_idntfccion_tpo',
unistr('        when ''C'' then ''C\00E9dula De Ciudadan\00EDa'''),
'        when ''D'' then ''Tipo Id Desconocido - D''',
unistr('        when ''E'' then ''C\00E9dula De Extranjeria'''),
'        when ''M'' then ''Matricula''',
unistr('        when ''N'' then ''N\00FAmero De Identificaci\00F3n Tributaria'''),
'        when ''R'' then ''Otros''',
'        when ''P'' then ''Pasaportes''',
'        when ''Y'' then ''Registro Civil''',
'        when ''S'' then ''Secuencial''',
'        when ''T'' then ''Tarjeta De Identidad''',
'        when ''X'' then ''No Tiene Identificacion''',
'        else cdgo_idntfccion_tpo',
unistr('    end as "Tipo Identificaci\00F3n",'),
unistr('    idntfccion as "Identificaci\00F3n",'),
'    prmer_nmbre || '' '' || sgndo_nmbre || '' '' || prmer_aplldo || '' '' || sgndo_aplldo as "Nombre Encargado",',
'    cllar as "Celular",',
'    email as "Correo",',
'    nit as "Nit",',
'    nmbre_rzon_scial as "Nombre Empresa",',
'    case activo',
'        when ''S'' then ''Si''',
'        when ''N'' then ''No''',
'        else activo',
unistr('    end as "\00BFActivo?"'),
'from ',
'    gi_d_usuarios_telefonia',
'where ',
'    cdgo_clnte = :F_CDGO_CLNTE;',
'',
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
 p_id=>wwv_flow_api.id(160111816646732828)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:332:&SESSION.::&DEBUG.:RP:P332_BRANCH,P332_ID_USRIO_TLFNIA,P332_CDGO_CLNTE:&APP_PAGE_ID.,#ID_USRIO_TLFNIA#,&F_CDGO_CLNTE.'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'VROMERO'
,p_internal_uid=>160111816646732828
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160111917782732829)
,p_db_column_name=>'ID_USRIO_TLFNIA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Usrio Tlfnia'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160112030719732830)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Cdgo Clnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160112364383732833)
,p_db_column_name=>'Nombre Encargado'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Nombre Encargado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160112888138732838)
,p_db_column_name=>unistr('Tipo Identificaci\00F3n')
,p_display_order=>60
,p_column_identifier=>'J'
,p_column_label=>unistr('Tipo Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160112990084732839)
,p_db_column_name=>unistr('Identificaci\00F3n')
,p_display_order=>70
,p_column_identifier=>'K'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160113049137732840)
,p_db_column_name=>'Celular'
,p_display_order=>80
,p_column_identifier=>'L'
,p_column_label=>'Celular'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160113194362732841)
,p_db_column_name=>'Correo'
,p_display_order=>90
,p_column_identifier=>'M'
,p_column_label=>'Correo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160113218237732842)
,p_db_column_name=>'Nit'
,p_display_order=>100
,p_column_identifier=>'N'
,p_column_label=>'Nit'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160113342333732843)
,p_db_column_name=>'Nombre Empresa'
,p_display_order=>110
,p_column_identifier=>'O'
,p_column_label=>'Nombre Empresa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160163220452001329)
,p_db_column_name=>unistr('\00BFActivo?')
,p_display_order=>120
,p_column_identifier=>'P'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(160146581045876031)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1601466'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('Tipo Identificaci\00F3n:Identificaci\00F3n:Nombre Encargado:Celular:Correo:Nit:Nombre Empresa::\00BFActivo?')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(160113490109732844)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(160113542473732845)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br><h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
unistr('Funcionalidad que permite ingresar, modificar y eliminar usuarios relacionados con la empresa de telefon\00EDa.'),
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(160113662217732846)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(160113490109732844)
,p_button_name=>'BTN_NUEVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Registro '
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:332:&SESSION.::&DEBUG.:RP,332:P332_CDGO_CLNTE:&F_CDGO_CLNTE.'
,p_icon_css_classes=>'fa-user-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(160110768159732817)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(160109138575732801)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Usuarios Asociados a Empresa De Telefon\00EDa  - Save Interactive Grid Data')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
