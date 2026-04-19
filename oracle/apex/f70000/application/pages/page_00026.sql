prompt --application/pages/page_00026
begin
wwv_flow_api.create_page(
 p_id=>26
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Declaraciones Propiedades de Formulario'
,p_step_title=>'Formularios Arbol'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
''))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*RGN_ARBOL.addEventListener(''contextmenu'', function(ev) {',
'        /*$("#MenuContext").menu( "toggle", ev.pageX, ev.pageY );',
'          ev.preventDefault(); ',
'          return false;',
'        if (evt.target.className === ''a-TreeView-label'') {',
'            console.log("Reconoce")',
'        }else{',
'            console.log("No lo reconoce")',
'        }*/',
'  /*  console.log("Reconoce")',
'    }, false);',
'',
'/*function doAction(pNode,pTree,a){  ',
'  var l_action;  ',
'  var l_id;  ',
'  ',
'  l_id = pNode.attr("id");  ',
'  ',
'  if (a=="create") { l_action = "f?p="+$v(''pFlowId'')+":2:"+$v(''pInstance'')+":::2:P2_MGR:"+l_id }  ',
'  if (a=="delete") { deleteEmp(pNode,l_id); }  ',
'  if (a=="edit") { l_action = "f?p="+$v(''pFlowId'')+":2:"+$v(''pInstance'')+"::::P2_EMPNO:"+l_id }  ',
'  ',
'  if (l_action != null) {document.location.href=l_action; }  ',
'}  */'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'mostrarAyudaD();',
'/*var menu$ = $("<div id=''MenuContext''></div>");',
'$("body").append(menu$);',
'menu$.menu({',
'    iconType: "fa",',
'    items: [',
'       {',
'            type: "action",',
'            labelKey:"Test Button 1",',
'            icon: "fa-language ",',
'            action: function(menu, btn) {  ',
'                $.event.trigger(''CustomButton1'');  ',
'            }',
'        }',
'    ]',
'});',
'/*var lTreeContextMenu={  ',
'    items:{create:false,rename:false,remove:false,  ',
'        contextmenu_create:{  ',
'            label:"<strong>Add Employee</strong>",  ',
'            icon: "",  ',
'            visible: true,  ',
'            action: function(pNode, pTree){doAction(pNode, pTree, "create");}  ',
'        },  ',
'        contextmenu_delete:{  ',
'            label:"<strong>Delete</strong>",  ',
'            icon: "",  ',
'            visible: true,  ',
'            action: function(pNode, pTree){doAction(pNode, pTree, "delete");}  ',
'        },  ',
'        contextmenu_edit:{  ',
'            label:"<strong>Edit</strong>",  ',
'            icon: "",  ',
'            visible: true,  ',
'            action: function(pNode, pTree){doAction(pNode, pTree, "edit");}  ',
'        }  ',
'}};  ',
'  ',
'        // use jsTree to render the tree  ',
'        var lTreeSel = apex.jQuery("#RGN_ARBOL").find("div.tree");  ',
'        var lTreeId = lTreeSel.attr("id");  ',
'        var lDataId = lTreeId.replace("tree","");  ',
'        var lTreeData = eval("l"+lDataId+"Data");  ',
'        var lTree = lTreeSel.tree({  ',
'          data:{  ',
'            type:"json",  ',
'            async:true,  ',
'            opts:{  ',
'              "static":lTreeData,  ',
'              isTreeLoaded:false,  ',
'              method:"POST",  ',
'              url:"wwv_flow.show"  ',
'            }  ',
'          },  ',
'          root:{  ',
'            draggable:false,  ',
'            valid_children: "folder"  ',
'          },  ',
'          folder:{  ',
'            valid_children: "file"  ',
'          },  ',
'          file:{  ',
'            valid_children: "none",  ',
'            max_children: 0,  ',
'            max_depth:0  ',
'          },  ',
'          opened:["7839"],  ',
'          plugins:{contextmenu:lTreeContextMenu}  ',
'          });  ',
'  ',
'        $.showTooltip = function(pEvent) {  ',
'        var lAction = apex.jQuery(pEvent.target).attr("tooltip");  ',
'        if (lAction && lAction != "") {  ',
'            toolTip_enable(pEvent,this,apex.jQuery(this).attr("tooltip"));  ',
'        }  ',
'        }; // showTooltip  ',
'  ',
'        // Bind Tooltips for tree nodes  ',
'        apex.jQuery(''a[tooltip]'', lTreeSel).bind("mouseover", $.showTooltip);  ',
'  ',
'        // Hack for right click problem on selected node  ',
'        apex.jQuery("#RGN_ARBOL").find("a").live("mouseup",function() {apex.jQuery("#RGN_ARBOL").find("a").removeClass()});  */'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20200122104251'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16413220905495825)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'    </b>',
'</h5>',
'<i>',
unistr('Funcionalidad que permite gestionar los formularios de declaraci\00F3n.'),
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16413691017495829)
,p_plug_name=>unistr('M\00E1s informaci\00F3n')
,p_region_name=>'AYUDA'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(164079332454707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul>',
'  <li>Formulario',
'      <ul>',
'          <li>Crear',
'              <ol>',
unistr('                  <li>Presionar el bot\00F3n <b>Nuevo Formulario</b>.</li>'),
unistr('                  <li>Registrar la informaci\00F3n requerida.</li>'),
unistr('                  <li>Presionar el bot\00F3n <b>Insertar</b>.</li>'),
'              </ol>',
'          </li>',
'          <li>Editar',
'              <ol>',
'                  <li>Presionar doble clic sobre el formulario a <b>editar</b>.</li>',
unistr('                  <li>Actualizar  la informaci\00F3n.</li>'),
unistr('                  <li>Presionar el bot\00F3n <b>Aplicar Cambios</b>.</li>'),
'              </ol>',
'          </li>',
'          <li>Eliminar',
'              <ol>',
'                  <li>Presionar doble clic sobre el formulario a <b>eliminar</b>.</li>',
unistr('                  <li>Presionar el bot\00F3n <b>Eliminar</b>.</li>'),
'              </ol>',
'          </li>',
'      </ul>',
'  </li>',
unistr('  <li>Regi\00F3n'),
'      <ul>',
'          <li>Crear',
'              <ol>',
unistr('                  <li>Presionar el bot\00F3n <b>Nueva Regi\00F3n</b> o presionar doble clic sobre el item <b>Regiones</b>.</li>'),
unistr('                  <li>Registrar la informaci\00F3n requerida.</li>'),
unistr('                  <li>Presionar el bot\00F3n <b>Insertar</b>.</li>'),
'              </ol>',
'          </li>',
'          <li>Editar',
'              <ol>',
unistr('                  <li>Presionar doble clic sobre la regi\00F3n a <b>editar</b>.</li>'),
unistr('                  <li>Actualizar  la informaci\00F3n.</li>'),
unistr('                  <li>Presionar el bot\00F3n <b>Aplicar Cambios</b>.</li>'),
'              </ol>',
'          </li>',
'          <li>Eliminar',
'              <ol>',
unistr('                  <li>Presionar doble clic sobre la regi\00F3n a <b>eliminar</b>.</li>'),
unistr('                  <li>Presionar el bot\00F3n <b>Eliminar</b>.</li>'),
'              </ol>',
'          </li>',
'      </ul>',
'  </li>',
'  <li>Atributo',
'      <ul>',
'          <li>Crear',
'              <ol>',
unistr('                  <li>Presionar el bot\00F3n <b>Nuevo Atributo</b> o presionar doble clic sobre el item <b>Atributos</b>.</li>'),
unistr('                  <li>Registrar la informaci\00F3n requerida.</li>'),
unistr('                  <li>Presionar el bot\00F3n <b>Insertar</b>.</li>'),
'              </ol>',
'          </li>',
'          <li>Editar',
'              <ol>',
'                  <li>Presionar doble clic sobre el atributo a <b>editar</b>.</li>',
unistr('                  <li>Actualizar  la informaci\00F3n.</li>'),
unistr('                  <li>Presionar el bot\00F3n <b>Aplicar Cambios</b>.</li>'),
'              </ol>',
'          </li>',
'          <li>Eliminar',
'              <ol>',
'                  <li>Presionar doble clic sobre el atributo a <b>eliminar</b>.</li>',
unistr('                  <li>Presionar el bot\00F3n <b>Eliminar</b>.</li>'),
'              </ol>',
'          </li>',
'      </ul>',
'  </li>',
'</ul>  '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103051208748096901)
,p_plug_name=>'Arbol'
,p_region_name=>'RGION_ARBOL'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:margin-right-lg'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  case',
'            when connect_by_isleaf = 1 then 0',
'            when level = 1 then 1',
'            else -1',
'        end as status, ',
'        level,',
'        lpad('''',(level-1)*5)||descripcion as title, ',
'        case',
'          when substr(cod_hijo, 0, 1) = ''A'' then ''fa-file-text-o''           --Formulario    ',
'          when substr(cod_hijo, 0, 1) in (''B'', ''F'', ''J'') then ''fa-tree-org'' --Carpeta Regiones',
'          when substr(cod_hijo, 0, 1) in (''C'', ''K'') then ''fa-layout-header'' --Regiones',
'          when substr(cod_hijo, 0, 1) in (''D'', ''H'') then ''fa-th-list''       --Carpeta Atributos',
'          when substr(cod_hijo, 0, 1) in (''E'', ''I'') then ''fa-variable''      --Atributos',
'          else ''fa-circle''',
'        end as icon,',
'        vlor as value,',
'        case',
'            when substr(vlor, 0, 4) = ''CSSR'' then --CARPETA SUBREGIONES SUBREGIONES',
'                apex_util.prepare_url(''f?p='' || :APP_ID || '':24:'' || :APP_SESSION || ''::NO:24:P24_R_ID_FRMLRIO,P24_R_ID_RGION_PDRE:''|| substr(vlor,5))',
'            when substr(vlor, 0, 4) = ''CASR'' then --CARPETA ATRIBUTOS SUBREGIONES',
'                apex_util.prepare_url(''f?p='' || :APP_ID || '':28:'' || :APP_SESSION || ''::NO:28:P28_A_ID_RGION:'' || substr(vlor,5))',
'            when substr(vlor, 0, 3) = ''CSR'' then   --CARPETA SUBREGIONES REGION PADRE',
'                apex_util.prepare_url(''f?p='' || :APP_ID || '':24:'' || :APP_SESSION || ''::NO:24:P24_R_ID_FRMLRIO,P24_R_ID_RGION_PDRE:''|| substr(vlor,4))',
'            when substr(vlor, 0, 2) = ''CA'' then    --CARPETA ATRIBUTOS REGION PADRE',
'                apex_util.prepare_url(''f?p='' || :APP_ID || '':28:'' || :APP_SESSION || ''::NO:28:P28_A_ID_RGION:'' || substr(vlor,3))',
'            when substr(vlor, 0, 2) = ''CR'' then    --CARPETA REGION PADRE',
'                apex_util.prepare_url(''f?p='' || :APP_ID || '':24:'' || :APP_SESSION || ''::NO:24:P24_R_ID_FRMLRIO:''|| substr(vlor,3))',
'            when substr(vlor, 0, 1) = ''A'' then     --Atributo',
'                apex_util.prepare_url(''f?p='' || :APP_ID || '':28:'' || :APP_SESSION || ''::NO:28:P28_NODO_SELECCIONADO:'' || vlor)',
'            when substr(vlor, 0, 1) = ''R'' then     --Region',
'                apex_util.prepare_url(''f?p='' || :APP_ID || '':24:'' || :APP_SESSION || ''::NO:24:P24_NODO_SELECCIONADO:'' || vlor)',
'            when substr(vlor, 0, 1) = ''F'' then     --Formulario',
'                apex_util.prepare_url(''f?p='' || :APP_ID || '':22:'' || :APP_SESSION || ''::NO:22:P22_NODO_SELECCIONADO:'' || vlor)    ',
'            else null    ',
'        end as link',
'from (',
'    --FORMULARIOS',
'    select      ''A''||id_frmlrio             		as cod_hijo,    null                        						as cod_padre,',
'                cdgo_frmlrio || '' - '' || dscrpcion	as descripcion, ''F''||id_frmlrio             						as vlor,',
'                0                           		as orden',
'    from        gi_d_formularios',
'    where       cdgo_clnte  =   :F_CDGO_CLNTE',
'    union',
'    --CARPETA REGION PADRE',
'    select      ''B''||id_frmlrio         			as cod_hijo,    ''A''||id_frmlrio         							as cod_padre,',
'                ''Regiones''              			as descripcion, ''CR''||id_frmlrio       								as vlor,',
'                0                       			as orden',
'    from        gi_d_formularios    ',
'	union',
'    --REGION PADRE',
'    select      ''C''||id_frmlrio_rgion   			as cod_hijo,    ''B''||id_frmlrio         							as cod_padre,',
'                dscrpcion               			as descripcion, ''R''||id_frmlrio_rgion   							as vlor,',
'                orden',
'    from        gi_d_formularios_region',
'    where       id_frmlrio_rgion_pdre is null',
'    union',
'    --CARPETA ATRIBUTOS REGION PADRE',
'    select      ''D''||id_frmlrio_rgion   			as cod_hijo,    ''C''||id_frmlrio_rgion   							as cod_padre,',
'                ''Atributos''             			as descripcion, ''CA''||id_frmlrio_rgion      						as vlor,',
'                orden',
'    from        gi_d_formularios_region',
'    where       id_frmlrio_rgion_pdre is null',
'    union',
'    --ATRIBUTOS REGION PADRE',
'    select      ''E''||id_frmlrio_rgion_atrbto    	as cod_hijo,    ''D''||id_frmlrio_rgion           					as cod_padre,',
'                dscrpcion                       	as descripcion, ''A''||id_frmlrio_rgion_atrbto    					as vlor,',
'                orden',
'    from        gi_d_frmlrios_rgion_atrbto',
'    union    ',
'    --CARPETA SUBREGIONES REGION PADRE',
'    select      ''F''||id_frmlrio_rgion   			as cod_hijo,    ''C''||id_frmlrio_rgion   							as cod_padre,',
'                ''Subregiones''           			as descripcion, ''CSR'' || id_frmlrio ||'',''|| id_frmlrio_rgion   		as vlor,',
'                orden',
'    from        gi_d_formularios_region',
'    where       id_frmlrio_rgion_pdre is null',
'    union',
'    --SUBREGIONES REGION PADRE',
'    select      ''K''||id_frmlrio_rgion   			as cod_hijo,    ''F''||id_frmlrio_rgion_pdre      					as cod_padre,',
'                dscrpcion               			as descripcion, ''R''||id_frmlrio_rgion           					as vlor,',
'                orden',
'    from        gi_d_formularios_region',
'    where       id_frmlrio_rgion_pdre is not null',
'    union',
'    --CARPETA ATRIBUTOS SUBREGIONES',
'    select      ''H''||id_frmlrio_rgion   			as cod_hijo,    ''K''||id_frmlrio_rgion   							as cod_padre,',
'                ''Atributos''             			as descripcion, ''CASR''||id_frmlrio_rgion                			as vlor,',
'                orden',
'    from        gi_d_formularios_region',
'    where       id_frmlrio_rgion_pdre is not null',
'    union',
'    --ATRIBUTOS SUBREGIONES',
'    select      ''I''||id_frmlrio_rgion_atrbto    	as cod_hijo,    ''H''||id_frmlrio_rgion           					as cod_padre,',
'                dscrpcion                       	as descripcion, ''A''||id_frmlrio_rgion_atrbto    					as vlor,',
'                orden',
'    from        gi_d_frmlrios_rgion_atrbto',
'    union',
'    --CARPETA SUBREGIONES SUBREGIONES',
'    select      ''J''||id_frmlrio_rgion   			as cod_hijo,    ''K''||id_frmlrio_rgion_pdre      					as cod_padre,',
'                ''Subregiones''           			as descripcion, ''CSSR''|| id_frmlrio ||'',''||id_frmlrio_rgion_pdre	as vlor,',
'                orden',
'    from        gi_d_formularios_region',
'    where       id_frmlrio_rgion_pdre is not null',
'    --SUBREGIONES SUBREGIONES',
'    union',
'    select      ''K''||id_frmlrio_rgion   			as cod_hijo,    ''J''||id_frmlrio_rgion   							as cod_padre,',
'                dscrpcion               			as descripcion, ''R''||id_frmlrio_rgion   							as vlor,',
'                orden',
'    from        gi_d_formularios_region',
'    where       id_frmlrio_rgion_pdre is not null',
') a',
'start with          cod_padre is null',
'connect by nocycle  prior    cod_hijo = cod_padre',
'order siblings by   orden, descripcion;'))
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'D'
,p_attribute_03=>'P26_NODO_SELECCIONADO'
,p_attribute_04=>'DB'
,p_attribute_08=>'fa'
,p_attribute_10=>'TITLE'
,p_attribute_11=>'LEVEL'
,p_attribute_12=>'ICON'
,p_attribute_15=>'STATUS'
,p_attribute_20=>'VALUE'
,p_attribute_22=>'TITLE'
,p_attribute_23=>'LEVEL'
,p_attribute_24=>'LINK'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103385786595418816)
,p_plug_name=>'opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16413794039495830)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(16413220905495825)
,p_button_name=>'BTN_MAS_INFRMCION'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('M\00E1s Informaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:openModal(''AYUDA'');'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103051380177096902)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(103051208748096901)
,p_button_name=>'Collapse'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Collapse'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103385861336418817)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(103385786595418816)
,p_button_name=>'BTN_NVO_FRMLRIO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Formulario'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:RP,22::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103051697592096905)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(103051208748096901)
,p_button_name=>'BTN_EXPANDE_TREE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Expande Tree'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103511353756476121)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(103385786595418816)
,p_button_name=>'BTN_NVO_RGION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Nueva Regi\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:RP,24::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103511422674476122)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(103385786595418816)
,p_button_name=>'BTN_NVO_RGION_ATRBTO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Nuevo Atributo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:RP,28::'
,p_icon_css_classes=>'fa-folder-plus'
,p_button_cattributes=>'color= "background-color:#d7ecfd";'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16413025910495823)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(103385786595418816)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(16413194541495824)
,p_branch_name=>unistr('Ir a P\00E1gina 69')
,p_branch_action=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.:RP,69::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(16413025910495823)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103052092702096909)
,p_name=>'P26_NODO_SELECCIONADO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(103051208748096901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103051418544096903)
,p_name=>'Collapse'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(103051380177096902)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103051504277096904)
,p_event_id=>wwv_flow_api.id(103051418544096903)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_TREE_COLLAPSE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(103051208748096901)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103051783448096906)
,p_name=>'Expande Tree'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(103051697592096905)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103051890334096907)
,p_event_id=>wwv_flow_api.id(103051783448096906)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_TREE_EXPAND'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(103051208748096901)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(103705303598605841)
,p_name=>'Menu Contextual'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(103705403869605842)
,p_event_id=>wwv_flow_api.id(103705303598605841)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_TP.DA.TREECONTEXTMENU'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(103051208748096901)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{items:[',
'  {type:"action", label: "do something 1", action:function(){ ',
'      var node =  apex.jQuery("#RGION_ARBOL div[role=''tree'']").treeView("getSelectedNodes")[0];',
'      console.log("selected do something 1, node selected: ", node);',
'      alert("You actived ''do something 1'' on " + node.label + "(id: "+ node.id +")");',
'    }',
'  },',
'  {type:"separator"},',
'  {type:"action", label: "Nuevo Formulario", action:function(){',
'	  ',
'	  var c = "f?p=&APP_ID.:22:&SESSION.";',
'	  var d = ''::NO:::''',
'      var e = ("javascript:apex.navigation.dialog(''f?p=&APP_ID.:22:&SESSION.").length;',
'      var f = c.slice(0,e)+d+c.slice(e);',
'      f=f.replace(":::::",":");',
'     console.log(f);   ',
'     window.location.href=f;',
'  }} ,',
'  {type:"separator"},',
unistr('  {type:"action", label: "Nueva Regi\00F3n", action:function(){'),
'	  ',
'	  var c = "f?p=&APP_ID.:24:&SESSION.";',
'	  var d = ''::NO:::''',
'      var e = ("javascript:apex.navigation.dialog(''f?p=&APP_ID.:24:&SESSION.").length;',
'      var f = c.slice(0,e)+d+c.slice(e);',
'      f=f.replace(":::::",":");',
'     console.log(f);   ',
'     window.location.href=f;',
'  }},',
'    {type:"separator"},',
'  {type:"action", label: "Nuevo Atributo", action:function(){',
'	  ',
'	  var c = "f?p=&APP_ID.:28:&SESSION.";',
'	  var d = ''::NO::P28_NODO_SELECCIONADO:''',
'      var e = ("javascript:apex.navigation.dialog(''f?p=&APP_ID.:28:&SESSION.").length;',
'      var f = c.slice(0,e)+d+c.slice(e);',
'      f=f.replace(":::::",":");',
'     console.log(f);   ',
'     window.location.href=f;',
'  }} ',
'    ',
']}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(37971552494700401)
,p_name=>unistr('\00C1rbol cerrar cuadro de dialogo')
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(103051208748096901)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(37971617821700402)
,p_event_id=>wwv_flow_api.id(37971552494700401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(103051208748096901)
,p_stop_execution_on_error=>'Y'
);
end;
/
