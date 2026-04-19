prompt --application/pages/page_00087
begin
wwv_flow_api.create_page(
 p_id=>87
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Prescripci\00F3n Editar Respuesta')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Prescripci\00F3n Editar Respuesta')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_dialog_chained=>'N'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20191024100411'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(79273248124551102)
,p_plug_name=>unistr('Prescripci\00F3n Editar Respuesta')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'EXISTS'
,p_plug_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    gf_g_prscrpcns_dcmnto a',
'where   a.id_prscrpcion =   :P87_ID_PRSCRPCION;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79274730019551117)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(79273248124551102)
,p_button_name=>'P87_GUARDAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      1',
'from        gf_g_prscrpcnes_vgncs_vldcn a',
'inner join  gn_d_rglas_ngcio_clnte_fnc  b   on  b.id_rgla_ngcio_clnte_fncion    =   a.id_rgla_ngcio_clnte_fncion',
'inner join  gn_d_reglas_negocio_cliente c   on  c.id_rgla_ngcio_clnte           =   b.id_rgla_ngcio_clnte',
'where       a.id_vgnc_vldcn     =   :P87_ID_VGNC_VLDCN',
'and         b.actvo             =   ''S''',
'and         c.indcdor_edta_rgla =   ''N''',
'union',
'select      1',
'from        gf_g_prscrpcns_dcmnto       a',
'where       a.id_prscrpcion =   :P87_ID_PRSCRPCION;'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(79274810785551118)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(79273248124551102)
,p_button_name=>'P87_CANCELAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(27358165173076901)
,p_name=>'P87_NMBRE_TRCRO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(79273248124551102)
,p_prompt=>'Usuario Respuesta Opcional'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P87_NMBRE_TRCRO'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79273351132551103)
,p_name=>'P87_ID_VGNC_VLDCN'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(79273248124551102)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79273437868551104)
,p_name=>'P87_NMBRE_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(79273248124551102)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79273573217551105)
,p_name=>'P87_VGNCIA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(79273248124551102)
,p_prompt=>'Vigencia'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79273667047551106)
,p_name=>'P87_CMPLIO_VLDCION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(79273248124551102)
,p_prompt=>unistr('Aplica Prescripci\00F3n?')
,p_display_as=>'NATIVE_YES_NO'
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79273721430551107)
,p_name=>'P87_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(79273248124551102)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79273877456551108)
,p_name=>'P87_DSCRPCION_PRDO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(79273248124551102)
,p_prompt=>unistr('Descripci\00F3n Periodo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79273962756551109)
,p_name=>'P87_CMPLIO_VLDCION_OPCNAL'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(79273248124551102)
,p_item_default=>'N'
,p_prompt=>unistr('Aplica Prescripci\00F3n? (Opcional)')
,p_display_as=>'NATIVE_YES_NO'
,p_colspan=>4
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      1',
'from        gf_g_prscrpcnes_vgncs_vldcn a',
'inner join  gn_d_rglas_ngcio_clnte_fnc  b   on  b.id_rgla_ngcio_clnte_fncion    =   a.id_rgla_ngcio_clnte_fncion',
'inner join  gn_d_reglas_negocio_cliente c   on  c.id_rgla_ngcio_clnte           =   b.id_rgla_ngcio_clnte',
'where       a.id_vgnc_vldcn     =   :P87_ID_VGNC_VLDCN',
'and         b.actvo             =   ''S''',
'and         c.indcdor_edta_rgla =   ''N''',
'union',
'select      1',
'from        gf_g_prscrpcns_dcmnto       a',
'where       a.id_prscrpcion =   :P87_ID_PRSCRPCION;'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79274028446551110)
,p_name=>'P87_IDNTFCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(79273248124551102)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79274110037551111)
,p_name=>'P87_PRDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(79273248124551102)
,p_prompt=>'Periodo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79274239861551112)
,p_name=>'P87_DSCRPCION_VLDCION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(79273248124551102)
,p_prompt=>unistr('Validaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79274368051551113)
,p_name=>'P87_RSPSTA_VLDCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(79273248124551102)
,p_prompt=>'Respuesta'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_begin_on_new_line=>'N'
,p_colspan=>8
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79274464135551114)
,p_name=>'P87_RESPTA_OPCNAL'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(79273248124551102)
,p_prompt=>'Respuesta (Opcional)'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_begin_on_new_line=>'N'
,p_colspan=>8
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      1',
'from        gf_g_prscrpcnes_vgncs_vldcn a',
'inner join  gn_d_rglas_ngcio_clnte_fnc  b   on  b.id_rgla_ngcio_clnte_fncion    =   a.id_rgla_ngcio_clnte_fncion',
'inner join  gn_d_reglas_negocio_cliente c   on  c.id_rgla_ngcio_clnte           =   b.id_rgla_ngcio_clnte',
'where       a.id_vgnc_vldcn     =   :P87_ID_VGNC_VLDCN',
'and         b.actvo             =   ''S''',
'and         c.indcdor_edta_rgla =   ''N''',
'union',
'select      1',
'from        gf_g_prscrpcns_dcmnto       a',
'where       a.id_prscrpcion =   :P87_ID_PRSCRPCION;'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(81302998520751401)
,p_name=>'P87_ID_PRSCRPCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(79273248124551102)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79274601307551116)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Llenar Campos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select      c.nmbre_impsto,',
'                c.nmbre_impsto_sbmpsto,',
'                e.idntfccion_sjto_frmtda idntfccion,',
'                c.id_prscrpcion,',
'                a.vgncia,',
'                b.prdo,',
'                b.dscrpcion_prdo,',
'                d.dscrpcion,',
'                a.indcdr_cmplio,',
'                a.rspsta_prmtrca,',
'                a.indcdr_cmplio_opcnl,',
'                a.rspsta_opcnl,',
'                f.nmbre_trcro',
'    into        :P87_NMBRE_IMPSTO,',
'                :P87_NMBRE_IMPSTO_SBMPSTO,',
'                :P87_IDNTFCCION,',
'                :P87_ID_PRSCRPCION,',
'                :P87_VGNCIA,',
'                :P87_PRDO,',
'                :P87_DSCRPCION_PRDO,',
'                :P87_DSCRPCION_VLDCION,',
'                :P87_CMPLIO_VLDCION,',
'                :P87_RSPSTA_VLDCION,',
'                :P87_CMPLIO_VLDCION_OPCNAL,',
'                :P87_RESPTA_OPCNAL,',
'                :P87_NMBRE_TRCRO',
'    from        v_gf_g_prscrpcnes_vgncs_vldcn   a',
'    inner join  v_gf_g_prscrpcnes_vgncia        b   on  b.id_prscrpcion_vgncia      =   a.id_prscrpcion_vgncia',
'    inner join  v_gf_g_prscrpcnes_sjto_impsto   c   on  c.id_prscrpcion_sjto_impsto =   a.id_prscrpcion_sjto_impsto',
'    inner join  gn_d_funciones                  d   on  d.id_fncion                 =   a.id_fncion',
'    inner join  v_si_i_sujetos_impuesto         e   on  e.id_sjto_impsto            =   c.id_sjto_impsto',
'    left  join  v_sg_g_usuarios                 f   on  f.id_usrio                  =   a.id_usrio_rspsta_opcnl',
'    where       a.cdgo_clnte    =   :F_CDGO_CLNTE',
'    and         a.id_vgnc_vldcn =   :P87_ID_VGNC_VLDCN;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79417872329543101)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Actualizar Respuesta Prescripci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar2(1000);',
'begin',
'    pkg_gf_prescripcion.prc_ac_prscrpcion_rspsta_mnl(p_cdgo_clnte            =>    :F_CDGO_CLNTE,',
'                                                     p_id_vgnc_vldcn         =>    :P87_ID_VGNC_VLDCN,',
'                                                     p_indcdr_cmplio_opcnl   =>    :P87_CMPLIO_VLDCION_OPCNAL,',
'                                                     p_rspsta_opcnl          =>    :P87_RESPTA_OPCNAL,',
'                                                     p_id_usrio_rspsta_opcnl =>    :F_ID_USRIO,',
'                                                     o_cdgo_rspsta           =>    v_cdgo_rspsta,',
'                                                     o_mnsje_rspsta          =>    v_mnsje_rspsta',
'                                                    );',
'           ',
'    if (v_cdgo_rspsta <> 0)then',
'        RAISE_APPLICATION_ERROR (-20000,v_mnsje_rspsta);',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(79274730019551117)
,p_process_success_message=>unistr('Acci\00F3n procesada.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104656859392412503)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar ventana'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
