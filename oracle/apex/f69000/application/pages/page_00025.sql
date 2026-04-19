prompt --application/pages/page_00025
begin
wwv_flow_api.create_page(
 p_id=>25
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Aplicaci\00F3n de Resoluci\00F3n')
,p_step_title=>unistr('Aplicaci\00F3n de Resoluci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20250826114524'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(68730273554336902)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(88525409177834657)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(68731438568336914)
,p_plug_name=>unistr('Resoluci\00F3n Tipo I')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88525409177834657)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select /*( case when length(a.rfrncia_igac) = 15 then',
'                    pkg_gn_generalidades.fnc_cl_formato_texto( p_txto => a.rfrncia_igac , p_frmto => ''xx-xx-xxxx-xxxx-xxx'' , p_crcter_dlmtdor => ''-'' )',
'                when length(a.rfrncia_igac) = 25 then',
'                    pkg_gn_generalidades.fnc_cl_formato_texto( p_txto => a.rfrncia_igac , p_frmto => ''xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx'' , p_crcter_dlmtdor => ''-'' )',
'                else',
'                    a.rfrncia_igac',
'          end )*/ ',
'          a.rfrncia_igac as rfrncia_igac_frmtda ',
'        , a.rfrncia_igac',
'        , a.cncla_inscrbe',
'        , a.nmro_orden',
'        , a.ttal_rgstro',
'        , a.tpo_dcmnto',
'        , a.nmro_dcmnto',
'        , a.nmbre_prptrio',
'        , a.dstno_ecnmco',
'        , a.area_trrno',
'        , a.area_cnstrda',
'        , a.avluo_ctstral',
'        , decode( a.cncla_inscrbe , ''I'' , ''<span aria-hidden="true" class="fa fa-eye" style="font-size: 20px;"></span>''  ) as link      ',
'        , decode( a.cncla_inscrbe , ''I'' , ''<span aria-hidden="true" class="fa fa-money" style="font-size: 20px;"></span>''  ) as link_cartera',
'        , (select c.id_sjto_impsto from v_si_i_sujetos_impuesto c',
'            where c.id_impsto = :P25_ID_IMPSTO ',
'              and c.idntfccion_sjto = a.rfrncia_igac) id_sjto_impsto',
'     from si_g_resolucion_igac_t1 a',
'    where a.id_prcso_crga in (',
'                                 select b.id_prcso_crga',
'                                   from et_g_procesos_carga b',
'                                  where b.id_prcso_crga     = a.id_prcso_crga',
'                                    and b.cdgo_clnte        = :F_CDGO_CLNTE',
'                                    and b.id_impsto         = :P25_ID_IMPSTO ',
'                                    and b.id_impsto_sbmpsto = :P25_ID_IMPSTO_SBMPSTO',
'                             )',
'      and a.rslcion = :P25_RSLCION',
'      and a.rdccion = :P25_RDCCION',
' order by a.cncla_inscrbe',
'        , a.rfrncia_igac',
'        , a.nmro_orden'))
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
 p_id=>wwv_flow_api.id(68731587621336915)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay datos por mostrar.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:RP,26:P26_RFRNCIA_IGAC,P26_ID_IMPSTO,P26_ID_IMPSTO_SBMPSTO,P26_RSLCION,P26_RDCCION:#RFRNCIA_IGAC#,&P25_ID_IMPSTO.,&P25_ID_IMPSTO_SBMPSTO.,&P25_RSLCION.,&P25_RDCCION.'
,p_detail_link_text=>'#LINK#'
,p_detail_link_attr=>'title="Ver"'
,p_owner=>'NARDILA'
,p_internal_uid=>68731587621336915
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68731687005336916)
,p_db_column_name=>'RFRNCIA_IGAC_FRMTDA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68731763078336917)
,p_db_column_name=>'RFRNCIA_IGAC'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68731885953336918)
,p_db_column_name=>'CNCLA_INSCRBE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'C/I'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68731929170336919)
,p_db_column_name=>'NMRO_ORDEN'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Orden'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68732074115336920)
,p_db_column_name=>'TTAL_RGSTRO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Total'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68732147530336921)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Identificaci\00F3n Propietario')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68732213835336922)
,p_db_column_name=>'NMBRE_PRPTRIO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68732312485336923)
,p_db_column_name=>'DSTNO_ECNMCO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Destino'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(74182334876275535)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68732528803336925)
,p_db_column_name=>'AREA_CNSTRDA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('\00C1rea Construida')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68732641640336926)
,p_db_column_name=>'AVLUO_CTSTRAL'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Avalu\00F3')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68732423636336924)
,p_db_column_name=>'AREA_TRRNO'
,p_display_order=>120
,p_column_identifier=>'I'
,p_column_label=>unistr('\00C1rea Terreno')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68774985720989008)
,p_db_column_name=>'LINK'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>'Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72114438852007933)
,p_db_column_name=>'TPO_DCMNTO'
,p_display_order=>140
,p_column_identifier=>'M'
,p_column_label=>unistr('Tipo de Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6603216458259902)
,p_db_column_name=>'LINK_CARTERA'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Cartera'
,p_column_link=>'f?p=140000:10:&SESSION.::&DEBUG.:RP:P10_ID_SJTO_IMPSTO:#ID_SJTO_IMPSTO#'
,p_column_linktext=>'#LINK_CARTERA#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6603375154259903)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(68761568378793938)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'687616'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LINK_CARTERA:RFRNCIA_IGAC_FRMTDA:CNCLA_INSCRBE:NMRO_ORDEN:TTAL_RGSTRO:TPO_DCMNTO:NMRO_DCMNTO:NMBRE_PRPTRIO:DSTNO_ECNMCO:AREA_TRRNO:AREA_CNSTRDA:AVLUO_CTSTRAL:'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(6615718073408898)
,p_report_id=>wwv_flow_api.id(68761568378793938)
,p_name=>'Predio - Cancela'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CNCLA_INSCRBE'
,p_operator=>'='
,p_expr=>'C'
,p_condition_sql=>' (case when ("CNCLA_INSCRBE" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''C''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#FF7755'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(6616103499408899)
,p_report_id=>wwv_flow_api.id(68761568378793938)
,p_name=>'Predio - Inscribe'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CNCLA_INSCRBE'
,p_operator=>'='
,p_expr=>'I'
,p_condition_sql=>' (case when ("CNCLA_INSCRBE" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''I''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#99FF99'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(168439296109739910)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
'  Funcionalidad que permite',
unistr('  Aplicar las resoluciones igac por un n\00FAmero de resoluci\00F3n y radicaci\00F3n.<br/><br/>'),
unistr('  Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(305407295727404099)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center;">',
'        <b>',
'            <i>Opciones <i class="fa fa-gears" aria-hidden="true"></i>',
'			</i>',
'        </b>',
'    </div>',
'</h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(68819917911366978)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(305407295727404099)
,p_button_name=>'Btn_Aplicar_Resolucion'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P25_LBEL_BTON.'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro que desea aplicar/reliquidar la resoluciÃ³n?'',''Btn_Aplicar_Resolucion'');'
,p_button_condition=>'P25_CDGO_MTCION_CLSE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(68731000572336910)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(68730273554336902)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(9913587459651309)
,p_branch_name=>'Ir a 2025004'
,p_branch_action=>'f?p=&APP_ID.:2025004:&SESSION.::&DEBUG.:RP,2025004::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(68819917911366978)
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P25_INDCDOR_APRBA'
,p_branch_condition_text=>'S'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9913291045651306)
,p_name=>'P25_INDCDOR_APRBA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(68730273554336902)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9913401839651308)
,p_name=>'P25_LBEL_BTON'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(68730273554336902)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68730382590336903)
,p_name=>'P25_RSLCION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(68730273554336902)
,p_prompt=>unistr('N\00B0 Resoluci\00F3n')
,p_placeholder=>unistr('Digite N\00B0 Resoluci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>13
,p_field_template=>wwv_flow_api.id(88588499627834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68730442439336904)
,p_name=>'P25_RDCCION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(68730273554336902)
,p_prompt=>unistr('N\00B0 Radicaci\00F3n')
,p_placeholder=>unistr('Digite N\00B0 Radicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588499627834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68730624015336906)
,p_name=>'P25_CDGO_TRMTE_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(68730273554336902)
,p_prompt=>'Tipo de Tramite'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_TRAMITES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_trmte_tpo || '' - '' || dscrpcion as d,',
'       cdgo_trmte_tpo as r',
'  from df_s_tramites_tipo',
' order by cdgo_trmte_tpo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'P25_CDGO_MTCION_CLSE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88588114931834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68730785339336907)
,p_name=>'P25_CDGO_MTCION_CLSE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(68730273554336902)
,p_prompt=>unistr('Mutaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MUTACIONES_CLASE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_mtcion_clse || '' - '' || dscrpcion as d,',
'       cdgo_mtcion_clse as r',
'  from df_s_MUTACIONES_CLASE',
' order by dscrpcion'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_display_when=>'P25_CDGO_MTCION_CLSE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88588114931834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68730815271336908)
,p_name=>'P25_VGNCIA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(68730273554336902)
,p_prompt=>'Vigencia'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P25_CDGO_MTCION_CLSE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88588114931834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68730983058336909)
,p_name=>'P25_FCHA_RSLCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(68730273554336902)
,p_prompt=>unistr('Fecha de Resoluci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>9
,p_display_when=>'P25_CDGO_MTCION_CLSE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(88588114931834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68741201024491390)
,p_name=>'P25_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(68730273554336902)
,p_prompt=>'Sub-Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto  = :P25_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P25_ID_IMPSTO'
,p_ajax_items_to_submit=>'P25_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68742021725498894)
,p_name=>'P25_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(68730273554336902)
,p_prompt=>'Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(74445330426817901)
,p_validation_name=>'Validar si Existe Impuesto'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_impsto',
'         , a.id_impsto_sbmpsto',
'      into :P25_ID_IMPSTO',
'         , :P25_ID_IMPSTO_SBMPSTO',
'      from df_i_impuestos_subimpuesto a',
'     where a.cdgo_clnte          = :F_CDGO_CLNTE',
'       and a.cdgo_impsto_sbmpsto = ''IPU'';',
'     ',
'    return true; ',
'    ',
'exception',
'     when others then ',
'          return false;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'No fue posible encontrar el impuesto predial unificado [IPU].'
,p_when_button_pressed=>wwv_flow_api.id(68731000572336910)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(68731285138336912)
,p_validation_name=>'Validar Resolucion'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta  number;',
'    o_mnsje_rspsta varchar2(4000);',
'    v_fcha_rslcion date;',
'    v_rfrncia      si_g_resolucion_igac_t1.rfrncia_igac%type;',
'begin',
'    ',
unistr('    --Valida Resoluci\00F3n'),
'    pkg_si_resolucion_predio.prc_vl_resolucion( p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                              , p_id_impsto         => :P25_ID_IMPSTO',
'                                              , p_id_impsto_sbmpsto => :P25_ID_IMPSTO_SBMPSTO',
'                                              , p_rslcion           => :P25_RSLCION',
'                                              , p_rdccion           => :P25_RDCCION',
'                                              , o_cdgo_trmte_tpo    => :P25_CDGO_TRMTE_TPO',
'                                              , o_cdgo_mtcion_clse  => :P25_CDGO_MTCION_CLSE',
'                                              , o_vgncia            => :P25_VGNCIA',
'                                              , o_fcha_rslcion      => v_fcha_rslcion',
'                                              , o_rfrncia           => v_rfrncia',
'                                              , o_cdgo_rspsta       => o_cdgo_rspsta',
'                                              , o_mnsje_rspsta      => o_mnsje_rspsta );',
'    ',
'    :P25_FCHA_RSLCION := to_char( v_fcha_rslcion , ''DD/MM/YYYY'' );',
'    ',
'    if o_cdgo_rspsta <> 0 then',
'        return o_mnsje_rspsta;',
'    end if;',
'    ',
'    return null;',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_api.id(68731000572336910)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9912718844651301)
,p_name=>'Al cambiar RSLCION'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P25_RSLCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9912820524651302)
,p_event_id=>wwv_flow_api.id(9912718844651301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    select  rdccion INTO :P25_RDCCION',
'    from    si_g_resolucion_igac_t1',
'    where   rslcion = :P25_RSLCION',
'    order by nmro_orden',
'    fetch first 1 row only;',
'exception',
'    when others then',
'        :P25_RDCCION := null;',
unistr('        --raise_application_error( -20001 , ''Resoluci\00F3n no existe en el sistema'' );'),
unistr('        apex_application.g_print_success_message := ''<span style="color:white">Resoluci\00F3n no existe en el sistema</span>'';'),
'end;',
''))
,p_attribute_02=>'P25_RSLCION'
,p_attribute_03=>'P25_RDCCION'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9912909229651303)
,p_event_id=>wwv_flow_api.id(9912718844651301)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''radicacion:'', apex.item("P25_RDCCION").getValue());',
'',
'if ( apex.item("P25_RDCCION").getValue() === "" ) {',
'    ',
'    apex.message.showErrors([',
'      {',
'        type: "error",',
'        location: [ "page" ],',
unistr('        message: ''Resoluci\00F3n NO existe en el sistema'','),
'        unsafe: false',
'      }',
'    ]);',
'',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9913106324651305)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Indicador aprueba resoluci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte                => :F_CDGO_CLNTE,',
'                                                            p_cdgo_dfncion_clnte_ctgria => ''RSL'',',
'                                                            p_cdgo_dfncion_clnte        => ''ARA'' )',
'    into   :P25_INDCDOR_APRBA',
'    from   dual;',
'    ',
'    if :P25_INDCDOR_APRBA = ''S'' then',
unistr('        :P25_LBEL_BTON := ''Aprobar Resoluci\00F3n'' ;'),
'    else',
unistr('        :P25_LBEL_BTON := ''Aplicar Resoluci\00F3n'' ;    '),
'    end if;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(68775691465989015)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aplicar Resolucion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta  number;',
'    v_mnsje_rspsta varchar2(4000);',
'begin',
'    ',
unistr('    --Aplicaci\00F3n de Resoluci\00F3n'),
'    pkg_si_resolucion_predio.prc_ap_resolucion( p_id_usrio          => :F_ID_USRIO',
'                                              , p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                              , p_id_impsto         => :P25_ID_IMPSTO',
'                                              , p_id_impsto_sbmpsto => :P25_ID_IMPSTO_SBMPSTO',
'                                              , p_rslcion           => :P25_RSLCION',
'                                              , p_rdccion           => :P25_RDCCION',
'                                              , p_indcdor_aprba     => :P25_INDCDOR_APRBA -- Req. 0026316',
'                                              , o_cdgo_rspsta       => v_cdgo_rspsta',
'                                              , o_mnsje_rspsta      => v_mnsje_rspsta );',
'    ',
'    --Verifica si no hay Errores',
'    if( v_cdgo_rspsta <> 0 ) then',
'        raise_application_error( -20001 , v_mnsje_rspsta );',
'    end if;',
'',
'    ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(68819917911366978)
,p_process_success_message=>unistr('Resoluci\00F3n Aplicada/Reliquidada con \00E9xito.')
);
end;
/
