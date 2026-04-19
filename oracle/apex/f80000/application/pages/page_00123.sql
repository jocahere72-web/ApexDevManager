prompt --application/pages/page_00123
begin
wwv_flow_api.create_page(
 p_id=>123
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Documentos_Desembargo'
,p_step_title=>'Documentos_Desembargo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'KGONZALEZ'
,p_last_upd_yyyymmddhh24miss=>'20250910150322'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104572513004330479)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <b>',
'        <center>Opciones ',
'            <i class="fa fa-gears" aria-hidden="true"></i>',
'        </center>',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104575228789330506)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'',
'<p>Esta funcionalidad permite gestionar los documentos de cada una de las etpas del proceso juridico de cobro.</p>',
'<p> </p>',
'<p> </p>',
'<p><b>Nota:</b> Solo se visualizara la opcion de seleccionar la plantilla cuando no exista el documento.</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104618037292079653)
,p_plug_name=>'Documentos'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55337827758448243)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(104572513004330479)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55338102501448243)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(104572513004330479)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar o Aplicar <br> Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P123_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55338521152448244)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(104572513004330479)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55338980820448248)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(104572513004330479)
,p_button_name=>'BTN_IMPRMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55339361797448248)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(104572513004330479)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P123_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55339797642448248)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(104572513004330479)
,p_button_name=>'BTN_OBSVCION_RVRSA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Observaciones al <br>reversar estados'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:RP,43:P43_ID_PRCSOS_JRDCO_DCMNTO:&P123_ID_PRCSOS_JRDCO_DCMNTO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from (',
'select a.fcha_rgstro,e.dscrpcion,a.obsrvcion',
'from cb_g_prcsos_jrdc_dcmnt_estd a',
'left join wf_d_flujos_tarea_estado e on a.id_fljo_trea_estdo = e.id_fljo_trea_estdo',
'where a.obsrvcion is not null',
'and a.id_prcsos_jrdco_dcmnto = :p123_id_prcsos_jrdco_dcmnto',
'order by a.id_prcsos_jrdco_dcmnto_estdo desc) a;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-clipboard-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7739101494147511)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(104572513004330479)
,p_button_name=>'BTN_PRCSAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Finalizacion de procesos'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from cb_g_prcsos_jrdc_dcmnt_plnt a',
'join cb_g_procesos_jrdco_dcmnto b on a.id_prcsos_jrdco_dcmnto = b.id_prcsos_jrdco_dcmnto',
'where a.id_prcsos_jrdco_dcmnto = :P123_ID_PRCSOS_JRDCO_DCMNTO',
'and a.dcmnto is not null',
'and b.Actvo = ''S''',
'and :P123_TIPO_DCMNTO = ''J'';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55340743778448253)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_api.id(104618037292079653)
,p_button_name=>'BTN_GNRAR_DCMNTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Documento'
,p_button_position=>'BODY'
,p_button_condition=>'P123_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(55346884359448289)
,p_branch_name=>'Go To Page 123'
,p_branch_action=>'f?p=&APP_ID.:123:&SESSION.::&DEBUG.:RP,123:P123_BRANCH,P123_NOMBRE_ETPA,P123_IDNTFCCION,P123_CDGO_EMBRGO,P123_ID_DSMBRGOS_RSLCION,P123_ID_DSMBRGO_OFCIO,P123_ID_TPOS_MDDA_CTLAR,P123_TIPO_DCMNTO,P123_ID_EMBRGOS_CRTRA,P123_ID_PLNTLLA_1,P123_ID_PRCSOS_JRDCO,P123_ID_INSTNCIA_FLJO,P123_ID_PRCSOS_JRDCO_DCMNTO,P123_ID_FLJO_TREA,P123_ID_ACTO_TPO,P123_ID_ACTO,P123_NMRO_ACTO,P123_FCHA:&P123_BRANCH.,&P123_NOMBRE_ETPA.,&P123_IDNTFCCION.,&P123_CDGO_EMBRGO.,&P123_ID_DSMBRGOS_RSLCION.,&P123_ID_DSMBRGO_OFCIO.,&P123_ID_TPOS_MDDA_CTLAR.,&P123_TIPO_DCMNTO.,&P123_ID_EMBRGOS_CRTRA.,&P123_ID_PLNTLLA_1.,&P123_ID_PRCSOS_JRDCO.,&P123_ID_INSTNCIA_FLJO.,&P123_ID_PRCSOS_JRDCO_DCMNTO.,&P123_ID_FLJO_TREA.,&P123_ID_ACTO_TPO.,&P123_ID_ACTO.,&P123_NMRO_ACTO.,&P123_FCHA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(55339361797448248)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(55347211179448291)
,p_branch_name=>'Go To Page 2'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP,2:P2_ID_RPRTE,P2_XML:19,<data> 	<id_prcsos_jrdco_dcmnto>&P123_ID_PRCSOS_JRDCO_DCMNTO.</id_prcsos_jrdco_dcmnto> 	<id_prcsos_jrdco>&P123_ID_PRCSOS_JRDCO.</id_prcsos_jrdco> 	<funcion>pkg_cb_proceso_juridico.prc_ac_acto(p_file_blob => Ã‚Â¡file_blob ! p_id_acto => &P123_ID_ACTO.)</funcion> </data>&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(55338980820448248)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(13544613971442109)
,p_branch_name=>'Regresar'
,p_branch_action=>'f?p=&APP_ID.:&P123_BRANCH.:&SESSION.::&DEBUG.:RP,123::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(55337827758448243)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7739307614147513)
,p_branch_name=>'Regresar'
,p_branch_action=>'f?p=&APP_ID.:&P123_BRANCH.:&SESSION.::&DEBUG.:RP,123::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(7739101494147511)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6456383189497901)
,p_name=>'P123_ID_CSLES_DSMBRGO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7739439006147514)
,p_name=>'P123_FCHA'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7739538219147515)
,p_name=>'P123_NMRO_ACTO'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7739642538147516)
,p_name=>'P123_ID_ACTO'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13543932951442102)
,p_name=>'P123_ID_PRCSOS_JRDCO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13544152533442104)
,p_name=>'P123_ID_INSTNCIA_FLJO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13544234496442105)
,p_name=>'P123_ID_FLJO_TREA'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct first_value(a.id_fljo_trea_dstno) over (order by a.orden desc) ultimo',
'            from wf_d_flujos_transicion a',
'            join wf_g_instancias_flujo b on b.id_fljo = a.id_fljo',
'            where b.id_instncia_fljo = :P123_ID_INSTNCIA_FLJO;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13544394791442106)
,p_name=>'P123_ID_PLNTLLA_1'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_plntlla',
'  from gn_d_plantillas',
' where id_acto_tpo = :P123_ID_ACTO_TPO'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Plantilla'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,',
'       id_plntlla',
'  from gn_d_plantillas',
' where id_acto_tpo = :P123_ID_ACTO_TPO'))
,p_cHeight=>1
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_display_when=>'P123_TIPO_DCMNTO'
,p_display_when2=>'J'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when=>'P123_DCMNTO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13544471364442107)
,p_name=>'P123_ID_ACTO_TPO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13544505179442108)
,p_name=>'P123_ID_PRCSOS_JRDCO_DCMNTO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55341175704448253)
,p_name=>'P123_NOMBRE_ETPA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_prompt=>'<b>Etapa</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55341510464448259)
,p_name=>'P123_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_prompt=>'<b>Sujeto:</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55341937629448259)
,p_name=>'P123_CDGO_EMBRGO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55342371726448259)
,p_name=>'P123_ID_DSMBRGOS_RSLCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55342704380448260)
,p_name=>'P123_ID_DSMBRGO_OFCIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55343165388448260)
,p_name=>'P123_ID_TPOS_MDDA_CTLAR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55343567037448261)
,p_name=>'P123_TIPO_DCMNTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55343996318448265)
,p_name=>'P123_ID_PLNTLLA'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_prompt=>'Plantilla'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion,a.id_plntlla',
'from gn_d_plantillas a',
'inner join mc_d_tipos_mdda_ctlr_dcmnto b on b.id_plntlla = a.id_plntlla',
'inner join mc_d_tipos_mdda_ctlar c on c.id_tpos_mdda_ctlar = b.id_tpos_mdda_ctlar',
'and c.id_tpos_mdda_ctlar = :P123_ID_TPOS_MDDA_CTLAR',
'where /*a.tpo_plntlla = :P67_TPO_PLNTLLA',
'and*/ a.actvo = ''S''',
'and a.id_prcso = 24',
'and b.tpo_dcmnto = :P123_TIPO_DCMNTO --''R''',
'and b.clse_dcmnto = ''P''',
'and (b.ID_CSLES_DSMBRGO = :P123_ID_CSLES_DSMBRGO OR :P123_ID_CSLES_DSMBRGO IS NULL);'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_display_when=>'P123_TIPO_DCMNTO'
,p_display_when2=>'J'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_read_only_when=>'P123_DCMNTO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55344345163448266)
,p_name=>'P123_DCMNTO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_prompt=>'Documento'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (opt) {',
'    opt.skin = ''office2013,skins/office2013/'';',
'    opt.height = 400;',
'    opt.resize_enabled = false; ',
'    opt.enterMode = 2;	opt.removePlugins = ''contextmenu,liststyle,tabletools'';	return opt;',
'}'))
,p_attribute_02=>'Full'
,p_attribute_03=>'Y'
,p_attribute_04=>'kama'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55344726297448267)
,p_name=>'P123_BRANCH'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_item_default=>'118'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55345100900448267)
,p_name=>'P123_ID_EMBRGOS_CRTRA'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(104618037292079653)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55346321817448288)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if :P123_TIPO_DCMNTO = ''R'' then',
'    ',
'        select a.id_plntlla,',
'               a.dcmnto_dsmbrgo --,a.id_dsmbrgos_rslcion',
'          into :P123_ID_PLNTLLA,',
'               :P123_DCMNTO',
'          from mc_g_desembargos_resolucion a',
'         where a.id_dsmbrgos_rslcion = :P123_ID_DSMBRGOS_RSLCION',
'           and a.id_plntlla is not null;',
'           ',
'    elsif :P123_TIPO_DCMNTO = ''O'' then',
'',
'        select a.id_plntlla,',
'               a.dcmnto_dsmbrgo --,a.id_dsmbrgo_ofcio',
'          into :P123_ID_PLNTLLA,',
'               :P123_DCMNTO',
'          from mc_g_desembargos_oficio a',
'         where a.id_dsmbrgo_ofcio = :P123_ID_DSMBRGO_OFCIO',
'           and a.id_plntlla is not null;',
'           ',
'    elsif :P123_TIPO_DCMNTO = ''J'' then',
'    ',
'        select  b.id_plntlla, b.dcmnto, a.ID_PRCSOS_JRDCO_DCMNTO, a.nmro_acto, a.id_acto, a.fcha_acto',
'        into :P123_ID_PLNTLLA,',
'             :P123_DCMNTO,',
'             :P123_ID_PRCSOS_JRDCO_DCMNTO,',
'             :P123_NMRO_ACTO,',
'             :P123_ID_ACTO,',
'             :P123_FCHA',
'        from  cb_g_procesos_jrdco_dcmnto a ',
'        left join cb_g_prcsos_jrdc_dcmnt_plnt b on a.ID_PRCSOS_JRDCO_DCMNTO = b.ID_PRCSOS_JRDCO_DCMNTO',
'        where a.id_prcsos_jrdco = :P123_ID_PRCSOS_JRDCO',
'        and   a.id_acto_tpo     = :P123_ID_ACTO_TPO;',
'          ',
'    end if;',
'      ',
'exception when others then ',
'           null; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P123_DCMNTO'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55345586097448284)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_json_actos          clob;',
'v_mnsje               varchar2(2000);',
'v_cdgo_rspsta         number;',
'v_id_acto             number;',
'v_slct_sjto_impsto    varchar2(2000);',
'v_slct_rspnsble       varchar2(2000);',
'v_slct_vgncias        varchar2(2000);',
'v_cdgo_acto_tpo       varchar2(100);',
'v_fcha                date;',
'v_nmro_acto           number;',
'begin',
'    --:P123_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''<id_prcsos_jrdco>''|| :P123_ID_PRCSOS_JRDCO ||''</id_prcsos_jrdco><id_prcsos_jrdco_dcmnto>''|| :P123_ID_PRCSOS_JRDCO_DCMNTO ||''</id_prcsos_jrdco_dcmnto>'', :P123_ID_PLNTLLA);',
'    --''<id_embrgos_crtra>''|| embargos.id_embrgos_crtra ||''</id_embrgos_crtra><id_embrgos_rslcion>''|| embargos.id_embrgos_rslcion ||''</id_embrgos_rslcion><id_acto>''||v_id_acto||''</id_acto>''',
'    if :P123_TIPO_DCMNTO = ''R'' then',
'        --:P123_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''{"id_embrgos_crtra" : "''||:P123_ID_EMBRGOS_CRTRA||''","id_embrgos_rslcion" : "''||:P123_ID_EMBRGOS_RSLCION||''"}'', :P123_ID_PLNTLLA);',
'        :P123_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''<id_embrgos_crtra>''|| :P123_ID_EMBRGOS_CRTRA ||''</id_embrgos_crtra><id_dsmbrgos_rslcion>''|| :P123_ID_DSMBRGOS_RSLCION ||''</id_dsmbrgos_rslcion><id_acto>''||NULL||''</id_acto>'', :P123_ID_PLNTLL'
||'A);',
'    ',
'    elsif :P123_TIPO_DCMNTO = ''O'' then',
'     ',
'     --:P123_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''{"id_embrgos_crtra" : "''||:P123_ID_EMBRGOS_CRTRA||''","id_slctd_ofcio" : "''||:P123_ID_SLCTD_OFCIO||''"}'', :P123_ID_PLNTLLA);',
'        :P123_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''<id_embrgos_crtra>''|| :P123_ID_EMBRGOS_CRTRA ||''</id_embrgos_crtra><id_dsmbrgo_ofcio>''|| :P123_ID_DSMBRGO_OFCIO ||''</id_dsmbrgo_ofcio><id_acto>''||NULL||''</id_acto>'', :P123_ID_PLNTLLA);',
'   ',
'   elsif :P123_TIPO_DCMNTO = ''J'' then',
'              ',
'        --validamos que no el item P123_ID_PRCSOS_JRDCO_DCMNTO este nulo',
'        if :P123_ID_PRCSOS_JRDCO_DCMNTO is null then',
'                             ',
'            --insertamos el proceso juridico documento',
'            begin',
'                insert into cb_g_procesos_jrdco_dcmnto',
'                (id_prcsos_jrdco,',
'                 id_fljo_trea,',
'                 id_acto_tpo,',
'                 nmro_acto,',
'                 fcha_acto,',
'                 id_estdo_trea,',
'                 funcionario_firma,',
'                 id_acto,',
'                 actvo)',
'              values',
'                (:P123_ID_PRCSOS_JRDCO,',
'                 :P123_ID_FLJO_TREA,',
'                 :P123_ID_ACTO_TPO,',
'                 null,',
'                 null,',
'                 null,',
'                 :F_ID_FNCNRIO,',
'                 null,',
'                 ''S'')',
'              returning id_prcsos_jrdco_dcmnto into :P123_ID_PRCSOS_JRDCO_DCMNTO;',
'            end;',
'        end if;',
'        ',
'        ',
'        if :P123_ID_ACTO is null then',
'            begin',
'                select cdgo_acto_tpo',
'                into v_cdgo_acto_tpo',
'                from gn_d_actos_tipo',
'                where id_acto_tpo = :P123_ID_ACTO_TPO;',
'            exception',
'                when others then',
'                  v_mnsje := ''Error al consultar el tipo de acto :''|| :P123_ID_ACTO_TPO;',
'',
'                  raise_application_error(-20001, v_cdgo_rspsta || ''-'' || v_mnsje);',
'            end;',
'',
'',
'            begin',
'',
'                v_slct_sjto_impsto :=   '' select m.id_impsto_sbmpsto,m.id_sjto_impsto '' ||',
'                                        '' from CB_G_PROCESOS_JRDCO_MVMNTO m '' ||',
'                                        '' where m.estdo = '' || chr(39) || ''A'' ||',
'                                        chr(39) || '' and m.id_prcsos_jrdco = '' ||',
'                                        :P123_ID_PRCSOS_JRDCO ||',
'                                        '' group by m.id_impsto_sbmpsto,m.id_sjto_impsto'';',
'',
'                v_slct_rspnsble := '' select idntfccion, prmer_nmbre, sgndo_nmbre, prmer_aplldo, sgndo_aplldo,       '' ||',
'                                     '' cdgo_idntfccion_tpo, drccion_ntfccion, id_pais_ntfccion, id_mncpio_ntfccion,   '' ||',
'                                     '' id_dprtmnto_ntfccion, email, tlfno from cb_g_procesos_jrdco_rspnsble where id_prcsos_jrdco =         '' ||',
'                                     :P123_ID_PRCSOS_JRDCO;',
'',
'                v_slct_vgncias := '' select b.id_sjto_impsto , b.vgncia,b.id_prdo,sum(c.vlor_sldo_cptal) as vlor_cptal,sum(c.vlor_intres) as  vlor_intres'' ||',
'                                  '' from cb_g_procesos_jrdco_mvmnto b  '' ||',
'                                  '' join v_gf_g_cartera_x_concepto c on c.cdgo_clnte = b.cdgo_clnte '' ||',
'                                  '' and c.id_impsto = b.id_impsto '' ||',
'                                  '' and c.id_impsto_sbmpsto = b.id_impsto_sbmpsto '' ||',
'                                  '' and c.id_sjto_impsto = b.id_sjto_impsto '' ||',
'                                  '' and c.vgncia = b.vgncia '' ||',
'                                  '' and c.id_prdo = b.id_prdo '' ||',
'                                  '' and c.id_cncpto = b.id_cncpto '' ||',
'                                  '' and c.cdgo_mvmnto_orgn = b.cdgo_mvmnto_orgn '' ||',
'                                  '' and c.id_orgen = b.id_orgen '' ||',
'                                  '' and c.id_mvmnto_fncro = b.id_mvmnto_fncro '' ||',
'                                  '' where b.id_prcsos_jrdco = '' ||',
'                                    :P123_ID_PRCSOS_JRDCO || '' and b.estdo = '' ||',
'                                    chr(39) || ''A'' || chr(39) ||',
'                                  '' group by  b.id_sjto_impsto, b.vgncia, b.id_prdo''; ',
'',
'',
'                v_json_actos := pkg_gn_generalidades.fnc_cl_json_acto( p_cdgo_clnte       => :f_cdgo_clnte,',
'                                                                       p_cdgo_acto_orgen  => ''GCB'',',
'                                                                       p_id_orgen         => :P123_ID_PRCSOS_JRDCO_DCMNTO,',
'                                                                       p_id_undad_prdctra => :P123_ID_PRCSOS_JRDCO_DCMNTO,',
'                                                                       p_id_acto_tpo      => :P123_ID_ACTO_TPO,',
'                                                                       p_acto_vlor_ttal   => 0,',
'                                                                       p_cdgo_cnsctvo     => v_cdgo_acto_tpo,',
'                                                                       p_id_usrio         => :F_ID_USRIO,',
'                                                                       p_slct_sjto_impsto => v_slct_sjto_impsto,',
'                                                                       p_slct_vgncias     => v_slct_vgncias,',
'                                                                       p_slct_rspnsble    => v_slct_rspnsble); ',
'            end;',
'',
'            begin',
'                pkg_gn_generalidades.prc_rg_acto(p_cdgo_clnte   => :F_cdgo_clnte,',
'                                                 p_json_acto    => v_json_actos,',
'                                                 o_mnsje_rspsta => v_mnsje,',
'                                                 o_cdgo_rspsta  => v_cdgo_rspsta,',
'                                                 o_id_acto      => v_id_acto);    ',
'            exception',
'                when others then',
'                    v_mnsje := ''Error al registrar el acto :''|| v_cdgo_rspsta;',
'                    raise_application_error(-20001, v_cdgo_rspsta || ''-'' || v_mnsje);',
'            end;',
'',
'            -- extraemos los datos del numero del acto y fecha del acto',
'            begin',
'                select fcha, nmro_acto',
'                into v_fcha, v_nmro_acto',
'                from gn_g_actos',
'                where id_acto = v_id_acto;',
'            exception',
'                when others then',
unistr('                    v_mnsje := ''Error al consultar la informaci\00F3n del acto : '' ||v_id_acto;'),
'                    raise_application_error(-20001, v_cdgo_rspsta || ''-'' || v_mnsje);',
'            end;',
'',
'            /*:P123_ID_ACTO := v_id_acto;',
'            :P123_NMRO_ACTO := v_nmro_acto;',
'            :P123_FECHA     := v_fcha;*/',
'',
'            -- actualizamos en el documento los datos del numero del acto y fecha del acto que corresponde',
'            update cb_g_procesos_jrdco_dcmnto',
'            set id_acto   = v_id_acto, nmro_acto = v_nmro_acto, fcha_acto = v_fcha',
'            where id_prcsos_jrdco = :P123_ID_PRCSOS_JRDCO',
'            and id_prcsos_jrdco_dcmnto = :P123_ID_PRCSOS_JRDCO_DCMNTO;',
'        ',
'            commit;',
'         end if;',
'        ',
'        :P123_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''{"id_prcsos_jrdco":"'' ||:P123_ID_PRCSOS_JRDCO ||''","id_prcsos_jrdco_dcmnto":"'' || :P123_ID_PRCSOS_JRDCO_DCMNTO || ''"}'', :P123_ID_PLNTLLA_1);',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(55340743778448253)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55345990824448286)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Gestionar Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_exste_dcmnto number := 0;',
'begin',
'    if :P123_TIPO_DCMNTO = ''J'' then',
'        --INSERT INTO MUERTO (n_001,v_001,t_001) VALUES(04092025,'':REQUEST :''||:REQUEST, sysdate);',
'        if :REQUEST = ''SAVE'' then',
'            begin',
'                select count(a.ID_PRCSOS_JRDCO_DCMNTO)',
'                into v_exste_dcmnto',
'                from cb_g_prcsos_jrdc_dcmnt_plnt a',
'                where a.ID_PRCSOS_JRDCO_DCMNTO = :P123_ID_PRCSOS_JRDCO_DCMNTO',
'                and a.dcmnto is not null;',
'            end;',
'            ',
'            if v_exste_dcmnto = 0 then',
'                -- insertamos la plantilla y el documento combinado',
'                insert into cb_g_prcsos_jrdc_dcmnt_plnt',
'                           (id_prcsos_jrdco_dcmnto, id_plntlla, dcmnto)',
'                values',
'                           (:P123_ID_PRCSOS_JRDCO_DCMNTO, :P123_ID_PLNTLLA_1, :P123_DCMNTO);',
'            else',
'                update cb_g_prcsos_jrdc_dcmnt_plnt',
'                set dcmnto = :P123_DCMNTO',
'                where id_prcsos_jrdco_dcmnto = :P123_ID_PRCSOS_JRDCO_DCMNTO;',
'            end if;',
'        elsif :REQUEST = ''DELETE'' then',
'            --delete cb_g_procesos_jrdco_dcmnto   where id_prcsos_jrdco = :P123_ID_PRCSOS_JRDCO;',
'            delete cb_g_prcsos_jrdc_dcmnt_plnt  where id_prcsos_jrdco_dcmnto = :P123_ID_PRCSOS_JRDCO_DCMNTO;',
'        end if;    ',
'          ',
'          commit;',
'    else',
'        PKG_CB_MEDIDAS_CAUTELARES.prc_rg_dcmntos_dsmbrgo_pntual(p_id_dsmbrgos_rslcion => :P123_ID_DSMBRGOS_RSLCION,',
'                                                                p_id_dsmbrgo_ofcio   => :P123_ID_DSMBRGO_OFCIO,',
'                                                                p_id_plntlla         => :P123_ID_PLNTLLA,',
'                                                                p_dcmnto             => :P123_DCMNTO,',
'                                                                --p_id_usrio         => :F_ID_USRIO,',
'                                                                p_tpo_dcmnto         => :P123_TIPO_DCMNTO,',
'                                                                p_request            => :REQUEST);',
'    end if;                                                        ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('Operaci\00F3n realizada de forma exitosa!!')
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7739218828147512)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Finalizacion de procesos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    pkg_cb_proceso_juridico.prc_rg_fnlzcion_prcso_jrdco ( p_id_plntlla    => :P123_ID_PLNTLLA_1,',
'                                                          p_json_procesos => ''[{"ID_PRCSOS_JRDCO":"''||:P123_ID_PRCSOS_JRDCO||''","ID_INSTNCIA_FLJO":"''||:P123_ID_INSTNCIA_FLJO||''","ID_FLJO_TREA":"247"}]'', ',
'                                                          p_id_usuario    => :F_ID_USRIO,',
'                                                          p_cdgo_clnte    => :F_CDGO_CLNTE);',
'                         ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(7739101494147511)
);
null;
end;
/
