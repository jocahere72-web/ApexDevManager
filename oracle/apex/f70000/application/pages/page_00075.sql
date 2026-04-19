prompt --application/pages/page_00075
begin
wwv_flow_api.create_page(
 p_id=>75
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Consulta de Configuraciones Cliente'
,p_step_title=>'Consulta de Configuraciones Cliente'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20210309160851'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19325631996787113)
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
 p_id=>wwv_flow_api.id(19325799444787114)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100154734261860410)
,p_plug_name=>unistr('<b>GESTI\00D3N DE SUBTRIBUTOS</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_rnta_cnfgrcion_sbmpsto         ',
'		, a.nmbre_impsto_sbmpsto',
'        , a.dscrpcion_indcdor_usa_extrnjro',
'        , a.dscrpcion_indcdor_usa_mxto',
'        , a.lbel_fcha_expdcion',
'        , a.dscrpcion_fljo',
'        , a.dscrpcion_indcdor_exncion',
'        , a.dscrpcion_indcdor_cntrto_gslna',
'   		, a.dsc_indcdor_mnja_cntrto_ese',
'        , a.user_ultma_actlzcion',
'		, a.fcha_ultma_actlzcion',
'     from v_gi_d_rntas_cnfgrcion_sbmpst      a',
'    where a.cdgo_clnte = :F_CDGO_CLNTE',
' order by nmbre_impsto_sbmpsto'))
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
 p_id=>wwv_flow_api.id(100363621142052215)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:92:&SESSION.::&DEBUG.:RP,92:P92_ID_RNTA_CNFGRCION_SBMPSTO:#ID_RNTA_CNFGRCION_SBMPSTO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JRANGEL'
,p_internal_uid=>100363621142052215
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(100363734978052216)
,p_db_column_name=>'ID_RNTA_CNFGRCION_SBMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Rnta Cnfgrcion Sbmpsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(98657081517353034)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>240
,p_column_identifier=>'Y'
,p_column_label=>'Sub Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102338656609460916)
,p_db_column_name=>'DSCRPCION_INDCDOR_USA_EXTRNJRO'
,p_display_order=>250
,p_column_identifier=>'AI'
,p_column_label=>unistr('\00BFSujeto Extranjero?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102338572180460915)
,p_db_column_name=>'DSCRPCION_INDCDOR_USA_MXTO'
,p_display_order=>260
,p_column_identifier=>'AH'
,p_column_label=>unistr('\00BFLiquidaci\00F3n Mixta?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102339321397460923)
,p_db_column_name=>'DSCRPCION_FLJO'
,p_display_order=>270
,p_column_identifier=>'AP'
,p_column_label=>'Flujo de Trabajo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102339205598460922)
,p_db_column_name=>'LBEL_FCHA_EXPDCION'
,p_display_order=>280
,p_column_identifier=>'AO'
,p_column_label=>unistr('Etiqueta Fecha Expedici\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102339129957460921)
,p_db_column_name=>'DSCRPCION_INDCDOR_EXNCION'
,p_display_order=>290
,p_column_identifier=>'AN'
,p_column_label=>unistr('\00BFPermite Solicitud de Exenci\00F3n?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102338773432460917)
,p_db_column_name=>'DSCRPCION_INDCDOR_CNTRTO_GSLNA'
,p_display_order=>310
,p_column_identifier=>'AJ'
,p_column_label=>unistr('\00BFManeja Contrato de Combustible?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P75_INDCDOR_MNJA_CNTRTO_GSLNA'
,p_display_condition2=>'S'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102338867635460918)
,p_db_column_name=>'DSC_INDCDOR_MNJA_CNTRTO_ESE'
,p_display_order=>320
,p_column_identifier=>'AK'
,p_column_label=>unistr('\00BFManeja Contrato de ESE?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P75_INDCDOR_MNJA_CNTRTO_ESE'
,p_display_condition2=>'S'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102338975137460919)
,p_db_column_name=>'USER_ULTMA_ACTLZCION'
,p_display_order=>330
,p_column_identifier=>'AL'
,p_column_label=>unistr('Usuario \00DAltima Actualizaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102339036737460920)
,p_db_column_name=>'FCHA_ULTMA_ACTLZCION'
,p_display_order=>340
,p_column_identifier=>'AM'
,p_column_label=>unistr('Fecha \00DAltima Actualizaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(100435773829698741)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1004358'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_IMPSTO_SBMPSTO:DSCRPCION_INDCDOR_USA_EXTRNJRO:DSCRPCION_INDCDOR_USA_MXTO:DSCRPCION_FLJO:LBEL_FCHA_EXPDCION:DSCRPCION_INDCDOR_EXNCION:DSCRPCION_INDCDOR_CNTRTO_GSLNA:DSC_INDCDOR_MNJA_CNTRTO_ESE:USER_ULTMA_ACTLZCION:FCHA_ULTMA_ACTLZCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100859672568787617)
,p_plug_name=>unistr('<b>CONFIGURACI\00D3N DE RENTAS</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(19325841449787115)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(19325631996787113)
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
 p_id=>wwv_flow_api.id(19325964999787116)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(19325631996787113)
,p_button_name=>'BTN_NVA_CNFGRCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nueva Configuraci\00F3n <br> de Sub Tributo')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:92:&SESSION.::&DEBUG.:92:P92_ID_RNTA_CNFGRCION:&P75_ID_RNTA_CNFGRCION.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100862399558787644)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(100859672568787617)
,p_button_name=>'SAVE'
,p_button_static_id=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P75_ID_RNTA_CNFGRCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(19326005696787117)
,p_branch_name=>unistr('Ir a P\00E1gina 92')
,p_branch_action=>'f?p=&APP_ID.:92:&SESSION.::&DEBUG.:RP,92::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(19325964999787116)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100156683324860429)
,p_name=>'P75_ID_RNTA_CNFGRCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_RNTA_CNFGRCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100363066672052209)
,p_name=>'P75_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100859918500787620)
,p_name=>'P75_CDGO_CLNTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100860007573787621)
,p_name=>'P75_INDCDOR_USA_MXTO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b> \00BFLiquidaci\00F3n Mixta? </b>')
,p_source=>'INDCDOR_USA_MXTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si la renta a liquidar ser\00E1 de origen privado y p\00FAblico.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100860130169787622)
,p_name=>'P75_PRCNTJE_LQDCION_PRVDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b> % Liquidaci\00F3n Privada</b> ')
,p_format_mask=>'999G990D99'
,p_source=>'PRCNTJE_LQDCION_PRVDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>4
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" onkeyup="formatNumber(event,{thousand:''.'',decimal:'',''});"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indica el porcentaje correspondiente a la parte privada.'
,p_attribute_01=>'1'
,p_attribute_02=>'99'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100860213327787623)
,p_name=>'P75_PRCNTJE_LQDCION_PBLCO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b> % Liquidaci\00F3n P\00FAblica</b> ')
,p_format_mask=>'999G990D99'
,p_source=>'PRCNTJE_LQDCION_PBLCO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>4
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica el porcentaje correspondiente a la parte p\00FAblica.')
,p_attribute_01=>'1'
,p_attribute_02=>'99'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100860328558787624)
,p_name=>'P75_INDCDOR_USA_EXTRNJRO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b> \00BFSujeto Extranjero?</b> ')
,p_source=>'INDCDOR_USA_EXTRNJRO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indica si el sujeto sobre quien liquida la renta es extranjero.'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'Si'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100860454694787625)
,p_name=>'P75_TPO_DIAS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b> \00BFTipo de D\00EDas?</b> ')
,p_source=>'TPO_DIAS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica el tipo de d\00EDas. Calendario o h\00E1biles')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'H'
,p_attribute_03=>unistr('H\00E1biles')
,p_attribute_04=>'C'
,p_attribute_05=>'Calendario'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100860524419787626)
,p_name=>'P75_DIAS_MRGN_MRA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b> N\00B0 D\00EDas de Margen Mora</b> ')
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'DIAS_MRGN_MRA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');" onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Cantidad de d\00EDas de gabela despu\00E9s de la fecha de expedici\00F3n del acto.')
,p_attribute_01=>'1'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100860609969787627)
,p_name=>'P75_LBEL_FCHA_EXPDCION'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b> Etiqueta Fecha Expedici\00F3n</b> ')
,p_source=>'LBEL_FCHA_EXPDCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica la etiqueta para referenciar la fecha de expedici\00F3n del acto.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100860893621787629)
,p_name=>'P75_USER_DGTA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_source=>'USER_DGTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100860936243787630)
,p_name=>'P75_FCHA_DGTA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_source=>'FCHA_DGTA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100861018738787631)
,p_name=>'P75_USER_MDFCA'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_source=>'USER_MDFCA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100861159175787632)
,p_name=>'P75_FCHA_MDFCA'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_source=>'FCHA_MDFCA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100919191940162148)
,p_name=>'P75_INDCDOR_MNJA_CNTRTO_GSLNA'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BFManeja Contrato de Combustible?</b>')
,p_source=>'INDCDOR_MNJA_CNTRTO_GSLNA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Indica si para ente cliente se podr\00E1n realizar liquidaciones de contrato de Combustible. <br>'),
'Las liquidaciones de contratos de combustibles tiene las siguientes variables adicionales:<br>',
'- Se debe parametrizar si el contribuyente es mayorista o minorista.<br>',
'- Se debe parametrizar los margenes de utilidades.'))
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100919226209162149)
,p_name=>'P75_INDCDOR_MNJA_CNTRTO_ESE'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BFManeja Contrato de ESE ?</b>')
,p_source=>'INDCDOR_MNJA_CNTRTO_ESE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Indica si para ente Cliente se podr\00E1n realizar liquidaciones de contrato de E.S.E. <br>'),
unistr('Las liquidaciones de contratos de E.S.E tiene como variable adicional el valor del contrato de E.S.E que incluye el valor de los servicios prestados para usuarios del r\00E9gimen subsidiado y contributivo .')))
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100957787946432416)
,p_name=>'P75_SUMA'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101880938669258102)
,p_name=>'P75_NMRO_DCMNTOS'
,p_is_required=>true
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b> N\00FAmero de  Documentos</b> ')
,p_source=>'NMRO_DCMNTOS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>7
,p_cMaxlength=>2
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero de c\00F3digos de barra que se mostraran en el documento de pago')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101881070834258103)
,p_name=>'P75_INTRVLO_DIAS'
,p_is_required=>true
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b> Intervalo de d\00EDas del documento</b> ')
,p_source=>'INTRVLO_DIAS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>7
,p_cMaxlength=>2
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el intervalo de d\00EDas para generar la fecha de vencimiento del documento')
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102337977912460909)
,p_name=>'P75_ID_FLJO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_prompt=>'<b>Flujo de Trabajo</b>'
,p_source=>'ID_FLJO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select dscrpcion_fljo    d',
'        , id_fljo           r ',
'     from wf_d_flujos',
'    where cdgo_clnte = :F_CDGO_CLNTE',
' order by dscrpcion_fljo'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Relacionar el Flujo de trabajo que se utilizar\00E1 para realizar el proceso de solicitud o liquidaci\00F3n para \00E9ste cliente')
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107033600137474812)
,p_name=>'P75_INDCDOR_GNRA_BNO_CJA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(100859672568787617)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>\00BFBono Generado por Caja ?</b>')
,p_source=>'INDCDOR_GNRA_BNO_CJA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica si la generaci\00F3n del bono se va a realizar por el m\00F3dulo de Caja, o si se genera por Rentas igual al recibo de pago.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(100363108715052210)
,p_computation_sequence=>10
,p_computation_item=>'P75_ID_IMPSTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_impsto',
'from   df_c_impuestos',
'where cdgo_impsto = ''REN'''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(100956442436432403)
,p_computation_sequence=>20
,p_computation_item=>'P75_ID_RNTA_CNFGRCION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_RNTA_CNFGRCION',
'from GI_D_RENTAS_CONFIGURACION',
'where cdgo_clnte = :F_CDGO_CLNTE'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(100957814288432417)
,p_computation_sequence=>30
,p_computation_item=>'P75_SUMA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  (:P75_PRCNTJE_LQDCION_PRVDO + :P75_PRCNTJE_LQDCION_PBLCO)',
'from dual'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(100862038901787641)
,p_validation_name=>'Valida Porcentaje Privado'
,p_validation_sequence=>10
,p_validation=>'not (:P75_INDCDOR_USA_MXTO = ''S'' and :P75_PRCNTJE_LQDCION_PRVDO is null)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('\00A1Ingrese Porcentaje Privado!')
,p_validation_condition=>'CREATE,SAVE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(100860130169787622)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(100862171937787642)
,p_validation_name=>unistr('Valida Porcentaje P\00FAblico')
,p_validation_sequence=>20
,p_validation=>'not (:P75_INDCDOR_USA_MXTO = ''S'' and :P75_PRCNTJE_LQDCION_PBLCO is null)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('\00A1Ingrese Porcentaje P\00FAblico!')
,p_validation_condition=>'CREATE,SAVE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(100860213327787623)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(100862235178787643)
,p_validation_name=>unistr('Valida D\00EDas Mora')
,p_validation_sequence=>30
,p_validation=>'not (:P75_INDCDOR_USA_EXTRNJRO = ''S'' and :P75_DIAS_MRGN_MRA is null)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>unistr('\00A1Ingrese N\00B0 D\00EDas de Margen Mora!')
,p_validation_condition=>'CREATE,SAVE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(100860524419787626)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(100957654519432415)
,p_validation_name=>'Validar porcentaje'
,p_validation_sequence=>40
,p_validation=>'not (:P75_SUMA != 100)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La suma de los porcentajes debe ser 100%'
,p_validation_condition_type=>'NEVER'
,p_associated_item=>wwv_flow_api.id(100860213327787623)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100861289476787633)
,p_name=>unistr('Tipos de Liquidaci\00F3n')
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P75_INDCDOR_USA_MXTO'
,p_condition_element=>'P75_INDCDOR_USA_MXTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100861340427787634)
,p_event_id=>wwv_flow_api.id(100861289476787633)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P75_PRCNTJE_LQDCION_PRVDO,P75_PRCNTJE_LQDCION_PBLCO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100861687678787637)
,p_event_id=>wwv_flow_api.id(100861289476787633)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P75_PRCNTJE_LQDCION_PRVDO,P75_PRCNTJE_LQDCION_PBLCO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100957922664432418)
,p_event_id=>wwv_flow_api.id(100861289476787633)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P75_PRCNTJE_LQDCION_PRVDO,,P75_PRCNTJE_LQDCION_PBLCO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(100861772785787638)
,p_name=>'Definiciones Extranjero'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P75_INDCDOR_USA_EXTRNJRO'
,p_condition_element=>'P75_INDCDOR_USA_EXTRNJRO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100861806817787639)
,p_event_id=>wwv_flow_api.id(100861772785787638)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P75_TPO_DIAS,P75_DIAS_MRGN_MRA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100861958707787640)
,p_event_id=>wwv_flow_api.id(100861772785787638)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P75_TPO_DIAS,P75_DIAS_MRGN_MRA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(100958044375432419)
,p_event_id=>wwv_flow_api.id(100861772785787638)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P75_DIAS_MRGN_MRA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(102338164379460911)
,p_name=>unistr('Mostrar el intervalo de d\00EDas si el n\00FAmero de documentos a generar es mayor que 1')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P75_NMRO_DCMNTOS'
,p_condition_element=>'P75_NMRO_DCMNTOS'
,p_triggering_condition_type=>'GREATER_THAN'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(102338266860460912)
,p_event_id=>wwv_flow_api.id(102338164379460911)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P75_INTRVLO_DIAS'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(102338338143460913)
,p_event_id=>wwv_flow_api.id(102338164379460911)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P75_INTRVLO_DIAS'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(100957569033432414)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Procesar pantalla configuraciones'
,p_attribute_02=>'GI_D_RENTAS_CONFIGURACION'
,p_attribute_03=>'P75_ID_RNTA_CNFGRCION'
,p_attribute_04=>'ID_RNTA_CNFGRCION'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('\00A1Petici\00F3n Procesada!')
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(100957311775432412)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Inicializar pantalla configuraciones'
,p_attribute_02=>'GI_D_RENTAS_CONFIGURACION'
,p_attribute_03=>'P75_ID_RNTA_CNFGRCION'
,p_attribute_04=>'ID_RNTA_CNFGRCION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(100956557809432404)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Configuracion Rentas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'	select ',
'          id_rnta_cnfgrcion    ',
'        , cdgo_clnte           ',
'        , id_impsto            ',
'        , indcdor_usa_mxto     ',
'        , prcntje_lqdcion_prvdo',
'        , prcntje_lqdcion_pblco',
'        , indcdor_usa_extrnjro ',
'        , tpo_dias             ',
'        , dias_mrgn_mra        ',
'        , lbel_fcha_expdcion   ',
'        , user_dgta            ',
'        , fcha_dgta            ',
'        , user_mdfca           ',
'        , fcha_mdfca    ',
'	INTO',
'          :P75_ID_RNTA_CNFGRCION    ',
'        , :P75_CDGO_CLNTE                  ',
'        , :P75_ID_IMPSTO            ',
'        , :P75_INDCDOR_USA_MXTO     ',
'        , :P75_PRCNTJE_LQDCION_PRVDO',
'        , :P75_PRCNTJE_LQDCION_PBLCO',
'        , :P75_INDCDOR_USA_EXTRNJRO ',
'        , :P75_TPO_DIAS             ',
'        , :P75_DIAS_MRGN_MRA        ',
'        , :P75_LBEL_FCHA_EXPDCION   ',
'        , :P75_USER_DGTA            ',
'        , :P75_FCHA_DGTA            ',
'        , :P75_USER_MDFCA           ',
'        , :P75_FCHA_MDFCA    ',
'    from gi_d_rentas_configuracion',
'	where cdgo_clnte = :F_CDGO_CLNTE;',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
