prompt --application/pages/page_00156
begin
wwv_flow_api.create_page(
 p_id=>156
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Reversi\00F3n Acuerdo Pago')
,p_step_title=>unistr('Reversi\00F3n Acuerdo Pago')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function obtenerConvenio() { ',
'    var i, j, record, convenios = [], v_id_cnvnio , region = apex.region("DatosAcuerdoReversar"); ',
'    if (region) {',
'        var view = region.widget().interactiveGrid("getCurrentView");',
'        var model = view.model;  ',
'        var records = view.view$.grid("getSelectedRecords");',
'        if(records.length > 0){',
'            for(i=0; i < records.length;i++){',
'                record = records[i];',
'                convenios.push(parseFloat(model.getValue(record, "ID_CNVNIO")));',
'            }',
'        }',
'        $s("P156_ID_CNVNIO", convenios.join('':''));        ',
'   } ',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20191104174039'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100561823322972803)
,p_plug_name=>'Datos '
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(116678897103801401)
,p_plug_name=>'Workflow'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'false'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(229974812973231622)
,p_plug_name=>'Datos de Acuerdo de Pago'
,p_region_template_options=>'#DEFAULT#:t-Region--stacked:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(229978062758231654)
,p_plug_name=>'Cartera'
,p_parent_plug_id=>wwv_flow_api.id(229974812973231622)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:margin-top-md'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select c.vgncia, ',
'          to_char(c.vlor_cptal, :F_FRMTO_MNDA) vlor_cptal,',
'          to_char(c.vlor_intres, :F_FRMTO_MNDA) vlor_intres,',
'          to_char(c.vlor_cptal+vlor_intres , :F_FRMTO_MNDA)vlor_ttal',
'    from gf_g_convenios_cartera c',
'    join df_i_periodos p',
'      on p.id_prdo = c.id_prdo    ',
'    where id_cnvnio = :P156_ID_CNVNIO;'))
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
 p_id=>wwv_flow_api.id(116679204164801405)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LOBREDOR'
,p_internal_uid=>116679204164801405
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(116679303979801406)
,p_db_column_name=>'VGNCIA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(116679478686801407)
,p_db_column_name=>'VLOR_CPTAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Capital'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(116679535190801408)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Inter\00E9s')
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(116679613709801409)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(116718710934100463)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1167188'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:VLOR_CPTAL:VLOR_INTRES:VLOR_TTAL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(229978917987231663)
,p_plug_name=>'Plan de Pago'
,p_parent_plug_id=>wwv_flow_api.id(229974812973231622)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:margin-top-md'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmro_cta,',
'        to_char(vlor_ttal, :F_FRMTO_MNDA) vlor_ttal,',
'        fcha_vncmnto,',
'        estdo_cta',
'   from V_gf_g_convenios_extracto c',
'  where id_cnvnio = :P156_ID_CNVNIO',
'  and   c.actvo =''S'';'))
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
 p_id=>wwv_flow_api.id(229979069391231664)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JIRIARTE'
,p_internal_uid=>229979069391231664
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(116698271808900737)
,p_db_column_name=>'NMRO_CTA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Cuota')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(116699098810900737)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Fecha Cuota'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(116698604205900737)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>40
,p_column_identifier=>'B'
,p_column_label=>'Valor Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3779101540472801)
,p_db_column_name=>'ESTDO_CTA'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(230145387299855650)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1166994'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_CTA:FCHA_VNCMNTO:VLOR_TTAL:ESTDO_CTA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(455557684252393739)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'    Esta funcionalidad permite<br><br>',
unistr('    <b>1. </b>Visualizar los datos del acuerdo de pago con solicitud de reversi\00F3n.<br><br>'),
unistr('    <b>2. </b>Aplicar la reversi\00F3n de un acuerdo de pago.<br><br>'),
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(505771167633084065)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from gf_g_convenios a',
'join gf_G_convenios_reversion b on a.id_cnvnio = b.id_cnvnio  ',
'where b.id_cnvnio = :P156_ID_CNVNIO',
'  and a.cdgo_cnvnio_estdo = ''RVS'';'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(116726328880127878)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(505771167633084065)
,p_button_name=>'BTN_NUEVA_APLCCION'
,p_button_static_id=>'BTN_NUEVA_APLCCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Aplicar Reversi\00F3n')
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(100801500151022605)
,p_branch_name=>'Go To Page 212'
,p_branch_action=>'f?p=&APP_ID.:212:&SESSION.::&DEBUG.:RP,212::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(116726328880127878)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100663938080703105)
,p_name=>'P156_ID_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(100561823322972803)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100801314838022603)
,p_name=>'P156_RSPSTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(100561823322972803)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102052152878019203)
,p_name=>'P156_ID_CNVNIO_RVRSION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(100561823322972803)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(116691096336900723)
,p_name=>'P156_NMRO_CNVNIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(229974812973231622)
,p_prompt=>unistr('Acuerdo N\00B0 ')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(116691882865900724)
,p_name=>'P156_ID_CNVNIO_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(229974812973231622)
,p_prompt=>'Tipo de Acuerdo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_CONVENIO_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       ID_CNVNIO_TPO as r',
'  from gf_d_convenios_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(116692273028900725)
,p_name=>'P156_TTAL_CNVNIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(229974812973231622)
,p_prompt=>'Total Acuerdo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(116692671536900725)
,p_name=>'P156_FCHA_APLCCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(229974812973231622)
,p_prompt=>unistr('Fecha Aplicaci\00F3n')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(116693029609900725)
,p_name=>'P156_VGNCIA_MNMA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(229974812973231622)
,p_prompt=>'Desde Vigencia'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(116693477169900725)
,p_name=>'P156_VGNCIA_MXMA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(229974812973231622)
,p_prompt=>'Hasta Vigencia'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(116694282720900726)
,p_name=>'P156_ESTDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(229974812973231622)
,p_prompt=>'Estado'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(118159344566606201)
,p_validation_name=>'validar acuerdo de pago'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists (select a.id_cnvnio',
'            from v_gf_g_convenios_reversion a',
'             join (select id_cnvnio, count (id_cnvnio) cntdad',
'                           from gf_g_convenios_extracto        ',
'                       group by id_cnvnio) b on a.id_cnvnio = b.id_cnvnio ',
'             join (select id_cnvnio, count (id_cnvnio) cntdad',
'                           from gf_g_convenios_extracto',
'                           where indcdor_cta_pgda = ''N'' ',
'                           group by id_cnvnio) c on c.id_cnvnio = b.id_cnvnio and b.id_cnvnio is not null and (c.cntdad <> b.cntdad or c.cntdad = b.cntdad )',
'            where a.id_cnvnio = :P156_ID_CNVNIO);'))
,p_validation_type=>'SQL_EXPRESSION'
,p_error_message=>'No Puede Reversar, Acuerdo pagado Absolutamente.'
,p_when_button_pressed=>wwv_flow_api.id(116726328880127878)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117306087240691802)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_cnvnio,',
'          a.nmro_cnvnio,',
'          a.id_cnvnio_tpo,',
'          to_char(a.fcha_aplccion, ''DD/MM/YYYY'') fcha_aplccion,',
'          to_char(a.ttal_cnvnio, :F_FRMTO_MNDA) ttal_cnvnio,',
'          (select min(vgncia) from gf_g_convenios_cartera m where m.id_cnvnio = a.id_cnvnio) vgncia_mmna,',
'          (select max(vgncia) from gf_g_convenios_cartera m where m.id_cnvnio = a.id_cnvnio) vgncia_mxma,',
'          dscrpcion_cnvnio_estdo',
'     into :P156_ID_CNVNIO,',
'          :P156_NMRO_CNVNIO,',
'          :P156_ID_CNVNIO_TPO,',
'          :P156_FCHA_APLCCION,',
'          :P156_TTAL_CNVNIO,',
'          :P156_VGNCIA_MNMA,',
'          :P156_VGNCIA_MXMA,',
'          :P156_ESTDO',
'     from v_gf_g_convenios a',
'     join gf_g_convenios_reversion b on a.id_cnvnio = b.id_cnvnio and b.id_instncia_fljo_hjo = :F_ID_INSTNCIA_FLJO',
'    where a.cdgo_clnte = :F_CDGO_CLNTE;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(116679026574801403)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos de Acuerdo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_cnvnio,',
'          a.nmro_cnvnio,',
'          a.id_cnvnio_tpo,',
'          to_char(a.fcha_aplccion, ''DD/MM/YYYY'') fcha_aplccion,',
'          ''$''|| to_char(a.ttal_cnvnio, ''FM999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''') ttal_cnvnio,',
'          (select min(vgncia) from gf_g_convenios_cartera m where m.id_cnvnio = a.id_cnvnio) vgncia_mmna,',
'          (select max(vgncia) from gf_g_convenios_cartera m where m.id_cnvnio = a.id_cnvnio) vgncia_mxma,',
'          dscrpcion_cnvnio_estdo',
'     into :P156_ID_CNVNIO,',
'          :P156_NMRO_CNVNIO,',
'          :P156_ID_CNVNIO_TPO,',
'          :P156_FCHA_APLCCION,',
'          :P156_TTAL_CNVNIO,',
'          :P156_VGNCIA_MNMA,',
'          :P156_VGNCIA_MXMA,',
'          :P156_ESTDO',
'     from v_gf_g_convenios a',
'     join gf_g_convenios_reversion b on a.id_cnvnio = b.id_cnvnio and b.id_cnvnio = :P151_ID_CNVNIO',
'     join pq_g_solicitudes c on b.id_slctud = c.id_slctud',
'    where a.cdgo_clnte = :F_CDGO_CLNTE;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
