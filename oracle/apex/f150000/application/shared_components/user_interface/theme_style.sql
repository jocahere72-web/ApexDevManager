prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(57666899876637735)
,p_theme_id=>42
,p_name=>'Vita Valle'
,p_is_current=>true
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_config=>'{"customCSS":"#P0_LOGO_LEFT, #P0_LOGO_RIGHT {\n    width: 95%; \n  \theight: 15rem;\n}\n\n#menu {\n    position: absolute;\n    right: 3rem;\n    top: 1rem;\n}\n\n#menu ul li {\n    background-color: rgba(0, 127, 194, 0.92);\n}\n\n#menu ul {\n    lis'
||'t-style: none;\n    margin: 0;\n    padding: 0;\n}\n\n#menu ul a {\n    display: block;\n    color: #fff;\n    text-decoration: none;\n    font-weight: 200;\n    font-size: 15px;\n    padding: 3px;\n    letter-spacing: 1px;\n}\n\n#menu ul li {\n    p'
||'osition: relative;\n    /*float: right;*/\n    margin: 0;\n    padding: 0;\n    z-index: 900;\n}\n\n#menu ul li:hover {\n    background: rgb(0, 126, 194);\n}\n\n#menu ul ul {\n    display: none;\n    position: absolute;\n    top: 100%;\n    right: 0;'
||'\n    padding: 0;\n}\n\n#menu ul ul li {\n    float: none;\n    width: 150px\n}\n\n#menu ul ul a {\n    font-size: 12px;\n    line-height: 120%;\n    padding: 10px 15px;\n}\n\n#menu ul li:hover>ul {\n    display: block;\n}\n\n#menu ul li ul li:hover '
||'{\n    background: rgba(1, 52, 80, 0.904);\n    color: #fff;\n}","vars":{"@g_Container-BorderRadius":"8px","@l_Button-Hot-BG":"rgba(0,111,255,0.842)","@l_Button-Hot-Text":"#ffffff"}}'
,p_theme_roller_output_file_url=>'#THEME_DB_IMAGES#57666899876637735.css'
,p_theme_roller_read_only=>false
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(101004895681889530)
,p_theme_id=>42
,p_name=>'Vista'
,p_css_file_urls=>'#THEME_IMAGES#css/Vista#MIN#.css?v=#APEX_VERSION#'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_read_only=>true
,p_reference_id=>4007676303523989775
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(101005215493889530)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2719875314571594493
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(101005662715889530)
,p_theme_id=>42
,p_name=>'Vita - Dark'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Dark.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Dark#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3543348412015319650
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(101006073837889530)
,p_theme_id=>42
,p_name=>'Vita - Red'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Red.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Red#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>1938457712423918173
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(101006484422889530)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Slate.less'
,p_theme_roller_config=>'{"customCSS":"","vars":{"@g_Accent-BG":"#505f6d","@g_Accent-OG":"#ececec","@g_Body-Title-BG":"#dee1e4","@l_Link-Base":"#337ac0","@g_Body-BG":"#f5f5f5"}}'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3291983347983194966
);
end;
/
