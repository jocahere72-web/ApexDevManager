prompt --application/pages/page_00098
begin
wwv_flow_api.create_page(
 p_id=>98
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Reporte ICA Vigencia 2022'
,p_step_title=>'Reporte ICA Vigencia 2022'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('// Establecer los \00EDtems en nulos'),
'/*',
'apex.item(''P98_ID_IMPSTO'').setValue(null);',
'apex.item(''P98_ID_IMPSTO_SBMPSTO'').setValue(null);',
'apex.item(''P98_VGNCIA_PRSNTDA'').setValue(null);',
'apex.item(''P98_TPO_PRIOCDAD'').setValue(null);',
'apex.item(''P98_PRIODO'').setValue(null);',
'apex.item(''P98_VGNCIA_NO_PRSNTDA'').setValue(null);',
'apex.item(''P98_PRIODO_NO_PRSNTDO'').setValue(null);',
'*/'))
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JBADRAN'
,p_last_upd_yyyymmddhh24miss=>'20240722163914'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(798489685543520930)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
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
 p_id=>wwv_flow_api.id(800467489708311291)
,p_plug_name=>'CONTRIBUYENTES CON VIGENCIA 2022 SIN 2023'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(35741315331290409)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select d.idntfccion_sjto                                as "Identificaci\00F3n"'),
'     , c.nmbre_rzon_scial                               as "Nombre Razon Social" ',
'     , b.nmbre_rzon_scial                               as "Responsable Principal" ',
unistr('     , decode(c.tpo_prsna, ''N'', ''Natural'', ''Jur\00EDdica'')  as "Tipo de Persona"'),
'     , e.nmbre_sjto_tpo                                 as "Tipo de Regimen"',
unistr('     , d.drccion                                        as "Direcci\00F3n" '),
'     , d.email                                          as "Correo"',
unistr('     , d.tlfno                                          as "Tel\00E9fono"        '),
'     , a.vgncia                                         as "Vigencia Presentada"',
'     , p.dscrpcion                                      as "Periodo"',
'     , to_char(a.VLOR_TTAL, ''$999,999,999,999,999,999'') as "Valor Presentado" ',
'     , o.vgncia                                         as "Vigencia No Presentada"      ',
'     , (select dscrpcion from df_i_periodos',
'            where id_prdo = o.id_prdo)                  as "Periodo No presentado" ',
'     , d.dscrpcion_sjto_estdo                           as "Estado"',
'    from gi_g_declaraciones a',
'    join v_si_i_sujetos_responsable b  on b.id_sjto_impsto = a.id_sjto_impsto',
'    and b.Prncpal_S_N                  = ''S'' ',
'    and b.actvo                        = ''S''',
'    join v_si_i_personas c             on c.id_sjto_impsto = a.id_sjto_impsto',
'    join DF_I_SUJETOS_TIPO e           on e.id_sjto_tpo = c.id_sjto_tpo',
'    join v_si_i_sujetos_impuesto d     on d.id_sjto_impsto = a.id_sjto_impsto',
'    join df_i_periodos p               on p.id_prdo = a.id_prdo',
'    join V_FI_G_PBLCION_OMSOS_CNCDOS o on o.idntfccion_sjto = d.idntfccion_sjto',
'    and o.id_impsto = a.id_impsto',
'    and o.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
'    join gi_d_declaraciones_uso u      on u.id_dclrcion_uso = a.id_dclrcion_uso',
'    where a.cdgo_clnte        = :F_CDGO_CLNTE',
'    and a.id_impsto           = :P98_ID_IMPSTO    ',
'    and a.id_impsto_sbmpsto   = :P98_ID_IMPSTO_SBMPSTO  ',
'    and a.vgncia              = :P98_VGNCIA_PRSNTDA',
'    and p.cdgo_prdcdad        = :P98_TPO_PRIOCDAD ',
'    and p.id_prdo             = :P98_PRIODO',
'    and o.vgncia              = :P98_VGNCIA_NO_PRSNTDA',
'    and o.id_prdo             = :P98_PRIODO_NO_PRSNTDO',
'    and d.idntfccion_sjto     = nvl(:P99_IDNTFCCION, d.idntfccion_sjto)',
'    and e.id_sjto_tpo         = nvl(:P99_NMBRE_SJTO_TPO, e.id_sjto_tpo)',
'    and c.tpo_prsna           = nvl(:P99_DSCRPCION_TPO_PRSNA, c.tpo_prsna)',
'    and u.cdgo_dclrcion_uso   = ''DIN''',
'    and a.cdgo_dclrcion_estdo = ''APL''',
'    GROUP BY d.idntfccion_sjto,',
'         c.nmbre_rzon_scial,',
'         b.nmbre_rzon_scial,',
'         c.tpo_prsna,',
'         e.nmbre_sjto_tpo,',
'         d.drccion,',
'         d.email,',
'         d.tlfno,',
'         a.vgncia,',
'         p.dscrpcion,',
'         o.vgncia,',
'         d.dscrpcion_sjto_estdo,',
'         a.VLOR_TTAL,',
'         o.id_prdo;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_plug_display_when_condition=>'P98_CONSULTA'
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
 p_id=>wwv_flow_api.id(800469263648311309)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JPRADA'
,p_internal_uid=>800469263648311309
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161575037867966929)
,p_db_column_name=>unistr('Identificaci\00F3n')
,p_display_order=>10
,p_column_identifier=>'BS'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161575132383966930)
,p_db_column_name=>'Nombre Razon Social'
,p_display_order=>20
,p_column_identifier=>'BT'
,p_column_label=>unistr('Nombre Raz\00F3n Social')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161575275768966931)
,p_db_column_name=>'Responsable Principal'
,p_display_order=>30
,p_column_identifier=>'BU'
,p_column_label=>'Responsable Principal'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161575362114966932)
,p_db_column_name=>'Tipo de Persona'
,p_display_order=>40
,p_column_identifier=>'BV'
,p_column_label=>'Tipo De Persona'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161575466935966933)
,p_db_column_name=>'Tipo de Regimen'
,p_display_order=>50
,p_column_identifier=>'BW'
,p_column_label=>unistr('Tipo De R\00E9gimen')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161575571275966934)
,p_db_column_name=>unistr('Direcci\00F3n')
,p_display_order=>60
,p_column_identifier=>'BX'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161575640922966935)
,p_db_column_name=>'Correo'
,p_display_order=>70
,p_column_identifier=>'BY'
,p_column_label=>'Correo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161575725233966936)
,p_db_column_name=>unistr('Tel\00E9fono')
,p_display_order=>80
,p_column_identifier=>'BZ'
,p_column_label=>unistr('Tel\00E9fono')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161575883139966937)
,p_db_column_name=>'Vigencia Presentada'
,p_display_order=>90
,p_column_identifier=>'CA'
,p_column_label=>'Vigencia Presentada'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161575998230966938)
,p_db_column_name=>'Periodo'
,p_display_order=>100
,p_column_identifier=>'CB'
,p_column_label=>'Periodo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161576068027966939)
,p_db_column_name=>'Valor Presentado'
,p_display_order=>110
,p_column_identifier=>'CC'
,p_column_label=>'Valor Presentado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161576100374966940)
,p_db_column_name=>'Vigencia No Presentada'
,p_display_order=>120
,p_column_identifier=>'CD'
,p_column_label=>'Vigencia No Presentada'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161576212741966941)
,p_db_column_name=>'Estado'
,p_display_order=>130
,p_column_identifier=>'CE'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161576499575966943)
,p_db_column_name=>'Periodo No presentado'
,p_display_order=>140
,p_column_identifier=>'CF'
,p_column_label=>'Periodo No Presentado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(800556613163678822)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2359847'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>unistr(':Identificaci\00F3n:Nombre Razon Social:Responsable Principal:Tipo de Persona:Tipo de Regimen:Direcci\00F3n:Correo:Tel\00E9fono:Vigencia Presentada:Periodo:Valor Presentado:Vigencia No Presentada:Estado:Periodo No presentado')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1025352561407180594)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>40
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
unistr('    <p align="justify">En esta opci\00F3n permite generar el Informe de las vigencia presentadas en la declaraci\00F3n por los contribuyentes y que tienen la vigencia actual(2023) pendiente por declarar.<br> '),
'   </p>',
unistr('    <p align="justify">Debe realizar los filtros deseados para la consulta. Con estos filtros se despliega una cuadricula con la informaci\00F3n de las declaraciones presentadas.</p>      '),
'    </p>',
'     <p align="justify">El boton Generar Archivo descarga un documento de excel el cual contiene la informacion de la cuadricula.</p>',
'     </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1676999178784826794)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda ')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35731364179290406)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(235985436352145494)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(798489685543520930)
,p_button_name=>'BTN_IMPRIMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch:t-Button--padLeft:t-Button--padRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Archivo'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(162311464533585307)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_api.id(1676999178784826794)
,p_button_name=>'BTN_CONSULTARDG'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(35794622007290432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(157749007737564249)
,p_branch_name=>'Descargar_Excel'
,p_branch_action=>'f?p=&APP_ID.:98:&SESSION.:Imprimir:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(235985436352145494)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(157748105926564240)
,p_name=>'P98_CONSULTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(800467489708311291)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(161576735334966946)
,p_name=>'P98_TPO_PRIOCDAD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1676999178784826794)
,p_prompt=>'<b>Tipo de Periodo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d, cdgo_prdcdad r ',
'    from df_s_periodicidad'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(162311886662585311)
,p_name=>'P98_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1676999178784826794)
,p_prompt=>'<b>Impuesto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select i.nmbre_impsto d, i.id_impsto r ',
'    from df_c_impuestos i',
'where i.id_impsto in (230012) --Agregamos todos los Impuestos declarados;',
''))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'120%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(162312262013585314)
,p_name=>'P98_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1676999178784826794)
,p_prompt=>'<b>SubImpuesto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto d,',
'       id_impsto_sbmpsto r   ',
'from df_i_impuestos_subimpuesto ',
'where id_impsto = :P98_ID_IMPSTO;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P98_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(162312621365585314)
,p_name=>'P98_VGNCIA_PRSNTDA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1676999178784826794)
,p_prompt=>'<b>Vigencia Presentada</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vgncia d, vgncia r ',
'    from df_s_vigencias',
'where vgncia >= 2015;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(162313441481585315)
,p_name=>'P98_PRIODO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(1676999178784826794)
,p_prompt=>'<b>Periodo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct dscrpcion d, id_prdo r ',
'    from df_i_periodos',
'where id_impsto           = :P98_ID_IMPSTO',
'    and id_impsto_sbmpsto = :P98_ID_IMPSTO_SBMPSTO',
'and cdgo_prdcdad          = :P98_TPO_PRIOCDAD',
'    and vgncia            = :P98_VGNCIA_PRSNTDA;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P98_ID_IMPSTO,P98_ID_IMPSTO_SBMPSTO,P98_TPO_PRIOCDAD,P98_VGNCIA_PRSNTDA'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(162313812067585315)
,p_name=>'P98_VGNCIA_NO_PRSNTDA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(1676999178784826794)
,p_prompt=>'<b>Vigencia  No Presentada</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vgncia d, vgncia r ',
'    from df_s_vigencias',
'where vgncia >= :P98_VGNCIA_PRSNTDA;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P98_VGNCIA_PRSNTDA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(162314229379585315)
,p_name=>'P98_PRIODO_NO_PRSNTDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(1676999178784826794)
,p_prompt=>'<b>Periodo No Presentado</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct dscrpcion d, id_prdo r ',
'    from df_i_periodos',
'where id_impsto           = :P98_ID_IMPSTO',
'    and id_impsto_sbmpsto = :P98_ID_IMPSTO_SBMPSTO',
'and cdgo_prdcdad          = :P98_TPO_PRIOCDAD',
'    and vgncia            = :P98_VGNCIA_NO_PRSNTDA; '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P98_ID_IMPSTO,P98_ID_IMPSTO_SBMPSTO,P98_VGNCIA_NO_PRSNTDA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(162314678158585315)
,p_name=>'P98_NMBRE_SJTO_TPO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(1676999178784826794)
,p_prompt=>unistr('<b>Tipo R\00E9gimen</b>')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.nmbre_sjto_tpo ',
'     , e.id_sjto_tpo',
'    from DF_I_SUJETOS_TIPO e ',
'WHERE e.id_impsto = :P98_ID_IMPSTO',
'    order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P98_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(162315022686585315)
,p_name=>'P98_DSCRPCION_TPO_PRSNA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(1676999178784826794)
,p_prompt=>'<b>Tipo de Persona</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct case when a.tpo_prsna = ''N'' then ''Natural'' ',
unistr('                    else ''Jur\00EDdica'' '),
'                end  as dscrpcion_tpo_prsna ',
'                , a.tpo_prsna',
'        from si_i_personas a',
'    order by 1;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(162315405750585316)
,p_name=>'P98_DSCRPCION_SJTO_ESTDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(1676999178784826794)
,p_prompt=>'<b>Estado</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct dscrpcion_sjto_estdo',
'        , cdgo_sjto_estdo ',
'    from v_si_i_sujetos_impuesto',
'    where cdgo_sjto_estdo in (''A'', ''I'')',
'    order by 1;',
''))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(162315861025585316)
,p_name=>'P98_IDNTFCCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(1676999178784826794)
,p_prompt=>unistr('<b>Identificaci\00F3n</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(161614916035053226)
,p_validation_name=>'Valida Impuesto'
,p_validation_sequence=>10
,p_validation=>'P98_ID_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe Seleccionar el impuesto.'
,p_when_button_pressed=>wwv_flow_api.id(162311464533585307)
,p_associated_item=>wwv_flow_api.id(162311886662585311)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(161615058497053227)
,p_validation_name=>'Validar SubImpuesto'
,p_validation_sequence=>20
,p_validation=>'P98_ID_IMPSTO_SBMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe Seleccionar el SubImpuesto.'
,p_when_button_pressed=>wwv_flow_api.id(162311464533585307)
,p_associated_item=>wwv_flow_api.id(162312262013585314)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(161615140426053228)
,p_validation_name=>'Validar Vigencia Presentada'
,p_validation_sequence=>30
,p_validation=>'P98_VGNCIA_PRSNTDA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe Seleccionar la vigencia presentada.'
,p_when_button_pressed=>wwv_flow_api.id(162311464533585307)
,p_associated_item=>wwv_flow_api.id(162312621365585314)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(161615264223053229)
,p_validation_name=>'Validar Tipo Periodo'
,p_validation_sequence=>40
,p_validation=>'P98_TPO_PRIOCDAD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe Seleccionar tipo de periodicidad.'
,p_when_button_pressed=>wwv_flow_api.id(162311464533585307)
,p_associated_item=>wwv_flow_api.id(161576735334966946)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(161615332923053230)
,p_validation_name=>'Validar Periodo '
,p_validation_sequence=>50
,p_validation=>'P98_PRIODO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe Seleccionar el periodo presentado.'
,p_when_button_pressed=>wwv_flow_api.id(162311464533585307)
,p_associated_item=>wwv_flow_api.id(162313441481585315)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(161615690867053233)
,p_validation_name=>'Validar Vigencia No Presentado'
,p_validation_sequence=>60
,p_validation=>'P98_VGNCIA_NO_PRSNTDA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe Seleccionar la vigencia en el cual no presento.'
,p_when_button_pressed=>wwv_flow_api.id(162311464533585307)
,p_associated_item=>wwv_flow_api.id(162313812067585315)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(161615707529053234)
,p_validation_name=>'Valida Periodo No Presentado'
,p_validation_sequence=>70
,p_validation=>'P98_PRIODO_NO_PRSNTDO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe Seleccionar el periodo en el cual no presento.'
,p_when_button_pressed=>wwv_flow_api.id(162311464533585307)
,p_associated_item=>wwv_flow_api.id(162314229379585315)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(161574228217966921)
,p_name=>'Al seleccionar impuesto'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P98_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(161574341552966922)
,p_event_id=>wwv_flow_api.id(161574228217966921)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P98_ID_IMPSTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(157748431184564243)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'consulta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_contador number :=0;',
'    ',
'begin',
'    ',
'    v_contador := v_contador + 1; ',
'    select ',
'        v_contador',
'    into ',
'        :p98_consulta',
'    from dual;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(157748864040564247)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'prc_dscrga_excel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'  v_num_fla       number := 1;     -- Numero de filas del excel',
'  v_num_col       number := 0;     -- Inicio de columnas',
'  v_bfile         bfile;           -- Apuntador del documento en disco',
'  o_file_blob     blob;            -- Archivo blob de salida',
'  v_directorio    clob;            -- Directorio donde caera el archivo',
'  v_file_name     varchar2(3000);  -- Nombre del rachivo',
'  v_file_blob     blob; ',
'  v_nmbre_dcmnto  varchar2(100);',
'begin',
'  ',
'  o_file_blob  :=  empty_blob(); -- Inicializacion del blob ',
'  v_directorio := ''ETL_CARGA'';      -- Nombre del directorio donde caera el archivo',
'  v_file_name  := ''Temp_.xlsx'';  -- Nombre del archivo',
'  --se crea un hoja       ',
'  as_xlsx.new_sheet(''Reporte Liquidacion Contratos'');',
'  ',
'  --Nombre de las columnas',
unistr('  as_xlsx.cell( 1, v_num_fla , ''Identificaci\00F3n'');'),
'  as_xlsx.set_column_width(1, 25);',
'  as_xlsx.cell( 2, v_num_fla , ''Nombre Razon Social'');',
'  as_xlsx.set_column_width(1, 25);',
'  as_xlsx.cell( 3, v_num_fla , ''Responsable Principal'');',
'  as_xlsx.set_column_width(1, 25);',
'  as_xlsx.cell( 4, v_num_fla , ''Tipo de Persona'');',
'  as_xlsx.set_column_width(1, 25);',
'  as_xlsx.cell( 5, v_num_fla , ''Tipo de Regimen'');',
'  as_xlsx.set_column_width(1, 25);',
unistr('  as_xlsx.cell( 6, v_num_fla , ''Direcci\00F3n'');'),
'  as_xlsx.set_column_width(2, 30);',
'  as_xlsx.cell( 7, v_num_fla , ''Correo'');',
'  as_xlsx.set_column_width(3, 20);',
unistr('  as_xlsx.cell( 8, v_num_fla , ''Tel\00E9fono'');'),
'  as_xlsx.set_column_width(4, 20);',
'  as_xlsx.cell( 9, v_num_fla , ''Vigencia Presentada'');',
'  as_xlsx.set_column_width(5, 25);',
'  as_xlsx.cell( 10, v_num_fla , ''Periodo'');',
'  as_xlsx.set_column_width(6, 30);',
'  as_xlsx.cell( 11, v_num_fla , ''Valor Presentado'');',
'  as_xlsx.set_column_width(7, 15);',
'  as_xlsx.cell( 12, v_num_fla , ''Vigencia No Presentada'');',
'  as_xlsx.set_column_width(8, 15);',
'  as_xlsx.cell( 13, v_num_fla , ''Periodo No presentado'');',
'  as_xlsx.set_column_width(9, 15);',
'  as_xlsx.cell( 14, v_num_fla , ''Estado'');',
'  as_xlsx.set_column_width(10, 25);',
'  ',
'',
'  --raise_application_error(-20000,''ejecutando proceso '');',
'  -- Consulta ',
'  for c_datos in ( ',
'		select d.idntfccion_sjto                                as Identificacion',
'			 , c.nmbre_rzon_scial                               as Nombre_Razon_Social ',
'			 , b.nmbre_rzon_scial                               as Responsable_Principal ',
unistr('			 , decode(c.tpo_prsna, ''N'', ''Natural'', ''Jur\00EDdica'')  as Tipo_de_Persona'),
'			 , e.nmbre_sjto_tpo                                 as Tipo_de_Regimen',
'			 , d.drccion                                        as Direccion ',
'			 , d.email                                          as Correo',
'			 , d.tlfno                                          as Telefono        ',
'			 , a.vgncia                                         as Vigencia_Presentada',
'			 , p.dscrpcion                                      as Periodo',
'			 , to_char(a.VLOR_TTAL, ''$999,999,999,999,999,999'') as Valor_Presentado ',
'			 , o.vgncia                                         as Vigencia_No_Presentada      ',
'			 , (select dscrpcion from df_i_periodos',
'					where id_prdo = o.id_prdo)                  as Periodo_No_presentado ',
'			 , d.dscrpcion_sjto_estdo                           as Estado',
'		 from gi_g_declaraciones a',
'            join v_si_i_sujetos_responsable b  on b.id_sjto_impsto = a.id_sjto_impsto',
'            and b.Prncpal_S_N                  = ''S'' ',
'            and b.actvo                        = ''S''',
'            join v_si_i_personas c             on c.id_sjto_impsto = a.id_sjto_impsto',
'            join DF_I_SUJETOS_TIPO e           on e.id_sjto_tpo = c.id_sjto_tpo',
'            join v_si_i_sujetos_impuesto d     on d.id_sjto_impsto = a.id_sjto_impsto',
'            join df_i_periodos p               on p.id_prdo = a.id_prdo',
'            join V_FI_G_PBLCION_OMSOS_CNCDOS o on o.idntfccion_sjto = d.idntfccion_sjto',
'            and o.id_impsto = a.id_impsto',
'            and o.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
'            join gi_d_declaraciones_uso u      on u.id_dclrcion_uso = a.id_dclrcion_uso',
'            where a.cdgo_clnte        = :F_CDGO_CLNTE',
'            and a.id_impsto           = :P98_ID_IMPSTO    ',
'            and a.id_impsto_sbmpsto   = :P98_ID_IMPSTO_SBMPSTO  ',
'            and a.vgncia              = :P98_VGNCIA_PRSNTDA',
'            and p.cdgo_prdcdad        = :P98_TPO_PRIOCDAD ',
'            and p.id_prdo             = :P98_PRIODO',
'            and o.vgncia              = :P98_VGNCIA_NO_PRSNTDA',
'            and o.id_prdo             = :P98_PRIODO_NO_PRSNTDO',
'            and d.idntfccion_sjto     = nvl(:P99_IDNTFCCION, d.idntfccion_sjto)',
'            and e.id_sjto_tpo         = nvl(:P99_NMBRE_SJTO_TPO, e.id_sjto_tpo)',
'            and c.tpo_prsna           = nvl(:P99_DSCRPCION_TPO_PRSNA, c.tpo_prsna)',
'            and u.cdgo_dclrcion_uso   = ''DIN''',
'            and a.cdgo_dclrcion_estdo = ''APL''',
'            GROUP BY d.idntfccion_sjto,',
'                 c.nmbre_rzon_scial,',
'                 b.nmbre_rzon_scial,',
'                 c.tpo_prsna,',
'                 e.nmbre_sjto_tpo,',
'                 d.drccion,',
'                 d.email,',
'                 d.tlfno,',
'                 a.vgncia,',
'                 p.dscrpcion,',
'                 o.vgncia,',
'                 d.dscrpcion_sjto_estdo,',
'                 a.VLOR_TTAL,',
'                 o.id_prdo',
') loop',
'    --raise_application_error(-20000,''entro al loop'');',
'      -- aqui se debe hacer la consulta y ir llenado las filas',
'      v_num_fla :=  v_num_fla + 1;  ',
'      as_xlsx.cell( 1,  v_num_fla , c_datos.Identificacion);    ',
'      as_xlsx.cell( 2,  v_num_fla , c_datos.Nombre_Razon_Social);  ',
'      as_xlsx.cell( 3,  v_num_fla , c_datos.Responsable_Principal);    ',
'      as_xlsx.cell( 4,  v_num_fla , c_datos.Tipo_de_Persona);      ',
'      as_xlsx.cell( 5,  v_num_fla , c_datos.Tipo_de_Regimen); ',
'      as_xlsx.cell( 6,  v_num_fla , c_datos.Direccion);',
'      as_xlsx.cell( 7,  v_num_fla , c_datos.Correo);',
'      as_xlsx.cell( 8,  v_num_fla , c_datos.Telefono);',
'      as_xlsx.cell( 9,  v_num_fla , c_datos.Vigencia_Presentada);',
'      as_xlsx.cell( 10, v_num_fla , c_datos.Periodo);',
'      as_xlsx.cell( 11, v_num_fla , c_datos.Valor_Presentado);',
'      as_xlsx.cell( 12, v_num_fla , c_datos.Vigencia_No_Presentada);',
'	  as_xlsx.cell( 13, v_num_fla , c_datos.Periodo_No_presentado);',
'      as_xlsx.cell( 14, v_num_fla , c_datos.Estado);',
'    end loop;',
'    ',
'    ',
'  -- Guardar Excel',
'  as_xlsx.save( v_directorio, v_file_name );',
'  ',
'  v_bfile := bfilename( v_directorio, v_file_name);',
'',
'  --------------------------------------------------------------------',
'  ',
'  dbms_lob.open(v_bfile, dbms_lob.lob_readonly);',
'  dbms_lob.createtemporary(',
'      lob_loc => o_file_blob, ',
'      cache   => true, ',
'      dur     => dbms_lob.session',
'  );',
'  -- Open temporary lob',
'  dbms_lob.open(o_file_blob, dbms_lob.lob_readwrite);',
'',
'  -- Load binary file into temporary LOB',
'  dbms_lob.loadfromfile(',
'      dest_lob => o_file_blob,',
'      src_lob  => v_bfile,',
'      amount   => dbms_lob.getlength(v_bfile)',
'  );',
'',
'  -- Close lob objects',
'  dbms_lob.close(o_file_blob);',
'  dbms_lob.close(v_bfile);',
'',
'  utl_file.fremove(v_directorio,v_file_name);',
'  htp.init;',
'  owa_util.mime_header(''application/ms-excel'', false);',
'  ',
'  v_nmbre_dcmnto := ''Declaraciones Presntadas y pendientes '' || to_char(sysdate,''yyyymmddhhmiss'');',
'  ',
'  htp.p(''Content-length: '' ||sys.dbms_lob.getlength(o_file_blob) );  ',
'  htp.p(''Content-Disposition: attachment; filename="''|| v_nmbre_dcmnto ||''.xlsx"'');  ',
'  htp.p(''Cache-Control: max-age=0'');',
'  owa_util.http_header_close;  ',
'  wpg_docload.download_file(o_file_blob);  ',
'  apex_application.stop_apex_engine;',
'  ',
'  exception',
'    when others then',
'      raise_application_error(-20000,''Problemas al generar excel, ''||sqlerrm);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(235985436352145494)
,p_process_when=>'Imprimir'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
