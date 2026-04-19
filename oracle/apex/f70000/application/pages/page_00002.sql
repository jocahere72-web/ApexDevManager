prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Liquidaci\00F3n Predial')
,p_step_title=>unistr('Liquidaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#IMAGE_PREFIX#css/infortributos/utilidades.css'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20191113134334'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(101245510564762039)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'F_ID_INSTNCIA_FLJO'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(151144086575619967)
,p_plug_name=>'Ayuda '
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
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
'    Funcionalidad que permite: <br/><br/>',
unistr('    <b>1.</b> Generar la Liquidaci\00F3n.<br/><br/>'),
unistr('    <b>2.</b> Revertir la Liquidaci\00F3n.<br/><br/>'),
unistr('    <b>3.</b> Visualizar las inconsistencias de la Preliquidaci\00F3n.<br/>'),
'    <b>Nota:</b> Click sobre el cuadro (Predios por Preliquidar).<br/><br/>',
unistr('    <b>4.</b> Visualizar la informaci\00F3n de las cr\00EDticas del archivo:<br/>'),
'	<b>a.</b> Registros Cargados.<br />',
'    <b>b.</b> Predios Cargados.<br/>',
'    <b>c.</b> Predios por Preliquidar.<br/>',
'    <b>d.</b> Predios Preliquidados.<br/>',
'    <b>f.</b> Predios por Liquidar.<br/>',
'	<b>e.</b> Predios Liquidados.<br/><br/>',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.       '),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(267775924913604651)
,p_plug_name=>unistr('Proceso Liquidaci\00F3n - Preliquidaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>110
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(59283273333642601)
,p_plug_name=>unistr('Impresi\00F3n ')
,p_parent_plug_id=>wwv_flow_api.id(267775924913604651)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>80
,p_plug_display_column=>6
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(152434493968303361)
,p_plug_name=>'<b>Predios Cargados</b>'
,p_parent_plug_id=>wwv_flow_api.id(267775924913604651)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios Cargados'' as label ',
'      , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'   from v_gi_g_cinta_igac',
'  where nmro_orden_igac = ''001''',
'    and id_prcso_crga = :P2_ARCHIVO'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(231131651431691009)
,p_plug_name=>unistr('Duraci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(267775924913604651)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''HH:MI:SS'' as label',
'     , nvl( regexp_substr((fcha_incio - fcha_fnal), ''[[0-9]{2}:[[0-9]{2}:[[0-9]{2}.[[0-9]{2}'', 1 ,  1 ) , ''0'' ) as value',
unistr('     , ''Duraci\00F3n del proceso'' as value2'),
'  from wf_g_instncs_trnscn_estdtca',
' where id_instncia_trnscion = :P2_ID_INSTNCIA_TRNSCION'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'LABEL'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'N'
,p_attribute_09=>'VALUE2'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(268318184929938333)
,p_plug_name=>'<b>Registros Cargados</b>'
,p_parent_plug_id=>wwv_flow_api.id(267775924913604651)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_grid_column_css_classes=>'badgeListColor1'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Registros Cargados'' as label ',
'      , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'   from v_gi_g_cinta_igac',
'  where id_prcso_crga = :P2_ARCHIVO'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(268318190764938334)
,p_plug_name=>'<b>Predios por Pre-liquidar</b>'
,p_parent_plug_id=>wwv_flow_api.id(267775924913604651)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor3'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios por Preliquidar'' as label ',
'      , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'  from v_gi_g_cinta_igac',
' where nmro_orden_igac = ''001''',
'   and id_prcso_crga = :P2_ARCHIVO',
'   and estdo_rgstro = ''C'''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP,36:P36_ID_PRCSO_CRGA:&P2_ARCHIVO.'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(268318482703938336)
,p_plug_name=>'<b>Predios Pre-liquidados</b>'
,p_parent_plug_id=>wwv_flow_api.id(267775924913604651)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'badgeListColor4'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Predios Preliquidados'' as label ',
'     , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'  from v_gi_g_cinta_igac',
' where nmro_orden_igac = ''001''',
'   and id_prcso_crga   = :P2_ARCHIVO',
'   and estdo_rgstro    in ( ''P'' , ''L'' )'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(268318514144938337)
,p_plug_name=>'<b>Predios Liquidado</b>'
,p_parent_plug_id=>wwv_flow_api.id(267775924913604651)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'badgeListColor5'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select ''Predios Liquidados'' as label ',
'       , to_char( count(*) , ''FM999G999G999G999G999G999G990'') as value',
'   from v_gi_g_cinta_igac',
'  where nmro_orden_igac = ''001''',
'    and id_prcso_crga   = :P2_ARCHIVO',
'    and estdo_rgstro    = ''L'''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_06=>'L'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(268318634187938338)
,p_plug_name=>'<b>Predios Sin liquidar</b>'
,p_parent_plug_id=>wwv_flow_api.id(267775924913604651)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>60
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'badgeListColor6'
,p_plug_display_column=>4
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select l.label',
'      , to_char( c.value - l.value , ''FM999G999G999G999G999G999G990'') as value',
'   from (',
'          select count(*) as value',
'            from v_gi_g_cinta_igac',
'           where nmro_orden_igac = ''001''',
'             and id_prcso_crga   = :P2_ARCHIVO',
'      ) c',
'   join (',
'          select ''Predios por liquidar'' as label ',
'               , count(*) as value',
'            from v_gi_g_cinta_igac',
'           where nmro_orden_igac = ''001''',
'             and id_prcso_crga = :P2_ARCHIVO',
'             and estdo_rgstro = ''L''',
'      ) l',
'     on 1 = 1'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'LABEL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(337574100139656989)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(172873222894186841)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(337574100139656989)
,p_button_name=>'Btn_Generar_Liquidacion'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Generar Liquidaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gi_g_cinta_igac ',
' where id_prcso_crga   = :P2_ARCHIVO',
'   and nmro_orden_igac = ''001''',
'   and estdo_rgstro    = ''P'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(37117267745793802)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(337574100139656989)
,p_button_name=>'Btn_Revertir_Liquidacion'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Revertir Liquidaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from gi_g_cinta_igac ',
' where id_prcso_crga   = :P2_ARCHIVO',
'   and nmro_orden_igac = ''001''',
'   and estdo_rgstro    = ''L''',
'   and 1 in (',
'               select 1 ',
'                 from wf_g_instancias_transicion',
'                where id_instncia_fljo   = :F_ID_INSTNCIA_FLJO',
'                  and id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'                  and id_estdo_trnscion  in ( 1 , 2 )',
'            )'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(172872736419186825)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(337574100139656989)
,p_button_name=>'Btn_Imprimir_Anexos'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Imprimir Anexos'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,12:P12_VGNCIA:&P2_VGNCIA.'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(106205789483305946)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(337574100139656989)
,p_button_name=>'Btn_Revertir_Tarea'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Revertir Tarea'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1 ',
'   from wf_g_instancias_transicion',
'  where id_instncia_fljo   = :F_ID_INSTNCIA_FLJO',
'    and id_fljo_trea_orgen = :F_ID_FLJO_TREA',
'    and id_estdo_trnscion  in ( 1 , 2 )'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(58375066546748402)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(59283273333642601)
,p_button_name=>'Btn_Imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(58375130385748403)
,p_branch_name=>'Imprimir Reportes'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_XML:&P2_RPRTE.,<P2_ARCHIVO>&P2_ARCHIVO.</P2_ARCHIVO><P2_VGNCIA>&P2_VGNCIA.</P2_VGNCIA><P2_SMMLV>&P2_SMMLV.</P2_SMMLV><P2_UVT>&P2_UVT.</P2_UVT>&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(58375066546748402)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52159576901478299)
,p_name=>'P2_ARCHIVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(267775924913604651)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52159977723478301)
,p_name=>'P2_IMPUESTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(267775924913604651)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52160399589478302)
,p_name=>'P2_VGNCIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(267775924913604651)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52160766092478302)
,p_name=>'P2_PERIODO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(267775924913604651)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(52161167085478302)
,p_name=>'P2_IMPUESTO_SUBIMPUESTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(267775924913604651)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58374989844748401)
,p_name=>'P2_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(59283273333642601)
,p_prompt=>'Reporte'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select nmbre_rprte d ,',
'           id_rprte r',
'      from gn_d_reportes ',
'     where actvo = ''S''',
'       and cdgo_rprte_grpo = ''GLP'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Reporte'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(115575959614413601)
,p_name=>'P2_ID_INSTNCIA_TRNSCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(267775924913604651)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(173297588590847380)
,p_name=>'P2_SMMLV'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(337574100139656989)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select vlor as salario_minimo',
'      into :P2_SMMLV',
'      from df_s_indicadores_economico a',
'     where cdgo_indcdor_tpo = ''2''',
'       and :P2_VGNCIA between extract(year from fcha_dsde) and extract(year from fcha_hsta);',
'exception ',
'     when no_data_found then ',
'          :P2_SMMLV := 0;',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(173297680184847381)
,p_name=>'P2_TRFA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(337574100139656989)
,p_item_default=>'135'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(173297826609847382)
,p_name=>'P2_UVT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(337574100139656989)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select vlor as valor_uvt',
'      into :P2_UVT',
'      from df_s_indicadores_economico a',
'     where cdgo_indcdor_tpo = ''UVT''',
'       and :P2_VGNCIA between extract(year from fcha_dsde) and extract(year from fcha_hsta);',
'exception ',
'     when no_data_found then',
'          :P2_UVT := 0;',
'end;    '))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(115574689865390603)
,p_computation_sequence=>20
,p_computation_item=>'P2_ID_INSTNCIA_TRNSCION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_instncia_trnscion ',
'  from wf_g_instancias_transicion ',
' where id_instncia_fljo   = :F_ID_INSTNCIA_FLJO',
'   and id_fljo_trea_orgen = :F_ID_FLJO_TREA'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(172894215378187256)
,p_name=>'Al_cambiar_critica'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_CRITICAS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(172894694454187257)
,p_event_id=>wwv_flow_api.id(172894215378187256)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(65222863137270301)
,p_name=>'Al_cambiar_Reporte'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_RPRTE'
,p_condition_element=>'P2_RPRTE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P2_RPRTE'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(65222920728270302)
,p_event_id=>wwv_flow_api.id(65222863137270301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(58375066546748402)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(65223105533270304)
,p_event_id=>wwv_flow_api.id(65222863137270301)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(58375066546748402)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(106206628690315901)
,p_name=>'Al Dar Click'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(106205789483305946)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(106206729939315902)
,p_event_id=>wwv_flow_api.id(106206628690315901)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'revertirTarea();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(171581818917171401)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_Liquidacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    --Inicia la Estadistica',
'    insert into wf_g_instncs_trnscn_estdtca ( id_instncia_trnscion , obsrvcion )',
unistr('         values ( :P2_ID_INSTNCIA_TRNSCION , ''Proceso de Liquidaci\00F3n'');'),
'				 ',
'    pkg_gi_liquidacion_predio.prc_ge_lqdcion_msva_prdial( p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                                        , p_id_impsto         => :P2_IMPUESTO',
'                                                        , p_id_impsto_sbmpsto => :P2_IMPUESTO_SUBIMPUESTO',
'                                                        , p_id_prcso_crga     => :P2_ARCHIVO );',
'     --Finaliza la Estadistica',
'     update wf_g_instncs_trnscn_estdtca',
'        set fcha_fnal            = systimestamp',
'      where id_instncia_trnscion = :P2_ID_INSTNCIA_TRNSCION;',
'			           ',
'end;'))
,p_process_error_message=>unistr('Ocurri\00F3 un Error al Generar la Liquidaci\00F3n.')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(172873222894186841)
,p_process_success_message=>unistr('Se ha Generado la Liquidaci\00F3n con \00C9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(107555058251088001)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Revertir Liquidacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    pkg_gi_liquidacion_predio.prc_rv_lqdcion_msva_prdial( p_cdgo_clnte        => :F_CDGO_CLNTE',
'                                                        , p_id_impsto         => :P2_IMPUESTO',
'                                                        , p_id_impsto_sbmpsto => :P2_IMPUESTO_SUBIMPUESTO',
'                                                        , p_id_prcso_crga     => :P2_ARCHIVO );',
'                                                        ',
'    --Elimina la Estadistica',
'    delete wf_g_instncs_trnscn_estdtca',
'     where id_instncia_trnscion = :P2_ID_INSTNCIA_TRNSCION;                                                  ',
'end;'))
,p_process_error_message=>unistr('Ocurri\00F3 un Error al Revertir la Liquidaci\00F3n.')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(37117267745793802)
,p_process_success_message=>unistr('Se ha Revertido la Liquidaci\00F3n con \00C9xito.')
);
end;
/
