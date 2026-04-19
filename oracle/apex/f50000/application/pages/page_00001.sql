prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Inicio'
,p_step_title=>'Inicio'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function iraTarea(id_instncia_fljo, id_fljo_trea){',
'    $s("P1_INSTANCIA_FLUJO", id_instncia_fljo);',
'    $s("P1_ID_FLJO_TREA"   , id_fljo_trea);',
'    ',
'    apex.server.process(''asignaIdInstanciaFlujo'',{',
'        pageItems: ''#P1_INSTANCIA_FLUJO,#P1_ID_FLJO_TREA''',
'  }).then((resp) => {',
'      window.localStorage.clear();',
'      console.log(resp);',
'      if (resp.url.includes(''javascript'')){',
'          eval(resp.url);',
'      }else{',
'          window.location.href = resp.url ;',
'      }',
'  });',
'}',
'',
'function archivarNotificacion(idAlerta){',
'    console.log(''Alerta:'',idAlerta);',
'    apex.submit({',
'      request:"ARCHIVAR_ALERTA",',
'      set:{"P1_ID_ALRTA_USRIO":idAlerta}',
'    });',
'}',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'.body{',
'    background: #f9f9fc;',
'}',
'.caja-tareas{',
'    position: relative;',
'    margin-bottom: 1.5rem;',
'    width: 100%;',
'}',
'.tareas ul {',
'    padding: 0;',
'    margin: 0;',
'    list-style-type: none;',
'    max-height:400px; width:100%;',
'    overflow-y: auto;',
'    -webkit-perspective: 900;',
'    perspective: 900;',
'}',
'',
'.tareas ul::-webkit-scrollbar{',
'  width:10px;',
'  background-color: rgba(0,0,0,0.2);',
'}',
'.tareas ul::-webkit-scrollbar-thumb{',
'background-color: rgba(0,0,0,0.3);',
'}',
'.tareas ul::-webkit-scrollbar-thumb:hover{',
'background-color: rgba(0,0,0,0.5);',
'}',
'.tareas ul::-webkit-scrollbar-thumb:active{',
'background-color: rgba(0,0,0,0.75);',
'} ',
'',
'.tareas a{',
'    color: #17B794;',
'    text-decoration: none;',
'    background-color: transparent;',
'}',
'.tareas ul li {',
'    list-style: none;',
'    position: relative;',
'    padding: 14px 5px;',
'    border-bottom: 1px solid #eaeaea;',
'    display: list-item;',
'    text-align: -webkit-match-parent;',
'    margin: 5px 7px 0.5rem 7px;',
'    background-color: #f3f3f38c;',
'    ',
'}',
'.tareas ul li:hover{',
'    background-color: rgba(246, 240, 246, 0.6);',
'}',
'.tareas .tarea-imagen {',
'    position: absolute;',
'    left: 30px;',
'    top: 50%;',
'    transform: translateY(-50%);',
'}',
'',
'.tarea-imagen img {',
'    display: inline-block;',
'    width: 54px;',
'    height: 54px;',
'    border-radius: 50%;',
'    max-width: 100%;',
'    vertical-align: middle;',
'    border-style: none;',
'}',
'.tareas .tarea-cuerpo {',
'    margin-left: 85px;',
'    font-size: 15px;',
'    color: #6f6f6f;',
'}',
'.tarea-cuerpo h4 span {',
'    border-radius: 50px;',
'    line-height: 14px;',
'    font-size: 1rem;',
'    color: #fff;',
'    font-style: normal;',
'    padding: 4px 10px;',
'    margin-left: 5px;',
'    margin-top: -5px;',
'}',
'.tareas .tarea-cuerpo .tarea-descripcion h6{',
'    font-size: 1.1rem !important;',
'}',
'.tarea-cabecera h4 {',
'    font-weight: 600;',
'    display: inline-block;',
'    color: #000000;',
'    margin: 0 0 7px 0;',
'    padding: 0;',
'}',
'',
'.tarea-cabecera span {',
'    float: right;',
'    font-size: 10px;',
'    color: #b1b1b1;',
'}',
'',
'.t-Body-content {',
'    min-height: 80vh !important;',
'}',
'*/',
'',
'',
'/*Notificaciones*/',
'.notifications-container{',
'    width: 100%;',
'    height: 300px;',
'    overflow-y: scroll;',
'    float: left;',
'}',
'/*Inicio Scrollbar*/',
'.notifications-container::-webkit-scrollbar-track',
'{',
'	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);',
'	background-color: #F5F5F5;',
'	border-radius: 10px;',
'}',
'',
'.notifications-container::-webkit-scrollbar',
'{',
'	width: 10px;',
'	background-color: #F5F5F5;',
'}',
'',
'.notifications-container::-webkit-scrollbar-thumb',
'{',
'    border-radius: 10px;',
'    background-image: -webkit-gradient(linear, left bottom, left top, color-stop(0.44, rgb(208, 208, 208)), color-stop(0.72, rgb(221, 221, 221)), color-stop(0.86, rgb(200, 200, 200)));',
'}',
'/*Fin Scrollbar*/',
'',
'.notification-item{',
'    display: -webkit-box;',
'    display: -ms-flexbox;',
'    display: flex;',
'    -webkit-box-align: center;',
'    -ms-flex-align: center;',
'    align-items: center;',
'    padding: 1.1rem 1.5rem;',
'    border-bottom: 1.1px solid #ededed;',
'    -webkit-transition: background-color 0.3s ease;',
'    transition: background-color 0.3s ease;',
'    color: #5867dd;',
'    text-decoration: none;',
'    background-color: transparent;',
'}',
'',
'.notification-item:hover{',
'    -webkit-transition: background-color 0.3s ease;',
'    transition: background-color 0.3s ease;',
'    text-decoration: none;',
'    background-color: #f8fcff;',
'    border-radius: 6px;',
'}',
'',
'.notification-item .item-icon{',
'    display: -webkit-box;',
'    display: -ms-flexbox;',
'    display: flex;',
'    -webkit-box-flex: 0;',
'    -ms-flex: 0 0 2.5rem;',
'    flex: 0 0 2.5rem;',
'    -webkit-box-align: center;',
'    -ms-flex-align: center;',
'    align-items: center;',
'}',
'',
'.notification-item .item-details{',
'    display: -webkit-box;',
'    display: -ms-flexbox;',
'    display: flex;',
'    -webkit-box-orient: vertical;',
'    -webkit-box-direction: normal;',
'    -ms-flex-direction: column;',
'    flex-direction: column;',
'    -webkit-box-flex: 1;',
'    -ms-flex-positive: 1;',
'    flex-grow: 1;',
'}',
'',
'.notification-item .item-details .details-title{',
'    -webkit-transition: color 0.3s ease;',
'    transition: color 0.3s ease;',
'    font-size: 1.4rem;',
'    font-weight: 400;',
'    color: #2a5376;',
'    padding-left: 16px;',
'}',
'',
'.notification-item .item-details .details-time{',
'    font-size: 1rem;',
'    color: #6c6e7e;',
'    padding-left: 16px;',
'}',
'.notification-item .item-details .details-time span{',
'    background-color: #e1e8ed;',
'    color: black;',
'    padding: 2px;',
'    border-radius: 3px;',
'    color: #819cb4;',
'    font-size: 7pt;',
'}',
'',
'/*Progress*/',
'.circleProg {',
'  --value: 0%;',
'    width: 3rem;',
'    height: 3rem;',
'    border-radius: 50%;',
'    background: radial-gradient( circle closest-side, #ffffff 50%, transparent 70% /* + 0.5% to avoid ugly border */ ), conic-gradient( #0572ce var(--value), #ff0000 var(--value) );',
'}',
'',
''))
,p_page_template_options=>'#DEFAULT#'
,p_browser_cache=>'N'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20230803144821'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33259055070281803)
,p_plug_name=>unistr('Procesos de Liquidaci\00F3n')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29541487623068504)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vif.id_fljo,',
'       apex_string.get_initials(vif.nmbre_trcro) nombre_tercero,',
'       vif.dscrpcion_fljo descripcion,',
'       vit.id_instncia_fljo, ',
'       vit.id_fljo_trea_orgen, ',
'       ''No. ''||vit.id_instncia_fljo||'' - ''||vit.nmbre_trnscion_orgen titulo,  ',
'       vit.estdo_trnscion estado,',
'       vit.clor_trnscion color_estado,',
'       case vit.id_estdo_trnscion',
'           when 1 then ''fa fa-play-circle''',
'           when 2 then ''fa fa-clock-o''',
'       end tarea_icon,',
'       to_char(vit.fcha_incio,''dd/MM/yyyy'') fecha_inicio,',
'       to_char(vit.fcha_fin_plnda,''dd/MM/yyyy'') fecha_fin,',
'       to_char(vit.fcha_fin_optma,''dd/MM/yyyy'') fecha_optima,',
'       ''javascript:iraTarea("''||pkg_pl_workflow_1_0.fnc_gn_tarea_url(vit.id_instncia_fljo,vit.id_fljo_trea_orgen)||''"''||'',''||vit.id_instncia_fljo||'')'' tarea_link',
'from v_wf_g_instancias_transicion_p vit',
'inner join v_wf_g_instancias_flujos vif on vit.id_instncia_fljo = vif.id_instncia_fljo and',
'                                           vif.cdgo_clnte = :f_cdgo_clnte',
'where vit.id_estdo_trnscion in (1,2) and',
'      pkg_pl_workflow_1_0.fnc_vl_tarea_particpnte_s_n(p_id_fljo_trea=>vit.id_fljo_trea_orgen,p_user_apex=>null) = ''S'' and',
'      vif.id_prcso = 1'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_column_width=>'style ="-webkit-box-shadow: 0px 0px 143px -36px rgba(0,0,0,0.72); -moz-box-shadow: 0px 0px 143px -36px rgba(0,0,0,0.72); box-shadow: 0px 0px 143px -60px rgba(0,0,0,0.72);  border-radius: 25px;"'
,p_plug_display_condition_type=>'NEVER'
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
 p_id=>wwv_flow_api.id(33259174533281804)
,p_max_row_count=>'100000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_detail_view_enabled_yn=>'Y'
,p_detail_view_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="tareas">',
'    <ul>'))
,p_detail_view_for_each_row=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="item-task">',
'   <a href="#TAREA_LINK#">',
'       <div class="tarea-imagen">',
'           <span aria-hidden="true" class="#TAREA_ICON# fa-3x" style="color:#COLOR_ESTADO#; !important"></span>',
'       </div>',
'       <div class="tarea-cuerpo">',
'           <div class="tarea-cabecera">',
'               <h4>#TITULO#',
'                   <span style="background-color: #COLOR_ESTADO# !important;">#ESTADO#</span>',
'               </h4>',
unistr('               <span>Fecha \00F3ptima: #FECHA_OPTIMA#</span>'),
'           </div>',
'           <div class="tarea-descripcion">',
'               <h5>#DESCRIPCION#</h5>',
unistr('               <h6>Inicio el #FECHA_INICIO#, Fecha de finalizaci\00F3n #FECHA_FIN#</h6>'),
'           </div>',
'       </div>',
'    </a> ',
'</li>   ',
'',
''))
,p_detail_view_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    <ul>',
'</div>'))
,p_owner=>'ADMIN'
,p_internal_uid=>33259174533281804
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33259234742281805)
,p_db_column_name=>'ID_FLJO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Fljo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33259753886281810)
,p_db_column_name=>'ID_INSTNCIA_FLJO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Id Instncia Fljo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33259833197281811)
,p_db_column_name=>'ID_FLJO_TREA_ORGEN'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Id Fljo Trea Orgen'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(30796475317704312)
,p_db_column_name=>'NOMBRE_TERCERO'
,p_display_order=>80
,p_column_identifier=>'N'
,p_column_label=>'Nombre Tercero'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(30796568893704313)
,p_db_column_name=>'TITULO'
,p_display_order=>90
,p_column_identifier=>'O'
,p_column_label=>'Titulo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(30796687991704314)
,p_db_column_name=>'ESTADO'
,p_display_order=>100
,p_column_identifier=>'P'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(30796768510704315)
,p_db_column_name=>'COLOR_ESTADO'
,p_display_order=>110
,p_column_identifier=>'Q'
,p_column_label=>'Color Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(30796913286704317)
,p_db_column_name=>'TAREA_LINK'
,p_display_order=>130
,p_column_identifier=>'S'
,p_column_label=>'Tarea Link'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33416028903910701)
,p_db_column_name=>'DESCRIPCION'
,p_display_order=>140
,p_column_identifier=>'T'
,p_column_label=>'Descripcion'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33459840124029601)
,p_db_column_name=>'TAREA_ICON'
,p_display_order=>150
,p_column_identifier=>'U'
,p_column_label=>'Tarea Icon'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33524534721414101)
,p_db_column_name=>'FECHA_INICIO'
,p_display_order=>160
,p_column_identifier=>'W'
,p_column_label=>'Fecha Inicio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33524663111414102)
,p_db_column_name=>'FECHA_FIN'
,p_display_order=>170
,p_column_identifier=>'X'
,p_column_label=>'Fecha Fin'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33524796299414103)
,p_db_column_name=>'FECHA_OPTIMA'
,p_display_order=>180
,p_column_identifier=>'Y'
,p_column_label=>'Fecha Optima'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(33268250500293111)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'332683'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_view_mode=>'DETAIL'
,p_report_columns=>'ID_FLJO:ID_INSTNCIA_FLJO:ID_FLJO_TREA_ORGEN:NOMBRE_TERCERO:TITULO:ESTADO:COLOR_ESTADO:TAREA_LINK:DESCRIPCION:TAREA_ICON:FECHA_FIN:FECHA_OPTIMA'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(52179217915614001)
,p_name=>unistr('Procesos Jur\00EDdicos de Cobro')
,p_template=>wwv_flow_api.id(29541487623068504)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:t-MediaList--stack:t-MediaList--large force-fa-lg'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select a.nombre_etpa LIST_TITLE, ',
'           a.estdo_etpa_vsble LIST_TEXT,',
'           count(*) LIST_BADGE,',
'           apex_util.prepare_url(''f?p=80000:10:''|| v(''app_session'') ||''::no:10:P10_FLJO_TREA:'' || a.id_etpa ) LINK,',
'           ''u-color-'' || to_char( ora_hash(a.nombre_etpa,44) + 1 ) icon_color_class,',
'           ''fa fa-list-alt''icon_class',
'      from v_cb_g_procesos_jrdco_dcmnto a',
' left join cb_g_prcsos_jrdc_dcmnt_estd b',
'        on a.id_prcsos_jrdco_dcmnto = b.id_prcsos_jrdco_dcmnto',
'      join v_wf_d_flj_trea_estd_prtcpnte c',
'        on c.id_fljo_trea_estdo = a.id_fljo_trea_estdo',
'       and a.id_etpa            = c.id_fljo_trea',
'     where c.id_usrio = :F_ID_USRIO      ',
'       and nvl(b.actvo,''S'') = ''S''',
'  group by a.nombre_etpa,',
'           a.id_etpa,',
'           a.estdo_etpa_vsble',
'  ',
'  ',
'  '))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(29574057959068520)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(52123434394123730)
,p_query_column_id=>1
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'List Title'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(52123542053123731)
,p_query_column_id=>2
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'List Text'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(52123697172123732)
,p_query_column_id=>3
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>3
,p_column_heading=>'List Badge'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(52123713421123733)
,p_query_column_id=>4
,p_column_alias=>'LINK'
,p_column_display_sequence=>4
,p_column_heading=>'Link'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(52123841481123734)
,p_query_column_id=>5
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>5
,p_column_heading=>'Icon Color Class'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(52123900759123735)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>6
,p_column_heading=>'Icon Class'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95250092782808758)
,p_plug_name=>unistr('Rutas de Navegaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29561925684068511)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(95249542318808741)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(29605453487068539)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112860256313415107)
,p_plug_name=>'Notificaciones'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple:t-TabsRegion-mod--small'
,p_plug_template=>wwv_flow_api.id(29559344209068510)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_plug_header=>'<h4>Notificaciones<h4>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112860386592415108)
,p_plug_name=>'Hoy'
,p_parent_plug_id=>wwv_flow_api.id(112860256313415107)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cant number;',
'begin',
'    begin',
'        select count(*)',
'        into v_cant',
'        from v_ma_g_alertas',
'        where cdgo_clnte = :F_CDGO_CLNTE and',
'            id_usrio   = :F_ID_USRIO and',
'            trunc(fcha) = trunc(sysdate) and',
'            indcdor_envdo = ''S'' and',
'            indcdor_archvdo = ''N'';',
'    end;',
'    htp.p(''<div class="notifications-container">'');',
'    if(v_cant < 1)then',
'        htp.p(''<span>No hay notificaciones disponibles.</span>'');',
'    else',
'        for c_alertas in( select * ',
'                          from v_ma_g_alertas',
'                          where cdgo_clnte = :F_CDGO_CLNTE and',
'                                id_usrio   = :F_ID_USRIO and',
'                                trunc(fcha) = trunc(sysdate) and',
'                                indcdor_envdo = ''S'' and',
'                                indcdor_archvdo = ''N'' ',
'                          order by fcha desc)loop',
'            htp.p(''<div class="notification-item" id="style-6">'');',
'            htp.p(''<div class="item-icon">'');',
'            htp.p(''<i class="fa ''||c_alertas.icno||'' fa-lg" style="color: ''||c_alertas.icno_clor||''"></i>'');',
'            htp.p(''</div>'');',
'            htp.p(''<a href="''||nvl(replace(c_alertas.url, ''APP_SESSION'',:APP_SESSION),''#'')||''">'');',
'            htp.p(''<div class="item-details">'');',
'            htp.p(''<div class="details-title">'');',
'            htp.p(c_alertas.ttlo);',
'            htp.p(''</div>'');',
'            htp.p(''</a>'');',
'            htp.p(''<div class="details-time">'');',
'            htp.p(to_char(c_alertas.fcha,''HH:MI:SS AM''));',
'            htp.p(''<a href="#" onclick="archivarNotificacion(''||c_alertas.id_alrta_usrio||'');" ><span>Archivar</span></a>'');',
'            htp.p(''</div>'');',
'            htp.p(''</div>'');',
'            htp.p(''</div>'');',
'        end loop;',
'    end if;',
'    htp.p(''</div>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112860510825415110)
,p_plug_name=>'Semana'
,p_parent_plug_id=>wwv_flow_api.id(112860256313415107)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112860614032415111)
,p_plug_name=>'Mes'
,p_parent_plug_id=>wwv_flow_api.id(112860256313415107)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112861586148415120)
,p_plug_name=>'Tareas'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple:t-TabsRegion-mod--small'
,p_plug_template=>wwv_flow_api.id(29559344209068510)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>'<h4>Tareas<h4>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112861753847415122)
,p_plug_name=>'Pendientes'
,p_parent_plug_id=>wwv_flow_api.id(112861586148415120)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cant number;',
'begin',
'    begin',
'        select count(*)',
'         into v_cant',
'         from wf_g_instancias_transicion a',
'         join v_wf_d_flujos_tarea b',
'           on b.id_fljo_trea = a.id_fljo_trea_orgen',
'         join wf_d_estado_transicion c on a.id_estdo_trnscion = c.id_estdo_trnscion',
'        where a.id_estdo_trnscion in (1,2)',
'          and a.id_usrio = :F_ID_USRIO',
'          and b.cdgo_clnte = :F_CDGO_CLNTE;',
'         --and trunc(a.fcha_incio)= trunc(sysdate);',
'    end;',
'    htp.p(''<div class="notifications-container">'');',
'    if(v_cant < 1)then',
'        htp.p(''<span>No hay tareas disponibles.</span>'');',
'    else',
'        for c_tareas in( select  nmbre_trea,',
'                                 dscrpcion_fljo,',
'                                 fcha_fin_optma,',
'                                 fcha_fin_plnda,',
'                                 fcha_incio,',
'                                 id_instncia_fljo,',
'                                 id_estdo_trnscion,',
'                                 id_fljo_trea_orgen,',
'                                 estdo_trnscion,',
'                                 clor_trnscion,',
'                                 decode(dif_fcha_fin_inicio,0,0,trunc((dif_fcha_fin_actual/dif_fcha_fin_inicio)*100)) as porc,',
'                                 dif_fcha_fin_inicio,',
'                                 dif_fcha_fin_actual',
'                            from(',
'                            select  b.nmbre_trea,',
'                                    b.dscrpcion_fljo,',
'                                    a.fcha_fin_optma,',
'                                    a.fcha_fin_plnda,',
'                                    a.fcha_incio,',
'                                    a.id_instncia_fljo,',
'                                    a.id_estdo_trnscion,',
'                                    a.id_fljo_trea_orgen,',
'                                    c.estdo_trnscion,',
'                                    c.clor_trnscion,',
'                                (cast(a.fcha_fin_plnda as date) - cast(a.fcha_incio as date)) as dif_fcha_fin_inicio,',
'                                 (cast(a.fcha_fin_plnda as date) - cast(sysdate as date)) as dif_fcha_fin_actual',
'                            from wf_g_instancias_transicion a',
'                            join v_wf_d_flujos_tarea    b on b.id_fljo_trea = a.id_fljo_trea_orgen',
'                            join wf_d_estado_transicion c on a.id_estdo_trnscion = c.id_estdo_trnscion',
'                            where a.id_estdo_trnscion in (1,2)  and ',
'                               a.id_usrio = :F_ID_USRIO      and ',
'                               b.cdgo_clnte = :F_CDGO_CLNTE ',
'                               --trunc(a.fcha_incio)= trunc(sysdate)',
'                            order by a.fcha_incio desc',
'                            fetch first 50 rows only)',
'                       order by porc)loop',
'            htp.p(''<div class="notification-item" id="style-6">'');',
'            htp.p(''<div class="item-icon">'');',
'            htp.p(''<div class="circleProg" style="--value: ''||c_tareas.porc||''%"></div>'');',
'            htp.p(''</div>'');',
'            htp.p(''<a href="javascript:iraTarea(''||c_tareas.id_instncia_fljo||'',''||c_tareas.id_fljo_trea_orgen||'')">'');',
'            htp.p(''<div class="item-details">'');',
'            htp.p(''<div class="details-title">'');',
'            htp.p(c_tareas.nmbre_trea);',
'            htp.p(''</div>'');',
'            htp.p(''</a>'');',
'            htp.p(''<div class="details-time">'');',
'            htp.p(''Flujo: ''||c_tareas.dscrpcion_fljo||''<br>'');',
'            htp.p(''Inicio el ''||to_char(c_tareas.fcha_incio,''DD/MM/YYYY HH:MI AM'')||''<br/>'');',
'            htp.p(''Debe finalizar el ''||to_char(c_tareas.fcha_fin_plnda,''DD/MM/YYYY HH:MI AM''));',
'            htp.p(''</div>'');',
'            htp.p(''</div>'');',
'            htp.p(''</div>'');',
'        end loop;',
'    end if;',
'    htp.p(''</div>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16627898249083529)
,p_name=>'P1_INSTANCIA_FLUJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(112861586148415120)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112860738468415112)
,p_name=>'P1_ID_ALRTA_USRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(112860256313415107)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113672969867854001)
,p_name=>'P1_ID_FLJO_TREA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(112861586148415120)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(112860800251415113)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ActualizaAlerta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    pkg_ma_mail.prc_ac_alerta(',
'       p_id_alrta_usrio        => :P1_ID_ALRTA_USRIO,',
'       p_id_usrio              => :F_ID_USRIO',
'    );',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ARCHIVAR_ALERTA'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16627707954083528)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'asignaIdInstanciaFlujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_url varchar2(4000);',
'begin',
'    apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', :P1_INSTANCIA_FLUJO);',
'    v_url    := pkg_pl_workflow_1_0.fnc_gn_tarea_url(:P1_INSTANCIA_FLUJO, :P1_ID_FLJO_TREA);',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''OK'' );',
'    apex_json.write(''url'' , v_url);',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
