prompt --application/pages/page_00073
begin
wwv_flow_api.create_page(
 p_id=>73
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Plan de Pago'
,p_step_title=>'Plan de Pago'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buttonCollapse(id) {',
'  if ($("#" + id).attr("aria-expanded") == "true") {',
'    $("#" + id).click();',
'  }',
'}'))
,p_javascript_code_onload=>'buttonCollapse(''t_Button_rightControlButton'');'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20220601080735'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(117910132723954651)
,p_plug_name=>'Datos del Convenio'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(73655524996021574)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(177351601973050625)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(117910215439954651)
,p_plug_name=>'Datos del Convenio'
,p_parent_plug_id=>wwv_flow_api.id(117910132723954651)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177322596503050602)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122245810223364301)
,p_plug_name=>unistr('Proyecci\00F3n Temporal')
,p_parent_plug_id=>wwv_flow_api.id(117910132723954651)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select n001 nmro_cta,',
'        d001 fcha_cta,',
'        n004 vlor_cptal,',
'        n005 vlor_intres,',
'        n003 vlor_fnccion,',
'        n002 vlor_cta        ',
'  from gn_g_temporal ',
'  where id_ssion = :APP_SESSION',
' order by n001'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_api.id(122245989253364302)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>122245989253364302
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122246140611364304)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122246723186364310)
,p_db_column_name=>'FCHA_CTA'
,p_display_order=>80
,p_column_identifier=>'F'
,p_column_label=>'Fecha Cuota'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122246808427364311)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>90
,p_column_identifier=>'G'
,p_column_label=>'Valor Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122246953342364312)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>100
,p_column_identifier=>'H'
,p_column_label=>unistr('Valor Inter\00E9s')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122247035178364313)
,p_db_column_name=>'VLOR_FNCCION'
,p_display_order=>110
,p_column_identifier=>'I'
,p_column_label=>unistr('Valor Financiaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122247141170364314)
,p_db_column_name=>'VLOR_CTA'
,p_display_order=>120
,p_column_identifier=>'J'
,p_column_label=>'Valor Cuota'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(122253114451368927)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1222532'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CTA:FCHA_CTA:VLOR_CPTAL:VLOR_INTRES:VLOR_FNCCION:VLOR_CTA:'
,p_sum_columns_on_break=>'VLOR_FNCCION:VLOR_CTA:VLOR_INTRES:VLOR_CPTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(119129029784269144)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
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
'    <p align="justify">Funcionalidad de Solicitud de Acuerdo de Pago.<br> ',
'        <b> <center> Paso 3 Extracto de Acuerdo de Pago </center> </b> <br>',
'        Se muestra el extracto generado de acuerdo con los datos ingresados en el paso anterior.',
'    </p>',
unistr('     <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74460177253888499)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(117910215439954651)
,p_button_name=>'BTN_PROYECTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Actualizar Plan de Pago'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74456572274888357)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(117910132723954651)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:&P69_BRANCH.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74457222361888460)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(117910132723954651)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74456980049888459)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(117910132723954651)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355657869050631)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(74469642310888569)
,p_branch_name=>unistr('Ir a P\00E1gina 70 - Garantia')
,p_branch_action=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.::P70_BRANCH:&P73_BRANCH.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(74457222361888460)
,p_branch_sequence=>20
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>'Select * from GF_D_CONVENIOS_TIPO A where a.ID_CNVNIO_TPO = :P69_ID_CNVNIO_TPO and a.indcdor_rqre_grntia = ''S'''
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(74470891972888570)
,p_branch_name=>unistr('Ir a P\00E1gina 84 - Generaci\00F3n de la solicitud')
,p_branch_action=>'f?p=&APP_ID.:84:&SESSION.::&DEBUG.:84::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(74457222361888460)
,p_branch_sequence=>30
,p_branch_condition_type=>'NOT_EXISTS'
,p_branch_condition=>'Select * from GF_D_CONVENIOS_TIPO A where a.ID_CNVNIO_TPO = :P69_ID_CNVNIO_TPO and a.indcdor_rqre_grntia = ''S'''
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(74470004867888569)
,p_branch_name=>unistr('Ir a P\00E1gina 69 - Datos Convenio')
,p_branch_action=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(74456980049888459)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74466307450888526)
,p_name=>'P73_RSPSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(117910215439954651)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75507972942266869)
,p_name=>'P73_CDGO_PRDCDAD_CTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(117910215439954651)
,p_prompt=>'Periodicidad'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_cdgo_prdcdad_cta      varchar2(5);',
'begin ',
'',
'    if :P69_ID_CNVNIO is not null then ',
'      select a.cdgo_prdcdad_cta',
'        into v_cdgo_prdcdad_cta',
'        from v_gf_g_convenios   a',
'       where a.id_cnvnio = :P69_ID_CNVNIO;',
'',
'    elsif :P69_ID_PRYCCION is not null then',
'       select a.cdgo_prdcdad_cta',
'         into v_cdgo_prdcdad_cta',
'         from gf_g_proyecciones  a',
'        where id_pryccion = :P69_ID_PRYCCION;',
'    else ',
'        v_cdgo_prdcdad_cta := ''MNS'';',
'    end if;',
'    ',
'    return  v_cdgo_prdcdad_cta;',
' ',
' end;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PERIODICIDAD'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_prdcdad as r',
'  from df_s_periodicidad',
' order by cntdad_vce_anio desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Frecuencia en la cual se pagar\00E1n las cuotas del acuerdo de pago.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75508557752269226)
,p_name=>'P73_NMRO_CTAS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(117910215439954651)
,p_prompt=>unistr('N\00B0 Cuotas')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_nmro_cta  number;',
'begin ',
'',
'    if :P69_ID_CNVNIO is not null then ',
'      select a.nmro_cta',
'        into v_nmro_cta',
'        from v_gf_g_convenios   a',
'       where a.id_cnvnio = :P69_ID_CNVNIO;',
'',
'    elsif :P69_ID_PRYCCION is not null then     ',
'        select a.nmro_cta',
'         into v_nmro_cta',
'         from gf_g_proyecciones  a',
'         where id_pryccion = :P69_ID_PRYCCION;',
'    else ',
'        v_nmro_cta := 1;',
'    end if;',
'    ',
' return v_nmro_cta;',
' ',
' end;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>3
,p_cMaxlength=>3
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese la cantidad de cuotas desea pagar la deuda.'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86087922912392862)
,p_name=>'P73_FCHA_MXMA_CTAS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(117910215439954651)
,p_prompt=>unistr(' Fecha L\00EDmite de Cuotas')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select FCHA_MXMA_CTAS',
'  from gf_d_convenios_tipo ',
'  where id_cnvnio_tpo = :P69_ID_CNVNIO_TPO'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Muestra fecha m\00E1xima de cuotas seg\00FAn tipo de acuerdo de pago.')
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86090476450397586)
,p_name=>'P73_NMRO_MXMO_CTAS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(117910215439954651)
,p_prompt=>unistr('M\00E1ximo de Cuotas')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_mxmo_ctas ',
'   from gf_d_convenios_tipo ',
'  where id_cnvnio_tpo = :P69_ID_CNVNIO_TPO'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Muestra n\00FAmero de cuotas seg\00FAn tipo de acuerdo de pago.')
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86602526441322902)
,p_name=>'P73_FCHA_PRMRA_CTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(117910215439954651)
,p_prompt=>'Fecha Primera Cuota'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_fcha_prmra_cta  gf_g_convenios.fcha_prmra_cta%type;',
'begin ',
'',
'    if :P69_ID_CNVNIO is not null then ',
'        select a.fcha_prmra_cta',
'          into v_fcha_prmra_cta',
'          from v_gf_g_convenios   a',
'         where a.id_cnvnio = :P69_ID_CNVNIO;',
'',
'    elsif :P69_ID_PRYCCION is not null then ',
'        select a.fcha_prmra_cta',
'          into v_fcha_prmra_cta',
'         from gf_g_proyecciones  a',
'         where id_pryccion = :P69_ID_PRYCCION;',
'    else',
'        v_fcha_prmra_cta := sysdate;',
'    end if;',
' return v_fcha_prmra_cta;',
' end;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese la fecha de la primera cuota del acuerdo de pago.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(90799700973906106)
,p_name=>'P73_BRANCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(117910132723954651)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(74467120773888533)
,p_validation_name=>unistr('Proyecci\00F3n Exista')
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_nmro_pryccion    number; ',
'begin ',
'     begin',
'         select count (id_ssion) ',
'           into v_nmro_pryccion',
'           from gn_g_temporal ',
'          where id_ssion = :APP_SESSION;   ',
'          ',
'     exception  ',
'         when no_data_found then ',
'             v_nmro_pryccion := 0;',
'     end;',
'    ',
'    if v_nmro_pryccion  > 0 then ',
'        return true;',
'    else ',
'        return false;',
'    end if;',
'',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('La proyecci\00F3n no es correcta, por favor verifique la parametrizaci\00F3n del calendario, n\00FAmero de cuotas, periodicidad de cuotas y fecha limite de cuotas.  ')
,p_when_button_pressed=>wwv_flow_api.id(74457222361888460)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(55461139325090601)
,p_name=>unistr('Validar N\00FAmero de Cuotas')
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(74460177253888499)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(55461290568090602)
,p_event_id=>wwv_flow_api.id(55461139325090601)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var errors = [];',
'console.log(''1'');',
'apex.message.clearErrors();',
'if(parseInt($v(''P73_NMRO_CTAS'')) > parseInt($v(''P73_NMRO_MXMO_CTAS''))){',
'     errors.push({',
'            type:       "error",',
'            location:   [ "page", "inline" ],',
'            pageItem:   "P73_NMRO_CTAS",',
unistr('            message:    ''N\00FAmero de cuotas no puede ser mayor al m\00E1ximo definido.'','),
'            unsafe:     false',
'        });    ',
'}',
'/*if (!$v(''P73_RSPSTA'')){',
'    console.log(''3'');',
'    errors.push(     {',
'            type:       "error",',
'            location:   [ "page", "inline" ],',
'            pageItem:   "P73_FCHA_MXMA_CTAS",',
unistr('            message:    ''Fecha \00FAltima cuota no puede ser mayor a la fecha m\00E1xima definida.'','),
'            unsafe:     false',
'        });    ',
'}*/',
'if (errors.length > 0 ) { ',
'    console.log(''3'');',
'    apex.message.showErrors(errors);',
'}else{   ',
'    console.log(''4'');',
'    apex.page.submit(''BTN_PROYECTAR'');',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(56879841554055013)
,p_name=>'Nuevo'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P73_FCHA_PRMRA_CTA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(56879958541055014)
,p_event_id=>wwv_flow_api.id(56879841554055013)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta       number;',
'    v_mnsje_rspsta      varchar2(1000);',
'    v_fcha_prmra_cta    gf_g_convenios.fcha_prmra_cta%type      := :P73_FCHA_PRMRA_CTA;',
'    v_cdgo_prdcdad_cta  gf_g_convenios.cdgo_prdcdad_cta%type    := :P73_CDGO_PRDCDAD_CTA;',
'    v_nmro_ctas_cnvnio  gf_g_convenios.nmro_cta%type            := :P73_NMRO_CTAS;',
'',
'begin',
'    ',
'    if v_nmro_ctas_cnvnio is null then ',
'        begin',
'            if :P69_ID_CNVNIO is not null then ',
'                select a.nmro_cta',
'                  into v_nmro_ctas_cnvnio',
'                  from gf_g_convenios   a',
'                 where a.id_cnvnio = :P69_ID_CNVNIO;',
'',
'            elsif :P69_ID_PRYCCION is not null then ',
'                select a.nmro_cta',
'                  into v_nmro_ctas_cnvnio',
'                 from gf_g_proyecciones  a',
'                 where id_pryccion = :P69_ID_PRYCCION;',
'            else',
'                v_nmro_ctas_cnvnio := 1;',
'            end if;',
'        exception ',
'            when others then ',
'                v_nmro_ctas_cnvnio := 1;',
'        end;',
'        ',
'    end if;',
'    ',
'    if v_fcha_prmra_cta is null then ',
'        begin',
'            if :P69_ID_CNVNIO is not null then ',
'                select a.fcha_prmra_cta',
'                  into v_fcha_prmra_cta',
'                  from gf_g_convenios   a',
'                 where a.id_cnvnio = :P69_ID_CNVNIO;',
'',
'            elsif :P69_ID_PRYCCION is not null then ',
'                select a.fcha_prmra_cta',
'                  into v_fcha_prmra_cta',
'                 from gf_g_proyecciones  a',
'                 where id_pryccion = :P69_ID_PRYCCION;',
'            else',
'                v_fcha_prmra_cta := sysdate;',
'            end if;',
'        exception',
'            when others then ',
'                v_fcha_prmra_cta := sysdate;',
'        end;',
'    end if;',
'    ',
'    if v_cdgo_prdcdad_cta is null then ',
'        begin',
'            if :P69_ID_CNVNIO is not null then ',
'              select a.cdgo_prdcdad_cta',
'                into v_cdgo_prdcdad_cta',
'                from gf_g_convenios   a',
'               where a.id_cnvnio = :P69_ID_CNVNIO;',
'',
'            elsif :P69_ID_PRYCCION is not null then',
'               select a.cdgo_prdcdad_cta',
'                 into v_cdgo_prdcdad_cta',
'                 from gf_g_proyecciones  a',
'                where id_pryccion = :P69_ID_PRYCCION;',
'            else ',
'                v_cdgo_prdcdad_cta := ''MNS'';',
'            end if;',
'        exception ',
'            when others then ',
'                v_cdgo_prdcdad_cta := ''MNS'';',
'        end;',
'    end if;    ',
'    ',
'    declare ',
'        v_mnsje_rspsta        varchar2(2000);',
'    begin',
'    ',
'        pkg_gf_convenios.prc_gn_convenio_extracto (p_cdgo_clnte          => :F_CDGO_CLNTE ,',
'                                                   p_id_ssion            => :APP_SESSION ,',
'                                                   p_id_sjto_impsto      => :P52_ID_SJTO_IMPSTO ,',
'                                                   p_id_cnvnio_tpo       => :P69_ID_CNVNIO_TPO ,',
'                                                   p_nmro_ctas           => v_nmro_ctas_cnvnio ,',
'                                                   p_fcha_prmra_cta      => v_fcha_prmra_cta ,',
'                                                   p_cdgo_prdcdad_cta    => v_cdgo_prdcdad_cta ,',
'                                                   p_vlor_cta_incial     => :P69_VLOR_CTA_INCIAL ,',
'                                                   p_cdna_vgncia_prdo    => :P69_VGNCIA_PRDO ,',
'                                                   p_cdgo_rspsta         => v_cdgo_rspsta ,',
'                                                   p_mnsje_rspsta        => v_mnsje_rspsta);',
'       if (v_cdgo_rspsta  <> 0) then',
'           :P73_RSPSTA := null;',
'       else',
'           :P73_RSPSTA    :=     v_mnsje_rspsta;',
'       end if;',
'            ',
'    end;',
'end;                              ',
'						  ',
'  '))
,p_attribute_02=>'P73_FCHA_PRMRA_CTA,P73_NMRO_CTAS,P73_CDGO_PRDCDAD_CTA,P73_RSPSTA'
,p_attribute_03=>'P73_RSPSTA'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(56880008492055015)
,p_name=>unistr('Refrescar Regi\00F3n')
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(74460177253888499)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(56880193734055016)
,p_event_id=>wwv_flow_api.id(56880008492055015)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(122245810223364301)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103459636637042601)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta de los datos del acuerdo modificaci\00F3n acuerdo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select fcha_prmra_cta,',
'        nmro_cta,',
'        cdgo_prdcdad_cta',
'   into :P73_FCHA_PRMRA_CTA,',
'        :P73_NMRO_CTAS,',
'        :P73_CDGO_PRDCDAD_CTA',
'   from gf_g_convenios ',
'  where id_cnvnio = :P69_ID_CNVNIO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
' :P69_ID_CNVNIO is not null and ',
' :P73_FCHA_PRMRA_CTA  is null and ',
' :P73_NMRO_CTAS is null and ',
' :P73_CDGO_PRDCDAD_CTA is null'))
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(93192655706213901)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta de los datos de la proyecci\00F3n inserci\00F3n acuerdo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select fcha_prmra_cta,',
'        nmro_cta,',
'        cdgo_prdcdad_cta',
'   into :P73_FCHA_PRMRA_CTA,',
'        :P73_NMRO_CTAS,',
'        :P73_CDGO_PRDCDAD_CTA',
'   from gf_g_proyecciones ',
'  where id_pryccion = :P69_ID_PRYCCION;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
' :P69_ID_PRYCCION is not null and ',
' :P73_FCHA_PRMRA_CTA  is null and ',
' :P73_NMRO_CTAS is null and ',
' :P73_CDGO_PRDCDAD_CTA is null and',
' :P69_ID_CNVNIO is null ',
''))
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74467821538888537)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Creaci\00F3n de Colecci\00F3n del Extrato al cargar la pagina')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta       number;',
'    v_mnsje_rspsta      varchar2(1000);',
'    v_fcha_prmra_cta    gf_g_convenios.fcha_prmra_cta%type      := :P73_FCHA_PRMRA_CTA;',
'    v_cdgo_prdcdad_cta  gf_g_convenios.cdgo_prdcdad_cta%type    := :P73_CDGO_PRDCDAD_CTA;',
'    v_nmro_ctas_cnvnio  gf_g_convenios.nmro_cta%type            := :P73_NMRO_CTAS;',
'begin',
'    ',
'    if v_nmro_ctas_cnvnio is null then ',
'        begin',
'            if :P69_ID_CNVNIO is not null then ',
'                select a.nmro_cta',
'                  into v_nmro_ctas_cnvnio',
'                  from gf_g_convenios   a',
'                 where a.id_cnvnio = :P69_ID_CNVNIO;',
'',
'            elsif :P69_ID_PRYCCION is not null then ',
'                select a.nmro_cta',
'                  into v_nmro_ctas_cnvnio',
'                 from gf_g_proyecciones  a',
'                 where id_pryccion = :P69_ID_PRYCCION;',
'            else',
'                v_nmro_ctas_cnvnio := 1;',
'            end if;',
'        exception ',
'            when others then ',
'                v_nmro_ctas_cnvnio := 1;',
'        end;',
'        ',
'    end if;',
'    ',
'    if v_fcha_prmra_cta is null then ',
'        begin',
'            if :P69_ID_CNVNIO is not null then ',
'                select a.fcha_prmra_cta',
'                  into v_fcha_prmra_cta',
'                  from gf_g_convenios   a',
'                 where a.id_cnvnio = :P69_ID_CNVNIO;',
'',
'            elsif :P69_ID_PRYCCION is not null then ',
'                select a.fcha_prmra_cta',
'                  into v_fcha_prmra_cta',
'                 from gf_g_proyecciones  a',
'                 where id_pryccion = :P69_ID_PRYCCION;',
'            else',
'                v_fcha_prmra_cta := sysdate;',
'            end if;',
'        exception',
'            when others then ',
'                v_fcha_prmra_cta := sysdate;',
'        end;',
'    end if;',
'    ',
'    if v_cdgo_prdcdad_cta is null then ',
'        begin',
'            if :P69_ID_CNVNIO is not null then ',
'              select a.cdgo_prdcdad_cta',
'                into v_cdgo_prdcdad_cta',
'                from gf_g_convenios   a',
'               where a.id_cnvnio = :P69_ID_CNVNIO;',
'',
'            elsif :P69_ID_PRYCCION is not null then',
'               select a.cdgo_prdcdad_cta',
'                 into v_cdgo_prdcdad_cta',
'                 from gf_g_proyecciones  a',
'                where id_pryccion = :P69_ID_PRYCCION;',
'            else ',
'                v_cdgo_prdcdad_cta := ''MNS'';',
'            end if;',
'        exception ',
'            when others then ',
'                v_cdgo_prdcdad_cta := ''MNS'';',
'        end;',
'    end if;    ',
'    ',
'    declare ',
'        v_mnsje_rspsta        varchar2(2000);',
'    begin',
'    ',
'        pkg_gf_convenios.prc_gn_convenio_extracto (p_cdgo_clnte          => :F_CDGO_CLNTE ,',
'                                                   p_id_ssion            => :APP_SESSION ,',
'                                                   p_id_sjto_impsto      => :P52_ID_SJTO_IMPSTO ,',
'                                                   p_id_cnvnio_tpo       => :P69_ID_CNVNIO_TPO ,',
'                                                   p_nmro_ctas           => v_nmro_ctas_cnvnio ,',
'                                                   p_fcha_prmra_cta      => v_fcha_prmra_cta ,',
'                                                   p_cdgo_prdcdad_cta    => v_cdgo_prdcdad_cta ,',
'                                                   p_vlor_cta_incial     => :P69_VLOR_CTA_INCIAL ,',
'                                                   p_cdna_vgncia_prdo    => :P69_VGNCIA_PRDO ,',
'                                                   p_indcdor_inslvncia   => nvl(:P69_INSLVNCIA,''N''), ',
'                                                   p_indcdor_clcla_intres=> nvl(:P69_CLCLA_INTRES,''S''),',
'                                                   p_fcha_cngla_intres   => :P69_FCHA_CNGLA_INTRES, ',
'                                                   p_cdgo_rspsta         => v_cdgo_rspsta ,',
'                                                   p_mnsje_rspsta        => v_mnsje_rspsta);',
'       if (v_cdgo_rspsta <> 0) then',
'           raise_application_error(-20001, v_mnsje_rspsta);',
'       else',
'           :P73_RSPSTA    :=     v_mnsje_rspsta;',
'       end if;',
'            ',
'    end;',
'end;                              ',
'						  ',
'  '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(74460177253888499)
);
end;
/
