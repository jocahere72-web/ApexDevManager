prompt --application/pages/page_00263
begin
wwv_flow_api.create_page(
 p_id=>263
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Registro de Recaudo Asobancaria'
,p_step_title=>'Registro de Recaudo Asobancaria'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Wizard{',
'  max-width: none;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20200227172909'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32056197942004532)
,p_plug_name=>'<i><b>Recaudos</b></i>'
,p_region_name=>'re'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select id_rcdo_cntrol ',
'         , id_rcdo',
'         , dscrpcion_sjto_tpo ',
'         , idntfccion_sjto_frmtda as idntfccion_sjto',
'         , dscrpcion_rcdo_orgn_tpo',
'         , nmro_dcmnto',
'         , fcha_rcdo',
'         , vlor',
'         , fcha_apliccion',
'         , obsrvcion',
'         , dscrpcion_rcdo_estdo',
'         , cdgo_rcdo_estdo',
'     from v_re_g_recaudos',
'    where id_rcdo_cntrol = :P263_ID_RCDO_CNTROL'))
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
 p_id=>wwv_flow_api.id(61308064948841901)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>61308064948841901
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61308185506841902)
,p_db_column_name=>'ID_RCDO_CNTROL'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Rcdo Cntrol'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61308284842841903)
,p_db_column_name=>'ID_RCDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('N\00FAmero Recaudo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61308338617841904)
,p_db_column_name=>'DSCRPCION_SJTO_TPO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Tipo Sujeto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61308493754841905)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61308577894841906)
,p_db_column_name=>'DSCRPCION_RCDO_ORGN_TPO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Origen'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61308670632841907)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('N\00FAmero')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61308750335841908)
,p_db_column_name=>'FCHA_RCDO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Fecha de Recaudo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61308875916841909)
,p_db_column_name=>'VLOR'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Valor Recaudo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61308946769841910)
,p_db_column_name=>'FCHA_APLICCION'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Fecha de Aplicaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61309040331841911)
,p_db_column_name=>'DSCRPCION_RCDO_ESTDO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61309154505841912)
,p_db_column_name=>'CDGO_RCDO_ESTDO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Cdgo Rcdo Estdo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61309248527841913)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(61322685904849120)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'613227'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_RCDO:DSCRPCION_SJTO_TPO:IDNTFCCION_SJTO:DSCRPCION_RCDO_ORGN_TPO:NMRO_DCMNTO:FCHA_RCDO:VLOR:DSCRPCION_RCDO_ESTDO:OBSRVCION:'
,p_sum_columns_on_break=>'VLOR'
,p_count_columns_on_break=>'ID_RCDO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(61070280732523384)
,p_plug_name=>'Wizard Recaudo Asobancaria- Recaudos'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(15959830319946441)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(177351601973050625)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(126027998825257864)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(126031759547268630)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
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
'  Funcionalidad que permite confirmar los recaudos procesado por archivo asobancaria.',
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(62379642322911469)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(126027998825257864)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:221:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16073398116082458)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(126027998825257864)
,p_button_name=>'Btn_Confirmar_Registros'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Confirmar Registros'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿Esta seguro de registrar los recaudos?'',''Btn_Confirmar_Registros'');'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'  from re_g_recaudos ',
' where id_rcdo_cntrol = :P263_ID_RCDO_CNTROL',
'   and cdgo_rcdo_estdo = ''IN'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-check-square'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15991290323929229)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(61070280732523384)
,p_button_name=>'PREVIOUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355657869050631)
,p_button_image_alt=>'Previous'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:221:&SESSION.::&DEBUG.:RP::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(15995113608958803)
,p_name=>'P263_ID_RCDO_CNTROL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(32056197942004532)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15998327877958835)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Confirmar Registro'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta  number;',
'    v_mnsje_rspsta varchar2(4000);',
'begin',
'    --Cursor de Recaudos del Lote',
'    for c_rcdos in (',
'                        select id_rcdo',
'                          from re_g_recaudos',
'                         where id_rcdo_cntrol  = :P263_ID_RCDO_CNTROL',
'                           and cdgo_rcdo_estdo = ''IN''',
'                   ) loop',
'        ',
'        --Confirma el Recaudo',
'        pkg_re_recaudos.prc_ac_confirmar_recaudo( p_cdgo_clnte   => :F_CDGO_CLNTE',
'                                                , p_id_usrio     => :F_ID_USRIO',
'                                                , p_id_rcdo      => c_rcdos.id_rcdo',
'                                                , o_cdgo_rspsta  => v_cdgo_rspsta',
'                                                , o_mnsje_rspsta => v_mnsje_rspsta );',
'        ',
'        --Verifica si Hubo Error',
'        if( v_cdgo_rspsta <> 0 ) then',
'            raise_application_error( -20001 , v_mnsje_rspsta );',
'        end if;  ',
'        ',
'    end loop;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(16073398116082458)
);
end;
/
