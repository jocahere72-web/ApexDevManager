prompt --application/shared_components/user_interface/templates/region/breadcrumb_prueba
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(177323026447050602)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-BreadcrumbRegion #REGION_CSS_CLASSES#"> ',
'  <div class="t-BreadcrumbRegion-body">',
'    <div class="t-BreadcrumbRegion-breadcrumb">',
'      #BODY#',
'    </div>',
'    <div class="t-BreadcrumbRegion-title">',
'      <h6 class="t-BreadcrumbRegion-titleText">#TITLE#</h6>',
'    </div>',
'  </div>',
'  <div class="t-BreadcrumbRegion-buttons">#PREVIOUS##CLOSE##DELETE##HELP##CHANGE##EDIT##COPY##CREATE##NEXT#</div>',
'</div>',
''))
,p_page_plug_template_name=>'Breadcrumb_prueba'
,p_internal_name=>'BREADCRUMB_PRUEBA'
,p_javascript_code_onload=>'apex.theme42.initializePage.rightSideCol();'
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BreadcrumbRegion--showBreadcrumb'
,p_preset_template_options=>'t-BreadcrumbRegion--useBreadcrumbTitle:margin-bottom-none:t-Form--noPadding:t-Form--stretchInputs:t-Form--leftLabels:t-Form--labelsAbove:margin-left-none:margin-right-none:margin-top-none'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>99088830939915262
,p_translate_this_template=>'N'
);
end;
/
