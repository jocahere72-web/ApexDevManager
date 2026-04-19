prompt --application/pages/page_00025
begin
wwv_flow_api.create_page(
 p_id=>25
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Reglas de descuento'
,p_step_title=>'Reglas de descuento'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function isLetter(id){',
unistr('    if (!/^[A-Za-z\00E1\00E9\00ED\00F3\00FA\00FC\00F1 ]*$/i.test($(''#''+id).val())) {'),
unistr('        $(''#''+id).val($(''#''+id).val().replace(/[^A-Za-z\00E1\00E9\00ED\00F3\00FA\00FC\00F1 ]+/ig,""));'),
'    }',
'}',
'',
'function mayuscula(id){',
'	$(''#''+id).val($(''#''+id).val().toUpperCase());',
'}',
'',
'function buttonCollapse(id){',
'	if($(''#''+id).attr(''aria-expanded'') == ''true''){',
'		$(''#''+id).click();',
'	}',
'}'))
,p_javascript_code_onload=>'//buttonCollapse(''t_Button_rightControlButton'');'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.tooltip {',
'    position: relative;',
'    display: inline-block;',
'    border-bottom: 1px dotted black;',
'}',
'',
'.tooltip .tooltiptext {',
'    visibility: hidden;',
'    width: 120px;',
'    background-color: Gray;',
'    color: white;',
'    text-align: center;',
'    border-radius: 6px;',
'    padding: 5px 0;',
'',
'    /* Position the tooltip */',
'   position: static;',
'    z-index: 1;',
'}',
'',
'.tooltip:hover .tooltiptext {',
'    visibility: visible;',
'}',
'',
'#color{',
'     /*background-color: white;*/',
'    background-color: #e9eaec;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20211207133759'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33671430829178501)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'Funcionalidad para parametrizar reglas de descuento en las diferentes vigencias, periodos y conceptos que se le va a dar un porcentaje(%) de descuento.',
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(178467718504903272)
,p_plug_name=>'Reglas de Descuento'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_dscnto_rgla,',
'       a.id_impsto,',
'       a.id_impsto_sbmpsto,',
'       a.fcha_dsde,',
'       a.fcha_hsta,',
'       a.vgncia_dsde ,',
'       a.vgncia_hsta ,',
'       a.prdo_dsde  ,',
'       a.prdo_hsta ,',
'       a.cdgo_cncpto || '' - '' || a.dscrpcion_cncpto cncpto ,',
'       a.cdgo_cncpto_dscnto || '' - '' || a.dscrpcion_cncpto_dscnto cncpto_dscnto ,',
'       a.prcntje_dscnto_entro,',
'      -- a.cdgo_dscnto_tpo,',
'       a.dscrpcion_cdgo_tpo_dscnto,',
'       a.dscrpcion,',
'       a.actvo',
'  from v_re_g_descuentos_regla a',
' where a.cdgo_clnte          = :F_CDGO_CLNTE',
'   and (a.id_impsto          = :P25_ID_IMPSTO         or (:P25_ID_IMPSTO            is null))',
'  /* and (a.id_impsto_sbmpsto  = :P25_ID_IMPSTO_SBMPSTO or (:P25_ID_IMPSTO_SBMPSTO    is null))',
'  and (a.id_cncpto          = :P25_ID_CNCPTO         or (:P25_ID_CNCPTO            is null)) ',
'   and (a.id_cncpto_dscnto   = :P25_ID_CNCPTO_DSCNTO  or (:P25_ID_CNCPTO_DSCNTO     is null))',
'   and ((((a.vgncia_dsde *100) + a.prdo_dsde between (:P25_VIGENCIA_DSDE *100) + :P25_ID_PRDO_DSDE  ',
'                                                 and (:P25_VIGENCIA_HSTA *100) + :P25_ID_PRDO_HSTA) ) ',
'   or (((a.vgncia_hsta *100) + a.prdo_hsta between (:P25_VIGENCIA_DSDE *100) + :P25_ID_PRDO_DSDE  ',
'                                                 and (:P25_VIGENCIA_HSTA *100) + :P25_ID_PRDO_HSTA)));*/',
'  '))
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
 p_id=>wwv_flow_api.id(182520547083831692)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP:P9_ID_DSCNTO_RGLA:#ID_DSCNTO_RGLA#'
,p_detail_link_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt=""></center>',
''))
,p_owner=>'JALCOCER'
,p_internal_uid=>180342107673233233
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182520683700831693)
,p_db_column_name=>'ID_DSCNTO_RGLA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Condici\00F3n')
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99207268429054104)
,p_db_column_name=>'CNCPTO'
,p_display_order=>50
,p_column_identifier=>'Q'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99207430515054106)
,p_db_column_name=>'DSCRPCION_CDGO_TPO_DSCNTO'
,p_display_order=>60
,p_column_identifier=>'S'
,p_column_label=>'Tipo de Descuento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99207343820054105)
,p_db_column_name=>'PRCNTJE_DSCNTO_ENTRO'
,p_display_order=>70
,p_column_identifier=>'R'
,p_column_label=>'% Descuento'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(182521589071831702)
,p_db_column_name=>'ACTVO'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(177372678491050686)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99207670830054108)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>90
,p_column_identifier=>'T'
,p_column_label=>'Id Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99207718758054109)
,p_db_column_name=>'ID_IMPSTO_SBMPSTO'
,p_display_order=>100
,p_column_identifier=>'U'
,p_column_label=>'Id Impsto Sbmpsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16451668239791514)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>120
,p_column_identifier=>'W'
,p_column_label=>unistr('Descripci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46596380957083208)
,p_db_column_name=>'VGNCIA_DSDE'
,p_display_order=>130
,p_column_identifier=>'X'
,p_column_label=>'Vigencia Desde'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46596729327083212)
,p_db_column_name=>'PRDO_DSDE'
,p_display_order=>140
,p_column_identifier=>'AB'
,p_column_label=>'Periodo Desde'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46596429749083209)
,p_db_column_name=>'VGNCIA_HSTA'
,p_display_order=>150
,p_column_identifier=>'Y'
,p_column_label=>'Vigencia Hasta'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46596867648083213)
,p_db_column_name=>'PRDO_HSTA'
,p_display_order=>160
,p_column_identifier=>'AC'
,p_column_label=>'Periodo Hasta'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(46596687869083211)
,p_db_column_name=>'FCHA_DSDE'
,p_display_order=>170
,p_column_identifier=>'AA'
,p_column_label=>'Fecha Desde'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(45458745326856312)
,p_db_column_name=>'FCHA_HSTA'
,p_display_order=>180
,p_column_identifier=>'AD'
,p_column_label=>'Fecha Hasta'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(45458845112856313)
,p_db_column_name=>'CNCPTO_DSCNTO'
,p_display_order=>190
,p_column_identifier=>'AE'
,p_column_label=>'Concepto de Descuento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(183880543795389842)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1817022'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_CDGO_TPO_DSCNTO:CNCPTO:PRCNTJE_DSCNTO_ENTRO:DSCRPCION:VGNCIA_DSDE:PRDO_DSDE:VGNCIA_HSTA:PRDO_HSTA:FCHA_DSDE:FCHA_HSTA:ACTVO::CNCPTO_DSCNTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(178470353484903299)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(182521709581831703)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(47856491252794636)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(178470353484903299)
,p_button_name=>'Restablecer'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Restablecer'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(187528471409491424)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(182521709581831703)
,p_button_name=>'Regresar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(178470961109903305)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(178470353484903299)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(181099601658891960)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(182521709581831703)
,p_button_name=>'Btn_Nuevo'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva<br> Regla de Descuento'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP,9::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(187506705409206362)
,p_branch_name=>'regresar'
,p_branch_action=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(187528471409491424)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45458950176856314)
,p_name=>'P25_ID_CNCPTO_DSCNTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(178470353484903299)
,p_prompt=>'Concepto Descuento:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d,',
'        id_cncpto r',
'  from df_i_conceptos',
'  where cdgo_clnte       = :F_CDGO_CLNTE',
'    and id_impsto        = :P25_ID_IMPSTO',
'    and cdgo_cncpto_tpo  = ''CRD''',
'    and ctgria_cncpto    = ''D''',
'    and actvo            = ''S'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccione Concepto-'
,p_lov_cascade_parent_items=>'P25_ID_IMPSTO'
,p_ajax_optimize_refresh=>'N'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione de la lista el documento de descuento.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46597060264083215)
,p_name=>'P25_ID_PRDO_HSTA'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(178470353484903299)
,p_prompt=>'Periodo Hasta:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d,',
'         prdo r ',
'  from DF_I_PERIODOS',
'  where vgncia = :P25_VIGENCIA_HSTA',
'    and id_impsto = :P25_ID_IMPSTO',
'    and id_impsto_sbmpsto = :P25_ID_IMPSTO_SBMPSTO;'))
,p_lov_cascade_parent_items=>'P25_ID_IMPSTO,P25_ID_IMPSTO_SBMPSTO,P25_VIGENCIA_HSTA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione de la lista el periodo final. '
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46598891513083233)
,p_name=>'P25_VIGENCIA_HSTA'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(178470353484903299)
,p_prompt=>'Vigencia Hasta:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccione Vigencia-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista la vigencia final.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(178470479898903300)
,p_name=>'P25_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(178470353484903299)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccione Impuesto-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el tributo.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(178470589435903301)
,p_name=>'P25_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(178470353484903299)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_impsto_sbmpsto  as d,',
'        id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where id_impsto = :P25_ID_IMPSTO',
' order by 1',
''))
,p_lov_cascade_parent_items=>'P25_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione de la lista el subtributo.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(178470737927903302)
,p_name=>'P25_VIGENCIA_DSDE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(178470353484903299)
,p_prompt=>'Vigencia Desde:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccione Vigencia-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista la vigencia inicial'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(178470809144903303)
,p_name=>'P25_ID_PRDO_DSDE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(178470353484903299)
,p_prompt=>'Periodo Desde:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d,',
'         prdo r ',
'  from DF_I_PERIODOS',
'  where vgncia = :P25_VIGENCIA_DSDE',
'    and id_impsto = :P25_ID_IMPSTO',
'    and id_impsto_sbmpsto = :P25_ID_IMPSTO_SBMPSTO;'))
,p_lov_cascade_parent_items=>'P25_VIGENCIA_DSDE,P25_ID_IMPSTO,P25_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione de la lista el periodo inicial'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(178470839745903304)
,p_name=>'P25_ID_CNCPTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(178470353484903299)
,p_prompt=>'Concepto:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d,',
'        id_cncpto r',
'  from df_i_conceptos',
'  where cdgo_clnte       = :F_CDGO_CLNTE',
'    and id_impsto        = :P25_ID_IMPSTO',
'    and cdgo_cncpto_tpo  = ''DBT''',
'    and ctgria_cncpto    != ''D''',
'    and actvo            = ''S'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccione Concepto-'
,p_lov_cascade_parent_items=>'P25_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione de la lista el concepto'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(46598784734083232)
,p_validation_name=>'Vigencia Hasta Mayor que vigencia desde'
,p_validation_sequence=>5
,p_validation=>'(:P25_VIGENCIA_DSDE<=:P25_VIGENCIA_HSTA)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'La vigencia hasta no puede ser menor que la vigencia desde. '
,p_associated_item=>wwv_flow_api.id(46598891513083233)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(182522182786831708)
,p_name=>'Al cerrar modal refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(178467718504903272)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(182522290488831709)
,p_event_id=>wwv_flow_api.id(182522182786831708)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(178467718504903272)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9758528747357616)
,p_event_id=>wwv_flow_api.id(182522182786831708)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(183939471459921460)
,p_name=>'al cerar modal refresh '
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(181099601658891960)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(183939589847921461)
,p_event_id=>wwv_flow_api.id(183939471459921460)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(178467718504903272)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(47856564910794637)
,p_name=>unistr('Limpiar parametros de b\00FAsqueda')
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(47856491252794636)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(47856690940794638)
,p_event_id=>wwv_flow_api.id(47856564910794637)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P25_ID_IMPSTO,P25_ID_IMPSTO_SBMPSTO,P25_ID_CNCPTO,P25_ID_CNCPTO_DSCNTO,P25_VIGENCIA_DSDE,P25_VIGENCIA_HSTA,P25_ID_PRDO_HSTA,P25_ID_PRDO_DSDE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(178469167905903287)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Reglas de Descuento - Save Interactive Grid Data'
,p_attribute_02=>'RE_G_DESCUENTOS_REGLA'
,p_attribute_03=>'ID_DSCNTO_RGLA'
,p_attribute_04=>'ID_DSCNTO_RGLA'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
