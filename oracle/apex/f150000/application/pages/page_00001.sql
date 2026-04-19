prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Inicio'
,p_step_title=>unistr('Monter\00EDa - Impuestos Municipales')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/tooltipster/dist/js/tooltipster.bundle.js',
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/emisionRecibo.js',
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/app.js'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*apex.jQuery(apex.gPageContext$).on("apexreadyend", async function (e) {',
'    apex.item(''btn_atras'').hide();',
'    jsonConfig = await cargarConfig();',
'    if($v(''P7_ID_IMPSTO'') && $v(''P7_ID_IMPSTO_SBMPSTO'')){',
'        cargarOpciones($v(''P7_ID_IMPSTO''),$v(''P7_ID_IMPSTO_SBMPSTO''));',
'    }else{',
'        cargarImpuestos();',
'    }',
'});*/'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/tooltipster/dist/css/tooltipster.bundle.min.css',
'https://fonts.googleapis.com/css?family=Roboto:400,500,900,700,100italic,300italic,400italic,500italic,700italic,900italic,300,100',
'#IMAGE_PREFIX#javascript/infortributos/Portal/css/impuestos.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*#container, #menu_predial{',
'    background: url(#IMAGE_PREFIX#css/infortributos/imagenes/clientes/23001/FONDO_RECTANGULO-05.png);',
'    background-size: 100% 105%;',
'    padding: 5px 30px;',
'    min-height: 300px;',
'}',
'',
'',
'.t-Region-header{',
'    background: #409fff !important;',
'    color: #ffffff;',
'    width: 100%;',
'}',
'',
'.center {',
'  margin: auto;',
'  width: 60%;',
'  border: 3px solid #73AD21;',
'  padding: 0px;',
'}*/',
'',
'/* -- */',
'',
':root{',
'    --filter-white: brightness(0) saturate(100%) invert(99%) sepia(0%) saturate(1114%) hue-rotate(254deg) brightness(111%) contrast(100%);',
'}',
'',
'#container, #menu_predial{',
'    background: url(#APP_IMAGES#FONDO_RECTANGULAR_MONTERIA.png	);',
'    background-size: 100% 100%;',
'    padding: 23px 30px;',
'    min-height: 300px;',
'    border-radius: 10px;',
'  ',
'}',
'',
unistr('/* MQ TELEFONOS - AJUSTAR EL LOGO DE LA ADMINITRACI\00D3N */'),
'@media (max-width: 768px) {',
'    .banner-portal img {',
'        object-fit: cover;',
'        height: 30vh;',
'    }',
'}',
'',
'',
'',
'/* DEGRADADO COLOR VERDE */',
'.t-Region-header {',
'    /*background: linear-gradient(to right, rgba(0, 95, 34, 0.8), rgba(78, 219, 92, 0.8));*/',
'    /*background: linear-gradient(to right, rgb(0 94 217), rgb(239 239 239 / 88%));*/',
'    background: linear-gradient(92deg, rgba(0, 94, 217, 100) 40%, rgba(239, 239, 239, 0.88) 100%);',
'    color: #fff;',
'    width: 100%;',
'}',
'',
'.t-Region-title {',
'    font-size: 18px;',
'}',
'',
'.center {',
'    margin: auto;',
'    width: 60%;',
'    border: 3px solid #73AD21;',
'    padding: 0px;',
'}',
'',
'',
'.P0_LOGO_RIGHT {',
'    width: 100% !important ;',
'    height: 15rem !important;',
'    ',
'}',
'',
'.t-Region-headerItems--title {',
'    flex-grow: 1;',
'    text-align: center;',
'    padding: 1.2rem;',
'    display: flex;',
'    align-items: center;',
'    justify-content: center;',
'    align-content: flex-end;',
'    color: #fff;',
'}',
'',
'.t-BreadcrumbRegion{',
'    padding: 0 0 16px 0!important;',
'}',
'',
'',
'.t-Region-body .container{',
'    padding: 10px;',
'}',
'',
'/* ---------------- EFECTO 1 PORTAL: HOVER -------------- */',
'.img-ico-portal{',
'   padding: 10px 0 10px 0; ',
'}',
'',
'.img-ico-portal a img {',
'    width: 150px;',
'    height: auto;',
'    transition: transform 0.3s ease;',
'}',
'',
'.img-ico-portal a img:hover{',
'    transform: scale(1.1);',
'}',
'/* ------------------------------------------ */',
'',
'',
unistr('/* LEYENDA PORTAL: Realiza tus tr\00E1mites desde cualquier lugar y en cualquier momento en nuestro Portal Tributario */'),
'.leyendaportal{',
'    font-size: 18px ! important;',
'    text-align: center;',
'    color: white;',
'    padding: 10px;',
'    margin: 0;',
'}',
'/* ------------------------------------------ */',
'',
'',
'/* ---------------- EFECTO 1 PORTAL: HOVER -------------- */',
'.img-ico-portal-2 a img {',
'    /*width: 150px;',
'    height: auto;*/',
'    transition: transform 0.3s ease, border-radius 0.3s ease;',
'}',
'',
'.img-ico-portal-2 a:hover .efectoCirculo {',
'    /*background-color: #fbc710;*/',
'    transform:  scale(1.2);',
'}',
'',
'.img-ico-portal-2 a .efectoCirculo  {',
'    border: 0;',
'    border-radius: 50%;',
'    display: -webkit-inline-box;',
'    display: -ms-inline-flexbox;',
'    display: inline-flex;',
'    -ms-flex-pack: center;',
'    -webkit-box-pack: center;',
'    justify-content: center;',
'    -ms-flex-align: center;',
'    -webkit-box-align: center;',
'    align-items: center;',
'   /* width: 210px; */',
'    height: 200px;',
'    margin: 0;',
'    padding: 5px;',
'    position: relative;',
'    transition: transform 0.2s linear, background-color 0.2s linear;',
'    background-color: transparent;',
'    /*font-size: 2.75em;*/',
'    text-align: center;',
'}',
'/* ------------------------------------------ */',
'',
'',
'/* REGION: FOOTER - STATIC CONTENT */',
'.redes-sociales{',
'    display: flex;',
'    justify-content: center;',
'    gap: 20px;',
'    padding: 10px 10px 5px 5px;',
'}',
'',
'.redes-item {',
'    text-align: center;',
'}',
'',
'.redes-item img {',
'    width: 38px;',
'    height: 38px;',
'    border-radius: 10px;',
'}',
'',
'.redes-text {',
'    font-size: 12px;',
'    margin-top: 5px;',
'}',
'',
'.footer {',
'    text-align: center;',
'    font-size: 10px;',
'  }',
'',
'/* ------------------------------------------------------------------------------------------------- */',
unistr('/* AJUSTAR MARGIN EN INFORMACI\00D3N NOTARIOS */'),
'@media (max-width: 768px) {',
'    .t-Region-body ol{',
'        margin: 1.2rem 1.2rem;',
'    }',
'    ',
'/* AJUSTAR REDES SOCIALES CONTENEDOR */',
'    .redes-sociales{',
'        display: flex;',
'        justify-content: space-around;',
'        gap: 10px;',
'        padding: 20px;',
'    }  ',
'}',
'',
'',
'',
'',
'',
''))
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250930220839'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5502189142369801)
,p_plug_name=>unistr('<b>SERVICIOS EN L\00CDNEA</b>')
,p_region_name=>'container'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>unistr('<p class="leyendaportal">Realiza tus tr\00E1mites desde cualquier lugar y en cualquier momento en nuestro Portal Tributario</p>')
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P1_ID_MNU is null or :P1_ID_MNU = 1'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3751393234474345)
,p_plug_name=>'RENTAS'
,p_parent_plug_id=>wwv_flow_api.id(5502189142369801)
,p_plug_display_sequence=>110
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:205:&APP_SESSION.::::F_CDGO_CLNTE,P205_ID_IMPSTO:23001,230013">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#M007_RENTAS.png" alt="RENTAS">',
'        </div>',
'    </a>',
'</center>',
' '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5514245848658701)
,p_plug_name=>'Predial'
,p_region_name=>'Predial'
,p_parent_plug_id=>wwv_flow_api.id(5502189142369801)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:1:&APP_SESSION.::::F_CDGO_CLNTE,P1_ID_MNU:23001,2">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#M002_PREDIAL.png" alt="PREDIAL">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5514379045658702)
,p_plug_name=>'Industria'
,p_parent_plug_id=>wwv_flow_api.id(5502189142369801)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:1:&APP_SESSION.::::F_CDGO_CLNTE,P1_ID_MNU:23001,3">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#M001_INDUSTRIA.png" alt="INDUSTRIA">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5514449384658703)
,p_plug_name=>'PQR'
,p_parent_plug_id=>wwv_flow_api.id(5502189142369801)
,p_plug_display_sequence=>130
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="javascript:void(0);" id="abrir-modal-pqrs">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#M009_PQRS.png" alt="PQRS">',
'        </div>',
'    </a>',
'</center>',
'<!--<center>',
'    <a href="f?p=&APP_ID.:301:&APP_SESSION.::::F_CDGO_CLNTE:23001">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#M009_PQRS.png" alt="PQRS">',
'        </div>',
'    </a>',
'</center>-->'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5514673169658705)
,p_plug_name=>'Items'
,p_parent_plug_id=>wwv_flow_api.id(5502189142369801)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6361052692467115)
,p_plug_name=>'INFORMACION EXOGENA'
,p_parent_plug_id=>wwv_flow_api.id(5502189142369801)
,p_plug_display_sequence=>180
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:1:&APP_SESSION.::::F_CDGO_CLNTE,P1_ID_MNU:23001,8">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#EXOGENA.png" alt="PRSNTCI\EXOGENA" alt="EXOGENA">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6752746441570602)
,p_plug_name=>'Vehiculo'
,p_parent_plug_id=>wwv_flow_api.id(5502189142369801)
,p_plug_display_sequence=>80
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:1:&APP_SESSION.::::F_CDGO_CLNTE,P1_ID_MNU:23001,4">',
'        <div class="efectoCirculo">',
unistr('            <img src="#APP_IMAGES#CIRCULACION.png" alt="CIRCULACI\00D3N">'),
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21676356392808003)
,p_plug_name=>'NORMATIVIDAD'
,p_parent_plug_id=>wwv_flow_api.id(5502189142369801)
,p_plug_display_sequence=>140
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:40:&APP_SESSION.::::F_CDGO_CLNTE:23001">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#M010_NORMATIVIDAD.png" alt="NORMATIVIDAD">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22223547947487901)
,p_plug_name=>unistr('Plusval\00EDa')
,p_region_name=>'Predial'
,p_parent_plug_id=>wwv_flow_api.id(5502189142369801)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:44:&APP_SESSION.::::F_CDGO_CLNTE,P44_ID_IMPSTO:23001,230019">',
'        <div class="efectoCirculo">',
unistr('            <img src="#APP_IMAGES#PLUSVALIA.png" alt="PLUSVAL\00CDA">'),
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22223637371487902)
,p_plug_name=>unistr('Delineaci\00F3n')
,p_region_name=>'Predial'
,p_parent_plug_id=>wwv_flow_api.id(5502189142369801)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:205:&APP_SESSION.::::F_CDGO_CLNTE,P205_ID_IMPSTO:23001,230013">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#DURBANA.png" alt="DURBANA">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22223748065487903)
,p_plug_name=>'Sobretasa Gasolina'
,p_parent_plug_id=>wwv_flow_api.id(5502189142369801)
,p_plug_display_sequence=>100
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:1:&APP_SESSION.::::F_CDGO_CLNTE,P1_ID_MNU:23001,5">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#SOBRETASA.png" alt="SOBRETASA">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22749697228946211)
,p_plug_name=>'Alumbrado'
,p_parent_plug_id=>wwv_flow_api.id(5502189142369801)
,p_plug_display_sequence=>90
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:1:&APP_SESSION.::::F_CDGO_CLNTE,P1_ID_MNU:23001,6">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#ALUMBRADO.png" alt="ALUMBRADO">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(47127534073371301)
,p_plug_name=>'PAZ Y SALVOS GENERADOS'
,p_parent_plug_id=>wwv_flow_api.id(5502189142369801)
,p_plug_display_sequence=>160
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:280:&APP_SESSION.::::F_CDGO_CLNTE:23001">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#VALIDAR_PAZ_SALVO.png	" alt="VALIDAR_PYS">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85163889154979604)
,p_plug_name=>'NOTIFICACION'
,p_parent_plug_id=>wwv_flow_api.id(5502189142369801)
,p_plug_display_sequence=>150
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:42:&APP_SESSION.::::F_CDGO_CLNTE:23001">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#NOTIFICACIONES.png" alt="NOTIFICACIONES">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85165941923979625)
,p_plug_name=>'VUR'
,p_parent_plug_id=>wwv_flow_api.id(5502189142369801)
,p_plug_display_sequence=>120
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:1:&APP_SESSION.::::F_CDGO_CLNTE,P1_ID_MNU:23001,7">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#VENTANILLA_V2.png" alt="VENTANILLA">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89953455921968609)
,p_plug_name=>'Acceso Usuarios'
,p_region_name=>'Predial'
,p_parent_plug_id=>wwv_flow_api.id(5502189142369801)
,p_plug_display_sequence=>190
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=60000">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#ACCESO_USUARIOS.png" alt="DURBANA">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89960002566975910)
,p_plug_name=>unistr('Informaci\00F3n PQR')
,p_parent_plug_id=>wwv_flow_api.id(5502189142369801)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>wwv_flow_api.id(252177660597651395)
,p_plug_display_sequence=>210
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="padding: 10px; font-size: 16px; line-height: 1.6;">',
'    <p>',
unistr('        Para una gesti\00F3n m\00E1s \00E1gil de su solicitud, por favor env\00EDe su Petici\00F3n, Queja o Reclamo (PQR) al correo electr\00F3nico correspondiente:'),
'    </p>',
'',
'    <div style="margin-top: 20px;">',
'        <p style="margin-bottom: 5px;">',
'            <strong>Impuesto Predial y otras rentas:</strong>',
'        </p>',
'        <p style="background-color: #f2f2f2; padding: 10px; border-radius: 5px; font-family: monospace; word-wrap: break-word;">',
'            rentaspqrsf@alcaldiamonteria.gov.co',
'        </p>',
'    </div>',
'',
'    <div style="margin-top: 20px;">',
'        <p style="margin-bottom: 5px;">',
'            <strong>Impuesto de Industria y Comercio:</strong>',
'        </p>',
'        <p style="background-color: #f2f2f2; padding: 10px; border-radius: 5px; font-family: monospace; word-wrap: break-word;">',
'            ica@alcaldiamonteria.gov.co',
'        </p>',
'    </div>',
'',
'    <p style="margin-top: 25px; font-size: 14px; color: #555;">',
'        <em>Recuerde detallar su caso y adjuntar todas las evidencias en el correo para poder brindarle una mejor asistencia.</em>',
'    </p>',
'',
'</div>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100665431840486601)
,p_plug_name=>unistr('Gesti\00F3n de Autorizaci\00F3n')
,p_region_name=>'Predial'
,p_parent_plug_id=>wwv_flow_api.id(5502189142369801)
,p_plug_display_sequence=>200
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'  <a href="f?p=&APP_ID.:1:&APP_SESSION.::::P1_ID_MNU:20">',
'     <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#GESTION_AUTORIZACION.png" alt="GESTION_AUTORIZACION">',
'        </div>   ',
'  </a> ',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(159922786664958506)
,p_plug_name=>unistr('IMPUESTO DE TELEFON\00CDA')
,p_parent_plug_id=>wwv_flow_api.id(5502189142369801)
,p_plug_display_sequence=>170
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center><a href="f?p=&APP_ID.:309:&APP_SESSION.::::F_CDGO_CLNTE,P309_ID_IMPSTO,P309_SBMPSTO:23001,2300116,23001164">',
'<img src="#IMAGE_PREFIX#css/infortributos/imagenes/clientes/23001/IMPUESTO_TELEFONIA_TELEGRAFO.png',
unistr('" alt="Impuesto Telefon\00EDa y Tel\00E9grafo"></a></center>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5515564370658714)
,p_plug_name=>'<b>INDUSTRIA Y COMERCIO</b>'
,p_region_name=>'menu_predial'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P1_ID_MNU'
,p_plug_display_when_cond2=>'3'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5549311727442504)
,p_plug_name=>'Estados de Cuenta'
,p_parent_plug_id=>wwv_flow_api.id(5515564370658714)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:5:&APP_SESSION.:::5:P5_ID_IMPSTO,P5_ID_IMPSTO_SBMPSTO:230012,2300122">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#ESTADO_DE_CUENTA.png" alt="ESTADO_CUENTA">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5549462004442505)
,p_plug_name=>unistr('Emisi\00F3n de Recibos ICA')
,p_parent_plug_id=>wwv_flow_api.id(5515564370658714)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:4:&APP_SESSION.:::4:P4_ID_IMPSTO,P4_ID_IMPSTO_SBMPSTO:230012,2300122">',
'        <div class="efectoCirculo">',
unistr('            <img src="#APP_IMAGES#EMISION_RECB_PAG_PSE__ICA.png" alt="EMISI\00D3N_RECIBOS">'),
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5549688280442507)
,p_plug_name=>'Formulario RETEICA'
,p_parent_plug_id=>wwv_flow_api.id(5515564370658714)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:307:&APP_SESSION.:::307:P307_ID_IMPSTO,P307_ID_IMPSTO_SBMPSTO:230012,23001154">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#REGISTRO_E_IMPR_RETENCIONES.png" alt="REGISTRO_E_IMP_RT">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5549743044442508)
,p_plug_name=>'Imprimir Acuerdo Pago'
,p_parent_plug_id=>wwv_flow_api.id(5515564370658714)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:100:&APP_SESSION.:::100:P100_ID_IMPSTO,P100_ID_IMPSTO_SBMPSTO:230012,2300122">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#IMPRIMIR_CUOTAS_DE_ACU_DE_PAGO.png" alt="IMPRMR_CT_AC_PGO">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5549833217442509)
,p_plug_name=>'Consulta Acuerdo Pago'
,p_parent_plug_id=>wwv_flow_api.id(5515564370658714)
,p_plug_display_sequence=>100
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="f?p=&APP_ID.:116:&APP_SESSION.:::116:P116_ID_IMPSTO,P116_ID_IMPSTO_SBMPSTO:230012,2300122"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BOTON-3-CONSULTA_ACUERDOS_INDUSTRIA_COMERCIO.png"></a></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5643304984372001)
,p_plug_name=>unistr('Gesti\00F3n de Declaraciones ')
,p_parent_plug_id=>wwv_flow_api.id(5515564370658714)
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:21:&APP_SESSION.:::21:P21_ID_IMPSTO,F_CDGO_CLNTE:230012,23001">',
'        <div class="efectoCirculo">',
unistr('            <img src="#APP_IMAGES#GESTION_DE_DECLA.png" alt="GESTI\00D3N_DECLA">'),
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21524923942113403)
,p_plug_name=>'Formulario ICA'
,p_parent_plug_id=>wwv_flow_api.id(5515564370658714)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:307:&APP_SESSION.:::307:P307_ID_IMPSTO,P307_ID_IMPSTO_SBMPSTO:230012,2300122">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#REGIS_E_IMPR_ICA.png" alt="REGISTRO_E_IMP">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22324348460295501)
,p_plug_name=>unistr('Emisi\00F3n de Recibos de Pliego de cargos')
,p_parent_plug_id=>wwv_flow_api.id(5515564370658714)
,p_plug_display_sequence=>50
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:305:&APP_SESSION.:::305:P305_ID_IMPSTO,P305_ID_IMPSTO_SBMPSTO:230012,2300122">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#PAGOS_ACTOS_FISCA.png" alt="PGOS_ACT_FISCA">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(30028536126441601)
,p_plug_name=>unistr('Emisi\00F3n de Recibos RETEICA')
,p_parent_plug_id=>wwv_flow_api.id(5515564370658714)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:4:&APP_SESSION.:::4:P4_ID_IMPSTO,P4_ID_IMPSTO_SBMPSTO:230012,23001154">',
'        <div class="efectoCirculo">',
unistr('            <img src="#APP_IMAGES#EMISION_RECB_PAG_PSE__RETEICA.png" alt="EMISI\00D3N_RCBOS_RT">'),
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(84564211515173301)
,p_plug_name=>'Informacion Exogena'
,p_parent_plug_id=>wwv_flow_api.id(5515564370658714)
,p_plug_display_sequence=>90
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:11:&APP_SESSION.:::11:P11_ID_IMPSTO,F_CDGO_CLNTE:230012,23001">',
'        <div class="efectoCirculo">',
'          <img src="#APP_IMAGES#EXOGENA.png" alt="PRSNTCI\00D3N_EXOGENA">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85163669401979602)
,p_plug_name=>'Registro Industria y Comercio'
,p_parent_plug_id=>wwv_flow_api.id(5515564370658714)
,p_plug_display_sequence=>110
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:121:&APP_SESSION.:::21:P21_ID_IMPSTO,F_CDGO_CLNTE:230012,23001">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#REGISTRO_INFRM_TRB_RIT.png" alt="RGSTRO_INF_TR">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5566105458851606)
,p_plug_name=>'Regresar'
,p_plug_display_sequence=>170
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center><a href="f?p=&APP_ID.:1:&APP_SESSION.::::P1_ID_MNU:1">',
'<img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BOTON_REGRESAR-02.png" alt="No Imagen"></a></center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P1_ID_MNU'
,p_plug_display_when_cond2=>'2:3:4:5:6:7:8'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6361166385467116)
,p_plug_name=>unistr('<b>INFORMACI\00D3N EX\00D3GENA</b>')
,p_region_name=>'menu_predial'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>140
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P1_ID_MNU'
,p_plug_display_when_cond2=>'8'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6361392450467118)
,p_plug_name=>'Industria y Comercio'
,p_parent_plug_id=>wwv_flow_api.id(6361166385467116)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:11:&APP_SESSION.:::11:P11_ID_IMPSTO,F_CDGO_CLNTE:230012,23001">',
'        <div class="efectoCirculo">',
'          <img src="#APP_IMAGES#M001_INDUSTRIA.png" alt="INDUSTRIA">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6361471074467119)
,p_plug_name=>'Sobretasa a la Gasolina'
,p_parent_plug_id=>wwv_flow_api.id(6361166385467116)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:11:&APP_SESSION.:::11:P11_ID_IMPSTO,F_CDGO_CLNTE:230018,23001">',
'        <div class="efectoCirculo">',
'          <img src="#APP_IMAGES#SOBRETASA.png" alt="SOBRETASA">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6362914684467134)
,p_plug_name=>unistr('Alumbrado P\00FAblico')
,p_parent_plug_id=>wwv_flow_api.id(6361166385467116)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:11:&APP_SESSION.:::11:P11_ID_IMPSTO,P11_ID_IMPSTO_SBMPSTO,F_CDGO_CLNTE:230013,23001159,23001">',
'        <div class="efectoCirculo">',
'          <img src="#APP_IMAGES#ALUMBRADO.png" alt="ALUMBRADO">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6754106002570616)
,p_plug_name=>'<b>IMPUESTO PREDIAL UNIFICADO</b>'
,p_region_name=>'menu_predial'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P1_ID_MNU'
,p_plug_display_when_cond2=>'2'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5515235814658711)
,p_plug_name=>'Estados de Cuenta'
,p_parent_plug_id=>wwv_flow_api.id(6754106002570616)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:5:&APP_SESSION.:::5:P5_ID_IMPSTO,P5_ID_IMPSTO_SBMPSTO:230011,2300111">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#ESTADO_DE_CUENTA.png" alt="ESTADO_CUENTA">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5565642391851601)
,p_plug_name=>unistr('Proyecci\00F3n de Acuerdos de Pago')
,p_parent_plug_id=>wwv_flow_api.id(6754106002570616)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:110:&APP_SESSION.:::110:P110_ID_IMPSTO,P110_ID_IMPSTO_SBMPSTO:230011,2300111">',
'        <div class="efectoCirculo">',
unistr('            <img src="#APP_IMAGES#PROYECCION_DE_ACU_DE_PAGO.png" alt="PROYECCI\00D3N_AC_PAGO">'),
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5565753201851602)
,p_plug_name=>'Consulta de Acuerdos de Pago'
,p_parent_plug_id=>wwv_flow_api.id(6754106002570616)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="f?p=&APP_ID.:116:&APP_SESSION.:::116:P116_ID_IMPSTO,P116_ID_IMPSTO_SBMPSTO:230011,2300111"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/CONSULTA_ACUERDOS_INDUSTRIA_COMERCIO.png" alt="No Imagen"></a></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5565854413851603)
,p_plug_name=>'Imprimir Cuotas de Acuerdos de Pago'
,p_parent_plug_id=>wwv_flow_api.id(6754106002570616)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:100:&APP_SESSION.:::100:P100_ID_IMPSTO,P100_ID_IMPSTO_SBMPSTO:230011,2300111">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#IMPRIMIR_CUOTAS_DE_ACU_DE_PAGO.png" alt="IMPRIMIR_AC_PAGO">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6754570826570620)
,p_plug_name=>unistr('Emisi\00F3n de Recibos')
,p_parent_plug_id=>wwv_flow_api.id(6754106002570616)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:4:&APP_SESSION.:::4:P4_ID_IMPSTO,P4_ID_IMPSTO_SBMPSTO:230011,2300111">',
'        <div class="efectoCirculo">',
unistr('            <img src="#APP_IMAGES#EMISION_RECB_PAG_PSE.png" alt="EMISI\00D3N_RCB">'),
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(89959731612975907)
,p_plug_name=>unistr('Consulta Factura T\00EDtulo')
,p_parent_plug_id=>wwv_flow_api.id(6754106002570616)
,p_plug_display_sequence=>70
,p_plug_grid_column_span=>3
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:9999:&APP_SESSION.::::F_CDGO_CLNTE:23001">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#FACTURA_TITULO.png" alt="NOTIFICACIONES">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6754317787570618)
,p_plug_name=>unistr('<b>CIRCULACI\00D3N Y TR\00C1NSITO</b>')
,p_region_name=>'menu_predial'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P1_ID_MNU'
,p_plug_display_when_cond2=>'4'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5515327324658712)
,p_plug_name=>unistr('Emisi\00F3n de Recibos')
,p_parent_plug_id=>wwv_flow_api.id(6754317787570618)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:4:&APP_SESSION.:::4:P4_ID_IMPSTO,P4_ID_IMPSTO_SBMPSTO:230017,2300177">',
'        <div class="efectoCirculo">',
unistr('            <img src="#APP_IMAGES#EMISION_RECB_PAG_PSE.png" alt="EMISI\00D3N_RECIBOS">'),
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6754685429570621)
,p_plug_name=>'Estados de Cuenta'
,p_parent_plug_id=>wwv_flow_api.id(6754317787570618)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:5:&APP_SESSION.:::5:P5_ID_IMPSTO,P5_ID_IMPSTO_SBMPSTO:230017,2300177">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#ESTADO_DE_CUENTA.png" alt="ESTADO_CUENTA">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22224069820487906)
,p_plug_name=>'<b>SOBRETASA A LA GASOLINA</b>'
,p_region_name=>'menu_predial'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P1_ID_MNU'
,p_plug_display_when_cond2=>'5'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5549547891442506)
,p_plug_name=>'Formulario ICA'
,p_parent_plug_id=>wwv_flow_api.id(22224069820487906)
,p_plug_display_sequence=>20
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:8:&APP_SESSION.:::8:P8_ID_IMPSTO,P8_ID_IMPSTO_SBMPSTO:230018,2300188">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#REGISTRO_E_IMPR.png" alt="REGISTRO_E_IMPR">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22224263974487908)
,p_plug_name=>unistr('Emisi\00F3n de Recibos')
,p_parent_plug_id=>wwv_flow_api.id(22224069820487906)
,p_plug_display_sequence=>50
,p_plug_grid_column_span=>4
,p_plug_display_point=>'BODY'
,p_plug_source=>'<center><a href="f?p=&APP_ID.:4:&APP_SESSION.:::4:P4_ID_IMPSTO,P4_ID_IMPSTO_SBMPSTO:230018,2300188"><img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/BOTON-1-EMISION_RECIBOS_PSE.png" alt="No Imagen"></a></center>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22224576791487911)
,p_plug_name=>'Estados de Cuenta'
,p_parent_plug_id=>wwv_flow_api.id(22224069820487906)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:5:&APP_SESSION.:::5:P5_ID_IMPSTO,P5_ID_IMPSTO_SBMPSTO:230018,2300188">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#ESTADO_DE_CUENTA.png" alt="ESTADO_CUENTA">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(57724726158243301)
,p_plug_name=>unistr('Gesti\00F3n de Declaraciones ')
,p_parent_plug_id=>wwv_flow_api.id(22224069820487906)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:21:&APP_SESSION.:::21:P21_ID_IMPSTO,F_CDGO_CLNTE:230018,23001">',
'        <div class="efectoCirculo">',
unistr('            <img src="#APP_IMAGES#GESTION_DE_DECLA.png" alt="GESTI\00D3N_DECLA">'),
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22748624175946201)
,p_plug_name=>unistr('<b>ALUMBRADO P\00DABLICO</b>')
,p_region_name=>'menu_predial'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P1_ID_MNU'
,p_plug_display_when_cond2=>'6'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22749363162946208)
,p_plug_name=>unistr('Emisi\00F3n de Recibos')
,p_parent_plug_id=>wwv_flow_api.id(22748624175946201)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:4:&APP_SESSION.:::4:P4_ID_IMPSTO,P4_ID_IMPSTO_SBMPSTO:230013,23001159">',
'        <div class="efectoCirculo">',
unistr('            <img src="#APP_IMAGES#EMISION_RECB_PAG_PSE.png" alt="EMISI\00D3N_RECIBOS">'),
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22749549412946210)
,p_plug_name=>'Estados de Cuenta'
,p_parent_plug_id=>wwv_flow_api.id(22748624175946201)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:5:&APP_SESSION.:::5:P5_ID_IMPSTO,P5_ID_IMPSTO_SBMPSTO:230013,23001159">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#ESTADO_DE_CUENTA.png" alt="ESTADO_CUENTA">',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(34750031269025602)
,p_plug_name=>'Formatos y Manuales para Nuestros Contribuyentes'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>160
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table style="width:100%; margin:50px auto; padding-right:5%; padding-left:5%">',
'    <tbody style="text-align:center">',
'    ',
'        <tr>',
'            <td style="width:15%; font-family: ''Anuphan'', sans-serif; font-size: 18px;">',
unistr('                <a href="#APP_IMAGES#REGISTRO DE INFORMACI\00D3N TRIBUTARIA RIT.pdf" target="_blank">'),
unistr('                    Registro de Informaci\00F3n Tributaria RIT'),
'                    <i class="fa fa-download"></i>',
'                    <br>',
'                </a>',
'            </td>',
'        </tr>',
'        <tr>',
'            <td style="width:15%; font-family: ''Anuphan'', sans-serif; font-size: 18px;">',
'                <a href="#APP_IMAGES#INSTRUCTIVO RIT.pdf" target="_blank">',
unistr('                    Instructivo Registro de Informaci\00F3n Tributaria RIT'),
'                    <i class="fa fa-download"></i>',
'                    <br>',
'                </a>',
'            </td>',
'        </tr>       ',
'        <tr>',
'            <td style="width:15%; font-family: ''Anuphan'', sans-serif; font-size: 18px;">',
'                <a href="#APP_IMAGES#FORMULARIO CANCELACION RIT.pdf" target="_blank">',
unistr('                    Formato de Cancelaci\00F3n RIT'),
'                    <i class="fa fa-download"></i>',
'                </a>',
'            </td>',
'        </tr>',
'        ',
'        <tr>',
'            <td style="width:15%; font-family: ''Anuphan'', sans-serif; font-size: 18px;">',
'                <a href="#APP_IMAGES#SHF-R002-19 Solicitud de tramites.xlsx" target="_blank">',
unistr('                    Formato de Solicitud de Tr\00E1mites SHF-R002-19'),
'                    <i class="fa fa-download"></i>',
'                </a>',
'            </td>',
'        </tr>',
'        ',
'        <tr>',
'            <td style="width:15%; font-family: ''Anuphan'', sans-serif; font-size: 18px;">',
'                <a href="#APP_IMAGES#FORMATO SOLICITUD DE PAGO POR CUOTAS ICA.pdf" target="_blank">',
'                    Formato de Solicitud de Pago por Cuotas ICA',
'                    <i class="fa fa-download"></i>',
'                </a>',
'            </td>',
'        </tr>',
'        <tr>',
'            <td style="width:15%; font-family: ''Anuphan'', sans-serif; font-size: 18px;">',
'                <a href="#APP_IMAGES#Instructivo Pago Pliego Cargos.mp4" target="_blank">',
'                    Instructivo Pago Pliego de Cargos',
'                    <i class="fa fa-download"></i>',
'                </a>',
'            </td>',
'        </tr>',
'        ',
'</tbody>',
'</table>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65400076104844701)
,p_plug_name=>unistr('<b>P\00C1GINA EN MANTENIMIENTO</b>')
,p_region_name=>'menu_mantenimiento'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:1:&APP_SESSION.:::1:">',
'        <img src="#IMAGE_PREFIX#/css/infortributos/imagenes/clientes/23001/PAGINA_MANTENIMIENTO.jpg" alt="No Imagen">',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P1_ID_MNU'
,p_plug_display_when_cond2=>'99'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85165696795979622)
,p_plug_name=>'Footer'
,p_region_name=>'menu_'
,p_region_template_options=>'t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>180
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="redes-sociales">',
'  <div class="redes-item">',
'    <a href="https://www.facebook.com/AlcaldiaDeMonteria" target="_blank">',
'      <img alt="Facebook" src="https://icon-library.com/images/facebook-icon-download-for-android/facebook-icon-download-for-android-4.jpg">',
'    </a>',
'    <div class="redes-text">Facebook</div>',
'  </div>',
'',
'  <div class="redes-item">',
'    <a href="https://twitter.com/sechaciendamtr" target="_blank">',
'      <img alt="X" src="#APP_IMAGES#Logo-X.png">',
'    </a>',
'    <div class="redes-text">X</div>',
'  </div>',
'',
'  <div class="redes-item">',
'    <a href="https://www.instagram.com/secretariahaciendamonteria/" target="_blank">',
'      <img alt="Instagram" src="https://icon-library.com/images/instagram-small-icon/instagram-small-icon-12.jpg">',
'    </a>',
'    <div class="redes-text">Instagram</div>',
'  </div>',
'',
'  <div class="redes-item">',
'    <a href="mailto:predial@alcaldiamonteria.gov.co" target="_blank">',
'      <img alt="Correo" src="https://icon-library.com/images/e-mail-icon/e-mail-icon-8.jpg">',
'    </a>',
unistr('    <div class="redes-text">Correo <br> Electr\00F3nico</div>'),
'  </div>',
'</div>',
'',
'<div class="footer">',
unistr('  <p>Powered by: <strong>Inform\00E1tica y Tributos S.A.S</strong></p>'),
'</div>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85166079722979626)
,p_plug_name=>unistr('<b>VENTANILLA \00DANICA DE REGISTRO</b>')
,p_region_name=>'menu_predial'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P1_ID_MNU'
,p_plug_display_when_cond2=>'7'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85166230697979628)
,p_plug_name=>'Registro Industria y Comercio'
,p_parent_plug_id=>wwv_flow_api.id(85166079722979626)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=60000">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#ACCESO_NOTARIOS.png" alt="ACCESO_NOTARIOS>',
'        </div>',
'    </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100665556514486602)
,p_plug_name=>'<b>GESTION DE AUTORIZACION</b>'
,p_region_name=>'menu_autorizacion'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P1_ID_MNU'
,p_plug_display_when_cond2=>'20'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100665767176486604)
,p_plug_name=>unistr('Solicitudes de Autorizaci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(100665556514486602)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'    <a href="f?p=&APP_ID.:2024023:&APP_SESSION.:::2024023:F_CDGO_CLNTE:23001">',
'        <div class="efectoCirculo">',
'            <img src="#APP_IMAGES#SOLI_AUTORIZACION.png" alt="SOLI_AUTORIZACION">',
'        </div>   ',
'    </a>',
'</center>',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100665839627486605)
,p_plug_name=>unistr('Gesti\00F3n de Permisos de Autorizaci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(100665556514486602)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'img-ico-portal-2'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center>',
'   <a href="f?p=&APP_ID.:2024026:&APP_SESSION.:::2024026:F_CDGO_CLNTE:23001">',
'    <div class="efectoCirculo">',
'         <img src="#APP_IMAGES#CONSUL_AUTORIZACION.png" alt="CONSUL_AUTORIZACION">',
'      </div>   ',
'   </a>',
'</center>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(133158910160831149)
,p_plug_name=>unistr('<b>Informaci\00F3n Notarios</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>150
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ol>',
'  <li>',
unistr('    <a><b>\00BFQu\00E9 es VUR?</b></a>'),
'    <ul>',
unistr('      <li style="text-align:justify">La Ventanilla \00DAnica de Registro (VUR) es el modelo de simplificaci\00F3n de tr\00E1mites de registro, liderado por la Superintendencia de Notariado y Registro (SNR) que articula las diferentes entidades facilitando el reg')
||unistr('istro inmobiliario y garantizando seguridad jur\00EDdica al ciudadano y las entidades que lo integran</li>'),
'    </ul>',
'  </li>',
'  <li>',
'    <a><b>Objetivos</b></a>',
'    <ul>',
unistr('      <li style="text-align:justify">Reducir los tr\00E1mites, plazos, costos y requisitos necesarios para formalizar los procesos de escrituraci\00F3n y registro de la propiedad inmueble, principalmente para los actos de transferencia de dominio.</li>'),
'',
'      <li style="text-align:justify">Fomentar la formalidad y el cumplimiento de las obligaciones legales del ciudadano frente a las transacciones de transferencia de inmuebles.</li>',
'',
'      <li style="text-align:justify">Garantizar la transparencia y evitar riesgo de fraude alrededor de transacciones de compraventa entre particulares.</li>',
'',
unistr('      <li style="text-align:justify">Mejorar los procesos de informaci\00F3n e inducir cultura de legalidad en torno a la propiedad inmueble.</li>'),
'',
unistr('      <li style="text-align:justify">Acercar las gestiones asociadas al registro inmueble ante la ciudadan\00EDa, a partir de la ampliaci\00F3n y cualificaci\00F3n de canales de atenci\00F3n y el mejoramiento de la calidad del servicio.</li>'),
'',
unistr('      <li style="text-align:justify">Articular a las entidades p\00FAblicas y privadas relacionadas con el registro de la propiedad inmueble en torno a un proceso eficiente y expedito.</li>'),
'    </ul>',
'  </li>',
'  <li>',
unistr('    <a><b>\00BFC\00F3mo funciona?</b></a>'),
'    <ul>',
unistr('      <li style="text-align:justify">A trav\00E9s de nuestro convenio los notarios de cualquier municipio de Colombia ingresando al portal del Municipio de Monter\00EDa pueden consultar y descargar el paz y salvo del Impuesto Predial y Valorizaci\00F3n, necesari')
||unistr('os para la protocolizaci\00F3n de escritura p\00FAblica sobre predios en jurisdicci\00F3n del Municipio</li>'),
'    </ul>',
'  </li>',
'  <li>',
unistr('    <a><b>\00BFComo me registro?</b></a>'),
'    <ul>',
unistr('      <li style="text-align:justify">Si es un notario de cualquier municipio de Colombia puede solicitar su usuario y contrase\00F1a para acceder a los paz y salvos, solo debe enviar un correo electr\00F3nico a <b><a href="mailto:predial@alcaldiamonteria.gov')
||unistr('.co" target="_blank">predial@alcaldiamonteria.gov.co</a></b>, el correo obligatoriamente debe ser enviado del dominio a autorizado por la superintendencia de notariado y registro (@supernotariado.gov.co) manifestando su inter\00E9s en la creaci\00F3n del usu')
||unistr('ario, en el correo deber\00E1 suministrar la siguiente informaci\00F3n:<ul>'),
'        <li>Nombre Completo</li>',
unistr('        <li>C\00E9dula</li>'),
'        <li>Ciudad de la Notaria</li>',
unistr('        <li>N\00FAmero de la Notaria</li>'),
unistr('        <li>Direcci\00F3n</li>'),
unistr('        <li>Tel\00E9fono</li>'),
'        </ul>',
'      </li>',
'      <li style="text-align:justify">',
unistr('        En un plazo no m\00E1ximo a un d\00EDa h\00E1bil se le estar\00E1 respondiendo el correo con las credenciales de acceso y un instructivo para emitir los paz y salvos'),
'      </li>',
'    </ul>',
'  </li>',
'</ol>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P1_ID_MNU'
,p_plug_display_when_cond2=>'7'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5515666712658715)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5515564370658714)
,p_button_name=>'New_1_1'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'New'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1::'
,p_button_condition=>'P1_ID_MNU_PDRE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6361233476467117)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6361166385467116)
,p_button_name=>'New_1_1_2_1_1'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'New'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1::'
,p_button_condition=>'P1_ID_MNU_PDRE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6754234610570617)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6754106002570616)
,p_button_name=>'New_1_1_1'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'New'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1::'
,p_button_condition=>'P1_ID_MNU_PDRE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6754437592570619)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6754317787570618)
,p_button_name=>'New_1_1_1_1'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'New'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1::'
,p_button_condition=>'P1_ID_MNU_PDRE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22224104997487907)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(22224069820487906)
,p_button_name=>'New_1_1_2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'New'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1::'
,p_button_condition=>'P1_ID_MNU_PDRE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(22748790421946202)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(22748624175946201)
,p_button_name=>'New_1_1_1_1_1'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'New'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1::'
,p_button_condition=>'P1_ID_MNU_PDRE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(25343689107206902)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(85165696795979622)
,p_button_name=>'New'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'.'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP:P1_CODE:12345'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(65400148418844702)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(65400076104844701)
,p_button_name=>'New_1_1_1_2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'New'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1::'
,p_button_condition=>'P1_ID_MNU_PDRE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(85166104236979627)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(85166079722979626)
,p_button_name=>'New_1_1_2_1'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'New'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1::'
,p_button_condition=>'P1_ID_MNU_PDRE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(100665666446486603)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(100665556514486602)
,p_button_name=>'New_1_1_2_2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'New'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1::'
,p_button_condition=>'P1_ID_MNU_PDRE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5502232606369802)
,p_name=>'P1_CDGO_CLNTE_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5514673169658705)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5502330764369803)
,p_name=>'P1_ID_IMPSTO_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5514673169658705)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5502427097369804)
,p_name=>'P1_ID_IMPSTO_SBMPSTO_1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5514673169658705)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5502633755369806)
,p_name=>'P1_ID_MNU_PDRE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(5514673169658705)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5514723006658706)
,p_name=>'P1_NVEL_MNU'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(5514673169658705)
,p_item_default=>'1'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5565914396851604)
,p_name=>'P1_ID_MNU'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(5514673169658705)
,p_item_default=>'1'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25343597655206901)
,p_name=>'P1_CODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(85165696795979622)
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when_type=>'NEVER'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59694775855049922)
,p_name=>'P1_CDGO_CLNTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(5514673169658705)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59695147434049943)
,p_name=>'P1_ID_IMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(5514673169658705)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(59695525796049943)
,p_name=>'P1_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(5514673169658705)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(89960218219975912)
,p_name=>'Abrir modal PQR'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#abrir-modal-pqrs'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(89960359963975913)
,p_event_id=>wwv_flow_api.id(89960218219975912)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(89960002566975910)
,p_stop_execution_on_error=>'Y'
);
end;
/
