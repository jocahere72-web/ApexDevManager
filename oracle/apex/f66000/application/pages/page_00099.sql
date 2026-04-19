prompt --application/pages/page_00099
begin
wwv_flow_api.create_page(
 p_id=>99
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>unistr('Reporte Declaraci\00F3n Vigencia Pendiente')
,p_step_title=>unistr('Reporte Declaraci\00F3n Vigencia Pendiente')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('/*// Establecer los \00EDtems en nulos'),
'apex.item(''P99_ID_IMPSTO'').setValue(null);',
'apex.item(''P99_ID_IMPSTO_SBMPSTO'').setValue(null);',
'apex.item(''P99_VGNCIA_PRSNTDA'').setValue(null);',
'apex.item(''P99_TPO_PRIOCDAD'').setValue(null);',
'apex.item(''P99_PRIODO'').setValue(null);',
'apex.item(''P99_VGNCIA_NO_PRSNTDA'').setValue(null);',
'apex.item(''P99_PRIODO_NO_PRSNTDO'').setValue(null);',
'*/'))
,p_step_template=>wwv_flow_api.id(35710418378290397)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20240814143909'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(958258063723823314)
,p_plug_name=>unistr('Declaraci\00F3n con Cartera en Cero ')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(35741315331290409)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.idntfccion_sjto                                      as "Identificacion"',
'     , c.nmbre_rzon_scial                                     as "Nombre razon social"  ',
'     , d.nmbre_rzon_scial                                     as "Responsable Principal"',
unistr('     , decode( c.tpo_prsna , ''N'' , ''Natural'' , ''Jur\00EDdica'')    as "Tipo Persona"'),
'     , e.nmbre_sjto_tpo                                       as "Tipo Regimen"',
unistr('     , b.drccion                                              as "Direcci\00F3n"'),
'     , b.email                                                as "Correo"',
'     , b.tlfno                                                as "Telefono"',
unistr('     , a.nmro_cnsctvo                                         as "N\00FAmero de declaraci\00F3n"'),
'     , TO_CHAR(a.VLOR_TTAL, ''$999,999,999,999,999,999'')       as "Valor Total Declarado"',
'     , TO_CHAR(a.VLOR_PAGO, ''$999,999,999,999,999,999'')       as "Valor Presentado"',
'     , a.vgncia                                               as "Vigencia"              ',
'     , p.dscrpcion                                            as "Periodo"',
'     , TO_CHAR(g.vlor_sldo_cptal, ''$999,999,999,999,999,999'') as "Saldo Capital Cartera"',
'     , TO_CHAR(g.vlor_intres, ''$999,999,999,999,999,999'')     as "Saldo Interes Cartera"',
'     , TO_CHAR(SUM(g.vlor_sldo_cptal + g.vlor_intres), ',
'               ''$999,999,999,999,999,999'')                    as "Saldo Total"',
'     , b.DSCRPCION_SJTO_ESTDO                                 as "Estado"',
'    from gi_g_declaraciones         a',
'    join v_si_i_sujetos_impuesto    b on b.id_sjto_impsto = a.id_sjto_impsto',
'    join v_si_i_personas            c on a.id_sjto_impsto = c.id_sjto_impsto',
'    join V_si_i_sujetos_responsable d on d.id_sjto_impsto = a.id_sjto_impsto',
'    and d.Prncpal_S_N = ''S'' ',
'    and d.actvo       = ''S''      ',
'    join DF_I_SUJETOS_TIPO          e on e.id_sjto_tpo = c.id_sjto_tpo',
'    join df_i_periodos              p on p.id_prdo = a.id_prdo',
'    join V_GF_G_CARTERA_X_VIGENCIA  g on g.id_orgen = a.id_dclrcion',
'    where a.cdgo_clnte        = :F_CDGO_CLNTE',
'    and a.id_impsto           = :P99_ID_IMPSTO    ',
'    and a.id_impsto_sbmpsto   = :P99_ID_IMPSTO_SBMPSTO  ',
'    and a.vgncia              = :P99_VGNCIA_PRSNTDA',
'    and p.cdgo_prdcdad        = :P99_TPO_PRIOCDAD ',
'    and p.id_prdo             = :P99_PRIODO',
'    and a.cdgo_dclrcion_estdo = ''APL''',
'    and a.VLOR_PAGO           < a.VLOR_TTAL --= 0 Se cambio para que los presentado parcial tambien aparezca --cnegrete',
'    and g.vlor_sldo_cptal     > 0',
'    and d.idntfccion_sjto     = nvl(:P99_IDNTFCCION, d.idntfccion_sjto)',
'    and e.id_sjto_tpo         = nvl(:P99_NMBRE_SJTO_TPO, e.id_sjto_tpo)',
'    and c.tpo_prsna           = nvl(:P99_DSCRPCION_TPO_PRSNA, c.tpo_prsna)',
'    and b.cdgo_sjto_estdo     = nvl(:P99_DSCRPCION_SJTO_ESTDO, b.cdgo_sjto_estdo) ',
'    group by b.idntfccion_sjto                                    ',
'         , c.nmbre_rzon_scial                                      ',
'         , d.nmbre_rzon_scial                                     ',
'         , c.tpo_prsna    ',
'         , e.nmbre_sjto_tpo                                       ',
'         , b.drccion                                              ',
'         , b.email',
'         , b.tlfno                                                  ',
'         , a.VLOR_TTAL ',
'         , a.VLOR_PAGO ',
'         , a.vgncia                                            ',
'         , p.dscrpcion',
'         , g.vlor_sldo_cptal ',
'         , g.vlor_intres',
'         , a.nmro_cnsctvo',
'         , b.DSCRPCION_SJTO_ESTDO',
'        ORDER BY c.nmbre_rzon_scial ASC;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_plug_display_when_condition=>'P99_CONSULTA'
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
 p_id=>wwv_flow_api.id(958259837663823332)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JPRADA'
,p_internal_uid=>958259837663823332
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161613398389053210)
,p_db_column_name=>'Identificacion'
,p_display_order=>10
,p_column_identifier=>'BT'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161613433630053211)
,p_db_column_name=>'Nombre razon social'
,p_display_order=>20
,p_column_identifier=>'BU'
,p_column_label=>unistr('Nombre Raz\00F3n Social')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161613573179053212)
,p_db_column_name=>'Responsable Principal'
,p_display_order=>30
,p_column_identifier=>'BV'
,p_column_label=>'Responsable Principal'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161613651296053213)
,p_db_column_name=>'Tipo Persona'
,p_display_order=>40
,p_column_identifier=>'BW'
,p_column_label=>'Tipo Persona'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161613783562053214)
,p_db_column_name=>'Tipo Regimen'
,p_display_order=>50
,p_column_identifier=>'BX'
,p_column_label=>unistr('Tipo R\00E9gimen')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161613864161053215)
,p_db_column_name=>unistr('Direcci\00F3n')
,p_display_order=>60
,p_column_identifier=>'BY'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161613975208053216)
,p_db_column_name=>'Correo'
,p_display_order=>70
,p_column_identifier=>'BZ'
,p_column_label=>'Correo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161614052089053217)
,p_db_column_name=>'Telefono'
,p_display_order=>80
,p_column_identifier=>'CA'
,p_column_label=>unistr('Tel\00E9fono')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161614111139053218)
,p_db_column_name=>unistr('N\00FAmero de declaraci\00F3n')
,p_display_order=>90
,p_column_identifier=>'CB'
,p_column_label=>unistr('N\00FAmero De Declaraci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161614230914053219)
,p_db_column_name=>'Valor Total Declarado'
,p_display_order=>100
,p_column_identifier=>'CC'
,p_column_label=>'Valor Total Declarado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161614337823053220)
,p_db_column_name=>'Valor Presentado'
,p_display_order=>110
,p_column_identifier=>'CD'
,p_column_label=>'Valor Presentado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161614421764053221)
,p_db_column_name=>'Vigencia'
,p_display_order=>120
,p_column_identifier=>'CE'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161614505373053222)
,p_db_column_name=>'Periodo'
,p_display_order=>130
,p_column_identifier=>'CF'
,p_column_label=>'Periodo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161614683253053223)
,p_db_column_name=>'Saldo Capital Cartera'
,p_display_order=>140
,p_column_identifier=>'CG'
,p_column_label=>'Saldo Capital Cartera'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161614772797053224)
,p_db_column_name=>'Saldo Interes Cartera'
,p_display_order=>150
,p_column_identifier=>'CH'
,p_column_label=>'Saldo Interes Cartera'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161614899895053225)
,p_db_column_name=>'Estado'
,p_display_order=>170
,p_column_identifier=>'CI'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(161615959200053236)
,p_db_column_name=>'Saldo Total'
,p_display_order=>180
,p_column_identifier=>'CK'
,p_column_label=>'Saldo Total'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(958347187179190845)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1577956'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>unistr('Identificacion:Nombre razon social:Responsable Principal:Tipo Persona:Tipo Regimen:Direcci\00F3n:Correo:Telefono:N\00FAmero de declaraci\00F3n:Valor Total Declarado:Valor Presentado:Vigencia:Periodo:Saldo Capital Cartera:Saldo Interes Cartera:Estado::Saldo Total')
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1034525637204207254)
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
 p_id=>wwv_flow_api.id(1261389168185867959)
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
unistr('    <p align="justify">En esta opci\00F3n permite generar el Informe de las declaraciones presentadas en cero y que tienen cartera.<br> '),
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
 p_id=>wwv_flow_api.id(1514688052434241492)
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
 p_id=>wwv_flow_api.id(236036249859686326)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1034525637204207254)
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
 p_id=>wwv_flow_api.id(162302005757553774)
,p_button_sequence=>220
,p_button_plug_id=>wwv_flow_api.id(1514688052434241492)
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
 p_id=>wwv_flow_api.id(157913912502629004)
,p_branch_name=>'Go To Page 99'
,p_branch_action=>'f?p=&APP_ID.:99:&SESSION.:Imprimir:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(236036249859686326)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(157914162104629006)
,p_name=>'P99_CONSULTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(958258063723823314)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(162302427649553782)
,p_name=>'P99_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1514688052434241492)
,p_prompt=>'<b>Impuesto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select i.nmbre_impsto d, i.id_impsto r ',
'    from df_c_impuestos i',
'where i.id_impsto in (230012) --Agregamos todos los Impuestos declarados;',
''))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'120%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(162302886283553791)
,p_name=>'P99_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1514688052434241492)
,p_prompt=>'<b>SubImpuesto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto d,',
'       id_impsto_sbmpsto r   ',
'from df_i_impuestos_subimpuesto ',
'where id_impsto = :P99_ID_IMPSTO;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P99_ID_IMPSTO'
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
 p_id=>wwv_flow_api.id(162303223641553791)
,p_name=>'P99_VGNCIA_PRSNTDA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1514688052434241492)
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
 p_id=>wwv_flow_api.id(162303691047553791)
,p_name=>'P99_TPO_PRIOCDAD'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1514688052434241492)
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
 p_id=>wwv_flow_api.id(162304036121553791)
,p_name=>'P99_PRIODO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(1514688052434241492)
,p_prompt=>'<b>Periodo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct dscrpcion d, id_prdo r ',
'    from df_i_periodos',
'where id_impsto           = :P99_ID_IMPSTO',
'    and id_impsto_sbmpsto = :P99_ID_IMPSTO_SBMPSTO',
'and cdgo_prdcdad          = :P99_TPO_PRIOCDAD',
'    and vgncia            = :P99_VGNCIA_PRSNTDA;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P99_ID_IMPSTO,P99_ID_IMPSTO_SBMPSTO,P99_VGNCIA_PRSNTDA,P99_TPO_PRIOCDAD'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(35794283974290432)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(162305291160553792)
,p_name=>'P99_NMBRE_SJTO_TPO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(1514688052434241492)
,p_prompt=>unistr('<b>Tipo R\00E9gimen</b>')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.nmbre_sjto_tpo ',
'     , e.id_sjto_tpo',
'    from DF_I_SUJETOS_TIPO e ',
'WHERE e.id_impsto = :P99_ID_IMPSTO',
'    order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P99_ID_IMPSTO'
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
 p_id=>wwv_flow_api.id(162305689265553792)
,p_name=>'P99_DSCRPCION_TPO_PRSNA'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(1514688052434241492)
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
 p_id=>wwv_flow_api.id(162306061586553793)
,p_name=>'P99_DSCRPCION_SJTO_ESTDO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(1514688052434241492)
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
 p_id=>wwv_flow_api.id(162306408201553793)
,p_name=>'P99_IDNTFCCION'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(1514688052434241492)
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
 p_id=>wwv_flow_api.id(161616058465053237)
,p_validation_name=>'Valida Impuesto'
,p_validation_sequence=>10
,p_validation=>'P99_ID_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe Seleccionar el impuesto.'
,p_associated_item=>wwv_flow_api.id(162302427649553782)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(161616158768053238)
,p_validation_name=>'Valida SubImpuesto'
,p_validation_sequence=>20
,p_validation=>'P99_ID_IMPSTO_SBMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe Seleccionar el SubImpuesto.'
,p_associated_item=>wwv_flow_api.id(162302886283553791)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(161616298963053239)
,p_validation_name=>'Valida Vigencia presentada'
,p_validation_sequence=>30
,p_validation=>'P99_VGNCIA_PRSNTDA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar la vigencia presentada.'
,p_associated_item=>wwv_flow_api.id(162303223641553791)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(161616342656053240)
,p_validation_name=>'Valida Tipo de Periodo '
,p_validation_sequence=>40
,p_validation=>'P99_TPO_PRIOCDAD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar el tipo de periodo.'
,p_associated_item=>wwv_flow_api.id(162303691047553791)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(161616405664053241)
,p_validation_name=>'Valida Periodo'
,p_validation_sequence=>50
,p_validation=>'P99_PRIODO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar el periodo.'
,p_associated_item=>wwv_flow_api.id(162304036121553791)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(157914047563629005)
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
'        :p99_consulta',
'    from dual;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(157748794963564246)
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
'  as_xlsx.cell( 1, v_num_fla , ''Identificacion'');',
'  as_xlsx.set_column_width(1, 25);',
'  as_xlsx.cell( 2, v_num_fla , ''Nombre razon social'');',
'  as_xlsx.set_column_width(1, 25);',
'  as_xlsx.cell( 3, v_num_fla , ''Responsable Principal'');',
'  as_xlsx.set_column_width(1, 25);',
'  as_xlsx.cell( 4, v_num_fla , ''Tipo Persona'');',
'  as_xlsx.set_column_width(1, 25);',
'  as_xlsx.cell( 5, v_num_fla , ''Tipo Regimen'');',
'  as_xlsx.set_column_width(1, 25);',
unistr('  as_xlsx.cell( 6, v_num_fla , ''Direcci\00F3n'');'),
'  as_xlsx.set_column_width(2, 30);',
'  as_xlsx.cell( 7, v_num_fla , ''Correo'');',
'  as_xlsx.set_column_width(3, 20);',
'  as_xlsx.cell( 8, v_num_fla , ''Telefono'');',
'  as_xlsx.set_column_width(4, 20);',
unistr('  as_xlsx.cell( 9, v_num_fla , ''N\00FAmero de declaraci\00F3n'');'),
'  as_xlsx.set_column_width(5, 25);',
'  as_xlsx.cell( 10, v_num_fla , ''Valor Total Declarado'');',
'  as_xlsx.set_column_width(6, 30);',
'  as_xlsx.cell( 11, v_num_fla , ''Valor Presentado'');',
'  as_xlsx.set_column_width(7, 15);',
'  as_xlsx.cell( 12, v_num_fla , ''Vigencia'');',
'  as_xlsx.set_column_width(8, 15);',
'  as_xlsx.cell( 13, v_num_fla , ''Periodo'');',
'  as_xlsx.set_column_width(9, 15);',
'  as_xlsx.cell( 14, v_num_fla , ''Saldo Capital Cartera'');',
'  as_xlsx.set_column_width(10, 25);',
unistr('  as_xlsx.cell( 15, v_num_fla , ''Saldo Inter\00E9s Cartera'');'),
'  as_xlsx.set_column_width(11, 25);  ',
'  as_xlsx.cell( 16, v_num_fla , ''Saldo Total'');',
'  as_xlsx.set_column_width(12, 30);',
'  as_xlsx.cell( 17, v_num_fla , ''Estado'');',
'  as_xlsx.set_column_width(12, 30);',
'  ',
'',
'  --raise_application_error(-20000,''ejecutando proceso '');',
'  -- Consulta ',
'  for c_datos in (',
'	select b.idntfccion_sjto                                      as Identificacion',
'		 , c.nmbre_rzon_scial                                     as Nombre_razon_social ',
'		 , d.nmbre_rzon_scial                                     as Responsable_Principal',
unistr('		 , decode( c.tpo_prsna , ''N'' , ''Natural'' , ''Jur\00EDdica'')    as Tipo_Persona'),
'		 , e.nmbre_sjto_tpo                                       as Tipo_Regimen',
unistr('		 , b.drccion                                              as Direcci\00F3n'),
'		 , b.email                                                as Correo',
'		 , b.tlfno                                                as Telefono',
unistr('		 , a.nmro_cnsctvo                                         as N\00FAmero_de_declaraci\00F3n'),
'		 , TO_CHAR(a.VLOR_TTAL, ''$999,999,999,999,999,999'')       as Valor_Total_Declarado',
'		 , TO_CHAR(a.VLOR_PAGO, ''$999,999,999,999,999,999'')       as Valor_Presentado',
'		 , a.vgncia                                               as Vigencia          ',
'		 , p.dscrpcion                                            as Periodo',
'		 , TO_CHAR(g.vlor_sldo_cptal, ''$999,999,999,999,999,999'') as Saldo_Capital_Cartera',
'		 , TO_CHAR(g.vlor_intres, ''$999,999,999,999,999,999'')     as Saldo_Interes_Cartera',
'		 , TO_CHAR(SUM(g.vlor_sldo_cptal + g.vlor_intres), ',
'		   ''$999,999,999,999,999,999'') 							  as Saldo_Total',
'		 , b.DSCRPCION_SJTO_ESTDO                                 as Estado',
'    from gi_g_declaraciones         a',
'    join v_si_i_sujetos_impuesto    b on b.id_sjto_impsto = a.id_sjto_impsto',
'    join v_si_i_personas            c on a.id_sjto_impsto = c.id_sjto_impsto',
'    join V_si_i_sujetos_responsable d on d.id_sjto_impsto = a.id_sjto_impsto',
'    and d.Prncpal_S_N = ''S'' ',
'    and d.actvo       = ''S''      ',
'    join DF_I_SUJETOS_TIPO          e on e.id_sjto_tpo = c.id_sjto_tpo',
'    join df_i_periodos              p on p.id_prdo = a.id_prdo',
'    join V_GF_G_CARTERA_X_VIGENCIA  g on g.id_orgen = a.id_dclrcion',
'    where a.cdgo_clnte        = :F_CDGO_CLNTE',
'    and a.id_impsto           = :P99_ID_IMPSTO    ',
'    and a.id_impsto_sbmpsto   = :P99_ID_IMPSTO_SBMPSTO  ',
'    and a.vgncia              = :P99_VGNCIA_PRSNTDA',
'    and p.cdgo_prdcdad        = :P99_TPO_PRIOCDAD ',
'    and p.id_prdo             = :P99_PRIODO',
'    and a.cdgo_dclrcion_estdo = ''APL''',
'    and a.VLOR_PAGO           = 0',
'    and g.vlor_sldo_cptal     > 0',
'    and d.idntfccion_sjto     = nvl(:P99_IDNTFCCION, d.idntfccion_sjto)',
'    and e.id_sjto_tpo         = nvl(:P99_NMBRE_SJTO_TPO, e.id_sjto_tpo)',
'    and c.tpo_prsna           = nvl(:P99_DSCRPCION_TPO_PRSNA, c.tpo_prsna)',
'    and b.cdgo_sjto_estdo     = nvl(:P99_DSCRPCION_SJTO_ESTDO, b.cdgo_sjto_estdo) ',
'    group by b.idntfccion_sjto                                    ',
'         , c.nmbre_rzon_scial                                      ',
'         , d.nmbre_rzon_scial                                     ',
'         , c.tpo_prsna    ',
'         , e.nmbre_sjto_tpo                                       ',
'         , b.drccion                                              ',
'         , b.email',
'         , b.tlfno                                                  ',
'         , a.VLOR_TTAL ',
'         , a.VLOR_PAGO ',
'         , a.vgncia                                            ',
'         , p.dscrpcion',
'         , g.vlor_sldo_cptal ',
'         , g.vlor_intres',
'         , a.nmro_cnsctvo',
'         , b.DSCRPCION_SJTO_ESTDO',
'        ORDER BY c.nmbre_rzon_scial ASC',
') loop',
'    --raise_application_error(-20000,''entro al loop'');',
'      -- aqui se debe hacer la consulta y ir llenado las filas',
'      v_num_fla :=  v_num_fla + 1;  ',
'      as_xlsx.cell( 1, v_num_fla , c_datos.Identificacion);    ',
'      as_xlsx.cell( 2, v_num_fla , c_datos.Nombre_razon_social);  ',
'      as_xlsx.cell( 3, v_num_fla , c_datos.Responsable_Principal);    ',
'      as_xlsx.cell( 4, v_num_fla , c_datos.Tipo_Persona);      ',
'      as_xlsx.cell( 5, v_num_fla , c_datos.Tipo_Regimen); ',
unistr('      as_xlsx.cell( 6, v_num_fla , c_datos.Direcci\00F3n);'),
'      as_xlsx.cell( 7, v_num_fla , c_datos.Correo);',
'      as_xlsx.cell( 8, v_num_fla , c_datos.Telefono);',
unistr('      as_xlsx.cell( 9, v_num_fla , c_datos.N\00FAmero_de_declaraci\00F3n);'),
'      as_xlsx.cell( 10, v_num_fla , c_datos.Valor_Total_Declarado);',
'      as_xlsx.cell( 11, v_num_fla , c_datos.Valor_Presentado);',
'      as_xlsx.cell( 12, v_num_fla , c_datos.Vigencia);',
'	  as_xlsx.cell( 13, v_num_fla , c_datos.Periodo);',
'      as_xlsx.cell( 14, v_num_fla , c_datos.Saldo_Capital_Cartera);',
'      as_xlsx.cell( 15, v_num_fla , c_datos.Saldo_Interes_Cartera);',
'      as_xlsx.cell( 16, v_num_fla , c_datos.Saldo_Total);',
'	  as_xlsx.cell( 17, v_num_fla , c_datos.Estado);',
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
,p_process_when_button_id=>wwv_flow_api.id(236036249859686326)
,p_process_when=>'Imprimir'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
