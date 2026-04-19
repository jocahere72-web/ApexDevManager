prompt --application/pages/page_00155
begin
wwv_flow_api.create_page(
 p_id=>155
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Gesti\00F3n Registro de Recaudo por Archivo Asobancaria')
,p_step_title=>unistr('Gesti\00F3n Registro de Recaudo por Archivo Asobancaria')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-label{',
'  font-weight: 700;',
'}',
'',
'.a-IRR-noDataMsg {',
'    padding: 0;',
'}',
'',
'.t-Region--scrollBody>.t-Region-bodyWrap>.t-Region-body{',
'  padding: 1.1rem;',
'  border-bottom: solid 1px #ececec;',
'}',
'',
'/*.fa-download:before{',
'  color: #3ba100;',
'}*/',
'',
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(177374633629050691)
,p_last_updated_by=>'LTORRES'
,p_last_upd_yyyymmddhh24miss=>'20200827161253'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10018409552616197)
,p_plug_name=>'Opciones '
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10018595791616199)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
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
'<i>',
'Funcionalidad que permite: <br><br>',
'',
'<b><i>1.</i></b> Crear un nuevo registro de recaudo por archivo asobancaria.<br><br>',
unistr('<b><i>2.</i></b> Visualizar la informaci\00F3n de los registros de recaudos por archivo asobancaria.<br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'<i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10018716726616200)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(10019900522616212)
,p_plug_name=>'<b>Informe de Registros de Recaudo por Archivo Asobancaria.</b>'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'     select a.id_rcdo_cntrol',
'          , a.dscrpcion_bnco',
'          , a.nmro_cnta',
'          , a.obsrvcion      ',
'          , a.fcha_cntrol      ',
'          , a.fcha_rgstro',
'          , to_char( a.vlor_rcdos , :F_FRMTO_MNDA ) as vlor_rcdos',
'          , a.cntdad_rcdos',
'          , a.file_name',
'          , a.id_prcso_crga',
'          , a.user_name || '' - '' || a.nmbre_trcro as user_nmbre_trcro  ',
'          , case when b.cntdad is null and cntdad_rcdos <> 0 then',
'                 ''<span aria-hidden="true" class="fa fa-eye" style="font-size: 20px;"></span>'' ',
'                else ',
'                 ''<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'' ',
'            end as link',
'          , case when b.cntdad is null and cntdad_rcdos <> 0 then',
'                 ''title="Ver"'' ',
'                 else ',
'                 ''title="Editar"'' ',
'           end as attribute ',
'          , case when b.cntdad is null and cntdad_rcdos <> 0 then',
'                 ''Finalizado''',
'                 else ',
'                 ''Iniciado'' ',
'            end as estdo ',
'          , nvl(c.cntdad_no_prcsda, 0) as cntdad_no_prcsda',
'       from v_re_g_recaudos_control a',
'  left join (',
'                 select count(*) as cntdad',
'                      , id_rcdo_cntrol',
'                   from v_re_g_recaudos ',
'                  where cdgo_rcdo_estdo = ''IN''',
'               group by id_rcdo_cntrol',
'         ) b   ',
'        on a.id_rcdo_cntrol     = b.id_rcdo_cntrol',
'  left join (',
'                  select a.id_prcso_crga,',
'                         count(*) as cntdad_no_prcsda',
'                    from re_g_recaudos_asobancaria a',
'                         join et_g_procesos_carga b on a.id_prcso_crga = b.id_prcso_crga',
'                  where b.indcdor_prcsdo = ''S'' ',
'                  and a.indcdor_rlzdo = ''N''',
'                  and a.tpo_rgstro = ''06''',
'                  group by a.id_prcso_crga',
'         ) c',
'        on a.id_prcso_crga     = c.id_prcso_crga',
'      where a.cdgo_clnte        = :F_CDGO_CLNTE',
'        and a.id_impsto         = nvl(:P155_ID_IMPSTO,id_impsto)',
'        and a.id_impsto_sbmpsto = nvl(:P155_ID_IMPSTO_SBMPSTO,id_impsto_sbmpsto)',
'        and a.cdgo_rcdo_orgen   = ''AC''',
'        and trunc( a.fcha_cntrol ) between :P155_FCHA_INCIO and :P155_FCHA_FIN',
'   order by trunc( a.fcha_cntrol )',
'          , a.id_rcdo_cntrol'))
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
 p_id=>wwv_flow_api.id(10020067606616214)
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:221:&SESSION.::&DEBUG.:RP,221:P221_ID_RCDO_CNTROL,P221_ID_PRCSO_CRGA,P221_BRANCH:#ID_RCDO_CNTROL#,#ID_PRCSO_CRGA#,&APP_PAGE_ID.'
,p_detail_link_text=>'#LINK#'
,p_detail_link_attr=>'#ATTRIBUTE#'
,p_owner=>'NARDILA'
,p_internal_uid=>10020067606616214
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5159071299685512)
,p_db_column_name=>'ID_RCDO_CNTROL'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>unistr('N\00FAmero de Control')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5161410374685514)
,p_db_column_name=>'DSCRPCION_BNCO'
,p_display_order=>20
,p_column_identifier=>'L'
,p_column_label=>'Banco'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5159481388685513)
,p_db_column_name=>'NMRO_CNTA'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>unistr('N\00FAmero de Cuenta')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5160290454685513)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Fecha Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118331204855867812)
,p_db_column_name=>'FCHA_CNTROL'
,p_display_order=>80
,p_column_identifier=>'U'
,p_column_label=>'Fecha Recaudo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(118331416110867814)
,p_db_column_name=>'CNTDAD_RCDOS'
,p_display_order=>100
,p_column_identifier=>'W'
,p_column_label=>'Cantidad Recaudos'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38462339503604306)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>110
,p_column_identifier=>'AD'
,p_column_label=>'Archivo '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38462557029604308)
,p_db_column_name=>'ID_PRCSO_CRGA'
,p_display_order=>130
,p_column_identifier=>'AF'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:ET_G_PROCESOS_CARGA:FILE_BLOB:ID_PRCSO_CRGA::FILE_MIMETYPE:FILE_NAME:::attachment:<span class="fa fa-download" aria-hidden="true" title="Descargar"></span>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38462622801604309)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>140
,p_column_identifier=>'AG'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38462740300604310)
,p_db_column_name=>'USER_NMBRE_TRCRO'
,p_display_order=>150
,p_column_identifier=>'AH'
,p_column_label=>'Usuario '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38462828702604311)
,p_db_column_name=>'VLOR_RCDOS'
,p_display_order=>160
,p_column_identifier=>'AI'
,p_column_label=>'Total Recaudos'
,p_column_type=>'STRING'
,p_format_mask=>'F_FRMTO_MNDA'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59127723456644507)
,p_db_column_name=>'LINK'
,p_display_order=>170
,p_column_identifier=>'AJ'
,p_column_label=>'Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59127862903644508)
,p_db_column_name=>'ATTRIBUTE'
,p_display_order=>180
,p_column_identifier=>'AK'
,p_column_label=>'Attribute'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(59127966858644509)
,p_db_column_name=>'ESTDO'
,p_display_order=>190
,p_column_identifier=>'AL'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87915683353266602)
,p_db_column_name=>'CNTDAD_NO_PRCSDA'
,p_display_order=>200
,p_column_identifier=>'AM'
,p_column_label=>'Recaudos No Procesados'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(10053544695811596)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'51642'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'DSCRPCION_BNCO:ID_RCDO_CNTROL:NMRO_CNTA:FCHA_CNTROL:CNTDAD_RCDOS:VLOR_RCDOS:OBSRVCION:USER_NMBRE_TRCRO:FILE_NAME:ID_PRCSO_CRGA:ESTDO::CNTDAD_NO_PRCSDA'
,p_break_on=>'0:0:0:0:0:DSCRPCION_BNCO'
,p_break_enabled_on=>'0:0:0:0:0:DSCRPCION_BNCO'
,p_sum_columns_on_break=>'VLOR_TTAL:NMERO_RGSTRO'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(88003566299620703)
,p_report_id=>wwv_flow_api.id(10053544695811596)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'CNTDAD_NO_PRCSDA'
,p_operator=>'>'
,p_expr=>'0'
,p_condition_sql=>'"CNTDAD_NO_PRCSDA" > to_number(#APXWS_EXPR#)'
,p_condition_display=>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  '
,p_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(61309367583841914)
,p_plug_name=>'<b>Informe de Archivos de Asobancaria no Procesados.</b>'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'      select a.id_prcso_crga  ',
'           , a.file_name ',
'           , to_char( a.fcha_rgstro , ''DD/MM/YYYY HH:MI:SS AM'' )  as fcha_rgstro',
'           , a.idntfccion',
'           , a.nmbre_trcro as usrio',
'           , ( select /*+ RESULT_CACHE */',
'                      b.cdgo_tpo_asbncria',
'                from re_g_recaudos_asobancaria b',
'               where b.id_prcso_crga = a.id_prcso_crga',
'               fetch first 1 row only ) as cdgo_tpo_asbncria',
'        from v_et_g_procesos_carga a',
'       where id_prcso_crga in (  ',
'                                    select a.id_prcso_crga',
'                                      from re_g_recaudos_asobancaria a',
'                                      join et_g_procesos_carga b',
'                                        on a.id_prcso_crga = b.id_prcso_crga',
'                                     where b.cdgo_clnte    = :F_CDGO_CLNTE',
'                                       and a.tpo_rgstro    = ''01''',
'                                  group by a.id_prcso_crga',
'                              )',
'         and not id_prcso_crga in (  ',
'                                        select a.id_prcso_crga',
'                                          from re_g_recaudos_asobancaria a',
'                                          join et_g_procesos_carga b',
'                                            on a.id_prcso_crga = b.id_prcso_crga',
'                                         where b.cdgo_clnte    = :F_CDGO_CLNTE',
'                                           and a.tpo_rgstro    = ''06''',
'                                           and a.indcdor_rlzdo = ''S''',
'                                      group by a.id_prcso_crga',
'                              )',
'         and indcdor_prcsdo = ''S''',
'    order by a.id_prcso_crga'))
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
 p_id=>wwv_flow_api.id(61309429509841915)
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:221:&SESSION.:#ID_PRCSO_CRGA#:&DEBUG.:RP,221:P221_ID_PRCSO_CRGA,P221_BRANCH,P221_CDGO_TPO_ASBNCRIA:#ID_PRCSO_CRGA#,&APP_PAGE_ID.,#CDGO_TPO_ASBNCRIA#'
,p_detail_link_text=>'<span aria-hidden="true" class="fa fa-eye" style="font-size: 20px;"></span>'
,p_detail_link_attr=>'title="Ver"'
,p_owner=>'NARDILA'
,p_internal_uid=>61309429509841915
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61309507858841916)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Archivo '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61309680961841917)
,p_db_column_name=>'ID_PRCSO_CRGA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('N\00FAmero de Archivo')
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61310997736841930)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Fecha Registro'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61311005809841931)
,p_db_column_name=>'USRIO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61312008609841941)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61312176377841942)
,p_db_column_name=>'CDGO_TPO_ASBNCRIA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Cdgo Tpo Asbncria'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(61459815991884675)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'614599'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FILE_NAME:FCHA_RGSTRO:IDNTFCCION:USRIO::CDGO_TPO_ASBNCRIA'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5154735695685503)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(10018409552616197)
,p_button_name=>'Btn_Nuevo_Registro'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Registro'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:221:&SESSION.::&DEBUG.:RP,221:P221_BRANCH:&APP_PAGE_ID.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5155717459685506)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(10018716726616200)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consulta'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5156176732685507)
,p_name=>'P155_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(10018716726616200)
,p_prompt=>'Tributos:'
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
,p_lov_null_text=>'Seleccione Impuesto'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de lista el Tributo a consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'277'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5156578866685508)
,p_name=>'P155_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(10018716726616200)
,p_prompt=>'Sub-Tributos:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d',
'     , id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto  = :P155_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Sub-Impuesto'
,p_lov_cascade_parent_items=>'P155_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de lista el Sub-Tributo a consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'277'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5156954930685509)
,p_name=>'P155_FCHA_INCIO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(10018716726616200)
,p_item_default=>'to_date( ''01/'' || to_char( sysdate,''MM/YYYY'')  , ''DD/MM/YYYY'' )'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Inicio:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha inicio de recaudo.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5157877315685510)
,p_name=>'P155_FCHA_FIN'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(10018716726616200)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Fin:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Seleccione la fecha fin de recaudo.'
,p_attribute_02=>'&P155_FCHA_INCIO.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5165087760685525)
,p_name=>'Al Cambiar Fecha Inicio'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5165586724685526)
,p_event_id=>wwv_flow_api.id(5165087760685525)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P155_FCHA_FIN").datepicker( ''option'' , ''minDate'' , $("#P155_FCHA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5164672038685525)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpia Cache Sesion'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_is_stateful_y_n=>'Y'
);
end;
/
