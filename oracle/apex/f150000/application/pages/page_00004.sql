prompt --application/pages/page_00004
begin
wwv_flow_api.create_page(
 p_id=>4
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Recibos puntuales'
,p_step_title=>'Recibos puntuales'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Portal/js/emisionRecibo.js?v=&APP_SESSION.'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'String.prototype.initCap = function () {',
unistr('   return this.toLowerCase().replace(/(?:^|\005Cs)[a-z\00E1\00E9\00ED\00FA\00F3]/g, function (m) {'),
'      return m.toUpperCase();',
'   });',
'};',
'',
'function calcularTotales(grid) {',
'    let model   = grid.data.model,',
'        records = grid.data.selectedRecords;',
'',
'    let totalDeuda  = 0;',
'    let totalDscto  = 0;',
'    let totalPagar  = 0;',
'    ',
'',
'    if (records.length > 0) {',
'        records.forEach(function(record) {',
'            let deuda = parseFloat(model.getValue(record, "N004"))    || 0;',
'            let dscto = parseFloat(model.getValue(record, "N001")) || 0;',
'',
'            totalDeuda += deuda;',
'            totalDscto += dscto;',
'        });',
'    }',
'    ',
'    totalPagar = totalDeuda - totalDscto;',
'',
'    function formatMoney(num) {',
'      return num.toLocaleString("es-CO", {',
'        style: "currency",',
'        currency: "COP",',
'        minimumFractionDigits: 0,',
'        maximumFractionDigits: 0',
'      });',
'    }',
'',
'    // Items y cajas',
'    const deudaEl = document.getElementById("totalDeuda");',
'    const dsctoEl = document.getElementById("totalDscto");',
'    const pagarEl = document.getElementById("totalPagar");',
'',
'    const deudaBox = deudaEl.closest(".total-box");',
'    const dsctoBox = dsctoEl.closest(".total-box");',
'    const pagarBox = pagarEl.closest(".total-box");',
'',
unistr('    // Mostrar u ocultar seg\00FAn el valor'),
'    if (totalDeuda > 0) {',
'        deudaEl.textContent = formatMoney(totalDeuda);',
'        deudaBox.style.display = "block";',
'    } else {',
'        deudaBox.style.display = "none";',
'    }',
'',
'    if (totalDscto > 0) {',
'        dsctoEl.textContent = formatMoney(totalDscto);',
'        dsctoBox.style.display = "block";',
'    } else {',
'        dsctoBox.style.display = "none";',
'    }',
'',
'    if (totalPagar > 0) {',
'        pagarEl.textContent = formatMoney(totalPagar);',
'        pagarBox.style.display = "block";',
'    } else {',
'        pagarBox.style.display = "none";',
'    }',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery(apex.gPageContext$).on("apexreadyend", async function (e) {',
'    apex.item(''deuda'').hide();',
'    apex.item(''info'').hide();',
'    apex.item(''sujetos'').hide();',
'    apex.item(''btn_rgrsar'').hide();',
'    apex.item(''btn_gnrar'').hide();',
'    jsonConfig = await cargarConfig();',
'    //cargarTipoBusqueda();',
'});',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Region-body>p {',
'    background-color: #fff;',
'    border: 1px solid rgba(0, 0, 0, .1);',
'    color: rgba(255, 0, 0, 0.89);',
'    padding: 1rem;',
'    text-align: center;',
'}',
'',
'.table-inf {',
'    margin-left: 10px;',
'}',
'',
'.table-inf td {',
'    font-size: 14px;',
'    text-align: left;',
'}',
'',
'.table-inf td:nth-child(odd) {',
'    font-weight: 700;',
'}',
'',
'.table-inf td:nth-child(3) {',
'    padding-left: 20rem;',
'}',
'',
'.table-inf td:nth-child(odd)::after {',
'    content: '':''',
'}',
'',
'.table-inf td:nth-child(even) {',
'    padding-left: 5px;',
'}',
'',
'/* CCS DESCUENTOS */',
'',
'/* Contenedor general de los descuentos */',
'.descuentos {',
'  display: flex;',
'  flex-wrap: wrap;',
'  gap: 20px;',
'  justify-content: center;',
'  margin: 20px 0;',
'}',
'',
'/* Cada bloque de descuento */',
'.descuento-box {',
'  background: #f4f9ff;',
'  border-radius: 12px;',
'  padding: 20px;',
'  text-align: center;',
'  flex: 1 1 250px;',
'  box-shadow: 0 2px 6px rgba(0,0,0,0.1);',
'}',
'',
unistr('/* N\00FAmero grande del descuento */'),
'.percent-big {',
'  font-size: 72px;',
'  font-weight: bold;',
'  color: #006FFF;',
'  display: flex;',
'  justify-content: center;',
'  align-items: flex-start;',
'  line-height: 1;',
'  position: relative;  ',
'}',
'',
unistr('/* El n\00FAmero (90) */'),
'.percent-big .num {',
'  font-size: 90px;',
'  font-weight: 800;',
'  color: #006FFF;',
'  margin-right: 5px;',
'  text-shadow: -2px -2px 0 #fff, 2px -2px 0 #fff, -2px 2px 0 #fff, 2px 2px 0 #fff, 4px 4px 6px rgba(0, 0, 0, 0.3);',
'}',
'',
'/* El % badge */',
'.percent-big .percent-badge {',
'  background: #00324d;',
'  color: white;',
'  font-size: 28px;',
'  font-weight: bold;',
'  border-radius: 50%;',
'  padding: 6px 12px;',
'  line-height: 1;',
'  margin-top: 10px;',
'}',
'',
unistr('/* Texto \201CDescuento\201D */'),
'.caption {',
'  font-size: 20px;',
'  font-weight: bold;',
'  margin-top: 10px;',
'  color: #002b45;',
'}',
'',
'/* Subtexto de vigencias */',
'.subcaption {',
'  font-size: 16px;',
'  font-weight: 600;',
'  margin-top: 5px;',
'  color: #009640;',
'}',
'',
'/* Totales container */',
'.totales-container {',
'  display: flex;',
'  justify-content: space-around;',
'  margin-top: 25px;',
'  flex-wrap: wrap;',
'  gap: 15px;',
'}',
'',
'/* Cada bloque de totales */',
'.total-box {',
'  border: 2px solid #006FFF;',
'  border-radius: 12px;',
'  padding: 15px 20px;',
'  text-align: center;',
'  min-width: 220px;',
'  background: #fff;',
'  box-shadow: 0 2px 6px rgba(0,0,0,0.05);',
'}',
'',
'.total-label {',
'  font-size: 14px;',
'  font-weight: bold;',
'  color: #002b45;',
'  margin-bottom: 8px;',
'}',
'',
'.total-value {',
'  font-size: 22px;',
'  font-weight: bold;',
'  color: #000;',
'}',
'',
'.total-value-descuento {',
'  font-size: 22px;',
'  font-weight: bold;',
'  color: #006FFF;',
'}',
'',
'.totales-container {',
'  display: flex;',
unistr('  justify-content: space-around; /* separaci\00F3n equitativa */'),
'  text-align: center;',
'  padding: 15px;',
'  gap: 15px; /* espacio entre las cajas */',
'}',
'',
'.impuesto-nombre {',
unistr('  font-size: 2.5rem;           /* Tama\00F1o grande */'),
'  font-weight: 900;            /* Negrita fuerte */',
'  color: #006FFF;              /* Verde principal */',
unistr('  text-transform: uppercase;   /* May\00FAsculas */'),
'  text-align: center;          /* Centrado */',
'  line-height: 1.2;',
'  margin: 10px 0;',
'',
unistr('  /* Efecto 3D con m\00FAltiples sombras */'),
'  text-shadow: ',
'    -2px -2px 0 #fff,',
'     2px -2px 0 #fff,',
'    -2px  2px 0 #fff,',
'     2px  2px 0 #fff,',
'     4px  4px 6px rgba(0,0,0,0.3);',
'}',
'',
'.impuesto-fecha {',
'  font-size: 1.2rem;',
'  color: #222;',
'  font-weight: 600;',
'  text-align: center;',
'  margin-top: 5px;',
'}',
'',
'.impuesto-fecha strong {',
unistr('  color: #222;   /* D\00EDa en verde */'),
'}',
'',
'/* Eliminar cabecera del IG */',
'#bannerDescuentos .a-GV-hdr {',
'  display: none !important;',
'}',
'',
'#bannerDescuentos .a-IG-header {',
'  display: none !important;',
'}',
'',
'#bannerDescuentos .a-GV-footer {',
'  display: none !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251130094456'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50721182974915313)
,p_plug_name=>unistr('Emisi\00F3n de recibos puntuales')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Si escoge b\00FAsqueda por direcci\00F3n, siga el siguiente formato:<br/>'),
unistr('C: calle, K: carrera Ej. K 10 47B 133 \00F3 C 23 15 42<br/>'),
unistr('Si vive en un apartamento coloque solo la direcci\00F3n del conjunto<br/> 	'),
unistr('No utilice ning\00FAn tipo signo Ej. #, -</p>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6363436110467139)
,p_plug_name=>'Descuentos'
,p_region_name=>'bannerDescuentos'
,p_parent_plug_id=>wwv_flow_api.id(50721182974915313)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   ''<div class="descuentos">''||',
'     listagg(distinct(',
'        ''<div class="descuento-box">''||',
'            ''<div class="percent-big">''||',
'                ''<span class="num">''|| d.prcntje_dscnto * 100 ||''</span>''||',
'                ''<span class="percent-badge">%</span>''||',
'            ''</div>''||',
'            ''<div class="caption">Descuento</div>''||',
'            --''<div class="subcaption">Desde el ''|| d.vgncia_dsde ||'' Hasta el ''|| d.vgncia_hsta ||''</div>''||',
'        ''</div>''',
'        ), ''''',
'     ) within group (order by d.vgncia_dsde)',
'   ||',
'   -- bloque del impuesto (fecha hasta)',
'   ''<div class="descuento-box">''||',
'        ''<div class="impuesto-nombre">''|| a.nmbre_impsto_sbmpsto ||''</div>''||',
'        ''<div class="impuesto-fecha"> Hasta el <strong>''|| extract(day from max(d.fcha_hsta)) ||''</strong> ''||',
'        to_char(max(d.fcha_hsta), ''month'', ''NLS_DATE_LANGUAGE=SPANISH'') ||'' ''||',
'        extract(year from max(d.fcha_hsta)) ||',
'        ''</div>''||',
'        ''<div class="impuesto-fecha"> ''||max(d.dscrpcion)||''</div>''||',
'   ''</div>''||',
'',
'   -- Totales',
'   ''<div class="totales-container">',
'      <div class="total-box">',
'        <div class="total-label"> <strong> ESTO ES LO QUE DEBES  </strong></div>',
'        <div id="totalDeuda" class="total-value">$0,00</div>',
'      </div>',
'      <div class="total-box">',
'        <div class="total-label">  <strong> ESTO ES LO QUE TE AHORRAS  </strong> <b>HOY</b></div>',
'        <div id="totalDscto" class="total-value-descuento">$0,00</div>',
'      </div>',
'      <div class="total-box">',
'        <div class="total-label">  <strong> ESTO ES LO QUE VAS A PAGAR  </strong></div>',
'        <div id="totalPagar" class="total-value">$0,00</div>',
'      </div>',
'    </div>''',
'   as seleccionar',
'from re_g_descuentos_regla d',
'join df_i_impuestos_subimpuesto a on a.id_impsto = d.id_impsto and a.id_impsto_sbmpsto = d.id_impsto_sbmpsto',
'where trunc(sysdate) between d.fcha_dsde and d.fcha_hsta ',
'  and d.actvo = ''S''',
'  and d.id_impsto = :P4_ID_IMPSTO',
'  and d.id_impsto_sbmpsto = :P4_ID_IMPSTO_SBMPSTO',
'  and d.id_cncpto in (595,21,613)',
'  group by a.NMBRE_IMPSTO_SBMPSTO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from re_g_descuentos_regla d',
'join df_i_impuestos_subimpuesto a on a.id_impsto = d.id_impsto and a.id_impsto_sbmpsto = d.id_impsto_sbmpsto',
'where sysdate between d.fcha_dsde and d.fcha_hsta ',
'  and d.actvo = ''S''',
'  and d.id_impsto = :P4_ID_IMPSTO',
'  and d.id_impsto_sbmpsto = :P4_ID_IMPSTO_SBMPSTO',
'  group by a.NMBRE_IMPSTO_SBMPSTO;'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(6363602783467141)
,p_name=>'SELECCIONAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SELECCIONAR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_01=>'&SELECCIONAR.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(6363568495467140)
,p_internal_uid=>6363568495467140
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'NONE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(10518242153804289)
,p_interactive_grid_id=>wwv_flow_api.id(6363568495467140)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(10518380888804289)
,p_report_id=>wwv_flow_api.id(10518242153804289)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10518872102804291)
,p_view_id=>wwv_flow_api.id(10518380888804289)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(6363602783467141)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50721678116915318)
,p_plug_name=>'busqueda'
,p_region_name=>'busqueda'
,p_parent_plug_id=>wwv_flow_api.id(50721182974915313)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50722005466915322)
,p_plug_name=>'Deuda'
,p_region_name=>'deuda'
,p_parent_plug_id=>wwv_flow_api.id(50721182974915313)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c001',
'     , c002',
'     , c003',
'     , c004',
'     , c005',
'     , c006',
'     , c007',
'     , to_char(c008, ''FM$999G999G999G999G999G999G990'')  c008',
'     , to_char(c009, ''FM$999G999G999G999G999G999G990'')  c009',
'     , to_char(c010, ''FM$999G999G999G999G999G999G990'')  c010',
'     , c011',
'     , n001 --Descuentos sin formato',
'     , c008 as n002 -- Deuda sin formato ',
'     , c009 as n003 -- Interes sin formato',
'     , c010 as n004 -- Total sin formato',
'  from apex_collections',
' where collection_name = ''DEUDA''',
'   and c005 != ''CN''  --Req0025513',
' '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>'<strong><i>Vigencias con saldo pendiente</i></strong>'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(6363700706467142)
,p_name=>'N001'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'N001'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(6363889884467143)
,p_name=>'N002'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'N002'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(6363929904467144)
,p_name=>'N003'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'N003'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(6364086058467145)
,p_name=>'N004'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'N004'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50723501035915337)
,p_name=>'C002'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C002'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50723652497915338)
,p_name=>'C003'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C003'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(50723935909915341)
,p_name=>'C004'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C004'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(50724369279915345)
,p_name=>'C008'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C008'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor<br>Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_05=>'BOTH'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_is_required=>false
,p_max_length=>29
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
 p_id=>wwv_flow_api.id(50724456355915346)
,p_name=>'C009'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C009'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Valor<br> Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>29
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
 p_id=>wwv_flow_api.id(50724578976915347)
,p_name=>'C010'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C010'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor <br> Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>29
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
 p_id=>wwv_flow_api.id(54976245190127702)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(55481366783138607)
,p_name=>'C001'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C001'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'C001'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(55481488979138608)
,p_name=>'C005'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C005'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'C005'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(55481555649138609)
,p_name=>'C006'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C006'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'C006'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(55481606226138610)
,p_name=>'C007'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C007'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'C007'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(55481755663138611)
,p_name=>'C011'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C011'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_01=>'&C011.'
,p_link_target=>'#'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(50722185447915323)
,p_internal_uid=>50722185447915323
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_api.id(54882806016199894)
,p_interactive_grid_id=>wwv_flow_api.id(50722185447915323)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(54882969003199894)
,p_report_id=>wwv_flow_api.id(54882806016199894)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10524258103107949)
,p_view_id=>wwv_flow_api.id(54882969003199894)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(6363700706467142)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10525685605122460)
,p_view_id=>wwv_flow_api.id(54882969003199894)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(6363889884467143)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10526107428122462)
,p_view_id=>wwv_flow_api.id(54882969003199894)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(6363929904467144)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10526630039122463)
,p_view_id=>wwv_flow_api.id(54882969003199894)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(6364086058467145)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54950124294897237)
,p_view_id=>wwv_flow_api.id(54882969003199894)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(50723501035915337)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54950669911897239)
,p_view_id=>wwv_flow_api.id(54882969003199894)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(50723652497915338)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54961668385001602)
,p_view_id=>wwv_flow_api.id(54882969003199894)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(50723935909915341)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54963582531001608)
,p_view_id=>wwv_flow_api.id(54882969003199894)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(50724369279915345)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54964082555001610)
,p_view_id=>wwv_flow_api.id(54882969003199894)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(50724456355915346)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54964522884001611)
,p_view_id=>wwv_flow_api.id(54882969003199894)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(50724578976915347)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55779283861311061)
,p_view_id=>wwv_flow_api.id(54882969003199894)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(55481366783138607)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55779740277311063)
,p_view_id=>wwv_flow_api.id(54882969003199894)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(55481488979138608)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55780253714311065)
,p_view_id=>wwv_flow_api.id(54882969003199894)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(55481555649138609)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55780771004311066)
,p_view_id=>wwv_flow_api.id(54882969003199894)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(55481606226138610)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55781266403311068)
,p_view_id=>wwv_flow_api.id(54882969003199894)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(55481755663138611)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50723050107915332)
,p_plug_name=>unistr('Informaci\00F3n B\00E1sica')
,p_region_name=>'info'
,p_parent_plug_id=>wwv_flow_api.id(50721182974915313)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<table class="table-inf"></table>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(54976764789127707)
,p_plug_name=>'sujetos'
,p_region_name=>'sujetos'
,p_parent_plug_id=>wwv_flow_api.id(50721182974915313)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c002 ',
'     , c003',
'     , c004',
'     , c005',
'     , c001     ',
'  from apex_collections',
' where collection_name = ''SUJETOS'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54977022280127710)
,p_name=>'C002'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C002'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Referencia Anterior .'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
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
,p_static_id=>'c001'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54977226572127712)
,p_name=>'C004'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C004'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Propietario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
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
,p_static_id=>'c003'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54977301716127713)
,p_name=>'C005'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C005'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Direcci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
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
,p_static_id=>'c004'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54978393841127723)
,p_name=>unistr('Opci\00F3n')
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>unistr('Opci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_01=>'<button onclick="verSujeto(&C001.,''R'')" style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Ver <span class="fa fa-external-link-square"></span></button>'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104922472976156605)
,p_name=>'C003'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C003'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'C003'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_static_id=>'c002'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104922577806156606)
,p_name=>'C001'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C001'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(54976846303127708)
,p_internal_uid=>54976846303127708
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>false
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
 p_id=>wwv_flow_api.id(55167964964773227)
,p_interactive_grid_id=>wwv_flow_api.id(54976846303127708)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(55168069239773233)
,p_report_id=>wwv_flow_api.id(55167964964773227)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55169028306773254)
,p_view_id=>wwv_flow_api.id(55168069239773233)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(54977022280127710)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>259
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55170012573773257)
,p_view_id=>wwv_flow_api.id(55168069239773233)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(54977226572127712)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>270
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55170582809773259)
,p_view_id=>wwv_flow_api.id(55168069239773233)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(54977301716127713)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>106
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55187781689882352)
,p_view_id=>wwv_flow_api.id(55168069239773233)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(54978393841127723)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104947834633816977)
,p_view_id=>wwv_flow_api.id(55168069239773233)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(104922472976156605)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>289
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104953377036921666)
,p_view_id=>wwv_flow_api.id(55168069239773233)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(104922577806156606)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(50721970590915321)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(50721678116915318)
,p_button_name=>'btn_cnsltar'
,p_button_static_id=>'btn_cnsltar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="margin-top:5px"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(54978492730127724)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(50721182974915313)
,p_button_name=>'btn_rgrsar'
,p_button_static_id=>'btn_rgrsar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP,4:P4_ID_IMPSTO,P4_ID_IMPSTO_SBMPSTO:&P4_ID_IMPSTO.,&P4_ID_IMPSTO_SBMPSTO.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2226931354046002)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(50721182974915313)
,p_button_name=>'btn_rgrsar_pg'
,p_button_static_id=>'btn_rgrsar_pg'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1::'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9667035501371841)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(50723050107915332)
,p_button_name=>'BTN_HSTRIAL_PGOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Historial de Pagos'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(54978531069127725)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(50721182974915313)
,p_button_name=>'btn_gnrar'
,p_button_static_id=>'btn_gnrar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(54980355483127743)
,p_branch_name=>'Go To Page 6'
,p_branch_action=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP,6:P6_ID_IMPSTO:&P4_ID_IMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(54978531069127725)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(85163957474979605)
,p_branch_name=>'Go To Page 33'
,p_branch_action=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.:RP:P33_ID_SJTO_IMPSTO:&P4_ID_SJTO_IMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50721278882915314)
,p_name=>'P4_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(50721678116915318)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50721346763915315)
,p_name=>'P4_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(50721678116915318)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50721461002915316)
,p_name=>'P4_PRMTRO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(50721678116915318)
,p_prompt=>'P4_PRMTRO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50721528768915317)
,p_name=>'P4_TPO_BSQDA'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(50721678116915318)
,p_prompt=>'Tipo de busqueda'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion as value,',
'         a.cdgo_tpo_bsqda_sjto as id',
'from df_s_tipos_busqueda_sujeto a',
'join df_c_impuestos b',
'on b.cdgo_sjto_tpo = a.cdgo_sjto_tpo',
'where b.id_impsto = :P4_ID_IMPSTO;'))
,p_cHeight=>1
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50723224623915334)
,p_name=>'P4_ID_SJTO_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(50721678116915318)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54980194374127741)
,p_name=>'P4_VGNCIA_PRDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(50721678116915318)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50721787731915319)
,p_name=>'al cambiar tipo de busqueda'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4_TPO_BSQDA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50721803540915320)
,p_event_id=>wwv_flow_api.id(50721787731915319)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var valor = $(''#P4_TPO_BSQDA'').find(''[value='' + $(''#P4_TPO_BSQDA'').val() + '']'').text();',
'$(''#P4_PRMTRO_LABEL'').text(valor);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(50722875019915330)
,p_name=>unistr('al hacer clic en el bot\00F3n consultar')
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(50721970590915321)
,p_condition_element=>'P4_PRMTRO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(50722964351915331)
,p_event_id=>wwv_flow_api.id(50722875019915330)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validarSujeto($v(''P4_TPO_BSQDA''),''R'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(54978647177127726)
,p_name=>'al seleccionar un registro de la grilla'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(50722005466915322)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(54978776125127727)
,p_event_id=>wwv_flow_api.id(54978647177127726)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'seleccionarVigencias(this);',
'calcularTotales(this);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50722668511915328)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ValidarSujeto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    tpo_bsqda        varchar2(100) := apex_application.g_x01;',
'    v_prmtros        varchar2(2000) := :P4_PRMTRO ||'':''|| tpo_bsqda ||'':''|| :P4_ID_IMPSTO || '':''|| :F_CDGO_CLNTE || '':''|| :P4_ID_SJTO_IMPSTO;',
'    v_json           json_object_t;',
'    v_prueba         varchar2(1000);',
'    v_j              clob;',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'     ',
'    --v_j := apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''recibo/validarSujeto'',',
'    v_j := apex_web_service.make_rest_request(p_url          => ''http://99.0.3.141:8032/ords/api/recibo/validarSujeto'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''prmtro:tpo_bsqda:impuesto:cliente:idsujeto''),',
'                                                                     p_parm_value   => apex_util.string_to_table(v_prmtros)); ',
'                                                                     ',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''OK'');',
'    apex_json.write(''data'', v_j);',
'    apex_json.close_object;',
'                                                                     ',
'    exception',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''type'', ''error'');',
'            apex_json.write(''o_mnsje_rspsta'', ''asxasx '' || sqlerrm);',
'            apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50723352834915335)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ConsultarDeuda'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_tipo          varchar2(100) := apex_application.g_x01;',
'    v_prmtros       varchar2(2000) := :F_CDGO_CLNTE ||'':''|| :P4_ID_IMPSTO ||'':''|| :P4_ID_IMPSTO_SBMPSTO || '':''|| :P4_ID_SJTO_IMPSTO || '':'' || v_tipo;',
'    v_json_t        json_object_t;',
'    v_json          clob;',
'    v_sql           clob;',
'    v_sql_coll      clob := ''begin apex_collection.create_or_truncate_collection(p_collection_name => ''''DEUDA''''); '';',
'    v_array_t       json_array_t;',
'    v_keys          json_key_list;',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := apex_web_service.make_rest_request( p_url          => :F_DRCCION_SRVDOR_PRVDO ||  ''recibo/calcularDeuda''',
'    --v_json := apex_web_service.make_rest_request( p_url          => ''http://99.0.3.125:8011/ords/api/recibo/calcularDeuda''',
'                                                , p_http_method  => ''POST''',
'                                                , p_parm_name    => apex_util.string_to_table(''cliente:impuesto:subimpuesto:idsujeto:tipo'')',
'                                                , p_parm_value   => apex_util.string_to_table(v_prmtros));         ',
'    v_array_t := json_array_t(v_json);',
'    ',
'    for i in 0..(v_array_t.get_size - 1)',
'    loop        ',
'        v_json_t := json_object_t(v_array_t.get(i));',
'        v_keys   := v_json_t.get_keys(); ',
'        v_sql    := '' apex_collection.add_member( p_collection_name => ''''DEUDA'''''';',
'        for i in 1..v_keys.count loop',
'            v_sql := v_sql || '',p_'' ||v_keys(i) || '' => '''''' || v_json_t.get_String(v_keys(i)) || '''''' '' ;',
'        end loop;',
'        v_sql := v_sql || '');'';',
'        v_sql_coll := v_sql_coll || v_sql ;',
'    end loop;',
'    v_sql_coll := v_sql_coll || '' end;'';',
'    execute immediate v_sql_coll;',
'   ',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''OK''); ',
'    apex_json.write(''sql'' , v_json); ',
'    apex_json.write(''size'' , v_array_t.get_size); ',
'    apex_json.write(''v_sql'' , v_sql); ',
'    ',
'    ',
'    apex_json.close_object;',
'                                                                     ',
'    exception',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'' , sqlerrm);',
'            apex_json.write(''sql'' , v_sql); ',
'            apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(54976581073127705)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ConsultarSujetos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare    ',
'    v_json_t        json_object_t;',
'    v_json          clob;',
'    v_sql           clob; ',
'    v_array_t       json_array_t;',
'    v_keys          json_key_list;',
'begin',
'    for i in 1..apex_application.g_f01.count',
'    loop',
'        v_json := v_json || apex_application.g_f01(i);',
'    end loop;',
'    ',
'    v_sql     := ''select * from json_table(''''''||v_json|| '''''' , ''''$[*]'''' columns('';',
'    v_array_t := json_array_t(v_json);',
'    ',
'    if (v_array_t.get_size > 0) then',
'        v_json_t  := json_object_t(v_array_t.get(0));',
'        v_keys    := v_json_t.get_keys(); ',
'',
'        for i in 1..v_keys.count loop',
'            v_sql := v_sql || ''"'' ||v_keys(i) || ''"'' || '' path ''''$."'' || v_keys(i) || ''"'''','' ;',
'        end loop;',
'    else',
'        v_sql := v_sql || ''n path ''''$.n'''','';',
'    end if; ',
'    ',
'    v_sql := substr(v_sql, 1, length(v_sql) -1 ) || ''))''; ',
'    ',
'    apex_collection.create_collection_from_query( p_collection_name    => ''SUJETOS''',
'                                                , p_query              => v_sql',
'                                                , p_truncate_if_exists => ''YES'');',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''OK''); ',
'    apex_json.write(''sql'' , v_sql); ',
'    ',
'    apex_json.close_object;',
'                                                                     ',
'    exception',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'' , sqlerrm);',
'            apex_json.write(''sql'' , v_sql); ',
'            apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
