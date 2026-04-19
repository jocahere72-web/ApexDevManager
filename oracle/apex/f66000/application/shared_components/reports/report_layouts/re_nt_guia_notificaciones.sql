prompt --application/shared_components/reports/report_layouts/re_nt_guia_notificaciones
begin
    wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
    wwv_flow_api.g_varchar2_table(1) := '<?xml version = ''1.0'' encoding = ''UTF-8''?>'||wwv_flow.LF||
'<Workbook xmlns:xdoxslt="http://www.oracle.com/XSL/Transf';
    wwv_flow_api.g_varchar2_table(2) := 'orm/java/oracle.xdo.template.rtf.XSLTFunctions"><Worksheet srcName="Hoja1"><WorkSheetName>Hoja1</Wor';
    wwv_flow_api.g_varchar2_table(3) := 'kSheetName><Group name="XDOROOT" level="0" endCell="26"><Row><Cell Index="0" Copy="R1C1"/><Cell Inde';
    wwv_flow_api.g_varchar2_table(4) := 'x="1" Copy="R1C2"/><Cell Index="2" Copy="R1C3"/><Cell Index="3" Copy="R1C4"/><Cell Index="4" Copy="R';
    wwv_flow_api.g_varchar2_table(5) := '1C5"/><Cell Index="5" Copy="R1C6"/><Cell Index="6" Copy="R1C7"/><Cell Index="7" Copy="R1C8"/><Cell I';
    wwv_flow_api.g_varchar2_table(6) := 'ndex="8" Copy="R1C9"/><Cell Index="9" Copy="R1C10"/><Cell Index="10" Copy="R1C11"/><Cell Index="11" ';
    wwv_flow_api.g_varchar2_table(7) := 'Copy="R1C12"/><Cell Index="12" Copy="R1C13"/><Cell Index="13" Copy="R1C14"/><Cell Index="14" Copy="R';
    wwv_flow_api.g_varchar2_table(8) := '1C15"/><Cell Index="15" Copy="R1C16"/><Cell Index="16" Copy="R1C17"/><Cell Index="17" Copy="R1C18"/>';
    wwv_flow_api.g_varchar2_table(9) := '<Cell Index="18" Copy="R1C19"/><Cell Index="19" Copy="R1C20"/><Cell Index="20" Copy="R1C21"/><Cell I';
    wwv_flow_api.g_varchar2_table(10) := 'ndex="21" Copy="R1C22"/><Cell Index="22" Copy="R1C23"/><Cell Index="23" Copy="R1C24"/><Cell Index="2';
    wwv_flow_api.g_varchar2_table(11) := '4" Copy="R1C25"/><Cell Index="25" Copy="R1C26"/><Cell Index="26" Copy="R1C27"/></Row><Row><Cell Inde';
    wwv_flow_api.g_varchar2_table(12) := 'x="0" Style="R2C1" Field="XDO_?XDOFIELD1?">1 1 1 1 1 1 1</Cell><Cell Index="1" Style="R2C2" Field="X';
    wwv_flow_api.g_varchar2_table(13) := 'DO_?XDOFIELD2?">1 2 3 4 5 6 7</Cell><Cell Index="2" Style="R2C3" Field="XDO_?XDOFIELD3?">25773 25774';
    wwv_flow_api.g_varchar2_table(14) := ' 25775 25776 25777 25778 25779</Cell><Cell Index="3" Style="R2C4" Field="XDO_?XDOFIELD4?">31946 3194';
    wwv_flow_api.g_varchar2_table(15) := '7 31948 31949 31950 31951 31952</Cell><Cell Index="4" Style="R2C5" Field="XDO_?XDOFIELD5?">5 6 7 8 9';
    wwv_flow_api.g_varchar2_table(16) := ' 10 11</Cell><Cell Index="5" Style="R2C6" Field="XDO_?XDOFIELD6?">88 88 88 88 88 88 88</Cell><Cell I';
    wwv_flow_api.g_varchar2_table(17) := 'ndex="6" Style="R2C7" Field="XDO_?XDOFIELD7?">AUTO ADMISORIO AUTO ADMISORIO AUTO ADMISORIO AUTO ADMI';
    wwv_flow_api.g_varchar2_table(18) := 'SORIO AUTO ADMISORIO AUTO ADMISORIO AUTO ADMISORIO</Cell><Cell Index="7" Style="R2C8" Field="XDO_?XD';
    wwv_flow_api.g_varchar2_table(19) := 'OFIELD8?">20190000014 20190000015 20190000016 20190000017 20190000018 20190000019 20190000020</Cell>';
    wwv_flow_api.g_varchar2_table(20) := '<Cell Index="8" Style="R2C9" Field="XDO_?XDOFIELD9?">18/02/19 09:52:36,792072 18/02/19 09:57:25,5823';
    wwv_flow_api.g_varchar2_table(21) := '76 18/02/19 10:02:08,986980 18/02/19 10:02:36,331750 18/02/19 10:04:28,445810 18/02/19 10:11:56,8993';
    wwv_flow_api.g_varchar2_table(22) := '65 18/02/19 10:12:38,145800</Cell><Cell Index="9" Style="R2C10" Field="XDO_?XDOFIELD10?">00010000005';
    wwv_flow_api.g_varchar2_table(23) := '2000 000100000052000 000100000052000 000100000052000 000100000052000 000100000052000 000100000052000';
    wwv_flow_api.g_varchar2_table(24) := '</Cell><Cell Index="10" Style="R2C11" Field="XDO_?XDOFIELD11?">C C C C C C C</Cell><Cell Index="11" ';
    wwv_flow_api.g_varchar2_table(25) := 'Style="R2C12" Field="XDO_?XDOFIELD12?">1045748819 1045748819 1045748819 1045748819 1045748819 104574';
    wwv_flow_api.g_varchar2_table(26) := '8819 1045748819</Cell><Cell Index="12" Style="R2C13" Field="XDO_?XDOFIELD13?">JUAN JUAN JUAN JUAN JU';
    wwv_flow_api.g_varchar2_table(27) := 'AN JUAN JUAN</Cell><Cell Index="13" Style="R2C14" Field="XDO_?XDOFIELD14?">CAMILO CAMILO CAMILO CAMI';
    wwv_flow_api.g_varchar2_table(28) := 'LO CAMILO CAMILO CAMILO</Cell><Cell Index="14" Style="R2C15" Field="XDO_?XDOFIELD15?">CUAO CUAO CUAO';
    wwv_flow_api.g_varchar2_table(29) := ' CUAO CUAO CUAO CUAO</Cell><Cell Index="15" Style="R2C16" Field="XDO_?XDOFIELD16?">SANCHEZ SANCHEZ S';
    wwv_flow_api.g_varchar2_table(30) := 'ANCHEZ SANCHEZ SANCHEZ SANCHEZ SANCHEZ</Cell><Cell Index="16" Style="R2C17" Field="XDO_?XDOFIELD17?"';
    wwv_flow_api.g_varchar2_table(31) := '>Calle 92 # 3c - 29 Calle 92 # 3c - 29 Calle 92 # 3c - 29 Calle 92 # 3c - 29 Calle 92 # 3c - 29 Call';
    wwv_flow_api.g_varchar2_table(32) := 'e 92 # 3c - 29 Calle 92 # 3c - 29</Cell><Cell Index="17" Style="R2C18" Field="XDO_?XDOFIELD18?">BARR';
    wwv_flow_api.g_varchar2_table(33) := 'ANQUILLA BARRANQUILLA BARRANQUILLA BARRANQUILLA BARRANQUILLA BARRANQUILLA BARRANQUILLA</Cell><Cell I';
    wwv_flow_api.g_varchar2_table(34) := 'ndex="18" Style="R2C19" Field="XDO_?XDOFIELD19?">AtlÂ¿Â¿Â¿Â¿ntico AtlÂ¿Â¿Â¿Â¿ntico AtlÂ¿Â¿Â¿Â¿ntico ';
    wwv_flow_api.g_varchar2_table(35) := 'AtlÂ¿Â¿Â¿Â¿ntico AtlÂ¿Â¿Â¿Â¿ntico AtlÂ¿Â¿Â¿Â¿ntico AtlÂ¿Â¿Â¿Â¿ntico</Cell><Cell Index="19" Style="R2';
    wwv_flow_api.g_varchar2_table(36) := 'C20" Field="XDO_?XDOFIELD20?">COLOMBIA COLOMBIA COLOMBIA COLOMBIA COLOMBIA COLOMBIA COLOMBIA</Cell><';
    wwv_flow_api.g_varchar2_table(37) := '/Row></Group></Worksheet></Workbook>';
wwv_flow_api.create_report_layout(
 p_id=>wwv_flow_api.id(91443579006214253)
,p_report_layout_name=>'re_nt_guia_notificaciones'
,p_report_layout_type=>'XSL_FILE'
,p_varchar2_table=>wwv_flow_api.g_varchar2_table
);
end;
/
