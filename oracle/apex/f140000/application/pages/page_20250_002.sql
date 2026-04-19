prompt --application/pages/page_20250_002
begin
wwv_flow_api.create_page(
 p_id=>2025005
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'Mapa'
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Ubicaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/leaflet@1.9.2/dist/leaflet.js?v=202511181635'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Crear capas base',
'var capaOSM = L.tileLayer(''https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'', {',
unistr('    attribution: ''\00A9 OpenStreetMap contributors'''),
'});',
'',
'var capaSatelite = L.tileLayer(''https://{s}.google.com/vt/lyrs=s&x={x}&y={y}&z={z}'', {',
'    maxZoom: 19,',
'    subdomains:[''mt0'',''mt1'',''mt2'',''mt3''],',
unistr('    attribution: ''\00A9 Google Satellite'''),
'});',
'',
'var capaHibrido = L.tileLayer(''https://{s}.google.com/vt/lyrs=y&x={x}&y={y}&z={z}'', {',
'    maxZoom: 19,',
'    subdomains:[''mt0'',''mt1'',''mt2'',''mt3''],',
unistr('    attribution: ''\00A9 Google Hybrid'''),
'});',
'',
'// Crear mapa con capa base por defecto',
'window.mapa = L.map(''mapaLeaflet'', {',
'    center: [8.7483, -75.8815],',
'    zoom: 17,',
'    layers: [capaOSM] // capa base inicial',
'});',
'',
'// Crear grupo de capas base',
'var capasBase = {',
'    "Mapa": capaOSM,',
unistr('    "Sat\00E9lite": capaSatelite,'),
unistr('    "H\00EDbrido": capaHibrido'),
'};',
'',
'// Variable para capa de marcadores ',
'window.markersLayer = L.featureGroup().addTo(window.mapa);',
'',
'// Obtener y parsear JSON',
'var region = document.getElementById("puntos_json");',
'if (!region) {',
unistr('    console.error("No existe la regi\00F3n puntos_json");'),
'    return;',
'}',
'var texto = region.innerText.trim();',
'if (!texto) {',
unistr('    console.warn("La regi\00F3n JSON est\00E1 vac\00EDa");'),
'    return;',
'}',
'var puntos;',
'try {',
'    puntos = JSON.parse(texto);',
'} catch (e) {',
'    console.error("Error parseando JSON: ", e);',
'    return;',
'}',
'',
'// Limpiar marcadores anteriores',
'window.markersLayer.clearLayers();',
'',
'// Agregar marcadores a la capa',
'puntos.forEach(function(p) {',
'    if (p.latitud && p.longitud) {',
'        var popupHtml = `',
'            <div style="',
'                font-family: Arial; ',
'                width: 250px; ',
'                background: #ffffff;',
'                border-radius: 12px;',
'                padding: 12px;',
'                box-shadow: 0 2px 6px rgba(0,0,0,0.15);',
'                border: 1px solid #e0e0e0;',
'            ">',
'                <div style="display: flex; align-items: center; margin-bottom: 8px;">',
'                    <i class="fa-solid fa-location-dot" style="color:#0d6efd; margin-right: 6px;"></i>',
'                    <h3 style="font-size: 16px; margin:0; color:#003366;">',
'                        ${p.nombre}',
'                    </h3>',
'                </div>',
'                <div style="font-size: 13px; color:#444; margin-bottom: 10px; line-height: 1.4;">',
'                    ${p.descripcion}',
'                </div>',
'                <div style="',
'                    background:#d1e7dd; ',
'                    padding:8px; ',
'                    border-radius:8px; ',
'                    font-size:12px; ',
'                    color:#333; ',
'                    margin-bottom:10px;',
'                ">',
'                    <b style="color:#0d6efd;">Latitud:</b> ${p.latitud}<br>',
'                    <b style="color:#0d6efd;">Longitud:</b> ${p.longitud}',
'                </div>',
'            </div>',
'        `;',
'        L.marker([p.latitud, p.longitud])',
'            .bindPopup(popupHtml)',
'            .addTo(window.markersLayer);',
'    }',
'});',
'',
'// Ajustar zoom para mostrar todos los marcadores',
'var bounds = window.markersLayer.getBounds();',
'if (bounds.isValid()) {',
'    window.mapa.fitBounds(bounds);',
'}',
'',
unistr('// Crear grupo de capas de superposici\00F3n (overlays)'),
'var capasOverlay = {',
'    "Puntos": window.markersLayer',
'};',
'',
'// Eliminar control de capas anterior para evitar duplicados',
'if (window.controlCapas) {',
'    window.mapa.removeControl(window.controlCapas);',
'}',
'',
'// Crear control de capas siempre visible (desplegado) y guardar la referencia',
'window.controlCapas = L.control.layers(capasBase, capasOverlay, { collapsed: false }).addTo(window.mapa);',
''))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/leaflet@1.9.2/dist/leaflet.css?v=202511181635'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#puntos_json {',
'               display: none;',
'            }',
'',
'body .ui-dialog .ui-dialog-title,',
'#ui-id-1.ui-dialog-title,',
'h1.ui-dialog-title {',
'    color: #33761f !important;',
'}',
'',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_dialog_width=>'85%'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20251119100849'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15803046862925916)
,p_plug_name=>'Consulta Mapa'
,p_region_name=>'puntos_json'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52107261561074793)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  DECLARE',
'    CURSOR c IS',
'        select  b.idntfccion_sjto nombre,',
'                a.lttud   latitud,',
'                a.lngtud   longitud,',
'                b.drccion descripcion',
'        from si_i_predios  a join v_si_i_sujetos_impuesto b on b.id_sjto_impsto = a.id_sjto_impsto',
'        where a.id_sjto_impsto = :P2025005_ID_SJTO_IMPSTO;  ',
'',
'    l_json CLOB;  ',
'BEGIN',
'',
'--htp.p(''[{"nombre":"TEST","latitud":8.75,"longitud":-75.88,"descripcion":"PRUEBA"}]'');',
' ',
' ',
'    l_json := ''['';',
'',
'    FOR r IN c LOOP',
'        l_json := l_json || ''{"nombre":"'' || r.nombre ||',
'                           ''","latitud":'' || r.latitud ||',
'                           '',"longitud":'' || r.longitud ||',
'                           '',"descripcion":"'' || r.descripcion || ''"},'';',
'    END LOOP;',
'',
unistr('    -- Quitar la \00FAltima coma si existen registros'),
'    IF l_json <> ''['' THEN',
'        l_json := substr(l_json, 1, length(l_json) - 1);',
'    END IF;',
'',
'    l_json := l_json || '']'';',
'',
'    htp.p(l_json);  ',
'    ',
'    --htp.p(''<div id="json_puntos" style="display:none;">'');',
'    --htp.p(l_json);',
'    --htp.p(''</div>'');',
'',
'',
'END;',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15803112197925917)
,p_plug_name=>'Mapa'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(52129532999074802)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div id="mapaLeaflet" style="width: 100%; height: 500px;"></div>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30890832409373311)
,p_name=>'P2025005_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(15803046862925916)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
