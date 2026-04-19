prompt --application/pages/page_00121
begin
wwv_flow_api.create_page(
 p_id=>121
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Gesti\00F3n Sanciones_tem')
,p_step_title=>unistr('Gesti\00F3n Sanciones')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20200123170653'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55568022038431839)
,p_plug_name=>unistr('Gesti\00F3n Sanciones')
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55541746387376883)
,p_plug_name=>'Sanciones_tem'
,p_parent_plug_id=>wwv_flow_api.id(55568022038431839)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_sncion,',
'       cdgo_clnte,',
'       id_impsto,',
'       nmbre_impsto,',
'       id_impsto_sbmpsto,',
'       nmbre_impsto_sbmpsto,',
'       vgncia,',
'       id_prdo,',
'       dscrpcion_prdo,',
'       cdgo_sncion_tpo,',
'       dscrpcion_prdo_cdgo_sncion_tpo,',
'       prcntje_trfa,',
'       prcntje_trfa_empl,',
'       prcntje_trfa_ingrso_brto,',
'       prcntje_trfa_ingrso_brto_empl,',
'       prcntje_mxmo_impst_crg,',
'       prcntje_mxmo_impst_crg_empl,',
'       prcntje_mxmo_ingr_brt,',
'       prcntje_mxmo_ingr_brt_empl,',
'       aumnt_prcntj_x_dclrcn_inc_extm,',
'       undad_vlor_sncion_mnmo,',
'       id_indcdor_ecnmco,',
'       cdgo_indcdor_tpo,',
'       vlor_sncion_mnmo ',
'       ',
'  from v_gi_d_sanciones;'))
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
 p_id=>wwv_flow_api.id(55565383670431812)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:122:&SESSION.::&DEBUG.:RP:P122_ID_SNCION:#ID_SNCION#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'AMOLINA'
,p_internal_uid=>55565383670431812
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55565487905431813)
,p_db_column_name=>'ID_SNCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sncion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55565569974431814)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Cdgo Clnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55565647674431815)
,p_db_column_name=>'VGNCIA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55565738090431816)
,p_db_column_name=>'ID_PRDO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55565876437431817)
,p_db_column_name=>'CDGO_SNCION_TPO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Tipo de Sanci\00F3n ')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55565924555431818)
,p_db_column_name=>'PRCNTJE_TRFA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'% Tarifa'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'990D999'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55566089355431819)
,p_db_column_name=>'PRCNTJE_MXMO_INGR_BRT'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Prcntje Mxmo Ingr Brt'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55566157741431820)
,p_db_column_name=>'PRCNTJE_MXMO_IMPST_CRG'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('% M\00E1ximo Impuesto a Cargo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55566243027431821)
,p_db_column_name=>'UNDAD_VLOR_SNCION_MNMO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Unidad Valor M\00EDnimo')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55566300982431822)
,p_db_column_name=>'ID_INDCDOR_ECNMCO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Indicador Econ\00F3mico ')
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55566448547431823)
,p_db_column_name=>'VLOR_SNCION_MNMO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Valor M\00EDnimo Sanci\00F3n ')
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55566502993431824)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Tributo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55566682985431825)
,p_db_column_name=>'ID_IMPSTO_SBMPSTO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Sub-Tributo '
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55566755809431826)
,p_db_column_name=>'PRCNTJE_TRFA_INGRSO_BRTO'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Prcntje Trfa Ingrso Brto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55566826289431827)
,p_db_column_name=>'AUMNT_PRCNTJ_X_DCLRCN_INC_EXTM'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>unistr('% Aumento x Declaraci\00F3n Inicial Extempor\00E1nea  ')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'990D999'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55566960257431828)
,p_db_column_name=>'PRCNTJE_TRFA_EMPL'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'% Tarifa Emplazamiento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'990D999'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55567049829431829)
,p_db_column_name=>'PRCNTJE_MXMO_INGR_BRT_EMPL'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Prcntje Mxmo Ingr Brt Empl'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55567177985431830)
,p_db_column_name=>'PRCNTJE_MXMO_IMPST_CRG_EMPL'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>unistr('% M\00E1ximo Impuesto a Cargo Emplazamiento ')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'990D999'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55567206707431831)
,p_db_column_name=>'PRCNTJE_TRFA_INGRSO_BRTO_EMPL'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Prcntje Trfa Ingrso Brto Empl'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55568127458431840)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Tributo '
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55568263936431841)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Sub-Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55568398597431842)
,p_db_column_name=>'DSCRPCION_PRDO'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Periodo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55568467640431843)
,p_db_column_name=>'DSCRPCION_PRDO_CDGO_SNCION_TPO'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>unistr('Tipo de Sanci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55568585167431844)
,p_db_column_name=>'CDGO_INDCDOR_TPO'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>unistr('Indicador Econ\00F3mico')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(55600586958445186)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'556006'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_PRDO_CDGO_SNCION_TPO:VGNCIA:DSCRPCION_PRDO:PRCNTJE_TRFA:PRCNTJE_TRFA_EMPL:NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:PRCNTJE_MXMO_IMPST_CRG:PRCNTJE_MXMO_IMPST_CRG_EMPL:AUMNT_PRCNTJ_X_DCLRCN_INC_EXTM:UNDAD_VLOR_SNCION_MNMO:CDGO_INDCDOR_TPO:VLOR_SNCIO'
||'N_MNMO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(92759039768010972)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
 p_id=>wwv_flow_api.id(92766041873130712)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'Esta funcionalidad permite:<br><br>',
unistr('<p align="justify">1.Parametrizar los porcentajes y valores tenidos en cuenta para el c\00E1lculo de sanciones. </p><br></i>'),
unistr('<i><p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p></i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55674880963092010)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(92759039768010972)
,p_button_name=>unistr('BTN_Nueva_Sanci\00F3n')
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nueva Sanci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:122:&SESSION.::&DEBUG.:RP,110::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55674472076092003)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(92759039768010972)
,p_button_name=>'BTN_Regresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
end;
/
