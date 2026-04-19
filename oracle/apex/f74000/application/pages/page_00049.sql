prompt --application/pages/page_00049
begin
wwv_flow_api.create_page(
 p_id=>49
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Liquidaci\00F3n Oficial de Revisi\00F3n')
,p_step_title=>unistr('Liquidaci\00F3n Oficial de Revisi\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('var pageId = &APP_PAGE_ID.;  // Extrae el n\00FAmero de la pagina.'),
'async function generarActo(p_id_expdnte_acto){',
'    console.log(''pageId:''+pageId)',
'    let $waitPopup = apex.widget.waitPopup();',
'    try{',
'    console.log(''entrando al JS:''+pageId)',
'    await apex.server.process("generarActo", {',
'            pageItems: "#P"+pageId+"_ID_CNDDTO",',
'            x01: p_id_expdnte_acto}, {',
'            success: function(data) {',
'                    console.log(''DATA:''+JSON.stringify(data));',
'                    if (data.cdgo_rspsta > 0) {',
'                        console.log(''ERROR:''+data.mnsje_rspsta)',
'                        apex.message.clearErrors();',
'                        apex.message.showErrors([{',
'                            type: "error",',
'                            location: "page",',
'                            message: data.mnsje_rspsta,',
'                            unsafe: false',
'                        }]);',
'                    } else {',
'                        console.log(''OK:''+data.mnsje_rspsta)',
'                        apex.submit();',
'                    }',
'                }',
'            })',
'    }catch(e){',
'        console.error(e);',
'    }finally{',
'        $waitPopup.remove();',
'    }',
'};'))
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20241021170457'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31627197464927106)
,p_plug_name=>'Declaraciones'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_impsto,',
'        a.nmbre_impsto_sbmpsto,',
'        b.vgncia,',
'        c.prdo,',
'        f.dscrpcion,',
'        b.id_dclrcion_vgncia_frmlrio,',
'        b.id_cnddto_vgncia,',
'        g.id_dclrcion,',
'        case when g.id_dclrcion is null /*or (select m.id_acto_tpo ',
'                                             from fi_g_fiscalizacion_expdnte     i',
'                                             join fi_g_fsclzcion_expdnte_acto    m   on  i.id_fsclzcion_expdnte  =   m.id_fsclzcion_expdnte',
'                                             where i.id_fsclzcion_expdnte = :P49_ID_FSCLZCION_EXPDNTE ',
'                                             and m.id_acto_tpo = (select a.id_acto_tpo',
'                                                                  from gn_d_actos_tipo_tarea a',
'                                                                  where id_fljo_trea = :F_ID_FLJO_TREA',
'                                                                  and a.indcdor_oblgtrio = ''S'')',
'                                             and not m.id_acto is null) is null*/ then',
'            ''<center>',
'                <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">',
'                    Generar <span class="fa fa-cog"></span>',
'                </button>',
'            </center>''',
'        else',
'            ''<a href="#"><span class="fa fa-check"></span></a>''',
'        end btn,',
'        case when g.id_dclrcion is not null then',
'            ''<center>',
'                <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">',
'                    Ver <span class="fa fa-eye"></span>',
'                </button>',
'            </center>''',
'        else',
'            ''<a href="#"><span class="fa fa-eye-slash"></span></a>''',
'        end Ver',
'from v_fi_g_candidatos              a',
'join fi_g_candidatos_vigencia       b   on  a.id_cnddto                     =   b.id_cnddto',
'join fi_g_fsclzc_expdn_cndd_vgnc    h   on  b.id_cnddto_vgncia              =   h.id_cnddto_vgncia',
'join df_i_periodos                  c   on  b.id_prdo                       =   c.id_prdo',
'join gi_d_dclrcnes_vgncias_frmlr    d   on  b.id_dclrcion_vgncia_frmlrio    =   d.id_dclrcion_vgncia_frmlrio',
'join gi_d_dclrcnes_tpos_vgncias     e   on  d.id_dclrcion_tpo_vgncia        =   e.id_dclrcion_tpo_vgncia',
'join gi_d_declaraciones_tipo        f   on  e.id_dclrcn_tpo                 =   f.id_dclrcn_tpo',
'left join gi_g_declaraciones        g   on  b.id_cnddto_vgncia              =   g.id_cnddto_vgncia',
'where a.id_cnddto = :P49_ID_CNDDTO',
';'))
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
 p_id=>wwv_flow_api.id(31628360942927118)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'BVILLEGAS'
,p_internal_uid=>31628360942927118
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31628467073927119)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31628587013927120)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Subtributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31628672285927121)
,p_db_column_name=>'VGNCIA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31628791572927122)
,p_db_column_name=>'PRDO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Per\00EDodo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31628869217927123)
,p_db_column_name=>'DSCRPCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Tipo Declaraci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31628910649927124)
,p_db_column_name=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Id Dclrcion Vgncia Frmlrio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31629044697927125)
,p_db_column_name=>'ID_CNDDTO_VGNCIA'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Id Cnddto Vgncia'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31629166801927126)
,p_db_column_name=>'ID_DCLRCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Id Dclrcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31629217984927127)
,p_db_column_name=>'BTN'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Acci\00F3n')
,p_column_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP,36:P36_ID_SJTO_IMPSTO,P36_ID_CNDDTO_VGNCIA,P36_ID_DCLRCION,P36_ID_DCLRCION_VGNCIA_FRMLRIO,P36_ID_INSTNCIA_FLJO,P36_PGNA:&P49_ID_SJTO_IMPSTO.,#ID_CNDDTO_VGNCIA#,#ID_DCLRCION#,#ID_DCLRCION_VGNCIA_FRMLRIO#,&F_ID_INS'
||'TNCIA_FLJO.,&APP_PAGE_ID.'
,p_column_linktext=>'#BTN#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31629362338927128)
,p_db_column_name=>'VER'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Ver'
,p_column_link=>'f?p=140000:34:&SESSION.::&DEBUG.:RP,34:P34_ID_DCLRCION:#ID_DCLRCION#'
,p_column_linktext=>'#VER#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(31636661893963888)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'316367'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:VGNCIA:PRDO:DSCRPCION:ID_DCLRCION_VGNCIA_FRMLRIO:ID_CNDDTO_VGNCIA:ID_DCLRCION:BTN:VER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(287372992849313815)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(288090941132711819)
,p_plug_name=>'Proceso Fisca'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.CANDIDATO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'F_ID_INSTNCIA_FLJO'
,p_attribute_02=>'F_ID_FLJO_TREA'
,p_attribute_03=>'P49_ID_SJTO_IMPSTO'
,p_attribute_04=>'F_ID_FNCNRIO'
,p_attribute_05=>'P49_ID_FSCLZCION_EXPDNTE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(407935583497327851)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
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
 p_id=>wwv_flow_api.id(425113419693490440)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'    </b>',
'</h5>',
'',
'<p align="justify">',
unistr('<i>Funcionalidad que permite generar, modificar, visualizar y confirmar los actos parametrizados en la etapa del Emplazamiento que no requieren confirmaci\00F3n por el supervisor.</i>'),
'</p>',
'',
'',
'<p align="justify">',
unistr('<i>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72176254048316147)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(407935583497327851)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72173960590314366)
,p_name=>'P49_ID_CNDDTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(288090941132711819)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72174317094314367)
,p_name=>'P49_ID_SJTO_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(288090941132711819)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72174798531314368)
,p_name=>'P49_ID_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(288090941132711819)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72175134343314369)
,p_name=>'P49_ID_FSCLZCION_EXPDNTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(288090941132711819)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72175537791314369)
,p_name=>'P49_ID_FSCLZCION_EXPDNTE_ACTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(288090941132711819)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72176929880321251)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Carga Informaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    begin',
'    ',
'        select a.id_cnddto,',
'               a.id_sjto_impsto,',
'               a.id_impsto,',
'               c.id_fsclzcion_expdnte',
'        into   :P49_ID_CNDDTO,',
'               :P49_ID_SJTO_IMPSTO,',
'               :P49_ID_IMPSTO,',
'               :P49_ID_FSCLZCION_EXPDNTE',
'        from v_fi_g_candidatos          a',
'        join fi_g_fiscalizacion_expdnte c on a.id_cnddto        = c.id_cnddto',
'        join v_si_i_sujetos_impuesto    d on a.id_sjto_impsto   = d.id_sjto_impsto',
'        where c.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'',
'    exception',
'        when others then',
'            :P49_ID_CNDDTO    := null;',
'            :P49_ID_SJTO_IMPSTO := null;',
'            :P49_ID_IMPSTO := null;',
'            :P49_ID_FSCLZCION_EXPDNTE := null;',
'    end;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72186457989457290)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta     number;',
'    v_mnsje_rspsta    varchar(1000);',
'',
'begin',
'',
'    pkg_fi_fiscalizacion.prc_rg_acto(p_cdgo_clnte                  => :F_CDGO_CLNTE,',
'                                     p_id_usrio                    => :F_ID_USRIO,  ',
'                                     p_id_fsclzcion_expdnte_acto   => :P49_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                     p_id_cnddto                   => :P49_ID_CNDDTO,',
'                                     o_cdgo_rspsta                 => v_cdgo_rspsta,',
'                                     o_mnsje_rspsta                => v_mnsje_rspsta);',
'                                                      ',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'GENERAR'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(31573474207413421)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'generarActo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number         := 0;',
'    v_mnsje_rspsta   varchar2(4000) := ''OK'';',
'    v_id_expdnte_acto number        := apex_application.g_x01;',
'    v_vlor_ttal        number       := 0;',
'',
'begin',
'    :P49_ID_FSCLZCION_EXPDNTE_ACTO := v_id_expdnte_acto;',
'    --if :P49_DFNCION = ''S'' then',
'        begin',
'            pkg_fi_fiscalizacion.prc_rg_liquidacion( p_cdgo_clnte		          =>    :F_CDGO_CLNTE,',
'                                                     p_id_usrio                   =>    :F_ID_USRIO,',
'                                                     p_id_fsclzcion_expdnte       =>    :P49_ID_FSCLZCION_EXPDNTE,',
'                                                     p_id_fsclzcion_expdnte_acto  =>    :P49_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                                     o_vlor_ttal                  =>    v_vlor_ttal, ',
'                                                     o_cdgo_rspsta		          =>    v_cdgo_rspsta,',
'                                                     o_mnsje_rspsta	              =>    v_mnsje_rspsta);',
'        end;',
'    --end if;',
'    if v_cdgo_rspsta = 0 then',
'        begin',
'            pkg_fi_fiscalizacion.prc_rg_acto(p_cdgo_clnte                  => :F_CDGO_CLNTE,',
'                                             p_id_usrio                    => :F_ID_USRIO,  ',
'                                             p_id_fsclzcion_expdnte_acto   => :P49_ID_FSCLZCION_EXPDNTE_ACTO,',
'                                             p_id_cnddto                   => :P49_ID_CNDDTO,',
'                                             p_acto_vlor_ttal              => v_vlor_ttal,',
'                                             o_cdgo_rspsta                 => v_cdgo_rspsta,',
'                                             o_mnsje_rspsta                => v_mnsje_rspsta);',
'        end;',
'    else',
'        rollback;',
'        return;',
'    end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'exception ',
'    when others then',
'        apex_json.open_object;',
'        apex_json.write(''cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object;',
'        rollback;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
