prompt --application/pages/page_00288
begin
wwv_flow_api.create_page(
 p_id=>288
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Crear Declaraciones Carga'
,p_page_mode=>'MODAL'
,p_step_title=>'Crear Declaraciones Carga'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1200'
,p_last_updated_by=>'JGONZALEZ'
,p_last_upd_yyyymmddhh24miss=>'20220923094242'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100515479485624495)
,p_plug_name=>unistr('Par\00E1metros')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(30164026939766225)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(100515479485624495)
,p_button_name=>'btn_grdr'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>9
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30163702096766222)
,p_name=>'P288_VGNCIA_FRMLRIO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(100515479485624495)
,p_prompt=>'Vgncia Frmlrio'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30163815686766223)
,p_name=>'P288_ID_BNCO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(100515479485624495)
,p_prompt=>'Banco'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>'select nmbre_bnco,id_bnco  from df_c_bancos;'
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30163978832766224)
,p_name=>'P288_ID_CNTA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(100515479485624495)
,p_prompt=>'Cuenta'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  nmro_cnta,id_bnco_cnta',
'from    df_c_bancos_cuenta',
'where   id_bnco =:P288_ID_BNCO;'))
,p_lov_cascade_parent_items=>'P288_ID_BNCO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30164273277766227)
,p_name=>'P288_VIGENCIA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(100515479485624495)
,p_prompt=>'Vigencia'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.vgncia as r, c.vgncia as d',
'  from gi_d_dclrcnes_tpos_vgncias b',
'  join df_i_periodos c',
'    on c.id_prdo = b.id_prdo',
' where b.id_dclrcn_tpo = :P288_TPO_DCLRCION',
'      --and   id_frmlrio = :P288_FRMLRIO ',
'   and b.actvo = ''S''',
' group by c.vgncia',
' order by c.vgncia desc',
''))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'120'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30164394376766228)
,p_name=>'P288_DCLRCN_TPO_VGNCIA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(100515479485624495)
,p_prompt=>'dclrcion_tpo_vgncia'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30164503074766230)
,p_name=>'P288_PRDCDAD'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(100515479485624495)
,p_prompt=>'Periodidad'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  dscrpcion d, cdgo_prdcdad r',
'from   df_s_periodicidad'))
,p_lov_display_null=>'YES'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30164696267766231)
,p_name=>'P288_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(100515479485624495)
,p_prompt=>'Impuesto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto  as d,',
'       id_impsto as r',
'  from df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and cdgo_impsto = ''ICA''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30164870591766233)
,p_name=>'P288_SBIMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(100515479485624495)
,p_prompt=>'SubImpuesto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P288_IMPSTO',
' order by 1'))
,p_lov_cascade_parent_items=>'P288_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35188009958168336)
,p_name=>'P288_TPO_DCLRCION'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(100515479485624495)
,p_prompt=>unistr('Tipo Declaraci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  DISTINCT a.dscrpcion,',
'        a.id_dclrcn_tpo',
'from    gi_d_declaraciones_tipo a',
'join    gi_d_dclrcnes_tpos_vgncias b on a.id_dclrcn_tpo=b.id_dclrcn_tpo',
'where   a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and      exists (select * from gi_d_dclrcnes_vgncias_frmlr c where b.id_dclrcion_tpo_vgncia= c.id_dclrcion_tpo_vgncia)',
'order by a.dscrpcion;',
'',
'',
''))
,p_lov_display_null=>'YES'
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'360'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35188451392168349)
,p_name=>'P288_FRMLRIO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(100515479485624495)
,p_prompt=>'Formulario'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  d.dscrpcion,',
'        d.id_frmlrio',
'from    gi_d_declaraciones_tipo a',
'join    gi_d_dclrcnes_tpos_vgncias b on a.id_dclrcn_tpo=b.id_dclrcn_tpo',
'join    gi_d_dclrcnes_vgncias_frmlr c on b.id_dclrcion_tpo_vgncia = c.id_dclrcion_tpo_vgncia',
'join    gi_d_formularios d on c.id_frmlrio=d.id_frmlrio',
'join    v_df_i_periodos e on  b.id_prdo=e.id_prdo  ',
'where   a.cdgo_clnte        =   :F_CDGO_CLNTE',
'and c.actvo =''S''',
'and a.id_dclrcn_tpo=:P288_TPO_DCLRCION',
'group by d.dscrpcion, d.id_frmlrio;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P288_TPO_DCLRCION'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35188717582168349)
,p_name=>'P288_TPO_CRGA'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(100515479485624495)
,p_prompt=>'Tipo Carga'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_crga,',
'       id_crga',
'  from et_g_carga ',
'  where not id_crga in (',
'                          select id_crga ',
'                            from df_s_resolucion_carga',
'                      )',
' order by nmbre_crga'))
,p_lov_display_null=>'YES'
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'200'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(126350612744990906)
,p_name=>'P288_DSCRPCN'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(100515479485624495)
,p_prompt=>unistr('Descripci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>70
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(30164183980766226)
,p_computation_sequence=>10
,p_computation_item=>'P288_VGNCIA_FRMLRIO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_dclrcion_vgncia_frmlrio ',
'from gi_d_dclrcnes_vgncias_frmlr ',
'where id_frmlrio=:P288_FRMLRIO ',
'and id_dclrcion_tpo_vgncia=:P288_DCLRCN_TPO_VGNCIA;',
''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(30164410691766229)
,p_computation_sequence=>20
,p_computation_item=>'P288_DCLRCN_TPO_VGNCIA'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'select ID_DCLRCION_TPO_VGNCIA from gi_d_dclrcnes_tpos_vgncias where ID_DCLRCN_TPO=:P288_TPO_DCLRCION and vgncia=:P288_VIGENCIA;'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(35271837719070901)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insertar Registro Delcaraciones Carga'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare    ',
'  --v_dcl_vgc_tpo  number;  ',
'  --v_dcl_vgc_frm  number;',
'  v_exste        number;',
'begin',
'',
'/*',
'    begin',
'        select id_dclrcion_tpo_vgncia ',
'        into v_dcl_vgc_tpo',
'        from gi_d_dclrcnes_tpos_vgncias ',
'        where id_dclrcn_tpo=:P288_TPO_DCLRCION ',
'        and vgncia=:P288_VIGENCIA',
'        and id_prdo=:P288_PRDO;   ',
'        ',
'    exception',
'       when no_data_found then',
'          raise_application_error(-20001,''No se encontraron datos para esa vigencia'');',
'       when too_many_rows then',
'          raise_application_error(-20001,''Se obtuvo mas de un registro de vigencia'');',
'       when others then       ',
'           raise_application_error(-20001,''Error al procesar la vigencia'');           ',
'       ',
'   end;',
'    ',
'    --Obtenemos el id_dclrcion_vgncia_frmlrio   ',
'   begin',
'        select id_dclrcion_vgncia_frmlrio',
'        into v_dcl_vgc_frm',
'        from gi_d_dclrcnes_vgncias_frmlr ',
'        where id_frmlrio=:P288_FRMLRIO ',
'        and id_dclrcion_tpo_vgncia=v_dcl_vgc_tpo;',
'        ',
'   exception',
'      when no_data_found then',
'         raise_application_error(-20001,''No se encontraron datos para esa declaracion vigencia formulario'');',
'       when others then       ',
'           raise_application_error(-20001,''Error al procesar la declaracion vigencia formulario'');',
'   end;   ',
'   */',
'',
'  /*  begin',
'        select count(1) ',
'        into   v_exste',
'        from   gi_g_dclrcnes_crga ',
'        where  id_crga       = :P288_TPO_CRGA ',
'        and    id_dclrcn_tpo = :P288_TPO_DCLRCION ',
'        and    vgncia        = :P288_VIGENCIA;   ',
'        ',
'        raise_application_error(-20001,''v_exste: ''||v_exste);      ',
'        ',
'        if v_exste > 0 then',
unistr('            raise_application_error(-20001,''Ya se encuentra parametrizada la carga para la declarci\00F3n y la vigencia seleccionadas'');'),
'        end if;',
'        ',
'    exception',
'       when others then       ',
'           raise_application_error(-20001,''Error al procesar la vigencia'');           ',
'       ',
'   end;*/',
'   ',
'  begin',
'',
'        insert into gi_g_dclrcnes_crga(   id_crga                     ',
'                                        , id_dclrcn_tpo                ',
'                                        --, id_dclrcion_tpo_vgncia    ',
'                                        , id_frmlrio                 ',
'                                        --, id_dclrcion_vgncia_frmlrio     ',
'                                        , cdgo_clnte                 ',
'                                        , id_impsto                 ',
'                                        , id_impsto_sbmpsto         ',
'                                        , id_bnco                     ',
'                                        , id_bnco_cnta',
'                                        , vgncia',
'                                        --, cdgo_prdcdad',
'                                       )',
'                                values(   :P288_TPO_CRGA                     ',
'                                        , :P288_TPO_DCLRCION             ',
'                                       -- , v_dcl_vgc_tpo  ',
'                                        , :P288_FRMLRIO                 ',
'                                        --, v_dcl_vgc_frm     ',
'                                        , :F_CDGO_CLNTE                 ',
'                                        , :P288_IMPSTO                 ',
'                                        , :P288_SBIMPSTO         ',
'                                        , :P288_ID_BNCO                      ',
'                                        , :P288_ID_CNTA  ',
'                                        , :P288_VIGENCIA',
'                                        --, :P288_PRDCDAD',
'                                      );                              ',
'                              ',
'   exception',
'       when others then       ',
'            raise_application_error(-20001,''Error al procesar la declaracion vigencia formulario''||''-''||SQLERRM);',
'   end;',
'',
'end;'))
,p_process_error_message=>'No fue posible crear el registro!!'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(30164026939766225)
,p_process_success_message=>'Registro creado con exito!!'
);
end;
/
