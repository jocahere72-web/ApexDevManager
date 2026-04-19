prompt --application/pages/page_00035
begin
wwv_flow_api.create_page(
 p_id=>35
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>'Cerrar Solicitud'
,p_step_title=>'Cerrar Solicitud'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'',
''))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function descargar(solicitud, radicado) {',
'    var popup = apex.widget.waitPopup();',
'    var v_app_id = $v(''pFlowId''),',
'        v_page_id = $v(''pFlowStepId''),',
'        v_session = $v(''pInstance'');',
'    try {',
'        ',
'        $s(''P35_ID_SLCTUD'', solicitud);',
'        await apex.server.process(''set_session'', {pageItems: ''#P35_ID_SLCTUD''});',
'        var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:APPLICATION_PROCESS=DOWNLOADFILE:NO:RP:::`;',
'        await fetch(url, {',
'            method: ''GET'',',
'            cache: ''default''',
'        }).then(resp => {',
'            return resp.blob()',
'        }).then(resp => {',
'            console.log(resp);',
'            let a = document.createElement("a");',
'            document.body.appendChild(a);',
'            let v_url = window.URL.createObjectURL(resp);',
'            a.download = radicado + ".pdf";',
'            a.href = v_url;',
'            a.click();',
'            document.body.removeChild(a);',
'            window.URL.revokeObjectURL(v_url);',
'        });',
'    } catch (error) {',
'        console.log(error);',
'    } finally {',
'        popup.remove();',
'    }',
'}',
'',
'function iniciar_flujo(name, id_instancia){',
'    apex.server.process(name, {',
'        f01: id_instancia',
'    }, {',
'        success: function (data) { ',
'                if (data.type === ''OK'') {',
'                    window.localStorage.clear();',
'                    window.location.href = data.url;',
'                }else{',
'                    apex.message.showErrors({',
'                        type: apex.message.TYPE.ERROR,',
'                        location: ["page"],',
'                        message: data.msg,',
'                        unsafe: false',
'                    });',
'                }',
'            },',
'            error: function () {',
'                console.log(arguments);',
'            }',
'        }); ',
'}'))
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(71783507231951541)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20250327172403'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43877375246654357)
,p_plug_name=>'ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'Funcionalidad que permite:<br><br>',
'<b>1.</b> Cerrar las solicitudes que se encuentran en la tarea inicial del flujo.<br><br>',
'<b>2.</b> Consultar el detalle de las solicitudes.<br><br>',
'',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'',
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(114692116925898270)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71804482016951559)
,p_plug_display_sequence=>5
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(118730640244103417)
,p_plug_name=>'Consulta PQR'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select s.cdgo_clnte,',
'          s.nmro_rdcdo_dsplay,',
'          initcap(upper(r.prmer_nmbre || '' '' || r.prmer_aplldo)) nmbre_rdcdor,',
'          m.dscrpcion,',
'          e.dscrpcion dscrpcion_estdo,',
'          sms.idntfccion,',
'          i.nmbre_impsto,',
'          i.nmbre_impsto_sbmpsto,',
'          s.fcha_rdcdo,',
'          s.fcha_pryctda,',
'          s.fcha_real,',
'          s.id_instncia_fljo,',
'          rs.dscrpcion dscrpcion_rspsta,',
'          ac.id_acto,',
'          s.id_slctud,',
'          1 cerrar_pqr,',
'          2 ver,',
'          sc.obsrvcion,',
'          sc.id_slctud_cierre,',
'          (select nmbre_trcro from  v_sg_g_usuarios z where z.id_usrio = sc.id_usrio) usrio_cierre,',
'          sc.fcha_rgstro fcha_cierre,',
'          case when sc.file_blob is not null then ',
'              ''<span class=" fa fa-download fa-1x fa-spin">''',
'          else',
'              null',
'          end as descargar,',
'          sc.file_name,',
'          sc.file_mimetype',
'     from v_pq_g_solicitudes              s',
'     join v_sg_g_usuarios               u   on u.id_usrio = s.id_usrio',
'     join pq_d_estados                  e   on e.id_estdo = s.id_estdo',
'     join pq_g_radicador                r   on r.id_rdcdor = s.id_rdcdor',
'     join pq_g_solicitudes_motivo       sm  on sm.id_slctud = s.id_slctud',
'left join pq_g_solicitudes_mtvo_acto    ac  on ac.id_slctud_mtvo = sm.id_slctud_mtvo',
'     join pq_d_motivos                  m   on m.id_mtvo = sm.id_mtvo',
'left join pq_g_slctdes_mtvo_sjt_impst   sms on sms.id_slctud_mtvo = sm.id_slctud_mtvo',
'     join pq_d_presentaciones_tipo      p   on p.id_prsntcion_tpo = s.id_prsntcion_tpo',
'left join v_df_i_impuestos_subimpuesto  i   on i.id_impsto_sbmpsto = sms.id_impsto_sbmpsto',
'left join pq_d_respuestas               rs  on rs.cdgo_rspsta = s.cdgo_rspsta',
'     join wf_g_instancias_flujo_gnrdo   fg  on fg.id_instncia_fljo = s.id_instncia_fljo',
'     join v_wf_g_instancias_flujo       wf  on wf.id_instncia_fljo = fg.id_instncia_fljo_gnrdo_hjo',
'     join wf_g_instancias_transicion    tr  on tr.id_instncia_fljo = fg.id_instncia_fljo_gnrdo_hjo  ',
'     join wf_d_flujos                   fj  on wf.cdgo_fljo = fj.cdgo_fljo ',
'     join wf_d_flujos_tarea             ft  on  ft.id_fljo_trea = tr.id_fljo_trea_orgen  -- and ft.indcdor_incio = ''S''',
'    join wf_d_flujos_tarea             ft  on ft.id_fljo_trea =  (select id_fljo_trea_orgen',
'                                                                 from wf_g_instancias_transicion',
'                                                                 where id_instncia_fljo = s.id_instncia_fljo_gnrdo ',
'                                                                 order by  id_instncia_trnscion ASC  fetch first 1 rows only)     ',
'                                           --     and ft.indcdor_incio = ''S''  ',
'     left join pq_g_solicitudes_cierre  sc  on sc.id_slctud = s.id_slctud',
'    where s.cdgo_clnte = :F_CDGO_CLNTE',
'      and s.id_estdo  != 4 --Rresuelto',
'      and wf.cdgo_fljo = fj.cdgo_fljo ',
'      and s.nmro_rdcdo_dsplay is not null',
'      and 0 = case when sms.idntfccion = :P35_IDNTFCCION ',
'                  then 0',
'                  when :P35_IDNTFCCION is null',
'                  then 0',
'                  when sms.idntfccion is not null and :P35_IDNTFCCION is not null and :P35_IDNTFCCION = sms.idntfccion',
'                  then 0',
'                  else 1',
'              end',
'     and m.id_mtvo = nvl(:P35_ID_MTVO, m.id_mtvo) ',
'     and e.id_estdo = nvl(:P35_ESTDO, e.id_estdo)',
'     and nvl(rs.cdgo_rspsta,0)  = nvl(:P35_CDGO_RSPSTA, nvl(rs.cdgo_rspsta,0))',
'     and (s.nmro_rdcdo_dsplay   like ''%'' || :P35_NMRO_RDCDO_DSPLAY ||''%'' or :P35_NMRO_RDCDO_DSPLAY is null)',
'     and (TRUNC(s.fcha_rdcdo)   >= TRUNC(TO_DATE(:P35_FCHA_RDCDO_INCIO,''DD/MM/YYYY'')) OR :P35_FCHA_RDCDO_INCIO IS NULL)',
'     and (TRUNC(s.fcha_rdcdo)   <= TRUNC(TO_DATE(:P35_FCHA_RDCDO_FIN,''DD/MM/YYYY''))     OR :P35_FCHA_RDCDO_FIN IS NULL) ',
'     and (TRUNC(s.fcha_pryctda) >= TRUNC(TO_DATE(:P35_FCHA_PRYCTDA_INCIO,''DD/MM/YYYY'')) OR :P35_FCHA_PRYCTDA_INCIO IS NULL) ',
'     and (TRUNC(s.fcha_pryctda) <= TRUNC(TO_DATE(:P35_FCHA_PRYCTDA_FIN,''DD/MM/YYYY''))   OR :P35_FCHA_PRYCTDA_FIN IS NULL) ',
'     and (TRUNC(s.fcha_real)    >= TRUNC(TO_DATE(:P35_FCHA_REAL_INCIO,''DD/MM/YYYY''))    OR :P35_FCHA_REAL_INCIO IS NULL) ',
'     and (TRUNC(s.fcha_real)    <= TRUNC(TO_DATE(:P35_FCHA_REAL_FIN,''DD/MM/YYYY''))      OR :P35_FCHA_REAL_FIN IS NULL) ;',
'     '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(30795444741633906)
,p_heading=>'Cierre'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(118973887876198536)
,p_heading=>'Fecha'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(118974090418198538)
,p_heading=>'Datos del Tributo'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(163604151097473891)
,p_heading=>'Acciones'
);
wwv_flow_api.create_region_column_group(
 p_id=>wwv_flow_api.id(163604222436473892)
,p_heading=>'Datos de la solicitud'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30795081577633902)
,p_name=>'VER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Ver'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
,p_link_target=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:RP,28:P28_ID_SLCTUD,P28_APP_ID,P28_PAGE_ID:&ID_SLCTUD.,&APP_ID.,&APP_PAGE_ID.'
,p_link_text=>'<span class="fa fa-eye" aria-hidden="true"></span>'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30795109299633903)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_api.id(30795444741633906)
,p_use_group_for=>'BOTH'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(30795247946633904)
,p_name=>'USRIO_CIERRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USRIO_CIERRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Usuario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_api.id(30795444741633906)
,p_use_group_for=>'BOTH'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>503
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
 p_id=>wwv_flow_api.id(30795346625633905)
,p_name=>'FCHA_CIERRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CIERRE'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(30795444741633906)
,p_use_group_for=>'BOTH'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30795948045633911)
,p_name=>'DESCARGAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCARGAR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Descargar <br> Archivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(30795444741633906)
,p_use_group_for=>'BOTH'
,p_attribute_01=>'&DESCARGAR.'
,p_link_target=>'f?p=&APP_ID.:35:&SESSION.:DOWNLOAD:&DEBUG.:RP:P35_ID_SLCTUD_CIERRE:&ID_SLCTUD_CIERRE.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30796149917633913)
,p_name=>'ID_SLCTUD_CIERRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD_CIERRE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Slctud Cierre'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>230
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
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
 p_id=>wwv_flow_api.id(30796242760633914)
,p_name=>'FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FILE_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Archivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_api.id(30795444741633906)
,p_use_group_for=>'BOTH'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>255
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
 p_id=>wwv_flow_api.id(30796318218633915)
,p_name=>'FILE_MIMETYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FILE_MIMETYPE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo de <br>Archivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_api.id(30795444741633906)
,p_use_group_for=>'BOTH'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_api.id(36642064005214859)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(36642172365214860)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(37756118950732858)
,p_name=>'CERRAR_PQR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CERRAR_PQR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Cerrar PQR'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(30795444741633906)
,p_use_group_for=>'BOTH'
,p_link_target=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP,37:P37_ID_SLCTUD,P37_ID_SLCTUD_CIERRE:&ID_SLCTUD.,&ID_SLCTUD_CIERRE.'
,p_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-page.png" class="apex-edit-page" alt="">'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(118972697140198524)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Motivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_api.id(163604222436473892)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>400
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(118972724002198525)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_api.id(118974090418198538)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(118972909071198526)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_api.id(118974090418198538)
,p_use_group_for=>'BOTH'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>200
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
 p_id=>wwv_flow_api.id(118972999491198527)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub-Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_api.id(118974090418198538)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(118973064367198528)
,p_name=>'DSCRPCION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_api.id(163604222436473892)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(118973178118198529)
,p_name=>'NMRO_RDCDO_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RDCDO_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00B0 Radicado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_api.id(163604151097473891)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(118973418011198531)
,p_name=>'FCHA_RDCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RDCDO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Radicada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(118973887876198536)
,p_use_group_for=>'HEADING'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>false
,p_max_length=>11
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(118973496981198532)
,p_name=>'FCHA_PRYCTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PRYCTDA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Proyectada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(118973887876198536)
,p_use_group_for=>'HEADING'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>false
,p_max_length=>11
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(119651693907486718)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'&F_CDGO_CLNTE.'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(121792061011127491)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(125158212720740316)
,p_name=>'NMBRE_RDCDOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RDCDOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Radicador'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(163604222436473892)
,p_use_group_for=>'BOTH'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>201
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(133076157153128691)
,p_name=>'FCHA_REAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_REAL'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Cierre'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(118973887876198536)
,p_use_group_for=>'HEADING'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>false
,p_max_length=>11
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(163846598024689091)
,p_name=>'DSCRPCION_RSPSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_RSPSTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Respuesta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_api.id(163604222436473892)
,p_use_group_for=>'BOTH'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(118972612864198523)
,p_internal_uid=>118972612864198523
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
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
 p_id=>wwv_flow_api.id(119188885437899528)
,p_interactive_grid_id=>wwv_flow_api.id(118972612864198523)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(119188986742899528)
,p_report_id=>wwv_flow_api.id(119188885437899528)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30800913041638531)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(30795081577633902)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30811276214968895)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(30795109299633903)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>290
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30811785612968900)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(30795247946633904)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>152
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30812212497968902)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(30795346625633905)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30832342768416286)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(30795948045633911)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30833744051438782)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(30796149917633913)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30852274473484933)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(30796242760633914)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>160
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30852744387484935)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(30796318218633915)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(36648595007245482)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(36642064005214859)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(36649168637245484)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(36642172365214860)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37762078762739775)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(37756118950732858)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119189500323899533)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(118972697140198524)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>211
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119189963711899536)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(118972724002198525)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>203
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119190462325899538)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(118972909071198526)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>184
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119190988154899540)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(118972999491198527)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>210
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119191455034899541)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(118973064367198528)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>88
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119191976286899543)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(118973178118198529)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>124
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119192929000899546)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(118973418011198531)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119193473645899548)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(118973496981198532)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>89
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119853525130741425)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(119651693907486718)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(121797996032132263)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(121792061011127491)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>107
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(126886341062905645)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(125158212720740316)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(133082223042128844)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(133076157153128691)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(163852623355689315)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(163846598024689091)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>121.047
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(113566000001)
,p_view_id=>wwv_flow_api.id(119188986742899528)
,p_execution_seq=>5
,p_name=>'Cerrada'
,p_background_color=>'#99CCFF'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(118973064367198528)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'CERRADA'
,p_is_enabled=>true
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(30656355737130182)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(114692116925898270)
,p_button_name=>'Consultar'
,p_button_static_id=>'btn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(30681184606130238)
,p_branch_name=>'Imprimir'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_XML,P2_ID_RPRTE:<P_ID_MTVO>&P35_ID_MTVO.</P_ID_MTVO><P_ID_ESTDO>&P35_ESTDO.</P_ID_ESTDO><P_CDGO_RSPSTA>&P35_CDGO_RSPSTA.</P_CDGO_RSPSTA><P_NMR_RDCDO_DSPLAY>&P35_NMR_RDCDO_DSPLAY.</P_NMR_RDCDO_DSPLAY><P_FCHA_RDCDO_INCIO>&P35_FCHA_RDCDO_INCIO.</P_FCHA_RDCDO_INCIO><P_FCHA_RDCDO_FIN>&P35_FCHA_RDCDO_FIN.</P_FCHA_RDCDO_FIN><P_FCHA_PRYCTDA_INCIO>&P35_FCHA_PRYCTDA_INCIO.</P_FCHA_PRYCTDA_INCIO><P_FCHA_PRYCTDA_FIN>&P35_FCHA_PRYCTDA_FIN.</P_FCHA_PRYCTDA_FIN><P_FCHA_REAL_INCIO>&P35_FCHA_REAL_INCIO.</P_FCHA_REAL_INCIO><P_FCHA_REAL_FIN>&P35_FCHA_REAL_FIN.</P_FCHA_REAL_FIN><P_CDGO_RSPSTA>&P35_CDGO_RSPSTA.</P_CDGO_RSPSTA><ID_USRIO>&P35_USRIO.</ID_USRIO><P_NMRO_RDCDO_DSPLAY>&P35_NMRO_RDCDO_DSPLAY.</P_NMRO_RDCDO_DSPLAY>,&P35_ID_RPRTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(16594069713846501)
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(30681541118130239)
,p_branch_name=>'Go To Page 17'
,p_branch_action=>'f?p=62000:17:&SESSION.::&DEBUG.:RP,17:P17_ID_PRCSO:9&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30656795855130184)
,p_name=>'P35_ID_MTVO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(114692116925898270)
,p_prompt=>'<b>Motivo</b>'
,p_format_mask=>'DD/MM/YY'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion,',
'       a.id_mtvo',
'  from pq_d_motivos a',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and a.actvo    = ''S'''))
,p_lov_display_null=>'YES'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el motivo que desea consultar'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30657661752130187)
,p_name=>'P35_IDNTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(114692116925898270)
,p_prompt=>unistr('<b>Identificaci\00F3n</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'')" onkeyup="campoMayuscula(this)" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del sujeto de impuesto que desea consultar')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30658529907130188)
,p_name=>'P35_ESTDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(114692116925898270)
,p_prompt=>'<b>Estado</b>'
,p_format_mask=>'DD/MM/YY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,',
'       id_estdo',
' from pq_d_estados',
'where  cdgo_clnte = :F_CDGO_CLNTE',
'',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el Estado de la solicitudes que desea consultar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30659485460130188)
,p_name=>'P35_CDGO_RSPSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(114692116925898270)
,p_prompt=>'<b>Respuesta</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select dscrpcion, cdgo_rspsta from pq_d_respuestas'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30659824540130189)
,p_name=>'P35_FCHA_RDCDO_INCIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(114692116925898270)
,p_prompt=>'<b>Fecha Inicial</b>'
,p_placeholder=>'Radicado'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'P35_FCHA_RDCDO_INCIO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30660213031130189)
,p_name=>'P35_FCHA_RDCDO_FIN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(114692116925898270)
,p_prompt=>'<b>Fecha Final</b>'
,p_placeholder=>'Radicado'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'P35_FCHA_RDCDO_INCIO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Selecione la fecha de radicado inicio y fin que desea consultar'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30661159171130190)
,p_name=>'P35_FCHA_PRYCTDA_INCIO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(114692116925898270)
,p_prompt=>'<b>Fecha Inicial</b>'
,p_placeholder=>'Proyectada'
,p_source=>'P35_FCHA_PRYCTDA_INCIO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30661459166130190)
,p_name=>'P35_FCHA_PRYCTDA_FIN'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(114692116925898270)
,p_prompt=>'<b>Fecha Final</b>'
,p_placeholder=>'Proyectada'
,p_source=>'P35_FCHA_PRYCTDA_INCIO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Selecione la fecha proyectada de inicio y fin que desea consultar'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30662368280130190)
,p_name=>'P35_FCHA_REAL_INCIO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(114692116925898270)
,p_prompt=>'<b>Fecha Inicial</b>'
,p_placeholder=>'Cierre'
,p_source=>'P35_FCHA_REAL_INCIO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30662798427130191)
,p_name=>'P35_FCHA_REAL_FIN'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(114692116925898270)
,p_prompt=>'<b>Fecha Final</b>'
,p_placeholder=>'Cierre'
,p_source=>'P35_FCHA_REAL_INCIO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Selecione la fecha de cierre de inicio y fin que desea consultar'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30663614090130192)
,p_name=>'P35_NMRO_RDCDO_DSPLAY'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(114692116925898270)
,p_prompt=>unistr('<b>N\00BA Radicado</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30664012571130192)
,p_name=>'P35_ESTDO_S'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(114692116925898270)
,p_prompt=>'<b>Estado</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Normal;0,Vencida;1'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30673385909130224)
,p_name=>'P35_ID_SLCTUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(118730640244103417)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30673759108130225)
,p_name=>'P35__ID_ACTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(118730640244103417)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30796071233633912)
,p_name=>'P35_ID_SLCTUD_CIERRE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(118730640244103417)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(30676544965130231)
,p_name=>'Activar Imprimir'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P35_ID_RPRTE'
,p_condition_element=>'P35_ID_RPRTE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P35_ID_RPRTE'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30677078025130233)
,p_event_id=>wwv_flow_api.id(30676544965130231)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30677542017130236)
,p_event_id=>wwv_flow_api.id(30676544965130231)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(30677911560130236)
,p_name=>unistr('Limpiar p\00E1gina')
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(30678364353130236)
,p_name=>'New'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P35_FCHA_RDCDO_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30678854821130236)
,p_event_id=>wwv_flow_api.id(30678364353130236)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//$("#P35_FCHA_RDCDO_FIN").datepicker( {''minDate'': $("#P35_FCHA_RDCDO_INCIO").val()});',
'$("#P35_FCHA_RDCDO_FIN").datepicker(''option'' , ''minDate'' , $("#P35_FCHA_RDCDO_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(30679290946130237)
,p_name=>'New_1'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P35_FCHA_PRYCTDA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30679703245130237)
,p_event_id=>wwv_flow_api.id(30679290946130237)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P35_FCHA_PRYCTDA_FIN").datepicker( ''option'' , ''minDate'' , $("#P35_FCHA_PRYCTDA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(30680197655130237)
,p_name=>'New_1_1'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P35_FCHA_REAL_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30680615585130237)
,p_event_id=>wwv_flow_api.id(30680197655130237)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P35_FCHA_REAL_FIN").datepicker( ''option'' , ''minDate'' , $("#P35_FCHA_REAL_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(30752511700512121)
,p_name=>'Al cerrar modal '
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(118730640244103417)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30752656992512122)
,p_event_id=>wwv_flow_api.id(30752511700512121)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(118730640244103417)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30674546447130229)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DOWNLOAD'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Consulta',
'declare',
'    file_name varchar2(2000);',
'    file_blob blob;',
'    file_mimetype varchar2(1000);',
'begin',
'    select file_blob',
'         , file_name',
'         , file_mimetype',
'      into file_blob',
'         , file_name',
'         , file_mimetype',
'      from pq_g_solicitudes_cierre ',
'     where id_slctud_cierre = :P35_ID_SLCTUD_CIERRE;  ',
'    if (file_blob is not null and  file_name is not null and file_mimetype is not null)then',
'        htp.init;',
'        owa_util.mime_header(file_mimetype, FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(file_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' ||file_name || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(file_blob);',
'        apex_application.stop_apex_engine;',
'    end if;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DOWNLOAD'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30675785390130229)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IniciarFlujoGenerado'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_instncia_fljo number := apex_application.g_f01(1);',
'    v_id_fljo_trea number;',
'    v_url varchar2(4000);',
'    v_id_instncia_fljo_gnrdo wf_g_instancias_flujo_gnrdo.id_instncia_fljo_gnrdo%Type;',
'    ',
'begin',
' begin',
'  apex_json.open_object(); ',
'   begin ',
'   select id_instncia_fljo_gnrdo_hjo into v_id_instncia_fljo_gnrdo from wf_g_instancias_flujo_gnrdo where id_instncia_fljo = v_id_instncia_fljo;',
'   exception when others then ',
'      apex_json.write(''type'', ''ERROR'');',
'      apex_json.write(''msg'', ''No existe flujo generado'');',
'      ',
'   end;       ',
'    ',
'    begin',
'    ',
'        select a.id_fljo_trea_orgen ',
'          into v_id_fljo_trea',
'          from wf_g_instancias_transicion a',
'         where a.id_instncia_fljo = v_id_instncia_fljo_gnrdo',
'           and a.id_estdo_trnscion in (1,2);',
'           ',
'    exception when no_data_found then',
'              ',
'              begin                   ',
'                  select distinct first_value(id_fljo_trea_orgen) over(order by id_instncia_trnscion desc) ',
'                    into v_id_fljo_trea',
'                    from wf_g_instancias_transicion ',
'                   where id_instncia_fljo = v_id_instncia_fljo_gnrdo;',
'                   ',
'              exception when no_data_found  then',
'                        v_id_fljo_trea := null;',
'              end;',
'    end;',
'    ',
'        if nvl(v_id_fljo_trea, -1) > 0 then',
'            apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo_gnrdo );',
'            apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea );            	',
'            v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo_gnrdo,',
'                                                          p_id_fljo_trea     => v_id_fljo_trea,',
'                                                          p_clear_session    => ''S'');',
'        ',
'            apex_json.write(''type'', ''OK'');',
'            apex_json.write(''msg'', ''Url generada exitosamente'');',
'            apex_json.write(''url'', v_url);',
'        ',
'        else',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'', ''No existe tarea destino'');',
'        ',
'        end if;',
'        apex_json.close_object();',
'    ',
'    exception when others then ',
'      apex_json.open_object();',
'      apex_json.write(''type'', ''OK'');',
'      apex_json.write(''msg'',apex_escape.html(sqlerrm));',
'      apex_json.close_object();',
'  end;',
'  ',
'  apex_json.close_all();',
'  ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30676188042130230)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IniciarFlujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_instncia_fljo number := apex_application.g_f01(1);',
'    v_id_fljo_trea number;',
'    v_url varchar2(4000);',
'    v_id_instncia_fljo_gnrdo wf_g_instancias_flujo_gnrdo.id_instncia_fljo_gnrdo%Type;',
'    ',
'begin',
' begin',
'  apex_json.open_object(); ',
'    ',
'    begin',
'    ',
'        select a.id_fljo_trea_orgen ',
'          into v_id_fljo_trea',
'          from wf_g_instancias_transicion a',
'         where a.id_instncia_fljo = v_id_instncia_fljo',
'           and a.id_estdo_trnscion in (1,2);',
'           ',
'    exception when no_data_found then',
'              ',
'              begin                   ',
'                  select distinct first_value(id_fljo_trea_orgen) over(order by id_instncia_trnscion desc) ',
'                    into v_id_fljo_trea',
'                    from wf_g_instancias_transicion ',
'                   where id_instncia_fljo = v_id_instncia_fljo;',
'                   ',
'              exception when no_data_found  then',
'                        v_id_fljo_trea := null;',
'              end;',
'    end;',
'    ',
'        if nvl(v_id_fljo_trea, -1) > 0 then',
'            apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );',
'            apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea );            	',
'            v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo,',
'                                                          p_id_fljo_trea     => v_id_fljo_trea,',
'                                                          p_clear_session    => ''S'');',
'        ',
'            apex_json.write(''type'', ''OK'');',
'            apex_json.write(''msg'', ''Url generada exitosamente'');',
'            apex_json.write(''url'', v_url);',
'        ',
'        else',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'', ''No existe tarea destino'');',
'        ',
'        end if;',
'        apex_json.close_object();',
'    ',
'    exception when others then ',
'      apex_json.open_object();',
'      apex_json.write(''type'', ''OK'');',
'      apex_json.write(''msg'',apex_escape.html(sqlerrm));',
'      apex_json.close_object();',
'  end;',
'  ',
'  apex_json.close_all();',
'  ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30674100953130227)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DOWNLOADFILE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_blob          blob;',
'    v_gn_d_reportes gn_d_reportes%rowtype;    ',
'begin',
'    begin',
'        apex_session.attach( p_app_id     => 66000',
'                           , p_page_id    => 2',
'                           , p_session_id => v(''APP_SESSION'') );',
'',
'        --BUSCAMOS LOS DATOS DE PLANTILLA DE REPORTES',
'        select /*+ RESULT_CACHE */',
'               r.*',
'          into v_gn_d_reportes ',
'          from gn_d_reportes r',
'         where r.id_rprte = 212;',
'',
'        --SETEAMOS EN SESSION LOS ITEMS NECESARIOS PARA GENERAR EL ARCHIVO                    ',
'        apex_util.set_session_state(''P2_XML'', ''<id_slctud>'' || :P35_ID_SLCTUD || ''</id_slctud>'');',
'        apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'',
'        v_blob := apex_util.get_print_document( p_application_id     => 66000, ',
'                                                p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,',
'                                                p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,',
'                                                p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,',
'                                                p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );',
'        htp.init;',
'        owa_util.mime_header(''application/pdf'', FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(v_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' || v_gn_d_reportes.nmbre_rprte || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(v_blob);',
'        apex_application.stop_apex_engine;',
'    end;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30674939796130229)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set_session'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_json.open_object;',
'apex_json.write(''type'', ''OK'');',
'apex_json.close_object;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30675364111130229)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CerrarPQR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
unistr('    v_nmro_rdcdo_dsplay             varchar2(15)  := ''2021-10005705'';----- Ingrese Aqu\00ED n\00FAmero de Radicado'),
'    v_id_instncia_fljo              number;',
'    v_id_instncia_trnscion          number;',
'    v_id_instncia_fljo_gnrdo_hjo    number;',
'',
'begin ',
'    ',
'----- Consultamos instancia del flujo ------    ',
'    select id_instncia_fljo',
'    into v_id_instncia_fljo',
'    from pq_g_solicitudes t ',
'    where t.nmro_rdcdo_dsplay = v_nmro_rdcdo_dsplay;',
'    ',
'----- Consultamos el id instancia transicion ------     ',
'    select e.id_instncia_trnscion, b.id_instncia_fljo_gnrdo_hjo',
'    into v_id_instncia_trnscion, v_id_instncia_fljo_gnrdo_hjo ',
'    from pq_g_solicitudes a',
'    left join wf_g_instancias_flujo_gnrdo b on a.id_instncia_fljo = b.id_instncia_fljo',
'    join wf_g_instancias_flujo c on b.id_instncia_fljo_gnrdo_hjo = c.id_instncia_fljo',
'    join wf_d_flujos d on c.id_fljo = d.id_fljo',
'    join wf_g_instancias_transicion e on c.id_instncia_fljo = e.id_instncia_fljo',
'    join wf_d_flujos_tarea f on e.id_fljo_trea_orgen = f.id_fljo_trea',
'    join wf_d_tareas g on f.id_trea = g.id_trea',
'    join sg_g_usuarios h on e.id_usrio = h.id_usrio',
'    join si_c_terceros i on h.id_trcro = i.id_trcro',
'    join wf_d_estado_transicion j on e.id_estdo_trnscion = j.id_estdo_trnscion',
'    where a.id_instncia_fljo = (v_id_instncia_fljo)',
'    order by a.fcha_rdcdo asc;',
'',
unistr('----- Actualizamos los estados de transici\00F3n ------       '),
'    update wf_g_instancias_transicion ',
'    set id_estdo_trnscion = 3 ',
'    where id_instncia_trnscion = v_id_instncia_trnscion',
'    and id_instncia_trnscion != 3;',
'    ',
'    /*update wf_g_instancias_transicion ',
'    set id_estdo_trnscion = 3 ',
'    where id_instncia_fljo = v_id_instncia_fljo_gnrdo_hjo;*/',
'    ',
'    update wf_g_instancias_flujo ',
'    set estdo_instncia = ''FINALIZADA'' ',
'    where id_instncia_fljo = v_id_instncia_fljo',
'    and id_fljo = 6;',
'    ',
'    update wf_g_instancias_flujo ',
'    set estdo_instncia = ''FINALIZADA'' ',
'    where id_fljo != 6 and id_instncia_fljo = v_id_instncia_fljo_gnrdo_hjo;',
'    ',
'    update pq_g_solicitudes',
'    set id_estdo = 4',
'    where id_instncia_fljo = v_id_instncia_fljo;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
