prompt --application/pages/page_00352
begin
wwv_flow_api.create_page(
 p_id=>352
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Actualizar_Fecha_Cuenta_Banco'
,p_step_title=>'Actualizar Fecha Cuenta Banco'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'PSOTTER'
,p_last_upd_yyyymmddhh24miss=>'20211202084105'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14716636278511131)
,p_plug_name=>unistr('Par\00E1metros De B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14717013085511135)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
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
'      <p align="justify">Permite consultar los documentos que se hicieron efectivos por un recaudo.</p>',
'      ',
'      <p align="justify">Permite editar la fecha del recaudo por banco.</p>',
'      ',
'      <p align="justify">Permite editar la cuenta del recaudo por banco.</p>',
'    ',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14717244490511137)
,p_plug_name=>'Datos Asociados'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_rcdo,',
'        a.id_rcdo_cntrol,',
'        b.id_bnco,',
'        b.nmbre_impsto,',
'        b.nmbre_impsto_sbmpsto,',
'        d.idntfccion_sjto,',
'        trunc(a.fcha_rcdo) as fcha_rcdo,',
'        a.vlor,',
'        b.nmbre_bnco,',
'        b.nmro_cnta,',
'        trunc(a.fcha_ingrso_bnco) as fcha_ingrso_bnco',
'from v_re_g_recaudos a',
'    join v_re_g_recaudos_control b',
'    on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'    join v_si_i_sujetos_impuesto d',
'    on d.id_sjto_impsto = a.id_sjto_impsto',
'where a.cdgo_rcdo_estdo = ''AP''',
'    and d.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.nmro_dcmnto = :P352_NMRO_DCMNTO',
'    and :P352_NMRO_DCMNTO is not null'))
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
 p_id=>wwv_flow_api.id(14717364395511138)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:353:&SESSION.::&DEBUG.:RP:P353_ID_RCDO,P353_ID_RCDO_CNTROL,P353_ID_BNCO:#ID_RCDO#,#ID_RCDO_CNTROL#,#ID_BNCO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'PSOTTER'
,p_internal_uid=>14717364395511138
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14718222369511147)
,p_db_column_name=>'ID_RCDO'
,p_display_order=>10
,p_column_identifier=>'I'
,p_column_label=>'Id_Rcdo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14831199468385919)
,p_db_column_name=>'ID_RCDO_CNTROL'
,p_display_order=>20
,p_column_identifier=>'J'
,p_column_label=>'Id Rcdo Cntrol'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14879802723818903)
,p_db_column_name=>'ID_BNCO'
,p_display_order=>30
,p_column_identifier=>'K'
,p_column_label=>'Id Bnco'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14717468119511139)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>40
,p_column_identifier=>'A'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14717509766511140)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>50
,p_column_identifier=>'B'
,p_column_label=>'Sub Impuesto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14717624693511141)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>60
,p_column_identifier=>'C'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14717887307511143)
,p_db_column_name=>'VLOR'
,p_display_order=>80
,p_column_identifier=>'E'
,p_column_label=>'Valor $'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14717964390511144)
,p_db_column_name=>'NMBRE_BNCO'
,p_display_order=>90
,p_column_identifier=>'F'
,p_column_label=>'Banco'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14718097185511145)
,p_db_column_name=>'NMRO_CNTA'
,p_display_order=>100
,p_column_identifier=>'G'
,p_column_label=>'Numero Cuenta'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14883985480818944)
,p_db_column_name=>'FCHA_RCDO'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>'Fecha Recaudo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14884061321818945)
,p_db_column_name=>'FCHA_INGRSO_BNCO'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'Fecha Ingreso Banco'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(14798133513315054)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'147982'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:IDNTFCCION_SJTO:VLOR:NMBRE_BNCO:NMRO_CNTA:ID_RCDO:ID_RCDO_CNTROL:ID_BNCO:FCHA_RCDO:FCHA_INGRSO_BNCO'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14717112464511136)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(14716636278511131)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14716788080511132)
,p_name=>'P352_NMRO_DCMNTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(14716636278511131)
,p_prompt=>'Numero Documento'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
