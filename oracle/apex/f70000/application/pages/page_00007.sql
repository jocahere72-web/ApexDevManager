prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Liquidaciones Atipicas'
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Liquidaciones At\00EDpicas')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#PCA .u-colors>:nth-child(45n+1) .u-color {',
'    background-color: mediumvioletred;',
'    color: #fff;',
'    font-weight: 400;',
'}',
'',
'#PCAL .u-colors>:nth-child(45n+1) .u-color {',
'    background-color: coral;',
'    color: #fff;',
'    font-weight: 400;',
'}',
'',
'#PBI .u-colors>:nth-child(45n+1) .u-color {',
'    background-color: darkkhaki;',
'    color: #fff;',
'    font-weight: 400;',
'}',
'',
'#PBIL .u-colors>:nth-child(45n+1) .u-color {',
'    background-color: orchid;',
'    color: #fff;',
'    font-weight: 400;',
'}',
'',
'#PE .u-colors>:nth-child(45n+1) .u-color {',
'    background-color: rebeccapurple;',
'    color: #fff;',
'    font-weight: 400;',
'}',
'',
'#PEL .u-colors>:nth-child(45n+1) .u-color {',
'    background-color: slateblue;',
'    color: #fff;',
'    font-weight: 400;',
'}',
'',
'#PLC .u-colors>:nth-child(45n+1) .u-color {',
'    background-color: seagreen;',
'    color: #fff;',
'    font-weight: 400;',
'}',
'',
'#PPP .u-colors>:nth-child(45n+1) .u-color {',
'    background-color: teal;',
'    color: #fff;',
'    font-weight: 400;',
'}',
'',
'#PPPL .u-colors>:nth-child(45n+1) .u-color {',
'    background-color: royalblue;',
'    color: #fff;',
'    font-weight: 400;',
'}'))
,p_step_template=>wwv_flow_api.id(164065555011707626)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'400'
,p_dialog_width=>'1200'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20190205155134'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173529326233126567)
,p_plug_name=>'<b>Predios Campo Alegre</b>'
,p_region_name=>'PCA'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios Liq. Como 21-LOTE NO URBANIZABLE AREA RIESGO NO MITIGABLE '' as label,',
'           count(*) cntdad',
'      from (',
'              select p.rfrncia_igac rfrncia',
'                from v_gi_g_cinta_igac p',
'                join v_si_i_sujetos_impuesto c',
'                  on c.idntfccion = p.rfrncia_igac',
'               where p.dstno_ecnmco_igac= ''21'' ',
'                 and c.id_sjto_estdo = 9',
'                 and p.vgncia = :P2_VGNCIA',
'                 and p.cdgo_clnte = :F_CDGO_CLNTE',
'           )a'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P7_INDICADOR'
,p_plug_display_when_cond2=>'PCA'
,p_attribute_02=>'CNTDAD'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173529394888126568)
,p_plug_name=>'Region Botones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164075504857707680)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173529976815126574)
,p_plug_name=>'<b>Predios Liquidacion Atipica</b>'
,p_region_name=>'PCAL'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios Parte de Liquidacion Atipica'' as label,',
'           count(*) cntdad',
'      from v_gi_g_cinta_igac c',
'     where c.nmro_orden_igac = ''001''',
'       and c.vgncia = :P2_VGNCIA',
'       and c.cdgo_clnte = :F_CDGO_CLNTE',
'       and c.rfrncia_igac in ( ',
'                              select p.idntfccion rfrncia ',
'                                from v_si_i_sujetos_impuesto p ',
'                               where p.idntfccion = c.rfrncia_igac',
'                                 and p.id_sjto_estdo = 9',
'                                 and c.dstno_ecnmco_igac = ''21''',
'                            )'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P7_INDICADOR'
,p_plug_display_when_cond2=>'PCA'
,p_attribute_02=>'CNTDAD'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173530100071126575)
,p_plug_name=>'<b>Predios Banco Inmobiliario</b>'
,p_region_name=>'PBI'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select ''Predios 22-MUNICIPAL \2013 BANCO INMOBILIARIO METRO'' as label,'),
'           count(*) cntdad',
'      from v_si_i_sujetos_impuesto p',
'      join v_gi_g_cinta_igac c',
'        on p.idntfccion = c.rfrncia_igac',
'     where p.id_sjto_estdo = 9 ',
'       and c.dstno_ecnmco_igac = ''22''',
'       and c.vgncia = ( :P2_VGNCIA - 1 )',
'       and c.cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P7_INDICADOR'
,p_plug_display_when_cond2=>'PBI'
,p_attribute_02=>'CNTDAD'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173530198387126576)
,p_plug_name=>'<b>Predios Banco Inmobiliario Atipica</b>'
,p_region_name=>'PBIL'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios parte liquidacion atipica'' as label,',
'              count(*) cntdad',
'         from v_gi_g_cinta_igac c',
'        where c.nmro_orden_igac = ''001'' ',
'          and c.area_cnstrda_igac = 0',
'          and c.vgncia = (:P2_VGNCIA -1 )',
'          and c.cdgo_clnte = :F_CDGO_CLNTE',
'          and c.rfrncia_igac in ( ',
'                                    select p.idntfccion rfrncia ',
'                                      from v_si_i_sujetos_impuesto p ',
'                                     where p.idntfccion = c.rfrncia_igac ',
'                                       and p.id_sjto_estdo = 9 ',
'                                       and c.dstno_ecnmco_igac = ''22''',
'                                )'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P7_INDICADOR'
,p_plug_display_when_cond2=>'PBI'
,p_attribute_02=>'CNTDAD'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173530302295126577)
,p_plug_name=>'<b>Predios Estatales</b>'
,p_region_name=>'PE'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios 33-ENTIDADES ORDEN NACIONAL y DEPARTAMENTAL'' as label,',
'           count(*) cntdad',
'      from si_i_sujetos_impuesto p',
'      join v_gi_g_cinta_igac c',
'        on p.idntfccion = c.rfrncia_igac',
'     where p.id_sjto_estdo = 9 ',
'       and c.dstno_ecnmco_igac = ''33''',
'       and c.vgncia = :P2_VGNCIA',
'       and c.cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P7_INDICADOR'
,p_plug_display_when_cond2=>'PE'
,p_attribute_02=>'CNTDAD'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173530338339126578)
,p_plug_name=>'<b>Predios Estatales Liquidacion Atipica</b>'
,p_region_name=>'PEL'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios Parte Liquidacion Atipica'' as label,',
'           count(*) cntdad',
'      from v_gi_g_cinta_igac c',
'     where c.nmro_orden_igac = ''001''',
'       and c.vgncia = :P2_VGNCIA',
'       and c.cdgo_clnte = :F_CDGO_CLNTE',
'       and exists ( ',
'                       select ''x'' ',
'                         from v_si_i_sujetos_impuesto p ',
'                        where p.idntfccion = c.rfrncia_igac ',
'                          and p.id_sjto_estdo = 9 ',
'                          and c.dstno_ecnmco_igac = ''33'' ',
'                  )'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P7_INDICADOR'
,p_plug_display_when_cond2=>'PE'
,p_attribute_02=>'CNTDAD'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173530446969126579)
,p_plug_name=>'<b>Predios Las Cayenas</b>'
,p_region_name=>'PLC'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios Parte Liquidacion Atipica Las Cayenas'' as label,',
'           count(*) CNTDAD',
'      from v_gi_g_cinta_igac c',
'     where c.nmro_orden_igac = ''001'' ',
'       and substr(c.rfrncia_igac,1,8)= ''00020000'' ',
'       and c.dstno_ecnmco_igac in (''B'',''C'')',
'       and c.vgncia = :P2_VGNCIA',
'       and c.cdgo_clnte = :F_CDGO_CLNTE'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P7_INDICADOR'
,p_plug_display_when_cond2=>'PC'
,p_attribute_02=>'CNTDAD'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173530580771126580)
,p_plug_name=>'<b>Predios Plan Parcial</b>'
,p_region_name=>'PPP'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios Liquidados Plan Parcial'' as label,',
'           count(*) cntdad',
'      from v_si_i_predios p ',
'      join v_si_i_sujetos_impuesto pp',
'        on p.id_sjto_impsto = pp.id_sjto_impsto',
'     where substr(pp.idntfccion,1,2)=''00'' ',
'       and p.cdgo_prdio_clsfccion = ''01'' ',
'       and p.cdgo_dstno_igac = ''01'' ',
'       and pp.id_sjto_estdo = 1'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P7_INDICADOR'
,p_plug_display_when_cond2=>'PVS'
,p_attribute_02=>'CNTDAD'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173530676199126581)
,p_plug_name=>'<b>Predios Plan Parcial Villa San Pablo</b>'
,p_region_name=>'PPPL'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Plan Liquidacion Atipica'' as label,',
'            count(*) cntdad',
'       from v_gi_g_cinta_igac c',
'      where c.nmro_orden_igac = ''001''',
'        and c.vgncia = :P2_VGNCIA',
'        and c.cdgo_clnte = :F_CDGO_CLNTE',
'        and rfrncia_igac in (  ',
'                                select pp.idntfccion   ',
'                                  from v_si_i_predios p ',
'                                  join v_si_i_sujetos_impuesto pp',
'                                    on p.id_sjto_impsto = pp.id_sjto_impsto',
'                                 where substr(pp.idntfccion,1,2)= ''00'' ',
'                                   and p.cdgo_prdio_clsfccion = ''01'' ',
'                                   and p.cdgo_dstno_igac = ''01'' ',
'                                   and pp.id_sjto_estdo = 1',
'                            )',
'     order by c.rfrncia_igac'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P7_INDICADOR'
,p_plug_display_when_cond2=>'PVS'
,p_attribute_02=>'CNTDAD'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(175283463279275575)
,p_plug_name=>unistr('Regi\00F3n de Anexos')
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(164075504857707680)
,p_plug_display_sequence=>95
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(173529501249126569)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(173529394888126568)
,p_button_name=>'Btn_Cancelar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(175283579198275576)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(175283463279275575)
,p_button_name=>'Btn_Anexo_04'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Anexo 04'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11::'
,p_button_condition=>'P7_INDICADOR'
,p_button_condition2=>'PCA'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-arrow-down'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(175283744200275578)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(175283463279275575)
,p_button_name=>'Btn_Anexo_05'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Anexo 05'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11::'
,p_button_condition=>'P7_INDICADOR'
,p_button_condition2=>'PBI'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-arrow-down'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(175284240906275583)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(175283463279275575)
,p_button_name=>'Btn_Anexo_06'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Anexo 06'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11::'
,p_button_condition=>'P7_INDICADOR'
,p_button_condition2=>'PE'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-arrow-down'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(175284597442275586)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(175283463279275575)
,p_button_name=>'Btn_Anexo_07'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Anexo 07'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11::'
,p_button_condition=>'P7_INDICADOR'
,p_button_condition2=>'PC'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-arrow-down'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(175285418755275594)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(175283463279275575)
,p_button_name=>'Btn_Anexo_08'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Anexo 08'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11::'
,p_button_condition=>'P7_INDICADOR'
,p_button_condition2=>'PVS'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-arrow-down'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(173529601793126570)
,p_name=>'P7_INDICADOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(173529394888126568)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(173529784006126572)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(173529501249126569)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(173529893614126573)
,p_event_id=>wwv_flow_api.id(173529784006126572)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(175284895909275589)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valores Anexo 04'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    :F_NMBRE_ARCHVO := ''Anexo_''||:P40_VGNCIA||''_04'';',
'    ',
'     begin',
'         select vlor',
'           into :F_SQL',
'           from df_c_definiciones_cliente',
'          where cdgo_clnte = :F_CDGO_CLNTE',
'            and cdgo_dfncion_clnte = ''A04'';',
'         exception when no_data_found ',
'              then',
'              :F_SQL := '''';',
'     end;',
'     ',
'     :F_SQL := replace( :F_SQL , ''!VGNCIA!'' , :P40_VGNCIA);',
'     :F_SQL := replace( :F_SQL , ''!CLNTE!'' , :F_CDGO_CLNTE);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(175283579198275576)
,p_process_when=>'P7_INDICADOR'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'PCA'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(175285022938275590)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valores Anexo 05'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    :F_NMBRE_ARCHVO := ''Anexo_''||:P40_VGNCIA||''_05'';',
'    ',
'     begin',
'         select vlor',
'           into :F_SQL',
'           from df_c_definiciones_cliente',
'          where cdgo_clnte = :F_CDGO_CLNTE',
'            and cdgo_dfncion_clnte = ''A05'';',
'         exception when no_data_found ',
'              then',
'              :F_SQL := '''';',
'     end;',
'     ',
'     :F_SQL := replace( :F_SQL , ''!VGNCIA!'' , :P40_VGNCIA);',
'     :F_SQL := replace( :F_SQL , ''!CLNTE!'' , :F_CDGO_CLNTE);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(175283744200275578)
,p_process_when=>'P7_INDICADOR'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'PBI'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(175285051432275591)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valores Anexo 06'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    :F_NMBRE_ARCHVO := ''Anexo_''||:P40_VGNCIA||''_06'';',
'    ',
'     begin',
'         select vlor',
'           into :F_SQL',
'           from df_c_definiciones_cliente',
'          where cdgo_clnte = :F_CDGO_CLNTE',
'            and cdgo_dfncion_clnte = ''A06'';',
'         exception when no_data_found ',
'              then',
'              :F_SQL := '''';',
'     end;',
'     ',
'     :F_SQL := replace( :F_SQL , ''!VGNCIA!'' , :P40_VGNCIA);',
'     :F_SQL := replace( :F_SQL , ''!CLNTE!'' , :F_CDGO_CLNTE);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(175284240906275583)
,p_process_when=>'P7_INDICADOR'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'PE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(175285229167275592)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valores Anexo 07'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    :F_NMBRE_ARCHVO := ''Anexo_''||:P40_VGNCIA||''_07'';',
'    ',
'     begin',
'         select vlor',
'           into :F_SQL',
'           from df_c_definiciones_cliente',
'          where cdgo_clnte = :F_CDGO_CLNTE',
'            and cdgo_dfncion_clnte = ''A07'';',
'         exception when no_data_found ',
'              then',
'              :F_SQL := '''';',
'     end;',
'     ',
'     :F_SQL := replace( :F_SQL , ''!VGNCIA!'' , :P40_VGNCIA);',
'     :F_SQL := replace( :F_SQL , ''!CLNTE!'' , :F_CDGO_CLNTE);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(175284597442275586)
,p_process_when=>'P7_INDICADOR'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'PC'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(175285275339275593)
,p_process_sequence=>50
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valores Anexo 08'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    :F_NMBRE_ARCHVO := ''Anexo_''||:P40_VGNCIA||''_08'';',
'    ',
'     begin',
'         select vlor',
'           into :F_SQL',
'           from df_c_definiciones_cliente',
'          where cdgo_clnte = :F_CDGO_CLNTE',
'            and cdgo_dfncion_clnte = ''A08'';',
'         exception when no_data_found ',
'              then',
'              :F_SQL := '''';',
'     end;',
'     ',
'     :F_SQL := replace( :F_SQL , ''!VGNCIA!'' , :P40_VGNCIA);',
'     :F_SQL := replace( :F_SQL , ''!CLNTE!'' , :F_CDGO_CLNTE);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(175285418755275594)
,p_process_when=>'P7_INDICADOR'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'PVS'
);
end;
/
