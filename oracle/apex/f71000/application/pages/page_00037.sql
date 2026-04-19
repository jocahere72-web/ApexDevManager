prompt --application/pages/page_00037
begin
wwv_flow_api.create_page(
 p_id=>37
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Tipos Acuerdos de Pago'
,p_step_title=>'Tipos Acuerdos de Pago'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20191202092930'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(42405168565318521)
,p_plug_name=>'Tipos Acuerdos de Pago'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select id_cnvnio_tpo,',
'       dscrpcion,',
'       cdgo_sjto_tpo,',
'       dscrpcion_rngo_vgncia,',
'       fcha_lmte_elbrcion,',
'       nmro_mxmo_ctas,',
'       fcha_mxma_ctas,',
'       indcdor_rqre_grntia,',
'       indcdor_exge_cta_incial,',
'       indcdor_lmta_prcntje,',
'       id_dcrto,',
'       actvo',
'  from v_gf_d_convenios_tipo',
'  where cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(42405202189318521)
,p_name=>'Tipos de Convenios'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.:RP,38:P38_ID_CNVNIO_TPO:#ID_CNVNIO_TPO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'SROMERO'
,p_internal_uid=>42405202189318521
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(42405610437318526)
,p_db_column_name=>'ID_CNVNIO_TPO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Cnvnio Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(42406403398318526)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(42406895272318526)
,p_db_column_name=>'CDGO_SJTO_TPO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Tipo de Sujeto <br>Tributo'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(177373668374050686)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(42344030119115409)
,p_db_column_name=>'DSCRPCION_RNGO_VGNCIA'
,p_display_order=>14
,p_column_identifier=>'AJ'
,p_column_label=>'Vigencias'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(42407641542318527)
,p_db_column_name=>'FCHA_LMTE_ELBRCION'
,p_display_order=>24
,p_column_identifier=>'F'
,p_column_label=>unistr('Fecha L\00EDmite  <br> de Elaboraci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(42408055884318527)
,p_db_column_name=>'NMRO_MXMO_CTAS'
,p_display_order=>34
,p_column_identifier=>'G'
,p_column_label=>unistr('N\00B0 M\00E1ximo <br> Cuotas')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(42408453145318527)
,p_db_column_name=>'FCHA_MXMA_CTAS'
,p_display_order=>44
,p_column_identifier=>'H'
,p_column_label=>unistr('Fecha  <br>M\00E1xima Cuotas')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(42409638477318528)
,p_db_column_name=>'INDCDOR_RQRE_GRNTIA'
,p_display_order=>54
,p_column_identifier=>'K'
,p_column_label=>unistr('\00BFRequiere <br>Garant\00EDa?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(177372678491050686)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(42410871987318528)
,p_db_column_name=>'INDCDOR_EXGE_CTA_INCIAL'
,p_display_order=>64
,p_column_identifier=>'N'
,p_column_label=>unistr('\00BFExige  <br>Cuota Inicial?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(177372678491050686)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(42412491332318529)
,p_db_column_name=>'INDCDOR_LMTA_PRCNTJE'
,p_display_order=>74
,p_column_identifier=>'R'
,p_column_label=>unistr('\00BFLimita % <br> Cuota Inicial?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(177372678491050686)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(42413668101318530)
,p_db_column_name=>'ID_DCRTO'
,p_display_order=>84
,p_column_identifier=>'U'
,p_column_label=>'Decreto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(34666281958953826)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(42419229352318533)
,p_db_column_name=>'ACTVO'
,p_display_order=>94
,p_column_identifier=>'AI'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(177372678491050686)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(42434967295341930)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'424350'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION:DSCRPCION_RNGO_VGNCIA:CDGO_SJTO_TPO:FCHA_LMTE_ELBRCION:NMRO_MXMO_CTAS:FCHA_MXMA_CTAS:INDCDOR_RQRE_GRNTIA:INDCDOR_EXGE_CTA_INCIAL:INDCDOR_LMTA_PRCNTJE:ID_DCRTO:ACTVO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43203055008835832)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(43203114956835833)
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
'<p align="justify">Funcionalidad que permite consultar los tipos de acuerdo de Pago existentes.</p>',
unistr('<p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario</p></i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17304733613804268)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(43203055008835832)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(43203256754835834)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(43203055008835832)
,p_button_name=>'BTN_NUEVO_TIPO_CONVENIO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Tipo Acuerdo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.:RP,38::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
end;
/
