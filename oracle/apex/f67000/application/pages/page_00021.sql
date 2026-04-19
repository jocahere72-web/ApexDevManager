prompt --application/pages/page_00021
begin
wwv_flow_api.create_page(
 p_id=>21
,p_user_interface_id=>wwv_flow_api.id(71698179048188014)
,p_name=>'Consulta Envios Email MailJet'
,p_step_title=>'Consulta Envios Email'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_step_template=>wwv_flow_api.id(71592158849187941)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251015162320'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(417830134077079744)
,p_plug_name=>'Contenedor'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(71630979842187961)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(476770711569322300)
,p_plug_name=>'Envios realizados desde MailJet'
,p_parent_plug_id=>wwv_flow_api.id(417830134077079744)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71623038711187958)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_envio',
'        ,b.id_envio_mdio',
'        ,a.id_envio_prgrmdo',
'        ,a.dscrpcion_envio_prgmdo',
'        ,a.fcha_rgstro',
'        ,b.dstno',
'        ,b.asnto',
'        ,b.txto_mnsje',
'        ,b.cdgo_envio_estdo',
'        ,b.dscrpcion_envio_estdo',
'        ,c.messagehref ',
'        ,c.cdgo_tpo_mvmnto mnvnto_inicio',
'        ,c.rspsta rspsta_inicio',
'        ,c.status status_inicio',
'        ,b.status status_actual',
'        ,b.fcha_rspsta ultma_cnslta',
'        ,(select count(*)',
'            from ma_g_envios_medio_respuesta   r',
'            where r.cdgo_tpo_mvmnto = ''SONDEO''',
'         and r.id_envio_mdio = b.id_envio_mdio) nmro_cnsltas',
'        , ''<span aria-hidden="true" class="fa fa-eye"></span>'' as correo',
'    , case',
'          when (select count(*)',
'                 from ma_g_envios_adjntos d',
'                where d.id_envio = a.id_envio) > 0 then',
'          ''<span aria-hidden="true" class="fa fa-eye"></span>''',
'          end as adjunto',
'        , ''<span class="fa fa-cloud-download fa-1x fa-spin"></span>'' as Certificado',
'from  v_ma_g_envios  a    ',
'    join v_ma_g_envios_medio   b on   a.id_envio = b.id_envio',
'    join  (select cdgo_tpo_mvmnto, rspsta, status, messagehref, messageid',
'            from ma_g_envios_medio_respuesta  ',
'            where cdgo_tpo_mvmnto = ''INICIO'') c on c.messageid = b.messageid',
' where a.cdgo_clnte            = :F_CDGO_CLNTE',
'      and b.cdgo_envio_mdio = ''EML''',
'      and a.id_envio_prgrmdo = :P21_ENVIO_PROGRAMADO',
'      and (trunc(a.fcha_rgstro)           between :P21_FCHA_INCIO_ENVIO   and :P21_FCHA_FIN_ENVIO) ',
'      and (lower(b.dstno) = lower(:P21_EMAIL) or :P21_EMAIL is null)'))
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
 p_id=>wwv_flow_api.id(229515550941813108)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JPRADA'
,p_internal_uid=>229515550941813108
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(229515630188813109)
,p_db_column_name=>'ID_ENVIO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Envio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(229515783416813110)
,p_db_column_name=>'ID_ENVIO_MDIO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Envio Mdio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(229515888844813111)
,p_db_column_name=>'ID_ENVIO_PRGRMDO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Envio Prgrmdo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(229515996744813112)
,p_db_column_name=>'DSCRPCION_ENVIO_PRGMDO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Tipo de Envio'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(229516091284813113)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Fecha Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(229516139104813114)
,p_db_column_name=>'DSTNO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Destino'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(20094016347032201)
,p_db_column_name=>'ASNTO'
,p_display_order=>70
,p_column_identifier=>'Q'
,p_column_label=>'Asunto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(229516222430813115)
,p_db_column_name=>'TXTO_MNSJE'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Txto Mnsje'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(229516323790813116)
,p_db_column_name=>'CDGO_ENVIO_ESTDO'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Cdgo Envio Estdo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(229516415823813117)
,p_db_column_name=>'DSCRPCION_ENVIO_ESTDO'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(229516541821813118)
,p_db_column_name=>'MESSAGEHREF'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'Messagehref'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(229516661654813119)
,p_db_column_name=>'MNVNTO_INICIO'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>'Mnvnto Inicio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(229516745206813120)
,p_db_column_name=>'RSPSTA_INICIO'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>'Rspsta Inicio'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(229516892612813121)
,p_db_column_name=>'STATUS_INICIO'
,p_display_order=>140
,p_column_identifier=>'M'
,p_column_label=>'Estado Inicio'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(20094162112032202)
,p_db_column_name=>'STATUS_ACTUAL'
,p_display_order=>150
,p_column_identifier=>'R'
,p_column_label=>'Estado Actual'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21590643218829301)
,p_db_column_name=>'ULTMA_CNSLTA'
,p_display_order=>160
,p_column_identifier=>'S'
,p_column_label=>unistr('\00DAltima Consulta')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21590883117829303)
,p_db_column_name=>'NMRO_CNSLTAS'
,p_display_order=>170
,p_column_identifier=>'U'
,p_column_label=>unistr('N\00FAmero Consultas')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5503260796929326)
,p_db_column_name=>'CORREO'
,p_display_order=>180
,p_column_identifier=>'V'
,p_column_label=>'Correo Enviado'
,p_column_link=>'f?p=&APP_ID.:2024001:&SESSION.::&DEBUG.:RP:P2024001_ID_ENVIO:#ID_ENVIO#'
,p_column_linktext=>'#CORREO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5503332360929327)
,p_db_column_name=>'ADJUNTO'
,p_display_order=>190
,p_column_identifier=>'W'
,p_column_label=>'Adjuntos Enviados'
,p_column_link=>'f?p=&APP_ID.:2024002:&SESSION.::&DEBUG.:RP:P2024002_ID_ENVIO:#ID_ENVIO#'
,p_column_linktext=>'#ADJUNTO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5503449572929328)
,p_db_column_name=>'CERTIFICADO'
,p_display_order=>200
,p_column_identifier=>'X'
,p_column_label=>unistr('Constancia de Env\00EDo')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(229561733162001243)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2295618'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>25
,p_report_columns=>'ID_ENVIO:DSCRPCION_ENVIO_PRGMDO:FCHA_RGSTRO:DSTNO:DSCRPCION_ENVIO_ESTDO:STATUS_INICIO:ASNTO:STATUS_ACTUAL:ULTMA_CNSLTA:NMRO_CNSLTAS:CORREO:ADJUNTO:'
,p_sort_column_1=>'FCHA_RGSTRO'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(469268917479528954)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71624143472187958)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
unistr('    <p align="justify">En esta opci\00F3n se puede consultar los envios realizados desde MailJet.<br> '),
'        ',
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(476770649408322299)
,p_plug_name=>'Parametros de Busqueda '
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(71613067978187954)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(193616129810878045)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(476770649408322299)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71676369474187991)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5503563193929329)
,p_name=>'P21_ID_ENVIO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(476770649408322299)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(193616506702878047)
,p_name=>'P21_ENVIO_PROGRAMADO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(476770649408322299)
,p_prompt=>'<b>Envio Programado</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct a.dscrpcion_envio_prgmdo, a.id_envio_prgrmdo',
'from v_ma_g_envios  a    ',
'    join v_ma_g_envios_medio   b on   a.id_envio = b.id_envio',
'    join  (select cdgo_tpo_mvmnto, rspsta, status, messagehref, messageid',
'            from ma_g_envios_medio_respuesta  ',
'            where cdgo_tpo_mvmnto = ''INICIO'') c on c.messageid = b.messageid ',
'order by 1',
'--select  dscrpcion || '' ['' ||idntfcdor|| '']'', ',
'--        id_envio_prgrmdo  ',
'--from ma_g_envios_programado',
'--order by 1;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el envi\00F3 programado que desea consultar')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(193616911957878049)
,p_name=>'P21_FCHA_INCIO_ENVIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(476770649408322299)
,p_prompt=>'<b>Fecha Inicio Envio</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>15
,p_tag_attributes=>'onkeypress="return false "'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha de inicio en la que se registro el envi\00F3 programado.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(193617861360878050)
,p_name=>'P21_FCHA_FIN_ENVIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(476770649408322299)
,p_prompt=>'<b>Fecha Fin Envio</b>'
,p_source=>'select last_day(sysdate) from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_cMaxlength=>15
,p_tag_attributes=>'onkeypress="return false "'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(71675989099187989)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha final en la que se registro el envi\00F3 programado.')
,p_attribute_02=>'&P21_FCHA_SLCTUD_INCIO.'
,p_attribute_03=>'&P21_ULTMO_DIA_MES.'
,p_attribute_04=>'both'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(193618784688878050)
,p_name=>'P21_ULTMO_DIA_MES'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(476770649408322299)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select last_day(sysdate)',
'	from dual'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(229515038265813103)
,p_name=>'P21_EMAIL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(476770649408322299)
,p_prompt=>unistr('<b>Correo Electr\00F3nico</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71675659070187989)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el correo al que se le envio el email que desea consultar'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(229515137660813104)
,p_validation_name=>unistr('validar direcci\00F3n de correo')
,p_validation_sequence=>10
,p_validation=>'regexp_like (:P21_EMAIL, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('Direcci\00F3n de correo no valida')
,p_when_button_pressed=>wwv_flow_api.id(193616129810878045)
,p_associated_item=>wwv_flow_api.id(229515038265813103)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(229515294208813105)
,p_validation_name=>'Fecha Inicial no nula'
,p_validation_sequence=>20
,p_validation=>'P21_FCHA_INCIO_ENVIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor escoja la fecha inicial del envi\00F3 de correo que desea consultar')
,p_when_button_pressed=>wwv_flow_api.id(193616129810878045)
,p_associated_item=>wwv_flow_api.id(193616911957878049)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(229515491096813107)
,p_validation_name=>'Fecha fin no nula'
,p_validation_sequence=>30
,p_validation=>'P21_FCHA_FIN_ENVIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor escoja la fecha final del envi\00F3 de correo que desea consultar')
,p_associated_item=>wwv_flow_api.id(193617861360878050)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(229517802547813131)
,p_validation_name=>'Envio programado no sea nulo'
,p_validation_sequence=>40
,p_validation=>'P21_ENVIO_PROGRAMADO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Por favor seleccione el envio programado que desea consultar'
,p_when_button_pressed=>wwv_flow_api.id(193616129810878045)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5503629277929330)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar Certificado'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_object              		json_object_t := json_object_t();  ',
'     v_json                		clob; ',
'	 v_id_envio                 number := :P21_ID_ENVIO;  ',
'     v_gn_d_reportes         	gn_d_reportes%rowtype;',
'     v_blob              		blob;',
'     ',
'begin      ',
'      ',
'    -- Llenar JSON con datos a usar en REPORT QUERY   ',
'        v_object.put(''cdgo_clnte'', :F_CDGO_CLNTE);',
'        v_object.put(''id_envio'',v_id_envio);',
'',
'        v_json := v_object.to_clob();',
'        ',
'    -- Generar Reporte      ',
'        apex_session.attach( p_app_id     => 66000',
'                           , p_page_id    => 37',
'                           , p_session_id => v(''APP_SESSION'') );',
'',
'        --BUSCAMOS LOS DATOS DE PLANTILLA DE REPORTES',
'        select r.*',
'          into v_gn_d_reportes ',
'          from gn_d_reportes r',
'         where r.cdgo_rprte_grpo in (''CCE''); ',
'',
'        --SETEAMOS EN SESSION LOS ITEMS NECESARIOS PARA GENERAR EL ARCHIVO     ',
'        apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'        apex_util.set_session_state(''P37_ID_RPRTE'', v_gn_d_reportes.id_rprte);',
'        apex_util.set_session_state(''P37_JSON''    , v_json);',
'        ',
'        v_blob := apex_util.get_print_document( p_application_id     => 66000, ',
'                                                    p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,',
'                                                    p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,',
'                                                    p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,',
'                                                    p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );',
'',
'        insert into muerto (n_001,b_001,n_002, c_001) values (321321,v_blob,v_id_envio, v_json); commit;',
'        ',
'        htp.init;',
'        owa_util.mime_header(''application/pdf'', FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(v_blob));',
unistr('        htp.p(''Content-Disposition: attachment; filename="'' ||''Constancia de Env\00EDo.pdf'' || ''"'' );'),
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(v_blob);',
'        apex_application.stop_apex_engine;',
'                     ',
'         ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DESCARGARCERTIFICADO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
