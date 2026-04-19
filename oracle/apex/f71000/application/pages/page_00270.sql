prompt --application/pages/page_00270
begin
wwv_flow_api.create_page(
 p_id=>270
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Paz y Salvo Rentas'
,p_step_title=>'Paz y Salvo Rentas'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'String.prototype.initCap = function () {',
unistr('   return this.toLowerCase().replace(/(?:^|\005Cs)[a-z\00E1\00E9\00ED\00FA\00F3]/g, function (m) {'),
'      return m.toUpperCase();',
'   });',
'};'))
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20250528090441'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(123012677108559167)
,p_plug_name=>unistr('Par\00E1metros')
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(123016258662559203)
,p_plug_name=>unistr('Par\00E1metros')
,p_parent_plug_id=>wwv_flow_api.id(123012677108559167)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(123781689657921665)
,p_plug_name=>'Estado de Cuenta'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'select  c.idntfccion_rspnsble ',
'      , (c.prmer_nmbre||'' ''||  c.sgndo_nmbre||'' ''|| c.prmer_aplldo||'' ''|| c.prmer_nmbre) as rspnsble',
'      , c.idntfccion_sjto',
'      , c.idntfccion_antrior',
'      , b.id_sjto_impsto',
'      , b.drccion',
'      , d.nmro_dcmnto',
'      , d.id_dcmnto',
'      , a.txto_ascda',
'from gi_g_rentas                a',
'join v_si_i_sujetos_impuesto    b  on a.id_sjto_impsto = b.id_sjto_impsto',
'join v_si_i_sujetos_responsable c  on b.id_sjto_impsto = c.id_sjto_impsto',
'join re_g_documentos            d  on a.id_dcmnto      = d.id_dcmnto',
'where  a.cdgo_clnte             = :F_CDGO_CLNTE',
'  and  a.id_impsto              = :P270_ID_IMPSTO',
'  and  a.id_impsto_sbmpsto      = :P270_ID_IMPSTO_SBIMPSTO',
'  and  c.prncpal_s_n            = ''S''',
'  and  d.nmro_dcmnto            = :P270_NMRO_DCMNTO;'))
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
 p_id=>wwv_flow_api.id(123907605410498571)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn Dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_detail_link=>'f?p=&APP_ID.:274:&SESSION.::&DEBUG.:RP,274:P274_ID_SJTO_IMPSTO,P274_ID_DCMNTO,P274_TXTO_ASCDA:#ID_SJTO_IMPSTO#,#ID_DCMNTO#,#TXTO_ASCDA#'
,p_detail_link_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="text-align: center;">',
'  &"Ver".<span class="fa fa-eye"></span>',
'</div>'))
,p_owner=>'AMOLINA'
,p_internal_uid=>123907605410498571
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5028820489410262)
,p_db_column_name=>'IDNTFCCION_RSPNSBLE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n responsable ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5029255919410263)
,p_db_column_name=>'RSPNSBLE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Responsable '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5029677664410263)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Identificaci\00F3n Sujeto ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5030023568410263)
,p_db_column_name=>'IDNTFCCION_ANTRIOR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Idntfccion Antrior'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5030420980410264)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5028468774410244)
,p_db_column_name=>'DRCCION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Direcci\00F3n ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5032425451430205)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Nmro Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5032557243430206)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Id Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9970891249852301)
,p_db_column_name=>'TXTO_ASCDA'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Txto Ascda'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(123924749636820449)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'50308'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'IDNTFCCION_RSPNSBLE:RSPNSBLE:IDNTFCCION_SJTO:IDNTFCCION_ANTRIOR:ID_SJTO_IMPSTO:DRCCION:NMRO_DCMNTO:ID_DCMNTO:TXTO_ASCDA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(169388922560642897)
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
'',
'<i>',
'Funcionalidad que permite generar un paz y salvo de un sujeto que este al dia con los pagos de un Impuesto especifico.<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5022408467410175)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(123016258662559203)
,p_button_name=>'Btn_Cnsultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5021805333410120)
,p_name=>'P270_TPO_BSQUEDA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(123012677108559167)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5022873578410187)
,p_name=>'P270_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(123016258662559203)
,p_prompt=>'Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  nmbre_impsto a',
'        ,id_impsto   b ',
'from df_c_impuestos',
'where cdgo_impsto = ''REN'''))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione un Tributo de la lista a consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5023790445410195)
,p_name=>'P270_ID_IMPSTO_SBIMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(123016258662559203)
,p_prompt=>'Sub-Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_impsto_sbmpsto as d, id_impsto_sbmpsto as',
'   from df_i_impuestos_subimpuesto a',
'   join df_c_impuestos b',
'     on b.id_impsto = a.id_impsto',
'  where b.cdgo_impsto = ''REN''',
'    and a.cdgo_impsto_sbmpsto IN (''DUB'', ''PEV'',''AEP'')',
'order by nmbre_impsto_sbmpsto    ',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P270_ID_IMPSTO'
,p_ajax_items_to_submit=>'P270_ID_IMPSTO_SBIMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione un Sub-Tributo de la lista a consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5024692229410196)
,p_name=>'P270_NMRO_DCMNTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(123016258662559203)
,p_prompt=>'Nro Documento: '
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Digite la referencia catastral del predio.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5025549489410197)
,p_name=>'P270_DRCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(123016258662559203)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Siga el siguiente formato:',
unistr('C: calle, K: carrera Ej. K 10 47B 133 \00F3 C 23 15 42'),
unistr('Si vive en un apartamento coloque solo la direcci\00F3n del conjunto'),
unistr('No utilice ning\00FAn tipo signo Ej. #, -')))
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5026309239410216)
,p_name=>'P270_IDNTFCCION_RSPNSBLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(123016258662559203)
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('Digite la identificaci\00F3n del responsable. ')
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5027212079410217)
,p_name=>'P270_RFRNCIA_ANTRIOR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(123016258662559203)
,p_prompt=>'Referencia Catastral Anterior:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Digite la referencia catastral anterior del predio.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5031649909410373)
,p_validation_name=>'Validar Parametros'
,p_validation_sequence=>10
,p_validation=>':P270_NMRO_DCMNTO is not null'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Para realizar la consulta debe digitar por lo menos un parametro adicional al Tributo y  Sub-Tributo.'
,p_always_execute=>'Y'
,p_validation_condition=>'(:P270_ID_IMPSTO is not null and :P270_ID_IMPSTO_SBIMPSTO is not null)'
,p_validation_condition_type=>'PLSQL_EXPRESSION'
,p_when_button_pressed=>wwv_flow_api.id(5022408467410175)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
