prompt --application/pages/page_00034
begin
wwv_flow_api.create_page(
 p_id=>34
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Ajustes D\00E9bito')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Ajustes D\00E9bito')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-GV-table th.a-GV-header, .a-GV-table th.a-GV-headerGroup {',
'    font-weight: 700;',
'    BACKGROUND: #e4e4e4;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'95%'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20191108165229'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80859335507673732)
,p_plug_name=>'Ajustes Realizados'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_ajste,',
'       a.numro_ajste,',
'       pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => a.idntfccion_sjto, p_frmto => ''xx-xx-xxxx-xxxx-xxx'' , p_crcter_dlmtdor => ''-'' ) idntfccion_sjto,',
'       a.id_impsto,',
'       a.id_impsto_sbmpsto,',
'       a.id_sjto_impsto,',
'       a.nmbre_impsto,',
'       a.nmbre_impsto_sbmpsto,',
'       a.drccion,',
'--       upper(c.nmbre_rzon_scial) prptrio_prcpal,',
'       to_char( a.fcha, ''DD/MM/YYYY'')  fecha,',
'   --  a.fcha,',
'       a.nmro_slctud,',
'       a.cdgo_tpo_ajste,',
'       case',
'			when a.tpo_ajste = ''Debito'' then',
unistr('				''D\00E9bito'''),
'			else',
unistr('				''Cr\00E9dito'''),
'       end tpo_ajste,',
'       a.dscrpcion_motivo,',
'       a.dscrpcion_estado,',
'       a.fcha_aplccion_frmtda,',
'       to_char(a.vlor, :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor_ajste,',
'    -- to_char(b.vlor_ajste, ''999,999,999'') vlor_ajste,',
'    -- b.vlor_ajste,',
'       d.nmbre_trcro',
'       ',
'       ',
'from v_gf_g_ajustes a       ',
'--join v_gf_g_ajuste_detalle      b on a.id_ajste = b.id_ajste',
'--left join v_si_i_sujetos_responsable c on a.id_sjto  = c.id_sjto',
'join v_sg_g_usuarios            d on a.id_usrio = d.id_usrio',
' where a.cdgo_clnte =:F_CDGO_CLNTE ',
'   and a.id_impsto              = nvl(:P34_ID_IMPSTO, a.id_impsto)',
'   and a.id_impsto_sbmpsto      = nvl(:P34_ID_IMPSTO_SBMPSTO, a.id_impsto_sbmpsto)',
'   and a.idntfccion_sjto        = nvl(:P34_IDNTFCCION, a.idntfccion_sjto)',
'   and a.cdgo_ajste_estdo       = nvl(:P34_CDGO_AJSTE, a.cdgo_ajste_estdo)',
' --  and a.tpo_ajste              = nvl(:P34_TPO_AJSTE, a.tpo_ajste)',
' --  and b.tpo_ajste              = nvl(:P34_TPO_AJSTE, b.tpo_ajste)',
'   and a.cdgo_tpo_ajste         = ''DB''',
'   AND a.CDGO_AJSTE_ESTDO       = ''AP''',
'   and a.id_usrio               = nvl(:P34_AJSTE_USRIOS, a.id_usrio) ',
'   and ( (a.vlor  between :P34_VLOR_AJSTE and :P34_VLOR_AJSTE_HASTA)',
'   or (a.vlor >= :P34_VLOR_AJSTE and :P34_VLOR_AJSTE_HASTA is null) ',
'   or (a.vlor <= :P34_VLOR_AJSTE_HASTA and :P34_VLOR_AJSTE is null)',
'   or (:P34_VLOR_AJSTE is null and :P34_VLOR_AJSTE_HASTA is null )) ',
'   ',
'    and  trunc(a.fcha_aplccion)       =trunc(to_date(:P34_FECHA_BUSQUEDA , ''DD/MM/YY''))',
'   ',
'      ',
' /*  and  ((trunc(a.fcha) between :P34_FECHA and :P34_FECHA_HASTA)',
'   or (trunc(a.fcha) >= :P34_FECHA and :P34_FECHA_HASTA is null) ',
'   or (trunc(a.fcha) <= :P34_FECHA_HASTA and :P34_FECHA  is null)',
'   or(:P34_FECHA is null and :P34_FECHA_HASTA is null ))*/',
'   order by a.id_ajste desc;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P34_FECHA,P34_FECHA_HASTA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'&P32_FECHA.',
'&P32_USRIO.',
''))
,p_prn_page_header_font_color=>'#FF0F2F'
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
 p_id=>wwv_flow_api.id(80861173421673751)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLS:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>80861173421673751
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41005465300789133)
,p_db_column_name=>'ID_AJSTE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'No Ajuste'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41005868016789133)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41006224154789134)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41006620271789134)
,p_db_column_name=>'ID_IMPSTO_SBMPSTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Id Impsto Sbmpsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41007080724789135)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41007457851789136)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41007890388789136)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Subimpuesto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41008216636789136)
,p_db_column_name=>'DRCCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Direccion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41009018850789136)
,p_db_column_name=>'NMRO_SLCTUD'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Solicitud'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41009470045789137)
,p_db_column_name=>'CDGO_TPO_AJSTE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Cdgo Tpo Ajste'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41009814458789137)
,p_db_column_name=>'TPO_AJSTE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41010228895789137)
,p_db_column_name=>'DSCRPCION_MOTIVO'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41010650650789137)
,p_db_column_name=>'DSCRPCION_ESTADO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41011005490789137)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41004608183789133)
,p_db_column_name=>'VLOR_AJSTE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Valor Ajuste'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(41005045475789133)
,p_db_column_name=>'FECHA'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>unistr('Fecha Creaci\00F3n ')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113657464995741105)
,p_db_column_name=>'NUMRO_AJSTE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'No. Ajuste'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(32378086982610708)
,p_db_column_name=>'FCHA_APLCCION_FRMTDA'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>unistr('Fecha Aplicaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(80874175759686917)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'410114'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NUMRO_AJSTE:FECHA:NMBRE_IMPSTO:IDNTFCCION_SJTO:VLOR_AJSTE:TPO_AJSTE:DSCRPCION_MOTIVO:DSCRPCION_ESTADO:NMBRE_TRCRO::FCHA_APLCCION_FRMTDA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(114107498183876256)
,p_plug_name=>unistr('Par\00E1metros')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(41014803909789140)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_XML:&P34_RPRTE.,<P_ID_IMPSTO>&P34_ID_IMPSTO.</P_ID_IMPSTO><P_ID_IMPSTO_SBMPSTO>&P34_ID_IMPSTO_SBMPSTO.</P_ID_IMPSTO_SBMPSTO><P_IDNTFCCION>&P34_IDNTFCCION.</P_IDNTFCCION><P_CDGO_AJSTE>&P34_CDGO_AJSTE.</P_CDGO_AJSTE><P_TPO_AJSTE>&P34_TPO_AJSTE.</P_TPO_AJSTE><P_AJSTE_USRIOS>&P34_AJSTE_USRIOS.</P_AJSTE_USRIOS><P_VLOR_AJSTE>&P34_VLOR_AJSTE.</P_VLOR_AJSTE><P_VLOR_AJSTE_HASTA>&P34_VLOR_AJSTE_HASTA.</P_VLOR_AJSTE_HASTA><P_FECHA>&P34_FECHA.</P_FECHA><P_FECHA_HASTA>&P34_FECHA_HASTA.</P_FECHA_HASTA>&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24476896303711320)
,p_name=>'P34_ID_IMPSTO'
,p_item_sequence=>123
,p_item_plug_id=>wwv_flow_api.id(114107498183876256)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24476961224711321)
,p_name=>'P34_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>133
,p_item_plug_id=>wwv_flow_api.id(114107498183876256)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41012195220789139)
,p_name=>'P34_USRIO'
,p_item_sequence=>63
,p_item_plug_id=>wwv_flow_api.id(114107498183876256)
,p_prompt=>'<b>Usuario:</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41012599547789139)
,p_name=>'P34_FECHA'
,p_item_sequence=>93
,p_item_plug_id=>wwv_flow_api.id(114107498183876256)
,p_prompt=>'<b>Fecha Desde:</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41012919404789139)
,p_name=>'P34_FECHA_HASTA'
,p_item_sequence=>103
,p_item_plug_id=>wwv_flow_api.id(114107498183876256)
,p_prompt=>'<b>Fecha Hasta:</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50096139402252801)
,p_name=>'P34_FECHA_BUSQUEDA'
,p_item_sequence=>113
,p_item_plug_id=>wwv_flow_api.id(114107498183876256)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(41013399134789140)
,p_name=>'Mostrar Usuario'
,p_event_sequence=>10
,p_condition_element=>'P34_USRIO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(41013816115789140)
,p_event_id=>wwv_flow_api.id(41013399134789140)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P34_USRIO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(41014354086789140)
,p_event_id=>wwv_flow_api.id(41013399134789140)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P34_USRIO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
end;
/
