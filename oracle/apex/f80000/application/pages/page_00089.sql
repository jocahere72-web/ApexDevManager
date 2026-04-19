prompt --application/pages/page_00089
begin
wwv_flow_api.create_page(
 p_id=>89
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Flujo de Medida de Secuestre-proyeccion'
,p_step_title=>'Flujo de Medida de Secuestre'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ABRACHE'
,p_last_upd_yyyymmddhh24miss=>'20200213180930'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(59104628695042801)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'<i>',
unistr('<p>Funcionalidad que permite realizar la proyecci\00F3n de los actos relacionados a la medida de secuestre</p>'),
'<p><b>1.</b>Permite generar el/los documento(s) asociados a la medida de secuestre.</p>',
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113251782975065822)
,p_plug_name=>'Flujo Secuestre'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113374217656462802)
,p_plug_name=>'Datos Medida de Secuestre'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113375148173462811)
,p_plug_name=>'Actos Secuestre'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>6
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion,',
'        a.id_actos_tpo_trea,',
'        a.id_acto_tpo,',
'        case',
'                 when (c.id_acto is null)then',
'                     ''<center>',
'                         <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">''',
'                             ||nvl2(c.id_scstre_dcmnto, ''Modificar '', ''Generar '')',
'                             ||''<span class="fa ''||nvl2(c.id_scstre_dcmnto,''fa-edit'',''fa-gear'')||''"></span>',
'                         </button>',
'                     </center>''',
'        end  ACCION,',
'        c.id_scstre_dcmnto',
'     from gn_d_actos_tipo_tarea a',
'    inner join  gn_d_actos_tipo b on b.id_acto_tpo = a.id_acto_tpo',
'     left join  mc_g_secuestre_documentos c on c.id_acto_tpo = a.id_acto_tpo',
'                                           and c.id_fljo_trea = a.id_fljo_trea',
'                                           and c.id_scstre_gstion  = :P89_ID_SCSTRE_GSTION',
'     left join mc_g_secuestre_gestion d on d.id_scstre_gstion = c.id_scstre_gstion',
'                                       and d.id_instncia_fljo= :F_ID_INSTNCIA_FLJO',
'where a.cdgo_clnte      = :F_CDGO_CLNTE     and',
'      a.id_fljo_trea    = :F_ID_FLJO_TREA   and',
'      a.actvo           = ''S'';',
'          '))
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
 p_id=>wwv_flow_api.id(113537349233471706)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ABRACHE'
,p_internal_uid=>113537349233471706
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113537414502471707)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Actos Medida de Secuestre'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113537548132471708)
,p_db_column_name=>'ID_ACTOS_TPO_TREA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Actos Tpo Trea'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113537669540471709)
,p_db_column_name=>'ID_ACTO_TPO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Acto Tpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113537773986471710)
,p_db_column_name=>'ACCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Acci\00F3n')
,p_column_link=>'f?p=&APP_ID.:93:&SESSION.::&DEBUG.:RP,93:P93_ID_ACTO_TPO,P93_ID_SCSTRE_GSTION,P93_ID_FLJO_TREA,P93_ID_SCSTRE_DCMNTO:#ID_ACTO_TPO#,&P89_ID_SCSTRE_GSTION.,&F_ID_FLJO_TREA.,#ID_SCSTRE_DCMNTO#'
,p_column_linktext=>'#ACCION#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113538202681471715)
,p_db_column_name=>'ID_SCSTRE_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Id Scstre Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(113550015575477381)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1135501'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION:ID_ACTOS_TPO_TREA:ID_ACTO_TPO:ACCION:ID_SCSTRE_DCMNTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(113538485867471717)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <b>',
'        <center>Opciones ',
'            <i class="fa fa-gears" aria-hidden="true"></i>',
'        </center>',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113538624682471719)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(113538485867471717)
,p_button_name=>'btn_Proyectar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Proyectar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_scstre_estdo',
'from mc_g_secuestre_estados a',
'where a.id_scstre_gstion = :P89_ID_SCSTRE_GSTION',
'and a.id_fljo_trea = :F_ID_FLJO_TREA;'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113872714467361803)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(113538485867471717)
,p_button_name=>'Regresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>unistr('Regresar a Gesti\00F3n <br>de Secuestre')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:88:&SESSION.::&DEBUG.:RP,88::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113364763457389903)
,p_name=>'P89_ID_INSTNCIA_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(113251782975065822)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113374324151462803)
,p_name=>'P89_ID_SCSTRE_GSTION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(113374217656462802)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_SCSTRE_GSTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113374401086462804)
,p_name=>'P89_FCHA_SCSTRE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(113374217656462802)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha de Registro'
,p_source=>'FCHA_SCSTRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113374564635462805)
,p_name=>'P89_NOMBRE_SECUESTRE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(113374217656462802)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Secuestre'
,p_source=>'NOMBRE_SECUESTRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113374814049462808)
,p_name=>'P89_NOMBRE_AUX_SECUESTRE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(113374217656462802)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Auxiliar de Secuestre'
,p_source=>'NOMBRE_AUX_SECUESTRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>403
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113374955102462809)
,p_name=>'P89_NMRO_ACTO_OFCIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(113374217656462802)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Oficio de Embargo'
,p_source=>'NMRO_ACTO_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113375049698462810)
,p_name=>'P89_NMRO_RSLCION_EMB'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(113374217656462802)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Resoluci\00F3n de Embargo')
,p_source=>'NMRO_RSLCION_EMB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(113374183532462801)
,p_computation_sequence=>10
,p_computation_item=>'F_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P89_ID_INSTNCIA_FLJO'
,p_compute_when=>'P89_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(113513526532286101)
,p_computation_sequence=>20
,p_computation_item=>'P89_ID_SCSTRE_GSTION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'v_id_scstre_gstion v_mc_g_secuestre_gestion.id_scstre_gstion%type;',
'',
'begin',
'select a.id_scstre_gstion',
'into v_id_scstre_gstion',
'from v_mc_g_secuestre_gestion a',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'',
'return v_id_scstre_gstion;',
'',
'end;'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(113374788411462807)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from'
,p_attribute_02=>'V_MC_G_SECUESTRE_GESTION'
,p_attribute_03=>'P89_ID_SCSTRE_GSTION'
,p_attribute_04=>'ID_SCSTRE_GSTION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(113538839266471721)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cambiar estado de Etapa'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pkg_cb_medidas_cautelares.prc_rg_estado_dcmnto_secuestre (p_id_scstre_gstion  => :P89_ID_SCSTRE_GSTION ,',
'                                                          p_id_fljo_trea      => :F_ID_FLJO_TREA,',
'                                                          p_id_instncia_fljo  => :F_ID_INSTNCIA_FLJO,',
'                                                          p_id_usrio          => :F_ID_USRIO,',
'                                                          p_cdgo_clnte        => :F_CDGO_CLNTE);',
'                                                          ',
'                                                          ',
'                               '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(113538624682471719)
,p_process_success_message=>'Documentos Proyectados!!'
);
end;
/
