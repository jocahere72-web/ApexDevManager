prompt --application/pages/page_00134
begin
wwv_flow_api.create_page(
 p_id=>134
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Detalles Prescripciones'
,p_page_mode=>'MODAL'
,p_step_title=>'Detalles Prescripciones'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-GV-table th.a-GV-header, .a-GV-table th.a-GV-headerGroup {',
'    font-weight: 700;',
'    BACKGROUND: #e4e4e4;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'95%'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210204213347'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(178419068943519420)
,p_plug_name=>'Detalles de Prescripciones'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select      a.nmro_prscrpcion,',
'            to_char(a.fcha_rgstro, ''DD/MM/YYYY'') fcha_rgstro,',
'            e.dscrpcion dscrpcion_prscrpcion_tpo,',
'            h.idntfccion,',
'            c.vgncia,',
'            d.prdo || '' - '' || d.dscrpcion dscrpcion_prdo,',
'            decode(c.indcdor_aprbdo, ''S'', ''Si'', ''N'', ''No'') indcdor_aprbdo,',
'            to_char(k.vlor_ajste, :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor_ajste,',
'            j.nmbre_trcro usuario',
'from        gf_g_prescripciones         a',
'inner join  gf_g_prscrpcnes_sjto_impsto b   on  b.id_prscrpcion             =   a.id_prscrpcion',
'inner join  gf_g_prscrpcnes_vgncia      c   on  c.id_prscrpcion_sjto_impsto =   b.id_prscrpcion_sjto_impsto',
'inner join  df_i_periodos               d   on  d.id_prdo                   =   c.id_prdo',
'inner join  gf_d_prescripciones_tipo    e   on  e.id_prscrpcion_tpo         =   a.id_prscrpcion_tpo',
'inner join  gf_d_prescripciones_rspsta  f   on  f.cdgo_rspsta               =   a.cdgo_rspsta',
'inner join  si_i_sujetos_impuesto       g   on  g.id_sjto_impsto            =   b.id_sjto_impsto',
'inner join  si_c_sujetos                h   on  h.id_sjto                   =   g.id_sjto',
'left  join  pq_g_solicitudes            i   on  i.id_slctud                 =   a.id_slctud',
'left  join  v_sg_g_usuarios             j   on  j.id_usrio                  =   a.id_usrio_rspsta',
'left  join  gf_g_ajuste_detalle         k   on  k.id_ajste                  =   c.id_ajste',
'                                            and k.vgncia                    =   c.vgncia',
'                                            and k.id_prdo                   =   c.id_prdo*/',
'',
'                                            ',
'select      a.nmro_prscrpcion,',
'            to_char(a.fcha_rgstro, ''DD/MM/YYYY'') fcha_rgstro ,',
'            e.dscrpcion dscrpcion_prscrpcion_tpo   ,',
'            h.idntfccion  ,',
'            c.vgncia        ,',
'            d.prdo || '' - '' || d.dscrpcion dscrpcion_prdo   ,',
'            decode(c.indcdor_aprbdo, ''S'', ''Si'', ''N'', ''No'') indcdor_aprbdo ,',
'            k.vlor_ajste ,',
'            j.nmbre_trcro usuario ',
'from        gf_g_prescripciones    a',
'inner join  gf_g_prscrpcnes_sjto_impsto b   on  b.id_prscrpcion             =   a.id_prscrpcion',
'inner join  gf_g_prscrpcnes_vgncia      c   on  c.id_prscrpcion_sjto_impsto =   b.id_prscrpcion_sjto_impsto',
'inner join  df_i_periodos               d   on  d.id_prdo                   =   c.id_prdo',
'inner join  gf_d_prescripciones_tipo    e   on  e.id_prscrpcion_tpo         =   a.id_prscrpcion_tpo',
'inner join  si_i_sujetos_impuesto       g   on  g.id_sjto_impsto            =   b.id_sjto_impsto',
'inner join  si_c_sujetos                h   on  h.id_sjto                   =   g.id_sjto',
'left  join  v_sg_g_usuarios             j   on  j.id_usrio                  =   a.id_usrio_rspsta',
'left  join  gf_g_ajuste_detalle         k   on  k.id_ajste                  =   c.id_ajste',
'                                            and k.vgncia                    =   c.vgncia',
'                                            and k.id_prdo                   =   c.id_prdo',
'                                            ',
'where   a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and     b.id_impsto         =   nvl(:P134_ID_IMPSTO, b.id_impsto)',
'and     b.id_impsto_sbmpsto =   nvl(:P134_ID_IMPSTO_SBMPSTO, b.id_impsto_sbmpsto)',
'and     trunc(cast(a.fcha_rgstro as date)) between nvl(to_date(:P134_FECHA_DESDE, ''DD/MM/YYYY''), trunc(cast(a.fcha_rgstro as date))) and',
'        nvl(nvl(to_date(:P134_FECHA_HASTA, ''DD/MM/YYYY''), to_date(:P134_FECHA_DESDE, ''DD/MM/YYYY'')), trunc(cast(a.fcha_rgstro as date)))',
'and     a.id_prscrpcion_tpo =   nvl(:P134_ID_PRSCRPCION_TPO, a.id_prscrpcion_tpo)',
'and     a.cdgo_rspsta       =   nvl(:P134_CDGO_RSPSTA, a.cdgo_rspsta)',
'and     a.id_usrio_rspsta   =   nvl(:P134_USRIO, a.id_usrio_rspsta)',
'and     c.vgncia            =   nvl(:P134_VGNCIA, c.vgncia)',
'and     c.indcdor_aprbdo    =   nvl(:P134_INDCDOR_APRBDO, c.indcdor_aprbdo);'))
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
 p_id=>wwv_flow_api.id(178420906857519439)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLS:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>178420906857519439
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97175837114923902)
,p_db_column_name=>'NMRO_PRSCRPCION'
,p_display_order=>20
,p_column_identifier=>'U'
,p_column_label=>unistr('Prescripci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(28246635712257301)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>30
,p_column_identifier=>'AT'
,p_column_label=>'Fecha Registro'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24309826162560337)
,p_db_column_name=>'DSCRPCION_PRSCRPCION_TPO'
,p_display_order=>40
,p_column_identifier=>'AL'
,p_column_label=>unistr('Tipo Prescripci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24310340228560342)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>50
,p_column_identifier=>'AQ'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24309964572560338)
,p_db_column_name=>'VGNCIA'
,p_display_order=>60
,p_column_identifier=>'AM'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24310082190560339)
,p_db_column_name=>'DSCRPCION_PRDO'
,p_display_order=>70
,p_column_identifier=>'AN'
,p_column_label=>'Periodo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24310132562560340)
,p_db_column_name=>'INDCDOR_APRBDO'
,p_display_order=>80
,p_column_identifier=>'AO'
,p_column_label=>'Aprobado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(28246717123257302)
,p_db_column_name=>'USUARIO'
,p_display_order=>100
,p_column_identifier=>'AU'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70782445975218901)
,p_db_column_name=>'VLOR_AJSTE'
,p_display_order=>110
,p_column_identifier=>'AV'
,p_column_label=>'Vlor Ajste'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(178433909195532605)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'975799'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>25
,p_report_columns=>'NMRO_PRSCRPCION:FCHA_RGSTRO:DSCRPCION_PRSCRPCION_TPO:IDNTFCCION:VGNCIA:DSCRPCION_PRDO:INDCDOR_APRBDO::USUARIO'
,p_sort_column_1=>'ID_INSTNCIA_FLJO'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(211667231619721944)
,p_plug_name=>'Parametros'
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
 p_id=>wwv_flow_api.id(97583719180874559)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_XML:&P134_RPRTE.,<data><P_ID_IMPSTO>&P134_ID_IMPSTO.</P_ID_IMPSTO><P_ID_IMPSTO_SBMPSTO>&P134_ID_IMPSTO_SBMPSTO.</P_ID_IMPSTO_SBMPSTO><P_IDNTFCCION>&P134_IDNTFCCION.</P_IDNTFCCION><P_CDGO_AJSTE>&P134_CDGO_AJSTE.</P_CDGO_AJSTE><P_TPO_AJSTE>&P134_TPO_AJSTE.</P_TPO_AJSTE><P_AJSTE_USRIOS>&P134_AJSTE_USRIOS.</P_AJSTE_USRIOS><P_VLOR_AJSTE>&P134_VLOR_AJSTE.</P_VLOR_AJSTE><P_VLOR_AJSTE_HASTA>&P134_VLOR_AJSTE_HASTA.</P_VLOR_AJSTE_HASTA><P_FECHA>&P134_FECHA.</P_FECHA><P_FECHA_HASTA>&P134_FECHA_HASTA.</P_FECHA_HASTA></data>&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24309027683560329)
,p_name=>'P134_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(211667231619721944)
,p_prompt=>'Tributo:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_impsto,',
'        a.id_impsto',
'from    DF_C_IMPUESTOS  a',
'where   a.id_impsto =   :P134_ID_IMPSTO;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24309129651560330)
,p_name=>'P134_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(211667231619721944)
,p_prompt=>'Sub-Tributo:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_impsto_sbmpsto,',
'        a.id_impsto_sbmpsto',
'from    DF_I_IMPUESTOS_SUBIMPUESTO  a',
'where   a.id_impsto_sbmpsto =   :P134_ID_IMPSTO_SBMPSTO;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24309427751560333)
,p_name=>'P134_VGNCIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(211667231619721944)
,p_prompt=>'Vigencia:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24309583018560334)
,p_name=>'P134_INDCDOR_APRBDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(211667231619721944)
,p_prompt=>'Indicador Aprobado:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_SI_NO(S,N)'
,p_lov=>'.'||wwv_flow_api.id(177372678491050686)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97580679988874546)
,p_name=>'P134_USRIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(211667231619721944)
,p_prompt=>'Usuario:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_trcro,',
'        a.id_usrio',
'from    V_SG_G_USUARIOS a',
'where   a.id_usrio  =   :P134_USRIO;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97581065098874548)
,p_name=>'P134_FECHA_DESDE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(211667231619721944)
,p_prompt=>'Fecha Desde:'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97581487147874548)
,p_name=>'P134_FECHA_HASTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(211667231619721944)
,p_prompt=>'Fecha Hasta:'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98284687194155702)
,p_name=>'P134_CDGO_RSPSTA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(211667231619721944)
,p_prompt=>'Respuesta:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  dscrpcion,',
'        cdgo_rspsta',
'from    gf_d_prscrpcnes_rspsta',
'where   cdgo_rspsta = :P134_CDGO_RSPSTA;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(121822189735715604)
,p_name=>'P134_ID_PRSCRPCION_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(211667231619721944)
,p_prompt=>unistr('Tipo Prescripci\00F3n:')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_prscrpcion_tpo',
'from    gf_d_prescripciones_tipo    a',
'where   a.id_prscrpcion_tpo   =   :P134_ID_PRSCRPCION_TPO;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(97582230212874557)
,p_name=>'Mostrar Usuario'
,p_event_sequence=>10
,p_condition_element=>'P134_USRIO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97582722565874558)
,p_event_id=>wwv_flow_api.id(97582230212874557)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P134_USRIO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97583281302874558)
,p_event_id=>wwv_flow_api.id(97582230212874557)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P134_USRIO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
end;
/
