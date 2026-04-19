prompt --application/pages/page_00033
begin
wwv_flow_api.create_page(
 p_id=>33
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>'Editar PQR'
,p_step_title=>'Editar PQR'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function imprimir_xls() {',
'    // Obtenemos el valor de ''pqr'' del localStorage',
'    let pqrData = window.localStorage.getItem("pqr");',
'',
unistr('    // Comprobamos si el valor existe y no est\00E1 vac\00EDo'),
'    if (pqrData && pqrData.trim() !== "") {',
'        try {',
'            // Intentamos parsear el JSON',
'            let v_pqr_json = JSON.parse(pqrData);',
'            console.log(v_pqr_json);',
'        } catch (e) {',
unistr('            // Si ocurre un error al parsear, lo manejamos aqu\00ED'),
'            console.error("Error al parsear el JSON:", e);',
'        }',
'    } else {',
unistr('        console.log("No se encontr\00F3 el valor ''pqr'' en localStorage o est\00E1 vac\00EDo.");'),
'    }',
'}',
'',
'',
unistr('// Funci\00F3n para validar la selecci\00F3n'),
'function validar_sel(valid) {',
'    console.log("Entramos a validar");',
'',
'    var region = apex.region("pqr");',
'',
'    if (region) {',
'        console.log("Entramos a if (region)");',
'',
unistr('        // Obt\00E9n la vista del Interactive Grid'),
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'',
'        // Si no hay registros seleccionados, seleccionamos el primer registro',
'        if (records.length === 0) {',
'            console.log("No hay registros seleccionados. Seleccionando el primer registro.");',
'            var firstRecord = view.view$.grid("getRecords")[0]; // Obtener el primer registro',
'            if (firstRecord) {',
'                view.view$.grid("setSelectedRecords", [firstRecord]); // Seleccionamos el primer registro',
'                records = [firstRecord]; // Ahora tenemos el primer registro en la lista de registros seleccionados',
'            }           ',
'        }',
'        ',
'        // Creamos un JSON con los datos seleccionados',
'        var json = records.map(function (record) {',
'            return {',
'                "ID_SOLICITUD": model.getValue(record, "ID_SOLICITUD").trim(),',
'                "NMBRE_RDCDOR": model.getValue(record, "NOMBRE_RADICADOR").trim(),',
'                "ID_RDCDOR": model.getValue(record, "ID_RADICADOR").trim(),',
unistr('                "DSCRPCION": model.getValue(record, "DESCRIPCI\00D3N").trim(),'),
unistr('                "DSCRPCION_ETDO": model.getValue(record, "DESCRIPCI\00D3N_ESTADO").trim(),'),
unistr('                "IDNTFCCION": model.getValue(record, "IDENTIFICACI\00D3N").trim(),'),
'                "IMPSTO": model.getValue(record, "NOMBRE_IMPUESTO").trim(),',
'                "SBIMPSTO": model.getValue(record, "SUBIMPUESTO").trim(),',
'                "ID_INSTNCIA_FLJO": model.getValue(record, "ID_INSTNCIA_FLJO").trim(),',
'                "FLUJO": model.getValue(record, "FLUJO").trim(),',
'                "FCHA_RDCDO": model.getValue(record, "FECHA_RADICADO").trim(),',
'                "EMAIL": model.getValue(record, "EMAIL").trim(),',
'                "DRCCION_NTFCCION": model.getValue(record, "DIRECCION_NOTIFICACION").trim(),',
'                "ID_SLCTNTE": model.getValue(record, "ID_SOLICITANTE").trim(),',
'                "CLLAR": model.getValue(record, "CLLAR").trim(),',
'                "NMRO_RDCDO_FRMTDO": model.getValue(record, "NRO_RADICADO_FORMATEADO").trim(),',
'                "ID_MTVO": model.getValue(record, "ID_MTVO").trim(),',
'                "NMBRE_MTVO": model.getValue(record, "DSCRPCION_MTVO").trim(),',
'                "ID_USRIO": model.getValue(record, "ID_USRIO").trim(),',
'                "DSCRPCION_PRTCPNTE": model.getValue(record, "DSCRPCION_PRTCPNTE").trim(),',
'                "ID_IMPSTO": model.getValue(record, "ID_IMPSTO").trim(),',
'                "ID_SBIMPSTO": model.getValue(record, "ID_IMPSTO_SBMPSTO").trim(),',
'                "ID_TPO": model.getValue(record, "ID_TPO").trim(),',
'                "ID_USRIO_TRSLDA": model.getValue(record, "F_ID_USRIO_TRSLDA").trim()',
'            };',
'        });',
'',
unistr('        // Guardamos el JSON en el localStorage, asegur\00E1ndonos de no guardar valores vac\00EDos'),
'        window.localStorage.setItem(''pqr'', json.length > 0 ? JSON.stringify(json) : JSON.stringify([]));',
'        ',
'',
unistr('        // Habilitamos o deshabilitamos el bot\00F3n seg\00FAn si hay m\00E1s de un registro seleccionado'),
'        if (json.length === 0) {',
'            console.log("Botones deshabilitados");',
'            apex.item("BTN_ACTUALIZAR").disable();',
'        } else {',
'            apex.item(''P33_JSON'').setValue(JSON.stringify(json));',
'            console.log("registros seleccionados");',
'            apex.item("BTN_ACTUALIZAR").enable();',
'        }',
'',
unistr('        // Recuperamos el valor de ''pqr'' desde localStorage y verificamos si es v\00E1lido'),
'        let jsonString = window.localStorage.getItem(''pqr'');',
'        if (jsonString && jsonString.trim() !== "") {',
'            try {',
'                let jsonData = JSON.parse(jsonString);',
'                console.log("Datos recuperados de localStorage:", jsonData);',
'',
'                // Seteamos las variables en APEX con los datos recuperados',
'                apex.item("P33_ID_RDCDOR_ED").setValue(jsonData[0].ID_RDCDOR);',
'                apex.item("P33_IDNTFCCION_ED").setValue(jsonData[0].ID_SLCTNTE);',
'                apex.item("P33_MTVO_PQR_ED").setValue(jsonData[0].ID_MTVO);',
'                apex.item("P33_NMBRE_MTVO_ED").setValue(jsonData[0].NMBRE_MTVO);',
'                apex.item("P33_IMPSTO_ED").setValue(jsonData[0].ID_IMPSTO);',
'                apex.item("P33_SBIMPSTO_ED").setValue(jsonData[0].ID_SBIMPSTO);',
'                apex.item("P33_SBIMPSTO_ED_1").setValue(jsonData[0].ID_SBIMPSTO);',
'                apex.item("P33_EMAIL").setValue(jsonData[0].EMAIL);',
'                apex.item("P33_DRCCION_NTFCCION").setValue(jsonData[0].DRCCION_NTFCCION);',
'                apex.item("P33_CELULAR").setValue(jsonData[0].CLLAR);',
'                apex.item("P33_ID_SJTO_ED").setValue(jsonData[0].IDNTFCCION);',
'                apex.item("P33_ID_SJTO_ED_DESTINO").setValue(jsonData[0].IDNTFCCION);',
'                apex.item("P33_PRTCPNTES").setValue(jsonData[0].ID_USRIO);',
'                apex.item("P33_NMBR_PRTCPNTES").setValue(jsonData[0].DSCRPCION_PRTCPNTE);',
'                apex.item("P33_ID_SOLICITUD").setValue(jsonData[0].ID_SOLICITUD);',
'                apex.item("P33_TPO_SLCTUD").setValue(jsonData[0].ID_TPO);',
'',
'                apex.item("P33_EMAIL_2").setValue(jsonData[0].EMAIL);',
'                apex.item("P33_DRCCION_NTFCCION_2").setValue(jsonData[0].DRCCION_NTFCCION);',
'                apex.item("P33_CELULAR_2").setValue(jsonData[0].CLLAR);',
'            } catch (error) {',
'                console.error("Error al analizar el JSON desde localStorage:", error);',
'            }',
'        } else {',
unistr('            console.log("El valor en localStorage est\00E1 vac\00EDo o no es un JSON v\00E1lido.");'),
'        }',
'',
'        return;',
'    }',
'',
unistr('    // Si no se cumple la condici\00F3n de la regi\00F3n'),
unistr('    console.log("No se encontr\00F3 la regi\00F3n.");'),
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item("editar_novedad").disable();',
'//apex.item("actualizar_novedad").disable();',
'apex.item("P33_JSON").hide();',
'apex.item("P33_MTVO_PQR_ED").hide();',
'apex.item("P33_PRTCPNTES").hide();',
'apex.item("P33_EMAIL_2").hide();',
'apex.item("P33_CELULAR_2").hide();',
'apex.item("P33_DRCCION_NTFCCION_2").hide();',
'apex.item("P33_ID_SOLICITUD").hide();',
'apex.item("P33_NMRO_RDCDO_F").hide();',
'apex.item("P33_ID_SJTO_ED").hide();',
'apex.item("P33_SBIMPSTO_ED_1").hide("");',
'',
'apex.item("P33_JSON").setValue("");',
'apex.item("P33_MTVO_PQR_ED_DESTINO").setValue("");',
'apex.item("P33_ID_SJTO_ED").setValue("");',
'apex.item("P33_ID_RDCDOR_ED").setValue("");',
'apex.item("P33_EMAIL").setValue("");',
'apex.item("P33_CELULAR").setValue("");',
'apex.item("P33_DRCCION_NTFCCION").setValue("");',
'apex.item("P33_IDNTFCCION_ED").setValue("");',
'apex.item("P33_ID_SOLICITUD").setValue("");',
'apex.item("P33_NMRO_RDCDO_F").setValue("");',
'apex.item("P33_OBSRVCION_TRSLDO").setValue("");',
'apex.item("P33_EMAIL_2").setValue("");',
'apex.item("P33_CELULAR_2").setValue("");',
'apex.item("P33_DRCCION_NTFCCION_2").setValue("");',
'apex.item("P33_ID_SJTO_ED_DESTINO").setValue("");',
'apex.item("P33_IMPSTO_ED").setValue("");',
'apex.item("P33_SBIMPSTO_ED").setValue("");',
'apex.item("P33_SBIMPSTO_ED_1").setValue("");',
'apex.item("P33_TPO_SLCTUD").setValue("");',
'apex.item("P33_NMBRE_MTVO_ED").setValue("");',
'apex.item("P33_NMBR_PRTCPNTES").setValue("");',
''))
,p_step_template=>wwv_flow_api.id(71783507231951541)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'MHERRERA'
,p_last_upd_yyyymmddhh24miss=>'20250425144734'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(189149269243436037)
,p_plug_name=>'opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
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
 p_id=>wwv_flow_api.id(189254937565691648)
,p_plug_name=>unistr('Busqueda / Edici\00F3n')
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(189145740935436002)
,p_plug_name=>'<b>Numero de solicitud</b> '
,p_parent_plug_id=>wwv_flow_api.id(189254937565691648)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(189252507203691624)
,p_plug_name=>unistr('Informac\00F3n de la PQR')
,p_parent_plug_id=>wwv_flow_api.id(189254937565691648)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct(s.id_slctud)       ',
'     from pq_g_solicitudes                    s',
'     join pq_g_solicitantes                   b   on s.id_slctud = b.id_slctud',
'     join v_sg_g_usuarios                     u   on u.id_usrio = s.id_usrio',
'     join pq_d_estados                        e   on e.id_estdo = s.id_estdo',
'     join pq_g_radicador                      r   on r.id_rdcdor = s.id_rdcdor',
'     join pq_g_solicitudes_motivo             sm  on sm.id_slctud = s.id_slctud',
'     join pq_d_motivos                        m   on m.id_mtvo = sm.id_mtvo',
'     left join pq_g_slctdes_mtvo_sjt_impst    sms on sms.id_slctud_mtvo = sm.id_slctud_mtvo',
'     join pq_d_presentaciones_tipo            p   on p.id_prsntcion_tpo = s.id_prsntcion_tpo',
'     left join v_df_i_impuestos_subimpuesto   i   on i.id_impsto_sbmpsto = sms.id_impsto_sbmpsto',
'     left join pq_d_respuestas                rs  on rs.cdgo_rspsta = s.cdgo_rspsta',
'     join si_c_terceros                       aa  on aa.id_trcro = u.id_trcro',
'     join wf_g_instancias_flujo               bb  on bb.id_instncia_fljo=s.id_instncia_fljo',
'     join wf_g_instancias_flujo_gnrdo         z   on z.id_instncia_fljo = s.id_instncia_fljo',
'     join wf_g_instancias_transicion          v   on z.id_instncia_fljo_gnrdo_hjo = v.id_instncia_fljo and v.id_estdo_trnscion != 3',
'     join wf_d_flujos_transicion              x   on x.id_fljo_trea = v.id_fljo_trea_orgen',
'     join wf_d_flujos_tarea                   cc  on cc.id_fljo_trea = x.id_fljo_trea',
'     left join v_wf_d_flujos_tarea_prtcpnte        zz  on zz.id_fljo = m.id_fljo and zz.id_prtcpte = v.id_usrio',
'   where s.cdgo_clnte = :F_CDGO_CLNTE',
'   and cc.indcdor_incio =''S''    ',
'     and s.nmro_rdcdo_dsplay = :P33_NMRO_RDCCION',
'     and e.id_estdo not in (5,9)',
'     and m.edta_slctud = ''S'';'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(189145887487436003)
,p_plug_name=>'<b>PQRs</b>'
,p_region_name=>'pqr'
,p_parent_plug_id=>wwv_flow_api.id(189252507203691624)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select * from (',
'select ',
'       --e.id_estdo  Estado,',
'       --s.cdgo_clnte,',
'       s.id_slctud  Id_Solicitud,',
'       b.idntfccion Id_Solicitante,',
'       r.idntfccion Id_Radicador,',
'       s.nmro_rdcdo_dsplay Nmro_Radicado,',
'       s.nmro_rdcdo_dsplay Nro_Radicado_Formateado,',
'       initcap(upper(r.prmer_nmbre || '' '' || r.prmer_aplldo)) Nombre_Radicador,',
unistr('       m.dscrpcion Descripci\00F3n,'),
unistr('       e.dscrpcion Descripci\00F3n_Estado,'),
unistr('       sms.idntfccion Identificaci\00F3n,'),
'       i.id_impsto,',
'       i.id_impsto_sbmpsto,',
'       i.nmbre_impsto Nombre_Impuesto,',
'       i.nmbre_impsto_sbmpsto SubImpuesto,',
'       b.email,',
'       b.drccion_ntfccion Direccion_Notificacion,',
'       b.cllar,',
'       s.fcha_rdcdo Fecha_Radicado,       ',
'       s.id_instncia_fljo Flujo,',
'       rs.dscrpcion Respuesta,',
'       s.id_instncia_fljo id_instncia_fljo,',
'       bb.id_fljo id_fljo,',
'       cc.id_fljo_trea id_fljo_trea,',
'       cc.id_trea id_trea,',
'       cc.indcdor_incio,',
'       s.id_usrio id_usrio,',
'       u.id_trcro  id_trcro,',
'       u.nmbre_trcro usuario_participa,',
'       m.id_mtvo,',
'       s.id_tpo',
'     from pq_g_solicitudes                    s',
'     join pq_g_solicitantes                   b   on s.id_slctud = b.id_slctud',
'     join v_sg_g_usuarios                     u   on u.id_usrio = s.id_usrio',
'     join pq_d_estados                        e   on e.id_estdo = s.id_estdo',
'     join pq_g_radicador                      r   on r.id_rdcdor = s.id_rdcdor',
'     join pq_g_solicitudes_motivo             sm  on sm.id_slctud = s.id_slctud',
'     join pq_d_motivos                        m   on m.id_mtvo = sm.id_mtvo',
'     left join pq_g_slctdes_mtvo_sjt_impst    sms on sms.id_slctud_mtvo = sm.id_slctud_mtvo',
'     join pq_d_presentaciones_tipo            p   on p.id_prsntcion_tpo = s.id_prsntcion_tpo',
'     left join v_df_i_impuestos_subimpuesto   i   on i.id_impsto_sbmpsto = sms.id_impsto_sbmpsto',
'     left join pq_d_respuestas                rs  on rs.cdgo_rspsta = s.cdgo_rspsta',
'     join si_c_terceros                       aa  on aa.id_trcro = u.id_trcro',
'     join wf_g_instancias_flujo               bb  on bb.id_instncia_fljo=s.id_instncia_fljo',
'     join wf_d_flujos_tarea                   cc  on  cc.id_fljo = bb.id_fljo',
'   where s.cdgo_clnte = :F_CDGO_CLNTE',
'   and cc.indcdor_incio =''S''   ',
'     and aa.idntfccion = nvl(TO_CHAR(:P33_ID_SJTO),aa.idntfccion)',
'                  ',
'     and m.id_mtvo = nvl(:P33_MTVO_PQR, m.id_mtvo) ',
'     and s.nmro_rdcdo_dsplay = nvl(:P33_NMRO_RDCCION, s.nmro_rdcdo_dsplay)',
'     and e.id_estdo not in (5,9)',
'     and (TRUNC(s.fcha_rdcdo)   >= TRUNC(TO_DATE(:P33_FCHA_INCIAL,''DD/MM/YYYY'')) OR :P33_FCHA_INCIAL IS NULL) ',
'     and (TRUNC(s.fcha_rdcdo)   <= TRUNC(TO_DATE(:P33_FCHA_FNAL,''DD/MM/YYYY'')) OR :P33_FCHA_FNAL IS NULL));*/',
'     ',
'     ',
'     ',
'     ',
'select distinct',
'       --e.id_estdo  Estado,',
'       --s.cdgo_clnte,',
'       s.id_slctud  Id_Solicitud,',
'       b.idntfccion Id_Solicitante,',
'       r.idntfccion Id_Radicador,',
'       s.nmro_rdcdo_dsplay Nmro_Radicado,',
'       s.nmro_rdcdo_dsplay Nro_Radicado_Formateado,',
'       initcap(upper(r.prmer_nmbre || '' '' || r.prmer_aplldo)) Nombre_Radicador,',
unistr('       m.dscrpcion Descripci\00F3n,'),
unistr('       e.dscrpcion Descripci\00F3n_Estado,'),
unistr('       sms.idntfccion Identificaci\00F3n,'),
'       i.id_impsto,',
'       i.id_impsto_sbmpsto,',
'       i.nmbre_impsto Nombre_Impuesto,',
'       i.nmbre_impsto_sbmpsto SubImpuesto,',
'       b.email,',
'       b.drccion_ntfccion Direccion_Notificacion,',
'       b.cllar,',
'       s.fcha_rdcdo Fecha_Radicado,       ',
'       s.id_instncia_fljo Flujo,',
'       rs.dscrpcion Respuesta,',
'       s.id_instncia_fljo id_instncia_fljo,',
'       bb.id_fljo id_fljo,',
'       cc.id_fljo_trea id_fljo_trea,',
'       cc.id_trea id_trea,',
'       cc.indcdor_incio,',
'       v.id_usrio id_usrio,',
'       ZZ.dscrpcion_prtcpnte,',
'       u.id_trcro  id_trcro,',
'       u.nmbre_trcro usuario_participa,',
'       m.id_mtvo,',
'       m.dscrpcion,',
'       s.id_tpo',
'     from pq_g_solicitudes                    s',
'     join pq_g_solicitantes                   b   on s.id_slctud = b.id_slctud',
'     join v_sg_g_usuarios                     u   on u.id_usrio = s.id_usrio',
'     join pq_d_estados                        e   on e.id_estdo = s.id_estdo',
'     join pq_g_radicador                      r   on r.id_rdcdor = s.id_rdcdor',
'     join pq_g_solicitudes_motivo             sm  on sm.id_slctud = s.id_slctud',
'     join pq_d_motivos                        m   on m.id_mtvo = sm.id_mtvo',
'     left join pq_g_slctdes_mtvo_sjt_impst    sms on sms.id_slctud_mtvo = sm.id_slctud_mtvo',
'     join pq_d_presentaciones_tipo            p   on p.id_prsntcion_tpo = s.id_prsntcion_tpo',
'     left join v_df_i_impuestos_subimpuesto   i   on i.id_impsto_sbmpsto = sms.id_impsto_sbmpsto',
'     left join pq_d_respuestas                rs  on rs.cdgo_rspsta = s.cdgo_rspsta',
'     join si_c_terceros                       aa  on aa.id_trcro = u.id_trcro',
'     join wf_g_instancias_flujo               bb  on bb.id_instncia_fljo=s.id_instncia_fljo',
'     --join wf_d_flujos_tarea                   cc  on cc.id_fljo = bb.id_fljo',
'     join wf_g_instancias_flujo_gnrdo         z   on z.id_instncia_fljo = s.id_instncia_fljo',
'     join wf_g_instancias_transicion          v   on z.id_instncia_fljo_gnrdo_hjo = v.id_instncia_fljo and v.id_estdo_trnscion != 3',
'     join wf_d_flujos_transicion              x   on x.id_fljo_trea = v.id_fljo_trea_orgen --and x.orden <= 6',
'     join wf_d_flujos_tarea                   cc  on cc.id_fljo_trea = x.id_fljo_trea',
'     left join v_wf_d_flujos_tarea_prtcpnte        zz  on zz.id_fljo = m.id_fljo and zz.id_prtcpte = v.id_usrio',
'   where s.cdgo_clnte = :F_CDGO_CLNTE',
'   and cc.indcdor_incio =''S''   ',
'     --and aa.idntfccion = nvl(TO_CHAR(:P33_ID_SJTO),aa.idntfccion)',
'     --and m.id_mtvo = nvl(:P33_MTVO_PQR, m.id_mtvo) ',
'     and s.nmro_rdcdo_dsplay = :P33_NMRO_RDCCION--nvl(:P33_NMRO_RDCCION, s.nmro_rdcdo_dsplay)',
'     and e.id_estdo not in (5,9)',
'     and edta_slctud = ''S''',
'     /*and (TRUNC(s.fcha_rdcdo)   >= TRUNC(TO_DATE(:P33_FCHA_INCIAL,''DD/MM/YYYY'')) OR :P33_FCHA_INCIAL IS NULL) ',
'     and (TRUNC(s.fcha_rdcdo)   <= TRUNC(TO_DATE(:P33_FCHA_FNAL,''DD/MM/YYYY'')) OR :P33_FCHA_FNAL IS NULL);*/'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P33_NMRO_RDCCION'
,p_plug_read_only_when_type=>'ALWAYS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3184089075894503)
,p_name=>'DSCRPCION_MTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>380
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3184272840894505)
,p_name=>'DSCRPCION_PRTCPNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_PRTCPNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>390
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4869066835918301)
,p_name=>'F_ID_USRIO_TRSLDA'
,p_source_type=>'SQL_EXPRESSION'
,p_source_expression=>':F_ID_USRIO'
,p_data_type=>'NUMBER'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>400
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(189150177780436046)
,p_name=>'NOMBRE_RADICADOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE_RADICADOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Radicador'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(189150270048436047)
,p_name=>unistr('DESCRIPCI\00D3N')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('DESCRIPCI\00D3N')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>400
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
 p_id=>wwv_flow_api.id(189150304739436048)
,p_name=>unistr('DESCRIPCI\00D3N_ESTADO')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('DESCRIPCI\00D3N_ESTADO')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n Estado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(189150480980436049)
,p_name=>unistr('IDENTIFICACI\00D3N')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('IDENTIFICACI\00D3N')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(189250265856691601)
,p_name=>'SUBIMPUESTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SUBIMPUESTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Subimpuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(189250373104691602)
,p_name=>'FECHA_RADICADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA_RADICADO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Radicado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'dd/mm/yy'
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
 p_id=>wwv_flow_api.id(189250630708691605)
,p_name=>'FLUJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FLUJO'
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
 p_id=>wwv_flow_api.id(189250740227691606)
,p_name=>'RESPUESTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RESPUESTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Respuesta'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(189251124519691610)
,p_name=>'NRO_RADICADO_FORMATEADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NRO_RADICADO_FORMATEADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nro Radicado Formateado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(189255012345691649)
,p_name=>'ID_RADICADOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RADICADOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>5
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
 p_id=>wwv_flow_api.id(189363816094665701)
,p_name=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMAIL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Email'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>320
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
 p_id=>wwv_flow_api.id(189363916176665702)
,p_name=>'DIRECCION_NOTIFICACION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIRECCION_NOTIFICACION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Direccion Notificacion'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(189364001311665703)
,p_name=>'CLLAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLLAR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Cllar'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(189371638591724501)
,p_name=>'NMRO_RADICADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RADICADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Nmro Radicado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(189371717342724502)
,p_name=>'ID_SOLICITANTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SOLICITANTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
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
 p_id=>wwv_flow_api.id(189371807881724503)
,p_name=>'ID_SOLICITUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SOLICITUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(189405710387678510)
,p_name=>'NOMBRE_IMPUESTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOMBRE_IMPUESTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(236481898714142301)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Instancia Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(236481957533142302)
,p_name=>'ID_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>270
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(236482016663142303)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>280
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(236482165906142304)
,p_name=>'ID_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
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
 p_id=>wwv_flow_api.id(236482210330142305)
,p_name=>'INDCDOR_INCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_INCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFTarea Inicial?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>1
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
 p_id=>wwv_flow_api.id(236482341832142306)
,p_name=>'ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_USRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>310
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
 p_id=>wwv_flow_api.id(236482445914142307)
,p_name=>'ID_TRCRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TRCRO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>320
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
 p_id=>wwv_flow_api.id(236482554845142308)
,p_name=>'USUARIO_PARTICIPA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USUARIO_PARTICIPA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Usuario Registra Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>330
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(237642255785301002)
,p_name=>'ID_MTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_MTVO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>340
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
 p_id=>wwv_flow_api.id(238252206502162902)
,p_name=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>350
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(238252329782162903)
,p_name=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_IMPSTO_SBMPSTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>360
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(239762727551171001)
,p_name=>'ID_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>370
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(189145976555436004)
,p_internal_uid=>189145976555436004
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_no_data_found_message=>'No se encontraron Datos!'
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
 p_id=>wwv_flow_api.id(189151560531448490)
,p_interactive_grid_id=>wwv_flow_api.id(189145976555436004)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(189151696193448492)
,p_report_id=>wwv_flow_api.id(189151560531448490)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3197264067967188)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>53
,p_column_id=>wwv_flow_api.id(3184089075894503)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3203341474215026)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>54
,p_column_id=>wwv_flow_api.id(3184272840894505)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4874457747969406)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>55
,p_column_id=>wwv_flow_api.id(4869066835918301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189257549294691732)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(189150177780436046)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>171
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189258100119691733)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(189150270048436047)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>245
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189258767805691735)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(189150304739436048)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>153
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189259313550691743)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(189150480980436049)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>180
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189260502009691747)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(189250265856691601)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189261188411691749)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(189250373104691602)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189262902254691760)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>31
,p_column_id=>wwv_flow_api.id(189250630708691605)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189263558403691761)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(189250740227691606)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189285641914073245)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(189251124519691610)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>172
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189342260507668552)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>34
,p_column_id=>wwv_flow_api.id(189255012345691649)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189369907343665958)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(189363816094665701)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>224.8
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189370520614665962)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(189363916176665702)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>121
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189371172957665964)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(189364001311665703)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189378079919724755)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(189371638591724501)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189379932791800716)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>39
,p_column_id=>wwv_flow_api.id(189371717342724502)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189383111714878584)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>40
,p_column_id=>wwv_flow_api.id(189371807881724503)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189423733301126517)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(189405710387678510)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(236487819859142883)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(236481898714142301)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(236488357044142891)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(236481957533142302)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(236488838481142893)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(236482016663142303)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(236489382181142895)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>45
,p_column_id=>wwv_flow_api.id(236482165906142304)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(236489818656142898)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(236482210330142305)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(236490369101142900)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>47
,p_column_id=>wwv_flow_api.id(236482341832142306)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(236490805118142902)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>48
,p_column_id=>wwv_flow_api.id(236482445914142307)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(236491319915142925)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(236482554845142308)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>221
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(237656418075498245)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>49
,p_column_id=>wwv_flow_api.id(237642255785301002)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(238302697484396710)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>50
,p_column_id=>wwv_flow_api.id(238252206502162902)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(238303123954396728)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>51
,p_column_id=>wwv_flow_api.id(238252329782162903)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(239768751588173425)
,p_view_id=>wwv_flow_api.id(189151696193448492)
,p_display_seq=>52
,p_column_id=>wwv_flow_api.id(239762727551171001)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(189252688759691625)
,p_plug_name=>'<b>Novedades</b>'
,p_parent_plug_id=>wwv_flow_api.id(189252507203691624)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71814488075951563)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>'select ''muerto'' from dual;'
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(189253790943691636)
,p_name=>'''MUERTO'''
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'''MUERTO'''
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'&#x27;muerto&#x27;'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>6
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
 p_id=>wwv_flow_api.id(189252733925691626)
,p_internal_uid=>189252733925691626
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(189309521678492050)
,p_interactive_grid_id=>wwv_flow_api.id(189252733925691626)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(189309689784492051)
,p_report_id=>wwv_flow_api.id(189309521678492050)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189315354227494839)
,p_view_id=>wwv_flow_api.id(189309689784492051)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(189253790943691636)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(189253845991691637)
,p_plug_name=>unistr('<b>Edici\00F3n PQR</b>')
,p_parent_plug_id=>wwv_flow_api.id(189254937565691648)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71804482016951559)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct(s.id_slctud)       ',
'     from pq_g_solicitudes                    s',
'     join pq_g_solicitantes                   b   on s.id_slctud = b.id_slctud',
'     join v_sg_g_usuarios                     u   on u.id_usrio = s.id_usrio',
'     join pq_d_estados                        e   on e.id_estdo = s.id_estdo',
'     join pq_g_radicador                      r   on r.id_rdcdor = s.id_rdcdor',
'     join pq_g_solicitudes_motivo             sm  on sm.id_slctud = s.id_slctud',
'     join pq_d_motivos                        m   on m.id_mtvo = sm.id_mtvo',
'     left join pq_g_slctdes_mtvo_sjt_impst    sms on sms.id_slctud_mtvo = sm.id_slctud_mtvo',
'     join pq_d_presentaciones_tipo            p   on p.id_prsntcion_tpo = s.id_prsntcion_tpo',
'     left join v_df_i_impuestos_subimpuesto   i   on i.id_impsto_sbmpsto = sms.id_impsto_sbmpsto',
'     left join pq_d_respuestas                rs  on rs.cdgo_rspsta = s.cdgo_rspsta',
'     join si_c_terceros                       aa  on aa.id_trcro = u.id_trcro',
'     join wf_g_instancias_flujo               bb  on bb.id_instncia_fljo=s.id_instncia_fljo',
'     join wf_g_instancias_flujo_gnrdo         z   on z.id_instncia_fljo = s.id_instncia_fljo',
'     join wf_g_instancias_transicion          v   on z.id_instncia_fljo_gnrdo_hjo = v.id_instncia_fljo and v.id_estdo_trnscion != 3',
'     join wf_d_flujos_transicion              x   on x.id_fljo_trea = v.id_fljo_trea_orgen',
'     join wf_d_flujos_tarea                   cc  on cc.id_fljo_trea = x.id_fljo_trea',
'     left join v_wf_d_flujos_tarea_prtcpnte        zz  on zz.id_fljo = m.id_fljo and zz.id_prtcpte = v.id_usrio',
'   where s.cdgo_clnte = :F_CDGO_CLNTE',
'   and cc.indcdor_incio =''S''    ',
'     and s.nmro_rdcdo_dsplay = :P33_NMRO_RDCCION',
'     and e.id_estdo not in (5,9)',
'     and m.edta_slctud = ''S'';'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(189404813239678501)
,p_plug_name=>'Documentos'
,p_parent_plug_id=>wwv_flow_api.id(189253845991691637)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71794297097951554)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_dcmnto as Documento',
'     , d.id_slctud as Id_Solicitud',
'     , d.file_name as Archivo',
unistr('     , d.obsrvcion as Observaci\00F3n'),
unistr('     , md.dscrpcion_dcmnto as Descripci\00F3n'),
'     , d.fcha as Fecha',
'     , case when d.actvo = ''S'' then',
'         ''<span style="color:green;"aria-hidden="true" class="fa fa-check-square"></span>''',
'         else',
'         ''<span style="color:red;"class="fa fa-times-square" aria-hidden="true"></span>''',
'         end actvo ',
'  from pq_g_documentos d',
'  join v_pq_d_motivos_documento md',
'    on d.id_mtvo_dcmnto = md.id_mtvo_dcmnto',
'    where id_slctud = :P33_ID_SOLICITUD '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(189460839966943109)
,p_name=>'DOCUMENTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOCUMENTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_api.id(189460914611943110)
,p_name=>'ID_SOLICITUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SOLICITUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(189461065222943111)
,p_name=>'ARCHIVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ARCHIVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Archivo'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(189461109560943112)
,p_name=>unistr('OBSERVACI\00D3N')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('OBSERVACI\00D3N')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(189461203863943113)
,p_name=>unistr('DESCRIPCI\00D3N')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('DESCRIPCI\00D3N')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(189461381192943114)
,p_name=>'FECHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(189461420305943115)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(189460758823943108)
,p_internal_uid=>189460758823943108
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
 p_id=>wwv_flow_api.id(189473392617948337)
,p_interactive_grid_id=>wwv_flow_api.id(189460758823943108)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(189473446082948337)
,p_report_id=>wwv_flow_api.id(189473392617948337)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189473968634948343)
,p_view_id=>wwv_flow_api.id(189473446082948337)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(189460839966943109)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189474480376948346)
,p_view_id=>wwv_flow_api.id(189473446082948337)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(189460914611943110)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189474969215948348)
,p_view_id=>wwv_flow_api.id(189473446082948337)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(189461065222943111)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189475495538948350)
,p_view_id=>wwv_flow_api.id(189473446082948337)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(189461109560943112)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189475935177948352)
,p_view_id=>wwv_flow_api.id(189473446082948337)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(189461203863943113)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189476492599948353)
,p_view_id=>wwv_flow_api.id(189473446082948337)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(189461381192943114)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(189476978390948356)
,p_view_id=>wwv_flow_api.id(189473446082948337)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(189461420305943115)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(337008569028701208)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>40
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
'    Funcionalidad que permite:<br><br>',
'',
'    <b>1. </b> Editar los datos de una PQR y/o actualizarlos.<br><br>',
'    <b>2. </b>Consultar una PQR.<br><br>   ',
'    <br><br>	',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(189372161360724506)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_api.id(189149269243436037)
,p_button_name=>'BTN_ACTUALIZAR'
,p_button_static_id=>'actualizar_novedad'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>'Actualizar PQR'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct(s.id_slctud)       ',
'     from pq_g_solicitudes                    s',
'     join pq_g_solicitantes                   b   on s.id_slctud = b.id_slctud',
'     join v_sg_g_usuarios                     u   on u.id_usrio = s.id_usrio',
'     join pq_d_estados                        e   on e.id_estdo = s.id_estdo',
'     join pq_g_radicador                      r   on r.id_rdcdor = s.id_rdcdor',
'     join pq_g_solicitudes_motivo             sm  on sm.id_slctud = s.id_slctud',
'     join pq_d_motivos                        m   on m.id_mtvo = sm.id_mtvo',
'     left join pq_g_slctdes_mtvo_sjt_impst    sms on sms.id_slctud_mtvo = sm.id_slctud_mtvo',
'     join pq_d_presentaciones_tipo            p   on p.id_prsntcion_tpo = s.id_prsntcion_tpo',
'     left join v_df_i_impuestos_subimpuesto   i   on i.id_impsto_sbmpsto = sms.id_impsto_sbmpsto',
'     left join pq_d_respuestas                rs  on rs.cdgo_rspsta = s.cdgo_rspsta',
'     join si_c_terceros                       aa  on aa.id_trcro = u.id_trcro',
'     join wf_g_instancias_flujo               bb  on bb.id_instncia_fljo=s.id_instncia_fljo',
'     join wf_g_instancias_flujo_gnrdo         z   on z.id_instncia_fljo = s.id_instncia_fljo',
'     join wf_g_instancias_transicion          v   on z.id_instncia_fljo_gnrdo_hjo = v.id_instncia_fljo and v.id_estdo_trnscion != 3',
'     join wf_d_flujos_transicion              x   on x.id_fljo_trea = v.id_fljo_trea_orgen',
'     join wf_d_flujos_tarea                   cc  on cc.id_fljo_trea = x.id_fljo_trea',
'     left join v_wf_d_flujos_tarea_prtcpnte        zz  on zz.id_fljo = m.id_fljo and zz.id_prtcpte = v.id_usrio',
'   where s.cdgo_clnte = :F_CDGO_CLNTE',
'   and cc.indcdor_incio =''S''    ',
'     and s.nmro_rdcdo_dsplay = :P33_NMRO_RDCCION',
'     and e.id_estdo not in (5,9)',
'     and m.edta_slctud = ''S'';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(236482692976142309)
,p_button_sequence=>180
,p_button_plug_id=>wwv_flow_api.id(189149269243436037)
,p_button_name=>'BTN_TRSLDR_PQR'
,p_button_static_id=>'actualizar_novedad'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Trasladar PQR'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-box-arrow-in-ne'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7611976775845910)
,p_button_sequence=>190
,p_button_plug_id=>wwv_flow_api.id(189149269243436037)
,p_button_name=>'btn_cnccelar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(71867662452951594)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:RP,33::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(189147230405436017)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(189145740935436002)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar PQR'
,p_button_position=>'BODY'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(237072028900683205)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(189145740935436002)
,p_button_name=>'btn_limpiar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(71867754166951595)
,p_button_image_alt=>unistr('Limpiar Datos de Sesi\00F3n')
,p_button_position=>'BODY'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(238942041848403803)
,p_branch_name=>'al presionar btn_traladar'
,p_branch_action=>'begin'||wwv_flow.LF||
'    apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', :F_ID_INSTNCIA_FLJO );'||wwv_flow.LF||
'    apex_util.set_session_state(''F_ID_FLJO_TREA'', :F_ID_FLJO_TREA ); '||wwv_flow.LF||
'    return pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => :F_ID_INSTNCIA_FLJO, p_id_fljo_trea  => :F_ID_FLJO_TREA, p_clear_session => ''S'');'||wwv_flow.LF||
'end;'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_FUNCTION_RETURNING_PAGE'
,p_branch_when_button_id=>wwv_flow_api.id(236482692976142309)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7705676384378501)
,p_branch_name=>'al presionar BTN_ACTUALIZAR'
,p_branch_action=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:RP,33:P50_NMRO_RDCDO_DSPLAY:&P33_NMRO_RDCCION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(189372161360724506)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3183822087894501)
,p_name=>'P33_MTVO_PQR_ED_DESTINO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>'<b>Motivo destino PQR </b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion , id_mtvo ',
'from pq_d_motivos  ',
'WHERE cdgo_clnte=:F_CDGO_CLNTE',
'and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3183965527894502)
,p_name=>'P33_PRTCPNTES_DESTINO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>'<b>Participante destino</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct a.dscrpcion_prtcpnte as d, a.id_prtcpte as r',
'  from v_wf_d_flujos_tarea_prtcpnte   a ',
'  join v_pq_d_motivos                 b on b.id_fljo = a.id_fljo  and a.actvo = ''S'' and TPO_PRTCPNTE = ''USUARIO''',
'  join v_wf_d_flujos_tarea            c on c.id_fljo_trea = a.id_fljo_trea and c.id_fljo = a.id_fljo and indcdor_incio = ''S''',
' where b.id_mtvo = nvl(:P33_MTVO_PQR_ED_DESTINO,:P33_MTVO_PQR_ED)',
'  and a.actvo = ''S''; '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P33_MTVO_PQR_ED_DESTINO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3184191783894504)
,p_name=>'P33_NMBRE_MTVO_ED'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>'<b>Motivo actual PQR :</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3184332926894506)
,p_name=>'P33_NMBR_PRTCPNTES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>'<b>Participantes actual</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3184479419894507)
,p_name=>'P33_EMAIL_2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>unistr('<b>Correo Electr\00F3nico</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3184595559894508)
,p_name=>'P33_CELULAR_2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>'<b>Celular</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>23
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3184697811894509)
,p_name=>'P33_DRCCION_NTFCCION_2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>unistr('<b>Direcci\00F3n Notificaci\00F3n</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7693313859684401)
,p_name=>'P33_ID_SJTO_ED_DESTINO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>unistr('<b>Identificaci\00F3n Sujeto</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7755957658552501)
,p_name=>'P33_SBIMPSTO_ED_1'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>'<b>SubImpuesto</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77585658426297601)
,p_name=>'P33_TPO_SLCTUD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>'<b>Tipo solicitud</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion',
'     , id_tpo',
'  from pq_d_tipos',
'  where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189146137051436006)
,p_name=>'P33_NMRO_RDCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(189145740935436002)
,p_prompt=>unistr('<b>N\00FAmero Radicaci\00F3n</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(71867060529951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189146434985436009)
,p_name=>'P33_FCHA_INCIAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(189145740935436002)
,p_prompt=>'<b>Fecha Inicial</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189146604686436011)
,p_name=>'P33_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(189145740935436002)
,p_prompt=>'<b>Impuesto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  nmbre_impsto as d, ',
'        id_impsto as r ',
'from v_df_i_impuestos_subimpuesto ',
'WHERE cdgo_clnte=:F_CDGO_CLNTE ',
'--and id_impsto = (select  id_impsto as r  from V_pq_g_solicitudes where id_slctud=:P33_ID_SOLICITUD)',
'--and id_impsto =  nvl((select  id_impsto as r  from V_pq_g_solicitudes where id_slctud=:P33_ID_SOLICITUD),id_impsto)',
'GROUP BY nmbre_impsto, id_impsto;'))
,p_lov_display_null=>'YES'
,p_colspan=>6
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189146722835436012)
,p_name=>'P33_ID_SJTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(189145740935436002)
,p_prompt=>unistr('<b>Identificaci\00F3n Sujeto</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189146934536436014)
,p_name=>'P33_IMPSTO_SBIMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(189145740935436002)
,p_prompt=>'<b>Sub-impuesto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  nmbre_impsto_sbmpsto as d, id_impsto_sbmpsto as r ',
'from v_df_i_impuestos_subimpuesto ',
'WHERE (id_impsto = :P33_IMPSTO or :P33_IMPSTO is null );',
''))
,p_lov_display_null=>'YES'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189147061495436015)
,p_name=>'P33_MTVO_PQR'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(189145740935436002)
,p_prompt=>'<b>Motivo PQR</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as r, id_mtvo as d from pq_d_motivos;',
''))
,p_lov_display_null=>'YES'
,p_colspan=>5
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'68%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189147154280436016)
,p_name=>'P33_FCHA_FNAL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(189145740935436002)
,p_prompt=>'<b>Fecha Final</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189149118825436036)
,p_name=>'P33_ID_NVDAD'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(189145740935436002)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189254183583691640)
,p_name=>'P33_IMPSTO_ED'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>'<b>Impuesto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  nmbre_impsto as d, ',
'        id_impsto as r ',
'from v_df_i_impuestos_subimpuesto ',
'WHERE cdgo_clnte=:F_CDGO_CLNTE ',
'and id_impsto = id_impsto',
'--and id_impsto =  nvl((select  id_impsto as r  from V_pq_g_solicitudes where id_slctud=:P33_ID_SOLICITUD),id_impsto)',
'GROUP BY nmbre_impsto, id_impsto;',
''))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189254536160691644)
,p_name=>'P33_ID_SJTO_ED'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>unistr('<b>Identificaci\00F3n Sujeto</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189254631944691645)
,p_name=>'P33_IDNTFCCION_ED'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('<b>Identificaci\00F3n Solicitante :</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189254759739691646)
,p_name=>'P33_MTVO_PQR_ED'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>'New'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(71867177152951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189255138323691650)
,p_name=>'P33_ID_RDCDOR_ED'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>unistr('<b>Identificaci\00F3n Radicador</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189345366699897201)
,p_name=>'P33_DRCCION_NTFCCION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>unistr('<b>Direcci\00F3n Notificaci\00F3n</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189345423722897202)
,p_name=>'P33_EMAIL'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>unistr('<b>Correo Electr\00F3nico</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189345536253897203)
,p_name=>'P33_CELULAR'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>'<b>Celular</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>23
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189371910335724504)
,p_name=>'P33_ID_SOLICITUD'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>'New'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(71867177152951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189372095386724505)
,p_name=>'P33_SBIMPSTO_ED'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>'<b>SubImpuesto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  nmbre_impsto_sbmpsto as d, id_impsto_sbmpsto as r ',
'from v_df_i_impuestos_subimpuesto ',
'WHERE id_impsto= :P33_IMPSTO_ED ;',
'',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P33_IMPSTO_ED'
,p_ajax_items_to_submit=>'P33_SBIMPSTO_ED'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(71866920750951592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189405858705678511)
,p_name=>'P33_NMRO_RDCDO_F'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>'New'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(71867177152951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(235962464526105303)
,p_name=>'P33_PRTCPNTES'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>'New'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(71867177152951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(236571287588467101)
,p_name=>'P33_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(189252507203691624)
,p_prompt=>'New'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(71867177152951592)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(237321259879953101)
,p_name=>'P33_ID_USRIO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(239754537047055501)
,p_name=>'P33_OBSRVCION_TRSLDO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(189253845991691637)
,p_prompt=>unistr('<b>Observaci\00F3n Traslado</b>')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>90
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(71867215129951593)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(77585721776297602)
,p_validation_name=>'al actualizar'
,p_validation_sequence=>10
,p_validation=>'P33_OBSRVCION_TRSLDO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Se debe ingresar una observaci\00F3n')
,p_when_button_pressed=>wwv_flow_api.id(189372161360724506)
,p_associated_item=>wwv_flow_api.id(239754537047055501)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(189252386846691622)
,p_name=>'Al seleccionar registro'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(189145887487436003)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(189252422266691623)
,p_event_id=>wwv_flow_api.id(189252386846691622)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('                // Llamar a la funci\00F3n de validaci\00F3n'),
'                validar_sel();',
'                ',
'                // Obtener el JSON almacenado en localStorage',
'                var json = JSON.parse(localStorage.getItem("pqr"));',
'                    // Asignar valores de los datos al formulario de APEX',
'                    apex.item("P33_NMRO_RDCDO_F").setValue(json[0].NMRO_RDCDO_FRMTDO);',
'                    apex.item("P33_ID_RDCDOR_ED").setValue(json[0].ID_RDCDOR);',
'                    apex.item("P33_IDNTFCCION_ED").setValue(json[0].ID_SLCTNTE);',
'                    apex.item("P33_MTVO_PQR_ED").setValue(json[0].ID_MTVO);',
'                    apex.item("P33_NMBRE_MTVO_ED").setValue(json[0].NMBRE_MTVO);',
'                    apex.item("P33_IMPSTO_ED").setValue(json[0].ID_IMPSTO);',
'                    apex.item("P33_SBIMPSTO_ED").setValue(json[0].ID_SBIMPSTO);',
'                    apex.item("P33_SBIMPSTO_ED1").setValue(jsonData[0].ID_SBIMPSTO);',
'                    apex.item("P33_EMAIL").setValue(json[0].EMAIL);',
'                    apex.item("P33_DRCCION_NTFCCION").setValue(json[0].DRCCION_NTFCCION);',
'                    apex.item("P33_CELULAR").setValue(json[0].CLLAR);',
'                    apex.item("P33_ID_SJTO_ED").setValue(json[0].IDNTFCCION);',
'                    apex.item("P33_PRTCPNTES").setValue(json[0].ID_USRIO);',
'                    apex.item("P33_NMBR_PRTCPNTES").setValue(json[0].DSCRPCION_PRTCPNTE);',
'                    apex.item("P33_ID_SOLICITUD").setValue(json[0].ID_SOLICITUD);',
'                    apex.item("P33_TPO_SLCTUD").setValue(json[0].ID_TPO);',
'',
'                    apex.item("P33_EMAIL_2").setValue(json[0].EMAIL);',
'                    apex.item("P33_DRCCION_NTFCCION_2").setValue(json[0].DRCCION_NTFCCION);',
'                    apex.item("P33_CELULAR_2").setValue(json[0].CLLAR);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(237072107372683206)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'limpiar'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(237072028900683205)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(189372208327724507)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar_PQR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json            clob;',
'    v_indcdor_trsldo  varchar2(1);',
'    v_cdgo_rspsta     number;',
'    o_cdgo_rspsta     number;',
'    v_id_mtvo_pqr_ed  number;',
'    v_id_partcpntes   number;',
'    v_id_sjto         varchar2(1000);',
'    v_cumple          varchar2(1);',
'    v_mnsje_rspsta    varchar2(3000);',
'    o_mnsje_rspsta    varchar2(3000);',
'    --p_cdgo_clnte      number;',
'    v_exception exception;',
'    v_id_sjto_impsto  number;',
'    v_vldar_sjto_impsto varchar2(2);',
'',
'begin',
'',
'      /*insert into muerto (n_001, v_001, t_001) values (999,:P33_IDNTFCCION_ED, sysdate); commit;',
'      insert into muerto (n_001, v_001, t_001) values (999, ''Actualizo la tabla de traza'', sysdate); commit;*/',
'     ',
'     for i in 1..APEX_APPLICATION.g_f01.count loop',
'               v_json :=  v_json || apex_application.g_f01(i);',
'     end loop;    ',
'     ',
'     if(:P33_MTVO_PQR_ED_DESTINO is not null)then',
'         v_id_mtvo_pqr_ed := :P33_MTVO_PQR_ED_DESTINO;',
'     else',
'         v_id_mtvo_pqr_ed := :P33_MTVO_PQR_ED;',
'     end if;',
'     ',
'     if(:P33_PRTCPNTES_DESTINO is not null)then',
'         v_id_partcpntes := :P33_PRTCPNTES_DESTINO;',
'     else',
'         v_id_partcpntes := :P33_PRTCPNTES;',
'     end if;',
'     ',
'     if :P33_ID_SJTO_ED_DESTINO <> nvl(:P33_ID_SJTO_ED,''0'') then',
'         v_id_sjto := :P33_ID_SJTO_ED_DESTINO;',
'     else',
'         v_id_sjto := :P33_ID_SJTO_ED;',
'     end if;',
'     ',
'     If(:P33_EMAIL_2 <> :P33_EMAIL or :P33_CELULAR_2  <> :P33_CELULAR or :P33_DRCCION_NTFCCION_2 <> :P33_DRCCION_NTFCCION or :P33_MTVO_PQR_ED_DESTINO <> :P33_MTVO_PQR_ED or ',
'        :P33_PRTCPNTES_DESTINO <> :P33_PRTCPNTES_DESTINO or :P33_ID_SJTO_ED_DESTINO IS NOT NULL or :P33_SBIMPSTO_ED <> :P33_SBIMPSTO_ED_1 or :P33_PRTCPNTES_DESTINO <> :P33_PRTCPNTES)  then',
'        ',
'         BEGIN',
'             select edta_slctud,vldar_sjto_impsto-- edita solicitud',
'             into v_indcdor_trsldo, v_vldar_sjto_impsto',
'             from pq_d_motivos',
'             where id_mtvo = v_id_mtvo_pqr_ed;',
'          EXCEPTION',
'              WHEN OTHERS THEN',
'                  v_cdgo_rspsta   := 10;',
'                  o_mnsje_rspsta  := ''No se encontro indicador de traslado. Favor verificar!!''; ',
'                  raise_application_error(-20001, o_mnsje_rspsta);',
'         END;',
'            ',
'         ',
'         --Insertamos el movimiento del traslado para traza ',
'         if v_indcdor_trsldo = ''S''  Then',
'             if v_vldar_sjto_impsto = ''S'' then',
'                 begin',
'                     --Se consulta el sujeto impuesto',
'                     select  id_sjto_impsto',
'                     into    v_id_sjto_impsto',
'                     from    v_si_i_sujetos_impuesto',
'                     where   cdgo_clnte      =   :F_CDGO_CLNTE',
'                     and     id_impsto       =   :P33_IMPSTO_ED',
'                     and     idntfccion_sjto =   v_id_sjto',
'                     and     id_sjto_estdo   =   1;',
'                 exception',
'                     when others then',
'                         v_cdgo_rspsta   := 15;',
unistr('                         o_mnsje_rspsta  := '' No fue posible validar la identificaci\00F3n!''; '),
'                         raise_application_error(-20001, o_mnsje_rspsta);',
'                 end;',
'             end if;',
'             ',
'             begin',
'                 pkg_pq_pqr.prc_rg_pqg_slctdes_tsldo_trza ( p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                                                  --        p_id_solicitud => v_id_usrio_trslda ,',
'                                                            p_json         => :P33_JSON,',
'                                                            p_mtvo_pqr_nva => :P33_MTVO_PQR_ED_DESTINO,',
'                                                            p_id_impsto    => :P33_IMPSTO_ED,',
'                                                            p_id_sbimpsto  => :P33_SBIMPSTO_ED,',
'                                                            p_email        => :P33_EMAIL,',
'                                                            p_drccion      => :P33_DRCCION_NTFCCION,',
'                                                            p_cllar        => :P33_CELULAR,',
'                                                            p_idntfccion   => v_id_sjto,',
'                                                            p_obsrvcion    => :P33_OBSRVCION_TRSLDO,',
'                                                            o_cdgo_rspsta  => v_cdgo_rspsta,',
'                                                            o_mnsje_rspsta => v_mnsje_rspsta);    ',
'             exception',
'                 when others then ',
'                     v_cdgo_rspsta   :=  20;',
'                     o_mnsje_rspsta  := ''Error al insertar registros de la traza. Favor verificar!!''; ',
'                     raise_application_error(-20001, o_mnsje_rspsta);',
'             end;',
'',
'             -- ACTUALIZA_MOTIVO_PQR(P_NMRO_RDCDO_DSPLAY=>:P33_NMRO_RDCDO_F,',
'',
'             begin',
'                 pkg_pq_pqr.prc_rg_actualiza_motivo_pqr (P_NMRO_RDCDO_DSPLAY=>:P33_NMRO_RDCDO_F,                     ',
'                                                         P_ID_RDCDOR        =>:P33_ID_RDCDOR_ED,',
'                                                         P_ID_SLCTNTE       =>:P33_IDNTFCCION_ED,',
'                                                         P_ID_MTVO_NUEVO    => v_id_mtvo_pqr_ed,',
'                                                         P_ID_IMPSTO        =>:P33_IMPSTO_ED,',
'                                                         P_ID_SBIMPSTO       =>:P33_SBIMPSTO_ED,',
'                                                         P_EMAIL            =>:P33_EMAIL,',
'                                                         P_DRCCION          =>:P33_DRCCION_NTFCCION,',
'                                                         P_CLLAR            =>:P33_CELULAR,',
'                                                         P_IDNTFCCION       => v_id_sjto,',
'                                                         P_ID_USRIO         => v_id_partcpntes,',
'                                                         P_CDGO_CLNTE       =>:F_CDGO_CLNTE,',
'                                                         O_CDGO_RSPSTA      => v_cdgo_rspsta,',
'                                                         O_MNSJE_RSPSTA     => v_mnsje_rspsta',
'                                                        );',
'             exception',
'                 when others then ',
'                     v_cdgo_rspsta   :=  30;',
'                     o_mnsje_rspsta  := ''Error al actualizar motivo del PQR. Favor verificar!!''; ',
'                     raise_application_error(-20001, o_mnsje_rspsta);',
'             end;',
'',
'         else',
'             v_cdgo_rspsta   := 50;',
unistr('             o_mnsje_rspsta  := ''El motivo de PQR seleccionado no permite la acci\00F3n de taslado. Favor verificar!!''; '),
'             raise_application_error(-20001, o_mnsje_rspsta);',
'         end if; ',
'     else',
'         v_cdgo_rspsta   :=  60;',
'         o_mnsje_rspsta  := ''no existen modificaciones de la PQR!!''; ',
'         raise_application_error(-20001, o_mnsje_rspsta);',
'     end if;',
'     ',
'      ',
'  ',
'    if(v_cdgo_rspsta = 0) then',
'        commit;',
'    end if;',
'',
'End;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(189372161360724506)
,p_process_success_message=>'!PQR ACTUALIZADA EXITOSAMENTE!'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(236482719348142310)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Trasladar_PQR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json            clob;',
'    v_indcdor_trsldo  varchar2(1);',
'    v_cdgo_rspsta     number;',
'     o_cdgo_rspsta    number;',
'    v_mnsje_rspsta    varchar2(3000);',
'    o_mnsje_rspsta    varchar2(3000);',
'    --p_cdgo_clnte      number;',
'    v_exception exception;',
'begin',
'',
'      insert into muerto (n_001, v_001, t_001) values (999,:P33_IDNTFCCION_ED, sysdate); commit;',
'      insert into muerto (n_001, v_001, t_001) values (999, ''Actualizo la tabla de traza'', sysdate); commit;',
'      insert into muerto (n_001, C_001, t_001) values (999, :P33_JSON, sysdate); commit;',
'      ',
'     for i in 1..APEX_APPLICATION.g_f01.count loop',
'               v_json :=  v_json || apex_application.g_f01(i);',
'',
'               insert into muerto (n_001,C_001,v_001,v_002,t_001) values(1022,v_json,''en el for 2 EXC'',null , systimestamp); commit;',
'     end loop;    ',
'      ',
'         select indcdor_trsldo into v_indcdor_trsldo from pq_d_motivos',
'         where id_mtvo =:P33_MTVO_PQR_ED;',
'         ',
'         IF v_indcdor_trsldo = ''S'' Then',
'              pkg_pq_pqr.prc_rg_pqg_slctdes_tsldo_trza(p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                                         --        p_id_solicitud =>   ,',
'                                                   p_json         => :P33_JSON,',
'                                                   o_cdgo_rspsta  => v_cdgo_rspsta,',
'                                                   o_mnsje_rspsta => v_mnsje_rspsta);                              ',
'                                ',
'                       if v_cdgo_rspsta > 0 then',
'                           raise v_exception; ',
'                        else',
'                             commit;',
'                        end if;',
'',
'                  insert into muerto (n_001, v_001, t_001) values (999, ''v_cdgo_rspsta ''||v_cdgo_rspsta, sysdate); commit;',
'                  insert into muerto (n_001, v_001, t_001) values (999, ''v_mnsje_rspsta ''||v_mnsje_rspsta, sysdate); commit;   ',
'               --raise_application_error(-20001, '' cdgo respuesta [''||v_cdgo_rspsta||'' msg [''||v_mnsje_rspsta||'']'' );',
'              else',
'                o_cdgo_rspsta   := 1;',
unistr('                o_mnsje_rspsta  := ''El motivo de PQR seleccionado no permite la acci\00F3n de taslado. Facor verificar!!''; '),
'                return;',
'              end if;',
' ',
' /*',
'                 ACTUALIZA_MOTIVO_PQR(P_NMRO_RDCDO_DSPLAY=>:P33_NMRO_RDCDO_F,',
'                                      P_ID_RDCDOR        =>:P33_ID_RDCDOR_ED,',
'                                      P_ID_SLCTNTE       =>:P33_IDNTFCCION_ED,',
'                                      P_ID_MTVO_NUEVO    =>:P33_MTVO_PQR_ED,',
'                                      P_ID_IMPSTO        =>:P33_IMPSTO_ED,',
'                                      P_ID_SBMPSTO       =>:P33_SBIMPSTO_ED,',
'                                      P_EMAIL            =>:P33_EMAIL,',
'                                      P_DRCCION          =>:P33_DRCCION_NTFCCION,',
'                                      P_CLLAR            =>:P33_CELULAR,',
'                                      P_IDNTFCCION       =>:P33_ID_SJTO_ED',
'                                     );',
' */                                    ',
'        if(v_cdgo_rspsta != 0) then',
'       RAISE_APPLICATION_ERROR (-20001, v_mnsje_rspsta); ',
'       end if;',
'                                       ',
'',
'End;'))
,p_process_error_message=>'!NO SE PUDO GENERAR LA TRAZA DE L REGISTRO!'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_comment=>'x'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(235962577669105304)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TrasladoPqr'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' v_cdgo_rspsta number;',
' v_mnsje_rspsta varchar2(4000);',
' v_json clob;',
' v_exception exception;',
'begin',
'',
'    prc_rg_pqg_slctdes_tsldo_trza(:F_CDGO_CLNTE,',
'                                   v_json,',
'                                   v_cdgo_rspsta,',
'                                   v_mnsje_rspsta);',
'                                ',
'   if v_cdgo_rspsta > 0 then',
'       raise v_exception; ',
'    else',
'         commit;',
'    end if;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta); ',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'    ',
'    exception',
'	    when v_exception then',
'			rollback;',
'			apex_json.open_object;',
'			apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'			apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'			apex_json.close_object;  ',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
