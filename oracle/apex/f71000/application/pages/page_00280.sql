prompt --application/pages/page_00280
begin
wwv_flow_api.create_page(
 p_id=>280
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Detalle del Documento'
,p_page_mode=>'MODAL'
,p_step_title=>'Detalle del Documento'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20231206011748'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(68434911781816709)
,p_plug_name=>'Detalle del Documento'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71512893452119840)
,p_plug_name=>'Detalle del Documento'
,p_parent_plug_id=>wwv_flow_api.id(68434911781816709)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select vgncia, ',
'        prdo, ',
'        dscrpcion || '' ['' || cdgo_cncpto || '']''  cncpto,',
'        sum(vlor_dbe)  vlor_dbe,',
'        sum(vlor_hber) vlor_hber',
'   from v_re_g_documentos_detalle ',
'  where id_dcmnto = :P280_ID_DCMNTO',
'  group by vgncia, ',
'        prdo, ',
'        dscrpcion || '' ['' || cdgo_cncpto || '']''',
' --order by id_dcmnto_dtlle'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71513094243119842)
,p_name=>'Vigencia'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>10
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71513114953119843)
,p_name=>'Periodo'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>20
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71513279893119844)
,p_name=>'Concepto '
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto '
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>108
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71513315372119845)
,p_name=>'Valor Debe'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DBE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Debe'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(71513456788119846)
,p_name=>'Valor Haber'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_HBER'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Haber'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(71512935320119841)
,p_internal_uid=>71512935320119841
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(73478381932544470)
,p_interactive_grid_id=>wwv_flow_api.id(71512935320119841)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(73478475591544471)
,p_report_id=>wwv_flow_api.id(73478381932544470)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(73478988705544484)
,p_view_id=>wwv_flow_api.id(73478475591544471)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(71513094243119842)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85.22200000000001
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(73479487134544494)
,p_view_id=>wwv_flow_api.id(73478475591544471)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(71513114953119843)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>63.667
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(73479931012544496)
,p_view_id=>wwv_flow_api.id(73478475591544471)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(71513279893119844)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>280.778
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(73480431913544498)
,p_view_id=>wwv_flow_api.id(73478475591544471)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(71513315372119845)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(73480930640544499)
,p_view_id=>wwv_flow_api.id(73478475591544471)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(71513456788119846)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(68545081725156207)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(68434911781816709)
,p_button_name=>'Btn_Imprimir'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(68304527690252728)
,p_branch_name=>'imprimir'
,p_branch_action=>'f?p=66000:37:&SESSION.::&DEBUG.:RP:P37_ID_RPRTE,P37_NMBRE_RPRTE:&P280_ID_RPRTE.,&P280_NMBRE_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(68545081725156207)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(22486455544152102)
,p_name=>'P280_ID_RPRTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(68434911781816709)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68304378728252726)
,p_name=>'P280_ID_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(177796137702414574)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68304455163252727)
,p_name=>'P280_NMBRE_RPRTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(177796137702414574)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68435533816816715)
,p_name=>'P280_NEW'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(68434911781816709)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_count number;',
'begin    ',
'     select count(*) ',
'      into v_count',
'      from re_g_documentos_detalle_rpt',
'     where id_dcmnto = :P280_ID_DCMNTO;',
'     ',
'     if v_count = 0 then',
'         return ''No Tiene Detalle'';',
'     else',
'         return ''Tiene detalle'';',
'     end if;    ',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(22526366516186501)
,p_computation_sequence=>10
,p_computation_item=>'P280_ID_RPRTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_rprte    r',
'  from gn_d_reportes a',
' where a.cdgo_rprte_grpo = ''RPG''  ',
'   and a.indcdor_gnrco   = ''S'' ',
'fetch first 1 rows only  ;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(68306702853252850)
,p_computation_sequence=>10
,p_computation_item=>'F_ID_DCMNTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P280_ID_DCMNTO'
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(68435099346816710)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Seteamos Del ID del Documento '
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*--Valida si el documento tiene detalle asociado si no se genera',
'declare',
'    v_count number;',
'begin',
'    :F_ID_DCMNTO := :P280_ID_DCMNTO;',
'    select count(*) ',
'      into v_count',
'      from re_g_documentos_detalle_rpt',
'     where id_dcmnto = :P280_ID_DCMNTO;',
'     ',
'     if v_count = 0 then',
'            begin',
'                insert into re_g_documentos_detalle_rpt( id_dcmnto , vgncia , prdo , cncpto , vlor_cptal ',
'                                                       , vlor_intres , saldo_total , bse_cncpto , trfa , txto_trfa )',
'                select :P280_ID_DCMNTO as id_dcmnto',
'                     , p.vgncia',
'                     , p.prdo',
'                     , p.cncpto',
'                     , p.vlor_cptal',
'                     , p.vlor_intres',
'                     , p.saldo_total',
'                     , p.bse_cncpto',
'                     , p.trfa',
'                     , p.txto_trfa',
'                  from table( pkg_re_documentos.fnc_co_dtlle_dcmnto( :P280_ID_DCMNTO , 25 )) p;',
'            exception',
'                  when others then ',
'                       raise_application_error(-20000,''No fue posible crear los detalles del documento para el reporte.'');                       ',
'                       rollback;',
'            end; ',
'            :P280_NEW := ''Detalle Creado.'';       ',
'     end if;       ',
'end;',
'',
'*/',
'--Valida si el documento tiene detalle asociado si no se genera',
'declare',
'    v_count        number;',
'    v_cdgo_rspsta  number;',
'    v_orden_agrpcion number;',
'    v_mnsje_rspsta varchar2(4000);',
'    v_dscrpcion_vgncia varchar2(50);',
'    v_vgncia_actual             number := pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte 			    => :F_CDGO_CLNTE',
'                                                                                         , p_cdgo_dfncion_clnte_ctgria  => ''GFN''',
'                                                                                         , p_cdgo_dfncion_clnte		    => ''VAC'' );    ',
'begin',
'     :F_ID_DCMNTO := :P280_ID_DCMNTO;',
'     ',
'    select count(*)',
'      into v_count',
'      from re_g_documentos_encbzdo_rpt',
'     where id_dcmnto = :P280_ID_DCMNTO;',
'     ',
'     if v_count = 0 then',
'            -- actualizamos la descripcion de la vigencia y el orden de agrupacion',
'            begin',
'                for c_dcmnto_dtlle in (',
'                                        select a.id_dcmnto_dtlle',
'                                             , b.vgncia',
'                                          from re_g_documentos_detalle a',
'                                          join gf_g_movimientos_detalle b on a.id_mvmnto_dtlle = b.id_mvmnto_dtlle',
'                                         where a.id_dcmnto =  :P280_ID_DCMNTO',
'                 )loop',
'                 ',
'                    if c_dcmnto_dtlle.vgncia = v_vgncia_actual then ',
'                        v_dscrpcion_vgncia  := ''VIGENCIA ACTUAL'';',
'                        v_orden_agrpcion    := 2;                    ',
'                    else',
'                        v_dscrpcion_vgncia := ''VIGENCIAS ANTERIORES'';',
'                        v_orden_agrpcion    := 1;                     ',
'                    end if;',
'                    ',
'                    update re_g_documentos_detalle',
'                       set dscrpcion_vgncia = v_dscrpcion_vgncia',
'                         , orden_agrpcion   = v_orden_agrpcion',
'                      where id_dcmnto_dtlle = c_dcmnto_dtlle.id_dcmnto_dtlle;',
'',
'                      commit;',
'                end loop;            ',
'            end;',
'            ',
'            -- generamos el detalle',
'            begin',
'                pkg_re_documentos.prc_rg_documento_rpt ( p_cdgo_clnte	=> :F_CDGO_CLNTE',
'                                                       , p_id_dcmnto    => :P280_ID_DCMNTO',
'                                                       , o_cdgo_rspsta	=> v_cdgo_rspsta',
'                                                       , o_mnsje_rspsta	=> v_mnsje_rspsta',
'                );',
'                commit;',
'                ',
'                if v_cdgo_rspsta != 0 then ',
'                    raise_application_error(-20000,''No fue posible crear los detalles del documento para el reporte: ''||v_mnsje_rspsta);                       ',
'                end if;',
'            exception',
'                  when others then ',
'                       raise_application_error(-20000,''No fue posible crear los detalles del documento para el reporte.'');                       ',
'                       rollback;',
'            end; ',
'            :P280_NEW := ''Detalle Creado.'';       ',
'     end if;       ',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(68545081725156207)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(71513557804119847)
,p_process_sequence=>40
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valida Detalle Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Valida si el documento tiene detalle asociado si no se genera',
'declare',
'    v_count        number;',
'    v_cdgo_rspsta  number;',
'    v_mnsje_rspsta varchar2(4000);',
'begin',
'     :F_ID_DCMNTO := :P280_ID_DCMNTO;',
'     ',
'    select count(*)',
'      into v_count',
'      from re_g_documentos_encbzdo_rpt',
'     where id_dcmnto = :P280_ID_DCMNTO;',
'     ',
'     if v_count = 0 then',
'            begin',
'                pkg_re_documentos.prc_rg_documento_rpt ( p_cdgo_clnte	=> :F_CDGO_CLNTE',
'                                                       , p_id_dcmnto    => :P280_ID_DCMNTO',
'                                                       , o_cdgo_rspsta	=> v_cdgo_rspsta',
'                                                       , o_mnsje_rspsta	=> :P280_NEW',
'                );',
'                commit;',
'                ',
'                if v_cdgo_rspsta != 0 then ',
'                    raise_application_error(-20000,''No fue posible crear los detalles del documento para el reporte: ''||:P280_NEW);                       ',
'                end if;',
'            exception',
'                  when others then ',
'                       raise_application_error(-20000,''No fue posible crear los detalles del documento para el reporte.'');                       ',
'                       rollback;',
'            end; ',
'            :P280_NEW := ''Detalle Creado.'';       ',
'     end if;       ',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
