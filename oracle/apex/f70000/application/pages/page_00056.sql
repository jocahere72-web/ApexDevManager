prompt --application/pages/page_00056
begin
wwv_flow_api.create_page(
 p_id=>56
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Registro Sujeto-Impuesto'
,p_step_title=>'Registro Sujeto-Impuesto'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'$(document).ready(() => {',
'    ',
'    if($v( "P56_SJTO_IMPSTO" ) === ''''){',
'        apex.item(''SR_rspnsble_tab'').hide();',
'    }else if ( $v( "P56_TPO_PRSNA_OCULTO" ) === ''N''){',
'        apex.item(''SR_rspnsble_tab'').hide();',
'    }',
'});',
'*/',
'',
''))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20210623145218'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14293946346157903)
,p_plug_name=>'Datos'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14295681861157920)
,p_plug_name=>unistr('Informaci\00F3n B\00E1sica')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(19643083071550834)
,p_plug_name=>'Responsables'
,p_parent_plug_id=>wwv_flow_api.id(14295681861157920)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  SEQ_ID,',
unistr('        decode(c001, ''S'', ''S\00ED'', ''No'')  as prncpal,'),
'        c002 as tpo_idntfccion_r,',
'        c003 as v_dscrpcion_idntfccion,',
'        c004 as idntfccion_r,',
'        c005 as prmer_nmbre_r,',
'        c006 as sgndo_nmbre_r,',
'        c007 as prmer_aplldo_r,',
'        c008 as sgndo_apellido_r,',
'        c009 as dprtmnto_r,',
'        c010 as v_dscrpcion_dprtmnto,',
'        c011 as mncpio_r,',
'        c012 as v_dscrpcion_mncpio,',
'        c013 as drccion_r,',
'        c014 as tlfno_r,',
'        c015 as email_r,',
'        c016 as tpo_rspnsble,',
'        c017 as indcdor,',
'        c018 as id_sjto_rspnsble,',
'        ''<center>',
'            <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Eliminar  ',
'                <span class="fa fa-trash-o" aria-hidden="true"></span>',
'            </button>',
'        </center>'' as btn_eliminar',
'        ',
'from APEX_collections    a    ',
'where collection_name = ''RESPONSABLES'''))
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
 p_id=>wwv_flow_api.id(19643196770550835)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:97:&SESSION.:actualizar:&DEBUG.:RP,97:P97_SEQ_ID:#SEQ_ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'LTORRES'
,p_internal_uid=>19643196770550835
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19996155331014312)
,p_db_column_name=>'PRNCPAL'
,p_display_order=>10
,p_column_identifier=>'P'
,p_column_label=>unistr('\00BFPrincipal?')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19996250459014313)
,p_db_column_name=>'TPO_IDNTFCCION_R'
,p_display_order=>20
,p_column_identifier=>'Q'
,p_column_label=>unistr('Tipo Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19996304553014314)
,p_db_column_name=>'V_DSCRPCION_IDNTFCCION'
,p_display_order=>30
,p_column_identifier=>'R'
,p_column_label=>unistr('Tipo Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19996497773014315)
,p_db_column_name=>'IDNTFCCION_R'
,p_display_order=>40
,p_column_identifier=>'S'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19996548751014316)
,p_db_column_name=>'PRMER_NMBRE_R'
,p_display_order=>50
,p_column_identifier=>'T'
,p_column_label=>'Primer nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19996672161014317)
,p_db_column_name=>'SGNDO_NMBRE_R'
,p_display_order=>60
,p_column_identifier=>'U'
,p_column_label=>'Segundo nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19996720102014318)
,p_db_column_name=>'PRMER_APLLDO_R'
,p_display_order=>70
,p_column_identifier=>'V'
,p_column_label=>'Primer Apellido'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19996821644014319)
,p_db_column_name=>'SGNDO_APELLIDO_R'
,p_display_order=>80
,p_column_identifier=>'W'
,p_column_label=>'Segundo Apellido'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19996962124014320)
,p_db_column_name=>'DPRTMNTO_R'
,p_display_order=>90
,p_column_identifier=>'X'
,p_column_label=>'Dprtmnto R'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19997078856014321)
,p_db_column_name=>'V_DSCRPCION_DPRTMNTO'
,p_display_order=>100
,p_column_identifier=>'Y'
,p_column_label=>'Departamento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19997187841014322)
,p_db_column_name=>'MNCPIO_R'
,p_display_order=>110
,p_column_identifier=>'Z'
,p_column_label=>'Mncpio R'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19997221845014323)
,p_db_column_name=>'V_DSCRPCION_MNCPIO'
,p_display_order=>120
,p_column_identifier=>'AA'
,p_column_label=>'Municipio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19997302844014324)
,p_db_column_name=>'DRCCION_R'
,p_display_order=>130
,p_column_identifier=>'AB'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19997481980014325)
,p_db_column_name=>'TLFNO_R'
,p_display_order=>140
,p_column_identifier=>'AC'
,p_column_label=>unistr('Tel\00E9fono')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19997534466014326)
,p_db_column_name=>'EMAIL_R'
,p_display_order=>150
,p_column_identifier=>'AD'
,p_column_label=>'Correo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(19997680806014327)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>160
,p_column_identifier=>'AE'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21553155426834503)
,p_db_column_name=>'TPO_RSPNSBLE'
,p_display_order=>170
,p_column_identifier=>'AF'
,p_column_label=>'Tpo Rspnsble'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33339776217989428)
,p_db_column_name=>'BTN_ELIMINAR'
,p_display_order=>180
,p_column_identifier=>'AG'
,p_column_label=>unistr('Acci\00F3n')
,p_column_link=>'f?p=&APP_ID.:56:&SESSION.:DELETE:&DEBUG.:RP:P56_SEQ_ID,P56_SJTO_RSPNSBLE:#SEQ_ID#,#ID_SJTO_RSPNSBLE#'
,p_column_linktext=>'#BTN_ELIMINAR#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33339979656989430)
,p_db_column_name=>'INDCDOR'
,p_display_order=>190
,p_column_identifier=>'AH'
,p_column_label=>'Indcdor'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(55424776152788403)
,p_db_column_name=>'ID_SJTO_RSPNSBLE'
,p_display_order=>200
,p_column_identifier=>'AI'
,p_column_label=>'Id Sjto Rspnsble'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(19894018870583217)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'198941'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'V_DSCRPCION_IDNTFCCION:IDNTFCCION_R:PRMER_NMBRE_R:SGNDO_NMBRE_R:PRMER_APLLDO_R:SGNDO_APELLIDO_R:V_DSCRPCION_DPRTMNTO:V_DSCRPCION_MNCPIO:DRCCION_R:TLFNO_R:EMAIL_R:PRNCPAL:BTN_ELIMINAR:'
,p_sort_column_1=>'IDNTFCCION_R'
,p_sort_direction_1=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33925282103699018)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
 p_id=>wwv_flow_api.id(83140041339992491)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
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
'Funcionalidad que permite: <br><br>',
'<i>',
'',
unistr('Registrar y modificar Sujeto Impuesto tipo persona \00F3 establecimiento. <br><br>'),
'Registrar y modificar responsables si la naturaleza es Juridica. <br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario. <br><br>'),
'',
'',
'',
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(20244140206376510)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(33925282103699018)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&P56_APPLCCION.:&P56_PGNA.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14295988165157923)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(33925282103699018)
,p_button_name=>'BTN_GRDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(33337566987989406)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(33925282103699018)
,p_button_name=>'BTN_AGRGAR_RSPNSBLE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Agregar Responsable'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(22269688173414001)
,p_branch_name=>'Direccionamiento '
,p_branch_action=>'f?p=&P56_APPLCCION.:&P56_PGNA.:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(14295988165157923)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(39666876682126701)
,p_branch_name=>'Abrir modal'
,p_branch_action=>'f?p=&APP_ID.:97:&SESSION.::&DEBUG.:RP,97::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13461415025436402)
,p_name=>'P56_ID_SJTO_RSPNSBLE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(14293946346157903)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13461616246436404)
,p_name=>'P56_SJTO_RSPNSBLE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(14293946346157903)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14294053641157904)
,p_name=>'P56_IMPSTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_prompt=>'Impuesto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO_X_TIPO_SUJETO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'  and b.cdgo_sjto_tpo = ''E''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14294211997157906)
,p_name=>'P56_DPRTMNTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_prompt=>'Departamento'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_dprtmnto as d,',
'        a.id_dprtmnto as r',
'from df_s_departamentos a;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14294366302157907)
,p_name=>'P56_MNCPIO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_mncpio as d,',
'        a.id_mncpio as r',
'from df_s_municipios a',
'where a.id_dprtmnto = :P56_DPRTMNTO;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P56_DPRTMNTO'
,p_ajax_items_to_submit=>'P56_MNCPIO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14294483156157908)
,p_name=>'P56_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P56_SJTO_IMPSTO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14294590353157909)
,p_name=>'P56_DRCCION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumeroEspacio'');" onkeyup="campoMayuscula(this)"'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14294686370157910)
,p_name=>'P56_TLFNO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14294764522157911)
,p_name=>'P56_EMAIL'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_prompt=>'Correo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14294875863157912)
,p_name=>'P56_TPO_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion_idntfccion_tpo as d,',
'        a.cdgo_idntfccion_tpo as r',
'from df_s_identificaciones_tipo a',
'order by a.dscrpcion_idntfccion_tpo; '))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14294976686157913)
,p_name=>'P56_TPO_RGMEN'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_prompt=>'Tipo Regimen'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.nmbre_sjto_tpo as d,',
'       s.id_sjto_tpo as r',
'from df_i_sujetos_tipo s',
'where s.id_impsto = :P56_IMPSTO',
'and s.cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P56_IMPSTO'
,p_ajax_items_to_submit=>'P56_TPO_RGMEN'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14295002247157914)
,p_name=>'P56_TPO_PRSNA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_item_default=>'N'
,p_prompt=>'Tipo de persona'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Natural;N,Juridica;J'
,p_read_only_when=>'P56_SJTO_IMPSTO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14295108125157915)
,p_name=>'P56_PRMER_NMBRE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14295249665157916)
,p_name=>'P56_SGNDO_NMBRE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14295355109157917)
,p_name=>'P56_PRMER_APLLDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14295449196157918)
,p_name=>'P56_SGNDO_APLLDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letra'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14298409980157948)
,p_name=>'P56_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(14293946346157903)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14513051918809602)
,p_name=>'P56_SJTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(14293946346157903)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19639882113550802)
,p_name=>'P56_RZON_SCIAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_prompt=>unistr('Raz\00F3n Social')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumeroEspacio'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19640111608550805)
,p_name=>'P56_NMRO_RGSTRO_CMRA_CMRCIO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_prompt=>'Camara de Comercio'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'');"'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19640218557550806)
,p_name=>'P56_FCHA_RGSTRO_CMRA_CMRCIO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'nvl(:P56_FCHA_RGSTRO_CMRA_CMRCIO, sysdate)',
''))
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Camara Comercio'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19640383299550807)
,p_name=>'P56_FCHA_INCIO_ACTVDDES'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_item_default=>'nvl(:P56_FCHA_INCIO_ACTVDDES, sysdate)'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha inicio Actividades'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19640497893550808)
,p_name=>'P56_NMRO_SCRSLES'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_prompt=>'N.  Sucursales'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(19640568667550809)
,p_name=>'P56_DRCCION_CMRA_CMRCIO'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_prompt=>unistr('Direcci\00F3n Camara Comercio')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumeroEspacio'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20243898805376507)
,p_name=>'P56_SEQ_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(14293946346157903)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20463250484969001)
,p_name=>'P56_PGNA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(14293946346157903)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(20508496518041503)
,p_name=>'P56_APPLCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(14293946346157903)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22028879950543706)
,p_name=>'P56_TPO_PRSNA_OCULTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(14293946346157903)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33338329936989414)
,p_name=>'P56_REQUEST'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(14293946346157903)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56870516610917401)
,p_name=>'P56_ID_SJTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(14293946346157903)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57955050987370201)
,p_name=>'P56_ID_ACTVDAD_ECNMCA'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(14295681861157920)
,p_prompt=>unistr('Actividad Econ\00F3mica')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select  a.dscrpcion  as d,',
'        a.id_dclrcns_esqma_trfa      as r ',
'from    gi_d_dclrcns_esqma_trfa     a',
'join    gi_d_dclrcns_esqma_trfa_tpo b   on  b.id_dclrcns_esqma_trfa_tpo =   a.id_dclrcns_esqma_trfa_tpo',
'where   b.cdgo_clnte                =   :F_CDGO_CLNTE',
'      and b.cdgo_dclrcns_esqma_trfa_tpo in (''1'',''2'',''3'',''4'')',
'order by  a.cdgo_dclrcns_esqma_trfa',
'',
'/*',
'select dscrpcion as d,',
'       id_actvdad_ecnmca as r',
'from gi_d_actividades_economica;',
'*/'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19998066970014331)
,p_validation_name=>unistr('Valida Campo tipo identificaci\00F3n')
,p_validation_sequence=>10
,p_validation=>'P56_TPO_IDNTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(14295988165157923)
,p_associated_item=>wwv_flow_api.id(14294875863157912)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19998145045014332)
,p_validation_name=>unistr('Valida campo identificaci\00F3n')
,p_validation_sequence=>20
,p_validation=>'P56_IDNTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(14295988165157923)
,p_associated_item=>wwv_flow_api.id(14294483156157908)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19998285178014333)
,p_validation_name=>unistr('Valida raz\00F3n social')
,p_validation_sequence=>30
,p_validation=>'P56_RZON_SCIAL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'P56_TPO_PRSNA_OCULTO'
,p_validation_condition2=>'J'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(14295988165157923)
,p_associated_item=>wwv_flow_api.id(19639882113550802)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19998355846014334)
,p_validation_name=>'Valida primer nombre'
,p_validation_sequence=>40
,p_validation=>'P56_PRMER_NMBRE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'P56_TPO_PRSNA'
,p_validation_condition2=>'N'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(14295988165157923)
,p_associated_item=>wwv_flow_api.id(14295108125157915)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19998494158014335)
,p_validation_name=>'Valida campo primer apellido'
,p_validation_sequence=>50
,p_validation=>'P56_PRMER_APLLDO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition=>'P56_TPO_PRSNA'
,p_validation_condition2=>'N'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(14295988165157923)
,p_associated_item=>wwv_flow_api.id(14295355109157917)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19998551801014336)
,p_validation_name=>'Valida impuesto'
,p_validation_sequence=>60
,p_validation=>'P56_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(14295988165157923)
,p_associated_item=>wwv_flow_api.id(14294053641157904)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19998678291014337)
,p_validation_name=>'Valida campo departamento'
,p_validation_sequence=>70
,p_validation=>'P56_DPRTMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(14295988165157923)
,p_associated_item=>wwv_flow_api.id(14294211997157906)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19998700827014338)
,p_validation_name=>'Valida campo municipio'
,p_validation_sequence=>80
,p_validation=>'P56_MNCPIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(14295988165157923)
,p_associated_item=>wwv_flow_api.id(14294366302157907)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19998842275014339)
,p_validation_name=>unistr('Valida campo direcci\00F3n')
,p_validation_sequence=>90
,p_validation=>'P56_DRCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(14295988165157923)
,p_associated_item=>wwv_flow_api.id(14294590353157909)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19998960190014340)
,p_validation_name=>'Valida campo tipo regimen'
,p_validation_sequence=>100
,p_validation=>'P56_TPO_RGMEN'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(14295988165157923)
,p_associated_item=>wwv_flow_api.id(14294976686157913)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19999017263014341)
,p_validation_name=>'Valida campo numero registro'
,p_validation_sequence=>110
,p_validation=>'P56_NMRO_RGSTRO_CMRA_CMRCIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(14295988165157923)
,p_associated_item=>wwv_flow_api.id(19640111608550805)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(19999122937014342)
,p_validation_name=>unistr('Valida campo fecha c\00E1mara comercio ')
,p_validation_sequence=>120
,p_validation=>'P56_FCHA_RGSTRO_CMRA_CMRCIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vaci\00F3, por favor verifique')
,p_validation_condition_type=>'NEVER'
,p_when_button_pressed=>wwv_flow_api.id(14295988165157923)
,p_associated_item=>wwv_flow_api.id(19640218557550806)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(21447263230552601)
,p_validation_name=>'Valida correo'
,p_validation_sequence=>270
,p_validation=>'regexp_like (:P56_EMAIL, ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'Ingrese un correo valido.'
,p_associated_item=>wwv_flow_api.id(14294764522157911)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21553444854834506)
,p_name=>unistr('Al cambiar la identificaci\00F3n')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P56_IDNTFCCION_R'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21553544630834507)
,p_event_id=>wwv_flow_api.id(21553444854834506)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(22269719995414002)
,p_name=>'Al cambiar'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P56_TPO_PRSNA'
,p_condition_element=>'P56_TPO_PRSNA'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'J'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14296539672157929)
,p_event_id=>wwv_flow_api.id(22269719995414002)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P56_TPO_RGMEN,P56_RZON_SCIAL,P56_NMRO_RGSTRO_CMRA_CMRCIO,P56_FCHA_RGSTRO_CMRA_CMRCIO,P56_FCHA_INCIO_ACTVDDES,P56_NMRO_SCRSLES,P56_DRCCION_CMRA_CMRCIO,P56_ID_ACTVDAD_ECNMCA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14296637590157930)
,p_event_id=>wwv_flow_api.id(22269719995414002)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P56_TPO_RGMEN,P56_RZON_SCIAL,P56_FCHA_INCIO_ACTVDDES,P56_NMRO_RGSTRO_CMRA_CMRCIO,P56_FCHA_RGSTRO_CMRA_CMRCIO,P56_NMRO_SCRSLES,P56_DRCCION_CMRA_CMRCIO,P56_ID_ACTVDAD_ECNMCA'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19639908545550803)
,p_event_id=>wwv_flow_api.id(22269719995414002)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P56_PRMER_NMBRE,P56_SGNDO_NMBRE,P56_PRMER_APLLDO,P56_SGNDO_APLLDO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19640035170550804)
,p_event_id=>wwv_flow_api.id(22269719995414002)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P56_PRMER_NMBRE,P56_SGNDO_NMBRE,P56_PRMER_APLLDO,P56_SGNDO_APLLDO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19997967557014330)
,p_event_id=>wwv_flow_api.id(22269719995414002)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(19643083071550834)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19997858526014329)
,p_event_id=>wwv_flow_api.id(22269719995414002)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(19643083071550834)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33339679502989427)
,p_event_id=>wwv_flow_api.id(22269719995414002)
,p_event_result=>'FALSE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(33337566987989406)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33339519597989426)
,p_event_id=>wwv_flow_api.id(22269719995414002)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(33337566987989406)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(33339223226989423)
,p_name=>unistr('Al Cambiar Fecha registro c\00E1mara de comercio ')
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P56_FCHA_RGSTRO_CMRA_CMRCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33339393825989424)
,p_event_id=>wwv_flow_api.id(33339223226989423)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P56_FCHA_INCIO_ACTVDDES").datepicker( ''option'' , ''minDate'' , $("#P56_FCHA_RGSTRO_CMRA_CMRCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13622179216830440)
,p_name=>'Capturar el evento close de la modal de responsable'
,p_event_sequence=>50
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13622244935830441)
,p_event_id=>wwv_flow_api.id(13622179216830440)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(19643083071550834)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14298512206157949)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Persona Natural'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_sjto,',
'       a.idntfccion,',
'       a.drccion,',
'       d.tpo_prsna,',
'       d.cdgo_idntfccion_tpo,',
'       c.prmer_nmbre,',
'       c.sgndo_nmbre,',
'       c.prmer_aplldo,',
'       c.sgndo_aplldo,',
'       b.tlfno,',
'       b.email,',
'       b.id_impsto,',
'       b.id_dprtmnto_ntfccion,',
'       b.id_mncpio_ntfccion,',
'       d.id_sjto_tpo,',
'       c.id_sjto_rspnsble',
'into   :P56_ID_SJTO,',
'       :P56_IDNTFCCION,',
'	   :P56_DRCCION,',
'	   :P56_TPO_PRSNA,',
'	   :P56_TPO_IDNTFCCION,',
'	   :P56_PRMER_NMBRE,',
'       :P56_SGNDO_NMBRE,',
'       :P56_PRMER_APLLDO,',
'       :P56_SGNDO_APLLDO,',
'	   :P56_TLFNO,',
'	   :P56_EMAIL,',
'	   :P56_IMPSTO,',
'       :P56_DPRTMNTO,',
'       :P56_MNCPIO,',
'	   :P56_TPO_RGMEN,',
'       :P56_ID_SJTO_RSPNSBLE',
'from si_c_sujetos      a',
'join si_i_sujetos_impuesto      b on a.id_sjto = b.id_sjto ',
'join df_c_impuestos             c on b.id_impsto = c.id_impsto',
'join si_i_personas              d on b.id_sjto_impsto = d.id_sjto_impsto',
'join si_i_sujetos_responsable   c on b.id_sjto_impsto = c.id_sjto_impsto',
'where b.id_sjto_impsto = :P56_SJTO_IMPSTO',
'and d.tpo_prsna = :P56_TPO_PRSNA_OCULTO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P56_TPO_PRSNA_OCULTO'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19642741884550831)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Crea coleccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''RESPONSABLES'');',
'End;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'NUEVO'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(22269987430414004)
,p_process_sequence=>60
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Persona Juridica'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_sjto,',
'        d.tpo_prsna,',
'        d.cdgo_idntfccion_tpo,',
'        a.idntfccion,',
'        d.nmbre_rzon_scial,',
'        b.id_impsto,',
'        b.id_dprtmnto_ntfccion,',
'        b.id_mncpio_ntfccion,',
'        a.drccion,',
'        b.tlfno,',
'        b.email,',
'        d.id_sjto_tpo,',
'        d.nmro_rgstro_cmra_cmrcio,',
'        to_char(d.fcha_rgstro_cmra_cmrcio, ''dd/mm/yyyy''),',
'        to_char(d.fcha_incio_actvddes, ''dd/mm/yyyy''),',
'        d.nmro_scrsles,',
'        nvl(d.drccion_cmra_cmrcio, a.drccion),',
'        e.id_actvdad_ecnmca',
'into   :P56_ID_SJTO,',
'       :P56_TPO_PRSNA,',
'	   :P56_TPO_IDNTFCCION,',
'	   :P56_IDNTFCCION,',
'	   :P56_RZON_SCIAL,',
'       :P56_IMPSTO,',
'       :P56_DPRTMNTO,',
'       :P56_MNCPIO,',
'       :P56_DRCCION,',
'	   :P56_TLFNO,',
'	   :P56_EMAIL,',
'       :P56_TPO_RGMEN,',
'       :P56_NMRO_RGSTRO_CMRA_CMRCIO,',
'       :P56_FCHA_RGSTRO_CMRA_CMRCIO,',
'       :P56_FCHA_INCIO_ACTVDDES,',
'       :P56_NMRO_SCRSLES,',
'       :P56_DRCCION_CMRA_CMRCIO,',
'       :P56_ID_ACTVDAD_ECNMCA',
'from si_c_sujetos               a',
'join si_i_sujetos_impuesto      b on a.id_sjto           =   b.id_sjto ',
'join df_c_impuestos             c on b.id_impsto         =   c.id_impsto',
'join si_i_personas              d on b.id_sjto_impsto    =   d.id_sjto_impsto',
'left join gi_d_actividades_economica e on d.id_actvdad_ecnmca = e.id_actvdad_ecnmca',
'where b.id_sjto_impsto  =   :P56_SJTO_IMPSTO',
'and d.tpo_prsna =   :P56_TPO_PRSNA_OCULTO;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'(:P56_TPO_PRSNA_OCULTO = ''J'' and :P56_REQUEST is null)'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(33339853063989429)
,p_process_sequence=>70
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Elimina registro de la colecci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
unistr('    --Elimina el registro de la colleci\00F3n'),
'    begin',
'        APEX_COLLECTION.DELETE_MEMBER(',
'        p_collection_name => ''RESPONSABLES'',',
'        p_seq => :P56_SEQ_ID);',
'    end;',
'    ',
'    --elimina el sujeto responsable',
'    begin',
'        delete from si_i_sujetos_responsable',
'        where id_sjto_rspnsble = :P56_SJTO_RSPNSBLE;',
'    end;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(33337005326989401)
,p_process_sequence=>80
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Responsables'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''RESPONSABLES'');',
'    ',
'    for c_rspnsbles in (select  a.prncpal_s_n,',
'                                a.cdgo_idntfccion_tpo,',
'                                a.dscrpcion_idntfccion_tpo,',
'                                a.idntfccion_rspnsble,    ',
'                                a.prmer_nmbre,',
'                                a.sgndo_nmbre,',
'                                a.prmer_aplldo,',
'                                a.sgndo_aplldo,',
'                                a.id_dprtmnto,      ',
'                                a.nmbre_dprtmnto,',
'                                a.id_mncpio,',
'                                a.nmbre_mncpio,',
'                                a.drccion,',
'                                b.tlfno,',
'                                b.email,',
'                                a.cdgo_tpo_rspnsble,',
'                                a.id_sjto_rspnsble,',
'                                a.actvo',
'                        from v_si_i_sujetos_responsable a',
'                        left join si_c_terceros              b   on  a.idntfccion_rspnsble   =   b.idntfccion and a.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'                        where id_sjto_impsto = :P56_SJTO_IMPSTO',
'                        and b.cdgo_clnte = :F_CDGO_CLNTE) loop',
'    ',
'        APEX_COLLECTION.ADD_MEMBER(p_collection_name => ''RESPONSABLES'',',
'                                       p_c001    =>  c_rspnsbles.prncpal_s_n,',
'                                       p_c002    =>  c_rspnsbles.cdgo_idntfccion_tpo,',
'                                       p_c003    =>  c_rspnsbles.dscrpcion_idntfccion_tpo,',
'                                       p_c004    =>  c_rspnsbles.idntfccion_rspnsble,',
'                                       p_c005    =>  c_rspnsbles.prmer_nmbre,',
'                                       p_c006    =>  c_rspnsbles.sgndo_nmbre,',
'                                       p_c007    =>  c_rspnsbles.prmer_aplldo,',
'                                       p_c008    =>  c_rspnsbles.sgndo_aplldo,',
'                                       p_c009    =>  c_rspnsbles.id_dprtmnto,',
'                                       p_c010    =>  c_rspnsbles.nmbre_dprtmnto,',
'                                       p_c011    =>  c_rspnsbles.id_mncpio,',
'                                       p_c012    =>  c_rspnsbles.nmbre_mncpio,',
'                                       p_c013    =>  c_rspnsbles.drccion,',
'                                       p_c014    =>  c_rspnsbles.tlfno,',
'                                       p_c015    =>  c_rspnsbles.email,',
'                                       p_c016    =>  c_rspnsbles.cdgo_tpo_rspnsble,',
'                                       p_c018    =>  c_rspnsbles.id_sjto_rspnsble,',
'                                       p_c019    =>  c_rspnsbles.actvo);',
'                    ',
'    end loop;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'(:P56_TPO_PRSNA_OCULTO = ''J'' and :P56_REQUEST is null) 	'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14296774964157931)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guarda Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rpsta  number;',
'    v_sjto_impsto number;',
'    v_mnsje_rspsta varchar2(200);',
'    v_json clob;',
'',
'begin',
'',
'    select json_object(''cdgo_clnte''     		    value :F_CDGO_CLNTE,',
'                       ''id_sjto''                    value :P56_ID_SJTO,',
'                       ''id_sjto_impsto''             value :P56_SJTO_IMPSTO,',
'                       ''idntfccion''					value :P56_IDNTFCCION,',
'				       ''id_dprtmnto''				value :P56_DPRTMNTO,',
'				       ''id_mncpio''					value :P56_MNCPIO,',
'				       ''drccion''					value :P56_DRCCION,	--Sujeto',
'				       ''id_impsto''					value :P56_IMPSTO,',
'				       ''id_dprtmnto_ntfccion''		value :P56_DPRTMNTO,',
'				       ''id_mncpio_ntfccion''			value :P56_MNCPIO,',
'				       ''drccion_ntfccion''			value :P56_DRCCION,',
'				       ''email''						value :P56_EMAIL,',
'				       ''tlfno''						value :P56_TLFNO,',
'				       ''id_usrio''					value :F_ID_USRIO,	--Sujeto Impuesto',
'				       ''cdgo_idntfccion_tpo''		value :P56_TPO_IDNTFCCION,',
'				       ''tpo_prsna''					value :P56_TPO_PRSNA,',
'				       ''prmer_nmbre''				value :P56_PRMER_NMBRE,',
'                       ''sgndo_nmbre''                value :P56_SGNDO_NMBRE,',
'				       ''prmer_aplldo''				value :P56_PRMER_APLLDO,',
'				       ''sgndo_aplldo''               value :P56_SGNDO_APLLDO,',
'                       ''nmbre_rzon_scial''			value :P56_RZON_SCIAL,',
'				       ''nmro_rgstro_cmra_cmrcio''	value :P56_NMRO_RGSTRO_CMRA_CMRCIO,',
'				       ''fcha_rgstro_cmra_cmrcio''	value :P56_FCHA_RGSTRO_CMRA_CMRCIO,',
'				       ''fcha_incio_actvddes''		value :P56_FCHA_INCIO_ACTVDDES,',
'				       ''nmro_scrsles''				value :P56_NMRO_SCRSLES,',
'                       ''drccion_cmra_cmrcio''        value :P56_DRCCION_CMRA_CMRCIO,',
'				       ''id_sjto_tpo''				value :P56_TPO_RGMEN,	',
'                       ''id_actvdad_ecnmca''			value :P56_ID_ACTVDAD_ECNMCA,	--persona',
'				       ''rspnsble''    				value decode(:P56_TPO_PRSNA, ''J'', (select json_arrayagg(json_object(''cdgo_clnte''     		value   :F_CDGO_CLNTE,',
'                                                                                                                        ''id_sjto_impsto''        value   :P56_SJTO_IMPSTO,',
'                                                                                                                        ''cdgo_idntfccion_tpo''   value   p.c002,',
'																						                                ''idntfccion''            value   p.c004,',
'																						                                ''prmer_nmbre''           value   p.c005,',
'																						                                ''sgndo_nmbre''      	    value   p.c006,',
'																						                                ''prmer_aplldo''          value   p.c007,',
'																						                                ''sgndo_aplldo''          value   p.c008,',
'																						                                ''prncpal''      	        value   p.c001,',
'																						                                ''cdgo_tpo_rspnsble''     value   p.c016,',
'																						                                ''id_dprtmnto_ntfccion''  value   p.c009,',
'																						                                ''id_mncpio_ntfccion''    value   p.c011,',
'																						                                ''drccion_ntfccion''      value   p.c013,',
'																						                                ''email''           	    value   p.c015,',
'																						                                ''tlfno''          	    value   p.c014,',
'																						                                ''cllar''      		    value   p.c014,',
'                                                                                                                        ''actvo''                 value   p.c019,',
'                                                                                                                        ''id_sjto_rspnsble''      value   p.c018 returning clob)returning clob)',
'                                                                                 from APEX_collections p',
'														                            where collection_name = ''RESPONSABLES''),',
'                                                             ',
'                                                                             (select json_arrayagg(json_object(''cdgo_clnte''     	   value   :F_CDGO_CLNTE,',
'                                                                                                               ''id_sjto_impsto''        value   :P56_SJTO_IMPSTO,',
'                                                                                                               ''cdgo_idntfccion_tpo''   value   :P56_TPO_IDNTFCCION,',
'																						                       ''idntfccion''            value   :P56_IDNTFCCION,',
'																						                       ''prmer_nmbre''           value   :P56_PRMER_NMBRE,',
'																						                       ''sgndo_nmbre''      	   value   :P56_SGNDO_NMBRE,',
'																						                       ''prmer_aplldo''          value   :P56_PRMER_APLLDO,',
'																						                       ''sgndo_aplldo''          value   :P56_SGNDO_APLLDO,',
'																						                       ''prncpal''      	       value   ''S'',',
'																						                       ''cdgo_tpo_rspnsble''     value   ''L'',',
'																						                       ''id_dprtmnto_ntfccion''  value   :P56_DPRTMNTO,',
'																						                       ''id_mncpio_ntfccion''    value   :P56_MNCPIO,',
'																						                       ''drccion_ntfccion''      value   :P56_DRCCION,',
'																						                       ''email''           	   value   :P56_EMAIL,',
'																						                       ''tlfno''          	   value   :P56_TLFNO,',
'																						                       ''cllar''      		   value   :P56_TLFNO,',
'                                                                                                               ''actvo''                 value   ''S'',',
'                                                                                                               ''id_sjto_rspnsble''      value   :P56_ID_SJTO_RSPNSBLE)returning clob)',
'                                                                                 from dual)',
'                                                            ) ',
'    returning clob',
'                      )',
'    into v_json',
'    from dual;',
'    ',
'        pkg_si_sujeto_impuesto.prc_rg_general_sujeto_impuesto(p_json            =>  v_json,',
'                                                              o_sjto_impsto     =>  v_sjto_impsto,',
'                                                              o_cdgo_rspsta     =>  v_cdgo_rpsta,',
'                                                              o_mnsje_rspsta    =>  v_mnsje_rspsta);',
'                                             ',
'        if(v_cdgo_rpsta != 0)then',
'            raise_application_error(-20001, v_mnsje_rspsta);',
'        end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(14295988165157923)
,p_process_success_message=>unistr('Operaci\00F3n realizada con exito')
);
end;
/
