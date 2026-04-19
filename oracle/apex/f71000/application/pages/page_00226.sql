prompt --application/pages/page_00226
begin
wwv_flow_api.create_page(
 p_id=>226
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Gesti\00F3n Registro Saldo Favor Manual ')
,p_step_title=>unistr('Gesti\00F3n Registro Saldo Favor Manual ')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function fnc_anulaSaldoFavor(P_ID_SLDO_FVOR){',
'    ',
unistr('    apex.message.confirm( "Est\00E1 seguro de eliminar el saldo a favor?", function(okPressed) {'),
'    if(okPressed) {',
'         try{',
'       apex.server.process("ajaxAnulaSaldoFavor",{',
'            x01: P_ID_SLDO_FVOR,',
'            pageItems: ""',
'        },{',
'            success: function(data){',
'                if(data.o_cdgo_rspsta != 0){',
'                   console.log(data.o_cdgo_rspsta);',
'                   apex.message.clearErrors();',
'                   apex.message.showErrors ([',
'                       {',
'                           type:       "error",',
'                           location:   "page",',
'                           message:    data.o_mnsje_rspsta,',
'                           unsafe:     false',
'                       }',
'                   ]);',
'                }else{',
unistr('                   apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                   apex.submit();',
'                }',
'            }',
'        })',
'    }catch(e){',
'        console.log(e);',
'    }',
'    }',
'});',
'    ',
'    ',
'   ',
'}',
'',
'',
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(177374633629050691)
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20220401160303'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122210503439037909)
,p_plug_name=>'parametros'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(177331524321050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(122536853176341304)
,p_plug_name=>'Saldos a Favor'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_sldo_fvor,',
'       c.idntfccion_sjto_frmtda,',
'       a.nmbre_impsto,',
'       b.nmbre,',
'       a.vlor_sldo_fvor,',
'       to_char(a.fcha_rgstro, ''dd/MM/YYYY'') as fecha,',
'       case when a.indcdor_rcncdo = ''N'' then ',
'             ''<center>',
'                <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Anular  ',
'                   <span class="fa fa-trash-o" aria-hidden="true"></span>',
'                </button>',
'             </center>'' end btn_eliminar',
'from v_gf_g_saldos_favor       a ',
'join gf_d_saldos_favor_tipo    b on a.cdgo_sldo_fvor_tpo = b.cdgo_sldo_fvor_tpo',
'join v_si_i_sujetos_impuesto   c on a.id_sjto_impsto = c.id_sjto_impsto',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.indcdor_rgstro = ''M''',
'and not a.estdo = ''AN''     ',
'and a.id_usrio = :F_ID_USRIO;'))
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
 p_id=>wwv_flow_api.id(122537718723341313)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:340:&SESSION.::&DEBUG.:RP,340:P340_ID_SLDO_FVOR:#ID_SLDO_FVOR#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/blue_function_16x16.gif" style="max-width:32px;" alt="" title="" />'
,p_owner=>'LTORRES'
,p_internal_uid=>122537718723341313
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122537818483341314)
,p_db_column_name=>'ID_SLDO_FVOR'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sldo Fvor'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122537908753341315)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122538040273341316)
,p_db_column_name=>'NMBRE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Tipo Saldo a Favor'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122538102287341317)
,p_db_column_name=>'VLOR_SLDO_FVOR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Valor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122538222580341318)
,p_db_column_name=>'FECHA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Fecha Registro'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(122691599249270202)
,p_db_column_name=>'BTN_ELIMINAR'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>unistr('Acci\00F3n')
,p_column_link=>'f?p=&APP_ID.:226:&SESSION.:anular:&DEBUG.:RP:P226_ID_SLDO_FVOR:#ID_SLDO_FVOR#'
,p_column_linktext=>'#BTN_ELIMINAR#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17120462472243106)
,p_db_column_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>unistr('Identificaci\00F3n Sujeto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(122549536770370687)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1225496'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'IDNTFCCION_SJTO_FRMTDA:NMBRE_IMPSTO:VLOR_SLDO_FVOR:NMBRE:FECHA:BTN_ELIMINAR:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(216547870593366347)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(370420828079379972)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
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
'',
'<i>',
'',
unistr('Funcionalidad que muestra los Saldos a Favor registrados manualmente y que no est\00E1n anulados, Permite: <br><br>'),
'',
'Registrar Saldos a favor.<br><br>',
'',
'Anular saldos a favor.<br><br>',
'',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'',
'',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(122096572683659964)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(216547870593366347)
,p_button_name=>'Registro_SAF'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar Saldo a Favor'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:204:&SESSION.::&DEBUG.:RP,204:P204_SJTO_IMPSTO,P204_PGNA:&P226_SJTO_IMPSTO.,&APP_PAGE_ID.'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122210603341037910)
,p_name=>'P226_ID_SLDO_FVOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(122210503439037909)
,p_prompt=>'id_sldo_fvor'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122691780388270204)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Anular_Saldo_Favor'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update gf_g_saldos_favor a',
'set a.estdo = ''AN''',
'where a.id_sldo_fvor = :P226_ID_SLDO_FVOR;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'anular'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(122691410543270201)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Nuevo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    update gf_g_saldos_favor a',
'    set A.ESTDO = ''AN''',
'    where A.ID_SLDO_FVOR = 1;   ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
