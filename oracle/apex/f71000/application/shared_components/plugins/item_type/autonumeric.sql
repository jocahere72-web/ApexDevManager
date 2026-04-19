prompt --application/shared_components/plugins/item_type/autonumeric
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(169829659018892055)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'AUTONUMERIC'
,p_display_name=>'autoNumeric'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS:APEX_APPL_PAGE_IG_COLUMNS'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','AUTONUMERIC'),'')
,p_javascript_file_urls=>'#IMAGE_PREFIX#plugins/infortributos/com.autonumeric/autoNumeric.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PROCEDURE render_autoNumeric(',
'  p_item   in apex_plugin.t_item,',
'  p_plugin in apex_plugin.t_plugin,',
'  p_param  in apex_plugin.t_item_render_param,',
'  p_result in out nocopy apex_plugin.t_item_render_result)',
'AS',
'  v_result       apex_plugin.t_page_item_render_result;',
'  v_function     varchar2(128);',
'  v_function2    varchar2(128);',
'  v_js_var       varchar2(128);',
'  v_rawValueItem            p_item.attribute_01%TYPE := UPPER (p_item.attribute_01);',
'  v_maximumValue            p_item.attribute_02%TYPE := LOWER (p_item.attribute_02); -- maximumValue',
'  v_minimumValue            p_item.attribute_03%TYPE := LOWER (p_item.attribute_03); -- minimumValue',
'  v_currencySymbol          p_item.attribute_05%TYPE := (p_item.attribute_05); -- currencySymbol',
'  v_currencySymbolPlacement p_item.attribute_06%TYPE := (p_item.attribute_06); -- currencySymbolPlacement',
'  v_decimalCharacter        p_item.attribute_07%TYPE := (p_item.attribute_07); -- decimalCharacter',
'  v_decCharactAlt	        p_item.attribute_08%TYPE := (p_item.attribute_08); -- decimalCharactAlternative',
'  v_decimalPlaces	        p_item.attribute_09%TYPE := (p_item.attribute_09); -- decimalPlaces',
'  v_decPlacRawVal	        p_item.attribute_10%TYPE := (p_item.attribute_10); -- decimalPlacesRawValue',
'  v_decPlaShownOnBlur       p_item.attribute_11%TYPE := (p_item.attribute_11); -- decimalPlacesShownOnBlur',
'  v_decPlaShownOnFocus	    p_item.attribute_12%TYPE := (p_item.attribute_12); -- decimalPlacesShownOnFocus',
'  v_digitalGroupSpacing	    p_item.attribute_13%TYPE := (p_item.attribute_13); -- digitalGroupSpacing 	 ',
'  v_digitGroupSeparator     p_item.attribute_14%TYPE := (p_item.attribute_14); -- digitGroupSeparator',
'BEGIN',
'  v_function  := ''setRawValueTo''||v_rawValueItem||''(''''''||v_rawValueItem||'''''')'';',
'  v_function2 := ''setRawValueTo''||v_rawValueItem||''(item)'';',
'  v_js_var    := v_rawValueItem||''RawValue'';',
' ',
' -- Load JS Libraries',
'  --apex_javascript.add_library (p_name => ''autoNumeric'', p_directory => p_plugin.file_prefix, p_version => null);',
'  ',
'  -- Input item',
'    sys.htp.prn(''<input'');',
'    sys.htp.prn('' type="text"'');',
'    sys.htp.prn('' id="'' || p_item.name || ''"'');',
'    sys.htp.prn('' name="'' || p_item.name || ''"'');	',
'    sys.htp.prn('' onkeyup="''||v_function||''"'');',
'    sys.htp.prn('' class="apex-item-text ''|| p_item.element_css_classes || ''"'');',
'    sys.htp.prn(case when p_item.is_required then '' required'' else null end);',
'    --sys.htp.prn('' maxlength="'' || p_item.element_max_length || ''"'');',
'    sys.htp.prn('' size="'' || p_item.element_width || ''"'');',
'    sys.htp.prn('' placeholder="'' || p_item.placeholder || ''"'');',
'    sys.htp.prn('' value="'');',
'    sys.htp.prn(p_param.value);',
'    sys.htp.prn(''"'');',
'    sys.htp.prn(''/>'');',
'',
'    -- Run onLoad code',
'    apex_javascript.add_inline_code (p_code =>',
'        ''var ''||lower(v_js_var)||'' = new AutoNumeric(''''#'' || p_item.name || '''''',{                              ',
'	                                 alwaysAllowDecimalCharacter: true,',
'									 caretPositionOnFocus: "start",',
'									 currencySymbol: "''||nvl(v_currencySymbol,'''')||''",',
'									 currencySymbolPlacement: "''||nvl(v_currencySymbolPlacement,''s'')||''",',
'									 decimalCharacter: "''||nvl(v_decimalCharacter,''.'')||''",',
'									 decimalCharacterAlternative: "''||nvl(v_decCharactAlt,''null'')||''",',
'									 decimalPlaces: ''||nvl(v_decimalPlaces,''2'')||'',',
'									 decimalPlacesRawValue: ''||nvl(v_decPlacRawVal,''null'')||'',',
'									 decimalPlacesShownOnBlur: ''||nvl(v_decPlaShownOnBlur,''null'')||'',',
'									 decimalPlacesShownOnFocus: ''||nvl(v_decPlaShownOnFocus,''null'')||'',',
'									 digitGroupSeparator: "''||nvl(v_digitGroupSeparator,'','')||''",',
'									 maximumValue: "''||nvl(v_maximumValue,''10000000000000'')||''",',
'									 minimumValue: "''||nvl(v_minimumValue,''-10000000000000'')||''"',
'                                     });''',
'      );',
'	  if v_rawValueItem is not null then',
'	    apex_javascript.add_inline_code(p_code=>',
'	    ''function ''||v_function2||'' {',
'          document.getElementById(item).value = ''||lower(v_js_var)||''.getNumericString();',
'	    };',
'	    '');',
'	  end if;',
'END;'))
,p_api_version=>2
,p_render_function=>'render_autoNumeric'
,p_standard_attributes=>'VISIBLE:FORM_ELEMENT:SOURCE:WIDTH'
,p_substitute_attributes=>true
,p_reference_id=>88424782383270265
,p_subscribe_plugin_settings=>true
,p_help_text=>'AutoNumeric is a Javascript library that provides live as-you-type formatting for international numbers and currencies.'
,p_version_identifier=>'1.0'
,p_about_url=>'https://apex.oracle.com/pls/apex/f?p=79291:LOGIN_DESKTOP'
,p_files_version=>2
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(81405622620623584)
,p_plugin_id=>wwv_flow_api.id(169829659018892055)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'rawValueItem'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS:APEX_APPL_PAGE_IG_COLUMNS'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(81406044252623585)
,p_plugin_id=>wwv_flow_api.id(169829659018892055)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'maximumValue'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_default_value=>'10000000000000'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Defines the maximum possible value a user can enter.',
'The default value is : 10000000000000'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(81406490568623585)
,p_plugin_id=>wwv_flow_api.id(169829659018892055)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'minimumValue'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_default_value=>'-10000000000000'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Defines the minimum possible value a user can enter. ',
'The default value is: -10000000000000'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(81406898085623585)
,p_plugin_id=>wwv_flow_api.id(169829659018892055)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'currencySymbol'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'none	''''	',
unistr('currencySign	''\00A4''	'),
unistr('austral	''\00BF''	ARA'),
unistr('australCentavo	''\00A2''	'),
unistr('baht	''\00BF''	THB'),
unistr('cedi	''\00BF''	GHS'),
unistr('cent	''\00A2''	'),
unistr('colon	''\00A2''	CRC'),
unistr('cruzeiro	''\00BF''	BRB - Not used anymore since 1993'),
'dollar	''$''	',
unistr('dong	''\00BF''	VND'),
unistr('drachma	''\00BF''	GRD (or ''\00BF\00BF\00BF.'' or ''\00BF\00BF.'')'),
unistr('dram	''\00BF\00BF\00BF''	AMD'),
unistr('european	''\00BF''	XEU (old currency before the Euro)'),
unistr('euro	''\20AC''	EUR'),
unistr('florin	''\0192''	'),
unistr('franc	''\00BF''	FRF'),
unistr('guarani	''\00BF''	PYG'),
unistr('hryvnia	''\00BF''	\00BF\00BF\00BF'),
unistr('kip	''\00BF''	LAK'),
unistr('att	''\00BF\00BF\00BF''	cents of the Kip'),
unistr('lepton	''\00BF''	cents of the Drachma'),
unistr('lira	''\00BF''	TRY'),
unistr('liraOld	''\00A3''	'),
unistr('lari	''\00BF''	GEL'),
'mark	''M''	',
unistr('mill	''\00BF''	'),
unistr('naira	''\00BF''	NGN'),
'peseta	''P''	',
unistr('peso	''\00BF''	PHP'),
unistr('pfennig	''\00BF''	cents of the Mark'),
unistr('pound	''\00A3''	'),
'real	''R$''	Brazilian real',
unistr('riel	''\00BF''	KHR'),
unistr('ruble	''\00BF''	RUB'),
unistr('rupee	''\00BF''	INR'),
unistr('rupeeOld	''\00BF''	'),
unistr('shekel	''\00BF''	'),
unistr('shekelAlt	''\00BF\00BF\00BF''	'),
unistr('taka	''\00BF''	BDT'),
unistr('tenge	''\00BF''	KZT'),
unistr('togrog	''\00BF''	MNT'),
unistr('won	''\00BF''	'),
unistr('yen	''\00A5''')))
,p_help_text=>'Defines the currency symbol string'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(81407287172623586)
,p_plugin_id=>wwv_flow_api.id(169829659018892055)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'currencySymbolPlacement'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(81407624547623586)
,p_plugin_attribute_id=>wwv_flow_api.id(81407287172623586)
,p_display_sequence=>10
,p_display_value=>'prefix'
,p_return_value=>'p'
,p_help_text=>'Placed before the numbers'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(81408196175623586)
,p_plugin_attribute_id=>wwv_flow_api.id(81407287172623586)
,p_display_sequence=>20
,p_display_value=>'suffix'
,p_return_value=>'s'
,p_help_text=>'Placed after the numbers'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(81408621513623586)
,p_plugin_id=>wwv_flow_api.id(169829659018892055)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'decimalCharacter'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(81409059982623586)
,p_plugin_attribute_id=>wwv_flow_api.id(81408621513623586)
,p_display_sequence=>10
,p_display_value=>'comma'
,p_return_value=>','
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(81409580079623587)
,p_plugin_attribute_id=>wwv_flow_api.id(81408621513623586)
,p_display_sequence=>20
,p_display_value=>'dot'
,p_return_value=>'.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(81410082577623587)
,p_plugin_attribute_id=>wwv_flow_api.id(81408621513623586)
,p_display_sequence=>30
,p_display_value=>'decimalSeparatorKeySymbol'
,p_return_value=>unistr('\00BF')
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(81410598779623587)
,p_plugin_id=>wwv_flow_api.id(169829659018892055)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'decimalCharacterAlternative'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>','
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS:APEX_APPL_PAGE_IG_COLUMNS'
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'none     null     No alternative character is defined for entering the decimalCharacter',
'comma    '',''      Entering a comma '','' will enter the defined decimalCharacter',
'dot      ''.''      Entering a dot ''.'' will enter the defined decimalCharacter'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Allow to declare an alternative decimal separator which is automatically replaced by ''decimalCharacter'' when typed.',
'You can customize the value.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(81410974730623587)
,p_plugin_id=>wwv_flow_api.id(169829659018892055)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'decimalPlaces'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(81411365307623587)
,p_plugin_attribute_id=>wwv_flow_api.id(81410974730623587)
,p_display_sequence=>10
,p_display_value=>'none'
,p_return_value=>'0'
,p_help_text=>'No decimal places are shown nor kept in the rawValue'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(81411888465623588)
,p_plugin_attribute_id=>wwv_flow_api.id(81410974730623587)
,p_display_sequence=>20
,p_display_value=>'one'
,p_return_value=>'1'
,p_help_text=>'One decimal place is shown and kept in the rawValue'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(81412343269623588)
,p_plugin_attribute_id=>wwv_flow_api.id(81410974730623587)
,p_display_sequence=>30
,p_display_value=>'two'
,p_return_value=>'2'
,p_help_text=>'Two decimal places are shown and kept in the rawValue'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(81412844114623588)
,p_plugin_attribute_id=>wwv_flow_api.id(81410974730623587)
,p_display_sequence=>40
,p_display_value=>'three'
,p_return_value=>'3'
,p_help_text=>'Three decimal places are shown and kept in the rawValue'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(81413390127623588)
,p_plugin_attribute_id=>wwv_flow_api.id(81410974730623587)
,p_display_sequence=>50
,p_display_value=>'four'
,p_return_value=>'4'
,p_help_text=>'Four decimal places are shown and kept in the rawValue'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(81413893779623588)
,p_plugin_attribute_id=>wwv_flow_api.id(81410974730623587)
,p_display_sequence=>60
,p_display_value=>'five'
,p_return_value=>'5'
,p_help_text=>'Five decimal places are shown and kept in the rawValue'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(81414335746623589)
,p_plugin_attribute_id=>wwv_flow_api.id(81410974730623587)
,p_display_sequence=>70
,p_display_value=>'six'
,p_return_value=>'6'
,p_help_text=>'Six decimal places are shown and kept in the rawValue'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(81414808911623589)
,p_plugin_attribute_id=>wwv_flow_api.id(81410974730623587)
,p_display_sequence=>80
,p_display_value=>'seven'
,p_return_value=>'7'
,p_help_text=>'Seven decimal places are shown and kept in the rawValue'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(81415313069623589)
,p_plugin_id=>wwv_flow_api.id(169829659018892055)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'decimalPlacesRawValue'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'null'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS:APEX_APPL_PAGE_IG_COLUMNS'
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'useDefault	null	This option is ignored and the decimalPlaces option value is used instead',
'none	0	No decimal places are shown nor kept in the rawValue',
'one	1	One decimal place is shown and kept in the rawValue',
'two	2	Two decimal places are shown and kept in the rawValue',
'three	3	Three decimal places are shown and kept in the rawValue',
'four	4	Four decimal places are shown and kept in the rawValue',
'Five	5	Five decimal places are shown and kept in the rawValue',
'Six	6	Six decimal places are shown and kept in the rawValue',
'--',
'{',
'    decimalPlaces: "7",',
'    decimalPlacesShownOnBlur: 5',
'}'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Defines how many decimal places should be kept for the raw value rawValue.',
'You can customize the value.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(81415777721623589)
,p_plugin_id=>wwv_flow_api.id(169829659018892055)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'decimalPlacesShownOnBlur'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'null'
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'useDefault	null	This option is ignored and the decimalPlaces option value is used instead',
'none	0	No decimal places are shown nor kept in the rawValue',
'one	1	One decimal place is shown and kept in the rawValue',
'two	2	Two decimal places are shown and kept in the rawValue',
'three	3	Three decimal places are shown and kept in the rawValue',
'four	4	Four decimal places are shown and kept in the rawValue',
'Five	5	Five decimal places are shown and kept in the rawValue',
'Six	6	Six decimal places are shown and kept in the rawValue',
'--',
'{',
'    decimalPlacesShownOnBlur: 2',
'}'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Defines how many decimal places should be visible when the element is unfocused.',
'You can customize the value.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(81416169713623589)
,p_plugin_id=>wwv_flow_api.id(169829659018892055)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_prompt=>'decimalPlacesShownOnFocus'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'null'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS:APEX_APPL_PAGE_IG_COLUMNS'
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'useDefault	null	This option is ignored and the decimalPlaces option value is used instead',
'none	0	No decimal places are shown nor kept in the rawValue',
'one	1	One decimal place is shown and kept in the rawValue',
'two	2	Two decimal places are shown and kept in the rawValue',
'three	3	Three decimal places are shown and kept in the rawValue',
'four	4	Four decimal places are shown and kept in the rawValue',
'Five	5	Five decimal places are shown and kept in the rawValue',
'Six	6	Six decimal places are shown and kept in the rawValue',
'--',
'{',
'    decimalPlacesShownOnFocus: 4',
'}'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Defines how many decimal places should be visible when the element has the focus.',
'You can customize the value'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(81416526008623589)
,p_plugin_id=>wwv_flow_api.id(169829659018892055)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>130
,p_prompt=>'digitalGroupSpacing'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'3'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(81416966771623589)
,p_plugin_id=>wwv_flow_api.id(169829659018892055)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_prompt=>'digitGroupSeparator'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>','
,p_is_translatable=>false
);
end;
/
