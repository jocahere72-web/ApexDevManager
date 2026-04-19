prompt --application/pages/page_00309
begin
wwv_flow_api.create_page(
 p_id=>309
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Impuesto de Telefon\00EDa')
,p_step_title=>unistr('Impuesto de Telefon\00EDa')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20250326144245'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(159922238384958501)
,p_plug_name=>'Cabecera'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>unistr('<h2 ><center><b>CARGUE DE INFORMACI\00D3N IMPUESTO TELEFON\00CDA.</b></center></h2>')
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(159922389483958502)
,p_plug_name=>'SUJETO DEL TRIBUTO'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(159923461294958513)
,p_plug_name=>unistr('Informaci\00F3n Sujeto Impuesto')
,p_parent_plug_id=>wwv_flow_api.id(159922389483958502)
,p_region_template_options=>'#DEFAULT#:margin-top-sm'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  distinct nmbre_rzon_scial as nmbre_rzon_scial',
'     from gi_d_usuarios_telefonia a',
'     where a.nit= :P309_IDNTFCCION',
'     and a.cdgo_clnte = :F_CDGO_CLNTE',
'     and activo = ''S''',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P309_IDNTFCCION'
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
 p_id=>wwv_flow_api.id(159923584088958514)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'VROMERO'
,p_internal_uid=>159923584088958514
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(159923647601958515)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Nombre/ Raz\00F3n Social')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(159974344208577983)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1599744'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_RZON_SCIAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(160001781858477901)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <center>Ayuda ',
'            <i class="fa fa-question-circle" aria-hidden="true"></i>',
'         </center>',
'    </b>',
'</h5>',
'<center>',
unistr('    <i>Descargue los archivos gu\00EDas para su presentaci\00F3n</i>'),
'  </center>',
'<br>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(160001802959477902)
,p_plug_name=>unistr('Archivos Gu\00EDas ')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    id_telefono_archvo_tpo,',
'    nmbre || '': '' || dscrpcion as nmbre,',
'    dbms_lob.getlength(file_blob) file_blob,',
'    file_name,',
'    file_mimetype,',
'    dscrpcion',
'from',
'    df_i_telefono_archivo_tipo',
'    where actvo = ''S''',
'    order by 2;',
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
 p_id=>wwv_flow_api.id(160001919208477903)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'N'
,p_owner=>'VROMERO'
,p_internal_uid=>160001919208477903
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160002024101477904)
,p_db_column_name=>'ID_TELEFONO_ARCHVO_TPO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Telefono Archvo Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160002159801477905)
,p_db_column_name=>'NMBRE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160002289038477906)
,p_db_column_name=>'FILE_BLOB'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Archivos Gu\00EDas ')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:DF_I_TELEFONO_ARCHIVO_TIPO:FILE_BLOB:ID_TELEFONO_ARCHVO_TPO::FILE_MIMETYPE:FILE_NAME:::attachment:#NMBRE#:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160002393961477907)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160002485407477908)
,p_db_column_name=>'FILE_MIMETYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'File Mimetype'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(160002503527477909)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Dscrpcion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(160017997144531476)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1600180'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_TELEFONO_ARCHVO_TPO:NMBRE:FILE_BLOB:FILE_NAME:FILE_MIMETYPE:DSCRPCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(160355192574386811)
,p_plug_name=>'ARCHIVOS CARGADOS'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  distinct nmbre_rzon_scial as nmbre_rzon_scial',
'     from gi_d_usuarios_telefonia a',
'     where a.nit= :P309_IDNTFCCION',
'     and a.cdgo_clnte = :F_CDGO_CLNTE',
'     and activo = ''S'''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(159924068416958519)
,p_plug_name=>'ARCHIVOS CARGADOS'
,p_parent_plug_id=>wwv_flow_api.id(160355192574386811)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.file_name as Nombre_Archivo',
'        , b.nmbre as Tipo_de_Archivo',
'        , a.id_infrmcion_telefono ',
'        , a.fcha_dgta as Fecha_de_Registro',
'        , a.fcha_mdfca as Fecha_de_Actualizacion',
'        , a.vgncia as Vigencia',
'        , c.dscrpcion as Periodo,',
'        case',
'        when extract(day from a.fcha_dgta) > 14 and b.id_telefono_archvo_tpo = 1  then ''extemporaneo''',
'        else null',
'        end as cargue',
'    from gi_g_informacion_telefono     a',
'    join df_i_telefono_archivo_tipo b on a.id_telefono_archvo_tpo = b.id_telefono_archvo_tpo',
'    join df_i_periodos c on a.id_prdo = c.id_prdo',
'    join gi_d_usuarios_telefonia d on a.id_usrio_tlfnia = d.id_usrio_tlfnia',
'   where  d.nit= :P309_IDNTFCCION ',
'   and    c.id_impsto =:P309_ID_IMPSTO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  distinct nmbre_rzon_scial as nmbre_rzon_scial',
'     from gi_d_usuarios_telefonia ',
'     where nit= :P309_IDNTFCCION',
'     and   cdgo_clnte = :F_CDGO_CLNTE'))
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
 p_id=>wwv_flow_api.id(160165236318001349)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:308:&SESSION.::&DEBUG.:RP,308:P308_ID_INFRMCION_TELEFONO,P308_CDGO_CLNTE,P308_VGNCIA,P308_IMPSTO,P308_SBMPSTO,P308_PRDO:#ID_INFRMCION_TELEFONO#,&F_CDGO_CLNTE.,#VIGENCIA#,&P309_ID_IMPSTO.,&P309_SBMPSTO.,#PERIODO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'VROMERO'
,p_internal_uid=>160165236318001349
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161318542030355720)
,p_db_column_name=>'NOMBRE_ARCHIVO'
,p_display_order=>10
,p_column_identifier=>'O'
,p_column_label=>'Nombre Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161318679933355721)
,p_db_column_name=>'TIPO_DE_ARCHIVO'
,p_display_order=>20
,p_column_identifier=>'P'
,p_column_label=>'Tipo De Archivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161318745852355722)
,p_db_column_name=>'ID_INFRMCION_TELEFONO'
,p_display_order=>30
,p_column_identifier=>'Q'
,p_column_label=>'Id Infrmcion Telefono'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161318875706355723)
,p_db_column_name=>'FECHA_DE_REGISTRO'
,p_display_order=>40
,p_column_identifier=>'R'
,p_column_label=>'Fecha De Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161318928508355724)
,p_db_column_name=>'FECHA_DE_ACTUALIZACION'
,p_display_order=>50
,p_column_identifier=>'S'
,p_column_label=>'Fecha De Actualizacion'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161319071216355725)
,p_db_column_name=>'VIGENCIA'
,p_display_order=>60
,p_column_identifier=>'T'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161319188758355726)
,p_db_column_name=>'PERIODO'
,p_display_order=>70
,p_column_identifier=>'U'
,p_column_label=>'Periodo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(162377311988717034)
,p_db_column_name=>'CARGUE'
,p_display_order=>80
,p_column_identifier=>'V'
,p_column_label=>'Cargue'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(160361632146445472)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1603617'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NOMBRE_ARCHIVO:TIPO_DE_ARCHIVO:FECHA_DE_REGISTRO:FECHA_DE_ACTUALIZACION:VIGENCIA:PERIODO:'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(163335597357583957)
,p_report_id=>wwv_flow_api.id(160361632146445472)
,p_name=>unistr('PRESENTACI\00D3N ARCHIVO')
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CARGUE'
,p_operator=>'='
,p_expr=>'extemporaneo'
,p_condition_sql=>' (case when ("CARGUE" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''extemporaneo''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#FF7755'
,p_row_font_color=>'#000000'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(159923104503958510)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(159922389483958502)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(159922945596958508)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(159922389483958502)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,309::'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(160355201508386812)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(160355192574386811)
,p_button_name=>'BTN_NUEVO_ACHIVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Achivo'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:308:&SESSION.::&DEBUG.:RP,308:P308_IMPSTO,P308_SBMPSTO,P308_CDGO_CLNTE,P308_ID_USRIO_TLFNIA:&P309_ID_IMPSTO.,&P309_SBMPSTO.,&F_CDGO_CLNTE.,&P309_ID_USRIO_TLFNIA.'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(159922536291958504)
,p_name=>'P309_CDGO_CLNTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(159922389483958502)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(159922687672958505)
,p_name=>'P309_IDNTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(159922389483958502)
,p_prompt=>'NIT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(159922803226958507)
,p_name=>'P309_ID_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(159922389483958502)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(159923895735958517)
,p_name=>'P309_ID_SJTO_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(159922389483958502)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(160367160061629205)
,p_name=>'P309_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(159922389483958502)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(161702899639812104)
,p_name=>'P309_ID_USRIO_TLFNIA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(159922389483958502)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(161702712134812103)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar usuario Telefonia'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_usrio_tlfnia ',
'into :P309_ID_USRIO_TLFNIA',
'from gi_d_usuarios_telefonia',
'where nit= :P309_IDNTFCCION',
'and activo = ''S'';'))
,p_process_error_message=>unistr('No se ha encontrado esa identificaci\00F3n registrada o se encuentra inactiva.')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Identificaci\00F3n Encontrada')
);
end;
/
