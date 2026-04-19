prompt --application/shared_components/reports/report_layouts/re_c_recaudo_anuales_por_vigencia_1
begin
    wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
    wwv_flow_api.g_varchar2_table(1) := '{\rtf1\adeflang1025\ansi\ansicpg1252\uc1\adeff0\deff0\stshfdbch0\stshfloch31506\stshfhich31506\stshf';
    wwv_flow_api.g_varchar2_table(2) := 'bi31506\deflang9226\deflangfe9226\themelang9226\themelangfe0\themelangcs0{\fonttbl{\f0\fbidi \froman';
    wwv_flow_api.g_varchar2_table(3) := '\fcharset0\fprq2{\*\panose 00000000000000000000}Times New Roman{\*\falt Times};}'||wwv_flow.LF||
'{\f34\fbidi \froman';
    wwv_flow_api.g_varchar2_table(4) := '\fcharset0\fprq2{\*\panose 02040503050406030204}Cambria Math;}{\f37\fbidi \fswiss\fcharset0\fprq2{\*';
    wwv_flow_api.g_varchar2_table(5) := '\panose 00000000000000000000}Calibri;}{\f38\fbidi \fswiss\fcharset0\fprq2{\*\panose 0000000000000000';
    wwv_flow_api.g_varchar2_table(6) := '0000}Calibri Light;}'||wwv_flow.LF||
'{\f43\fbidi \fswiss\fcharset0\fprq2{\*\panose 020b0502040204020203}Segoe UI;}{\';
    wwv_flow_api.g_varchar2_table(7) := 'flomajor\f31500\fbidi \froman\fcharset0\fprq2{\*\panose 00000000000000000000}Times New Roman{\*\falt';
    wwv_flow_api.g_varchar2_table(8) := ' Times};}'||wwv_flow.LF||
'{\fdbmajor\f31501\fbidi \froman\fcharset0\fprq2{\*\panose 00000000000000000000}Times New R';
    wwv_flow_api.g_varchar2_table(9) := 'oman{\*\falt Times};}{\fhimajor\f31502\fbidi \fswiss\fcharset0\fprq2{\*\panose 00000000000000000000}';
    wwv_flow_api.g_varchar2_table(10) := 'Calibri Light;}'||wwv_flow.LF||
'{\fbimajor\f31503\fbidi \froman\fcharset0\fprq2{\*\panose 00000000000000000000}Times';
    wwv_flow_api.g_varchar2_table(11) := ' New Roman{\*\falt Times};}{\flominor\f31504\fbidi \froman\fcharset0\fprq2{\*\panose 000000000000000';
    wwv_flow_api.g_varchar2_table(12) := '00000}Times New Roman{\*\falt Times};}'||wwv_flow.LF||
'{\fdbminor\f31505\fbidi \froman\fcharset0\fprq2{\*\panose 000';
    wwv_flow_api.g_varchar2_table(13) := '00000000000000000}Times New Roman{\*\falt Times};}{\fhiminor\f31506\fbidi \fswiss\fcharset0\fprq2{\*';
    wwv_flow_api.g_varchar2_table(14) := '\panose 00000000000000000000}Calibri;}'||wwv_flow.LF||
'{\fbiminor\f31507\fbidi \froman\fcharset0\fprq2{\*\panose 000';
    wwv_flow_api.g_varchar2_table(15) := '00000000000000000}Times New Roman{\*\falt Times};}{\f44\fbidi \froman\fcharset238\fprq2 Times New Ro';
    wwv_flow_api.g_varchar2_table(16) := 'man CE{\*\falt Times};}'||wwv_flow.LF||
'{\f45\fbidi \froman\fcharset204\fprq2 Times New Roman Cyr{\*\falt Times};}{\';
    wwv_flow_api.g_varchar2_table(17) := 'f47\fbidi \froman\fcharset161\fprq2 Times New Roman Greek{\*\falt Times};}{\f48\fbidi \froman\fchars';
    wwv_flow_api.g_varchar2_table(18) := 'et162\fprq2 Times New Roman Tur{\*\falt Times};}'||wwv_flow.LF||
'{\f49\fbidi \froman\fcharset177\fprq2 Times New Rom';
    wwv_flow_api.g_varchar2_table(19) := 'an (Hebrew){\*\falt Times};}{\f50\fbidi \froman\fcharset178\fprq2 Times New Roman (Arabic){\*\falt T';
    wwv_flow_api.g_varchar2_table(20) := 'imes};}{\f51\fbidi \froman\fcharset186\fprq2 Times New Roman Baltic{\*\falt Times};}'||wwv_flow.LF||
'{\f52\fbidi \fr';
    wwv_flow_api.g_varchar2_table(21) := 'oman\fcharset163\fprq2 Times New Roman (Vietnamese){\*\falt Times};}{\f384\fbidi \froman\fcharset238';
    wwv_flow_api.g_varchar2_table(22) := '\fprq2 Cambria Math CE;}{\f385\fbidi \froman\fcharset204\fprq2 Cambria Math Cyr;}{\f387\fbidi \froma';
    wwv_flow_api.g_varchar2_table(23) := 'n\fcharset161\fprq2 Cambria Math Greek;}'||wwv_flow.LF||
'{\f388\fbidi \froman\fcharset162\fprq2 Cambria Math Tur;}{\';
    wwv_flow_api.g_varchar2_table(24) := 'f391\fbidi \froman\fcharset186\fprq2 Cambria Math Baltic;}{\f392\fbidi \froman\fcharset163\fprq2 Cam';
    wwv_flow_api.g_varchar2_table(25) := 'bria Math (Vietnamese);}{\f414\fbidi \fswiss\fcharset238\fprq2 Calibri CE;}'||wwv_flow.LF||
'{\f415\fbidi \fswiss\fch';
    wwv_flow_api.g_varchar2_table(26) := 'arset204\fprq2 Calibri Cyr;}{\f417\fbidi \fswiss\fcharset161\fprq2 Calibri Greek;}{\f418\fbidi \fswi';
    wwv_flow_api.g_varchar2_table(27) := 'ss\fcharset162\fprq2 Calibri Tur;}{\f419\fbidi \fswiss\fcharset177\fprq2 Calibri (Hebrew);}'||wwv_flow.LF||
'{\f420\f';
    wwv_flow_api.g_varchar2_table(28) := 'bidi \fswiss\fcharset178\fprq2 Calibri (Arabic);}{\f421\fbidi \fswiss\fcharset186\fprq2 Calibri Balt';
    wwv_flow_api.g_varchar2_table(29) := 'ic;}{\f422\fbidi \fswiss\fcharset163\fprq2 Calibri (Vietnamese);}{\f424\fbidi \fswiss\fcharset238\fp';
    wwv_flow_api.g_varchar2_table(30) := 'rq2 Calibri Light CE;}'||wwv_flow.LF||
'{\f425\fbidi \fswiss\fcharset204\fprq2 Calibri Light Cyr;}{\f427\fbidi \fswis';
    wwv_flow_api.g_varchar2_table(31) := 's\fcharset161\fprq2 Calibri Light Greek;}{\f428\fbidi \fswiss\fcharset162\fprq2 Calibri Light Tur;}{';
    wwv_flow_api.g_varchar2_table(32) := '\f429\fbidi \fswiss\fcharset177\fprq2 Calibri Light (Hebrew);}'||wwv_flow.LF||
'{\f430\fbidi \fswiss\fcharset178\fprq';
    wwv_flow_api.g_varchar2_table(33) := '2 Calibri Light (Arabic);}{\f431\fbidi \fswiss\fcharset186\fprq2 Calibri Light Baltic;}{\f432\fbidi ';
    wwv_flow_api.g_varchar2_table(34) := '\fswiss\fcharset163\fprq2 Calibri Light (Vietnamese);}{\f474\fbidi \fswiss\fcharset238\fprq2 Segoe U';
    wwv_flow_api.g_varchar2_table(35) := 'I CE;}'||wwv_flow.LF||
'{\f475\fbidi \fswiss\fcharset204\fprq2 Segoe UI Cyr;}{\f477\fbidi \fswiss\fcharset161\fprq2 S';
    wwv_flow_api.g_varchar2_table(36) := 'egoe UI Greek;}{\f478\fbidi \fswiss\fcharset162\fprq2 Segoe UI Tur;}{\f479\fbidi \fswiss\fcharset177';
    wwv_flow_api.g_varchar2_table(37) := '\fprq2 Segoe UI (Hebrew);}'||wwv_flow.LF||
'{\f480\fbidi \fswiss\fcharset178\fprq2 Segoe UI (Arabic);}{\f481\fbidi \f';
    wwv_flow_api.g_varchar2_table(38) := 'swiss\fcharset186\fprq2 Segoe UI Baltic;}{\f482\fbidi \fswiss\fcharset163\fprq2 Segoe UI (Vietnamese';
    wwv_flow_api.g_varchar2_table(39) := ');}'||wwv_flow.LF||
'{\flomajor\f31508\fbidi \froman\fcharset238\fprq2 Times New Roman CE{\*\falt Times};}{\flomajor\';
    wwv_flow_api.g_varchar2_table(40) := 'f31509\fbidi \froman\fcharset204\fprq2 Times New Roman Cyr{\*\falt Times};}'||wwv_flow.LF||
'{\flomajor\f31511\fbidi ';
    wwv_flow_api.g_varchar2_table(41) := '\froman\fcharset161\fprq2 Times New Roman Greek{\*\falt Times};}{\flomajor\f31512\fbidi \froman\fcha';
    wwv_flow_api.g_varchar2_table(42) := 'rset162\fprq2 Times New Roman Tur{\*\falt Times};}'||wwv_flow.LF||
'{\flomajor\f31513\fbidi \froman\fcharset177\fprq2';
    wwv_flow_api.g_varchar2_table(43) := ' Times New Roman (Hebrew){\*\falt Times};}{\flomajor\f31514\fbidi \froman\fcharset178\fprq2 Times Ne';
    wwv_flow_api.g_varchar2_table(44) := 'w Roman (Arabic){\*\falt Times};}'||wwv_flow.LF||
'{\flomajor\f31515\fbidi \froman\fcharset186\fprq2 Times New Roman ';
    wwv_flow_api.g_varchar2_table(45) := 'Baltic{\*\falt Times};}{\flomajor\f31516\fbidi \froman\fcharset163\fprq2 Times New Roman (Vietnamese';
    wwv_flow_api.g_varchar2_table(46) := '){\*\falt Times};}'||wwv_flow.LF||
'{\fdbmajor\f31518\fbidi \froman\fcharset238\fprq2 Times New Roman CE{\*\falt Time';
    wwv_flow_api.g_varchar2_table(47) := 's};}{\fdbmajor\f31519\fbidi \froman\fcharset204\fprq2 Times New Roman Cyr{\*\falt Times};}'||wwv_flow.LF||
'{\fdbmajo';
    wwv_flow_api.g_varchar2_table(48) := 'r\f31521\fbidi \froman\fcharset161\fprq2 Times New Roman Greek{\*\falt Times};}{\fdbmajor\f31522\fbi';
    wwv_flow_api.g_varchar2_table(49) := 'di \froman\fcharset162\fprq2 Times New Roman Tur{\*\falt Times};}'||wwv_flow.LF||
'{\fdbmajor\f31523\fbidi \froman\fc';
    wwv_flow_api.g_varchar2_table(50) := 'harset177\fprq2 Times New Roman (Hebrew){\*\falt Times};}{\fdbmajor\f31524\fbidi \froman\fcharset178';
    wwv_flow_api.g_varchar2_table(51) := '\fprq2 Times New Roman (Arabic){\*\falt Times};}'||wwv_flow.LF||
'{\fdbmajor\f31525\fbidi \froman\fcharset186\fprq2 T';
    wwv_flow_api.g_varchar2_table(52) := 'imes New Roman Baltic{\*\falt Times};}{\fdbmajor\f31526\fbidi \froman\fcharset163\fprq2 Times New Ro';
    wwv_flow_api.g_varchar2_table(53) := 'man (Vietnamese){\*\falt Times};}{\fhimajor\f31528\fbidi \fswiss\fcharset238\fprq2 Calibri Light CE;';
    wwv_flow_api.g_varchar2_table(54) := '}'||wwv_flow.LF||
'{\fhimajor\f31529\fbidi \fswiss\fcharset204\fprq2 Calibri Light Cyr;}{\fhimajor\f31531\fbidi \fswi';
    wwv_flow_api.g_varchar2_table(55) := 'ss\fcharset161\fprq2 Calibri Light Greek;}{\fhimajor\f31532\fbidi \fswiss\fcharset162\fprq2 Calibri ';
    wwv_flow_api.g_varchar2_table(56) := 'Light Tur;}'||wwv_flow.LF||
'{\fhimajor\f31533\fbidi \fswiss\fcharset177\fprq2 Calibri Light (Hebrew);}{\fhimajor\f31';
    wwv_flow_api.g_varchar2_table(57) := '534\fbidi \fswiss\fcharset178\fprq2 Calibri Light (Arabic);}{\fhimajor\f31535\fbidi \fswiss\fcharset';
    wwv_flow_api.g_varchar2_table(58) := '186\fprq2 Calibri Light Baltic;}'||wwv_flow.LF||
'{\fhimajor\f31536\fbidi \fswiss\fcharset163\fprq2 Calibri Light (Vi';
    wwv_flow_api.g_varchar2_table(59) := 'etnamese);}{\fbimajor\f31538\fbidi \froman\fcharset238\fprq2 Times New Roman CE{\*\falt Times};}{\fb';
    wwv_flow_api.g_varchar2_table(60) := 'imajor\f31539\fbidi \froman\fcharset204\fprq2 Times New Roman Cyr{\*\falt Times};}'||wwv_flow.LF||
'{\fbimajor\f31541';
    wwv_flow_api.g_varchar2_table(61) := '\fbidi \froman\fcharset161\fprq2 Times New Roman Greek{\*\falt Times};}{\fbimajor\f31542\fbidi \from';
    wwv_flow_api.g_varchar2_table(62) := 'an\fcharset162\fprq2 Times New Roman Tur{\*\falt Times};}'||wwv_flow.LF||
'{\fbimajor\f31543\fbidi \froman\fcharset17';
    wwv_flow_api.g_varchar2_table(63) := '7\fprq2 Times New Roman (Hebrew){\*\falt Times};}{\fbimajor\f31544\fbidi \froman\fcharset178\fprq2 T';
    wwv_flow_api.g_varchar2_table(64) := 'imes New Roman (Arabic){\*\falt Times};}'||wwv_flow.LF||
'{\fbimajor\f31545\fbidi \froman\fcharset186\fprq2 Times New';
    wwv_flow_api.g_varchar2_table(65) := ' Roman Baltic{\*\falt Times};}{\fbimajor\f31546\fbidi \froman\fcharset163\fprq2 Times New Roman (Vie';
    wwv_flow_api.g_varchar2_table(66) := 'tnamese){\*\falt Times};}'||wwv_flow.LF||
'{\flominor\f31548\fbidi \froman\fcharset238\fprq2 Times New Roman CE{\*\fa';
    wwv_flow_api.g_varchar2_table(67) := 'lt Times};}{\flominor\f31549\fbidi \froman\fcharset204\fprq2 Times New Roman Cyr{\*\falt Times};}'||wwv_flow.LF||
'{\';
    wwv_flow_api.g_varchar2_table(68) := 'flominor\f31551\fbidi \froman\fcharset161\fprq2 Times New Roman Greek{\*\falt Times};}{\flominor\f31';
    wwv_flow_api.g_varchar2_table(69) := '552\fbidi \froman\fcharset162\fprq2 Times New Roman Tur{\*\falt Times};}'||wwv_flow.LF||
'{\flominor\f31553\fbidi \fr';
    wwv_flow_api.g_varchar2_table(70) := 'oman\fcharset177\fprq2 Times New Roman (Hebrew){\*\falt Times};}{\flominor\f31554\fbidi \froman\fcha';
    wwv_flow_api.g_varchar2_table(71) := 'rset178\fprq2 Times New Roman (Arabic){\*\falt Times};}'||wwv_flow.LF||
'{\flominor\f31555\fbidi \froman\fcharset186\';
    wwv_flow_api.g_varchar2_table(72) := 'fprq2 Times New Roman Baltic{\*\falt Times};}{\flominor\f31556\fbidi \froman\fcharset163\fprq2 Times';
    wwv_flow_api.g_varchar2_table(73) := ' New Roman (Vietnamese){\*\falt Times};}'||wwv_flow.LF||
'{\fdbminor\f31558\fbidi \froman\fcharset238\fprq2 Times New';
    wwv_flow_api.g_varchar2_table(74) := ' Roman CE{\*\falt Times};}{\fdbminor\f31559\fbidi \froman\fcharset204\fprq2 Times New Roman Cyr{\*\f';
    wwv_flow_api.g_varchar2_table(75) := 'alt Times};}'||wwv_flow.LF||
'{\fdbminor\f31561\fbidi \froman\fcharset161\fprq2 Times New Roman Greek{\*\falt Times};';
    wwv_flow_api.g_varchar2_table(76) := '}{\fdbminor\f31562\fbidi \froman\fcharset162\fprq2 Times New Roman Tur{\*\falt Times};}'||wwv_flow.LF||
'{\fdbminor\f';
    wwv_flow_api.g_varchar2_table(77) := '31563\fbidi \froman\fcharset177\fprq2 Times New Roman (Hebrew){\*\falt Times};}{\fdbminor\f31564\fbi';
    wwv_flow_api.g_varchar2_table(78) := 'di \froman\fcharset178\fprq2 Times New Roman (Arabic){\*\falt Times};}'||wwv_flow.LF||
'{\fdbminor\f31565\fbidi \from';
    wwv_flow_api.g_varchar2_table(79) := 'an\fcharset186\fprq2 Times New Roman Baltic{\*\falt Times};}{\fdbminor\f31566\fbidi \froman\fcharset';
    wwv_flow_api.g_varchar2_table(80) := '163\fprq2 Times New Roman (Vietnamese){\*\falt Times};}{\fhiminor\f31568\fbidi \fswiss\fcharset238\f';
    wwv_flow_api.g_varchar2_table(81) := 'prq2 Calibri CE;}'||wwv_flow.LF||
'{\fhiminor\f31569\fbidi \fswiss\fcharset204\fprq2 Calibri Cyr;}{\fhiminor\f31571\f';
    wwv_flow_api.g_varchar2_table(82) := 'bidi \fswiss\fcharset161\fprq2 Calibri Greek;}{\fhiminor\f31572\fbidi \fswiss\fcharset162\fprq2 Cali';
    wwv_flow_api.g_varchar2_table(83) := 'bri Tur;}'||wwv_flow.LF||
'{\fhiminor\f31573\fbidi \fswiss\fcharset177\fprq2 Calibri (Hebrew);}{\fhiminor\f31574\fbid';
    wwv_flow_api.g_varchar2_table(84) := 'i \fswiss\fcharset178\fprq2 Calibri (Arabic);}{\fhiminor\f31575\fbidi \fswiss\fcharset186\fprq2 Cali';
    wwv_flow_api.g_varchar2_table(85) := 'bri Baltic;}'||wwv_flow.LF||
'{\fhiminor\f31576\fbidi \fswiss\fcharset163\fprq2 Calibri (Vietnamese);}{\fbiminor\f315';
    wwv_flow_api.g_varchar2_table(86) := '78\fbidi \froman\fcharset238\fprq2 Times New Roman CE{\*\falt Times};}{\fbiminor\f31579\fbidi \froma';
    wwv_flow_api.g_varchar2_table(87) := 'n\fcharset204\fprq2 Times New Roman Cyr{\*\falt Times};}'||wwv_flow.LF||
'{\fbiminor\f31581\fbidi \froman\fcharset161';
    wwv_flow_api.g_varchar2_table(88) := '\fprq2 Times New Roman Greek{\*\falt Times};}{\fbiminor\f31582\fbidi \froman\fcharset162\fprq2 Times';
    wwv_flow_api.g_varchar2_table(89) := ' New Roman Tur{\*\falt Times};}'||wwv_flow.LF||
'{\fbiminor\f31583\fbidi \froman\fcharset177\fprq2 Times New Roman (H';
    wwv_flow_api.g_varchar2_table(90) := 'ebrew){\*\falt Times};}{\fbiminor\f31584\fbidi \froman\fcharset178\fprq2 Times New Roman (Arabic){\*';
    wwv_flow_api.g_varchar2_table(91) := '\falt Times};}'||wwv_flow.LF||
'{\fbiminor\f31585\fbidi \froman\fcharset186\fprq2 Times New Roman Baltic{\*\falt Time';
    wwv_flow_api.g_varchar2_table(92) := 's};}{\fbiminor\f31586\fbidi \froman\fcharset163\fprq2 Times New Roman (Vietnamese){\*\falt Times};}}';
    wwv_flow_api.g_varchar2_table(93) := '{\colortbl;\red0\green0\blue0;\red0\green0\blue255;'||wwv_flow.LF||
'\red0\green255\blue255;\red0\green255\blue0;\red';
    wwv_flow_api.g_varchar2_table(94) := '255\green0\blue255;\red255\green0\blue0;\red255\green255\blue0;\red255\green255\blue255;\red0\green0';
    wwv_flow_api.g_varchar2_table(95) := '\blue128;\red0\green128\blue128;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;'||wwv_flow.LF||
'\r';
    wwv_flow_api.g_varchar2_table(96) := 'ed128\green128\blue0;\red128\green128\blue128;\red192\green192\blue192;\red0\green0\blue0;\red0\gree';
    wwv_flow_api.g_varchar2_table(97) := 'n0\blue0;\caccentone\ctint255\cshade191\red47\green84\blue150;\cbackgroundone\ctint255\cshade217\red';
    wwv_flow_api.g_varchar2_table(98) := '217\green217\blue217;\red255\green255\blue255;'||wwv_flow.LF||
'\red231\green243\blue253;\red230\green230\blue230;}{\';
    wwv_flow_api.g_varchar2_table(99) := '*\defchp \f31506\fs22\lang9226\langfe1033\langfenp1033 }{\*\defpap \ql \li0\ri0\sa160\sl259\slmult1\';
    wwv_flow_api.g_varchar2_table(100) := 'widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 }\noqfpromote {\stylesheet{';
    wwv_flow_api.g_varchar2_table(101) := ''||wwv_flow.LF||
'\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0';
    wwv_flow_api.g_varchar2_table(102) := '\itap0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp922';
    wwv_flow_api.g_varchar2_table(103) := '6\langfenp1033 '||wwv_flow.LF||
'\snext0 \sqformat \spriority0 \styrsid1527012 Normal;}{\s1\ql \li0\ri0\sb240\sl259\s';
    wwv_flow_api.g_varchar2_table(104) := 'lmult1\keep\keepn\widctlpar\wrapdefault\aspalpha\aspnum\faauto\outlinelevel0\adjustright\rin0\lin0\i';
    wwv_flow_api.g_varchar2_table(105) := 'tap0 \rtlch\fcs1 \af0\afs32\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\fs32\cf19\lang9226\langfe1033\loch\f31502\hich\a';
    wwv_flow_api.g_varchar2_table(106) := 'f31502\dbch\af31501\cgrid\langnp9226\langfenp1033 \sbasedon0 \snext0 \slink15 \sqformat \spriority9 ';
    wwv_flow_api.g_varchar2_table(107) := '\styrsid3888528 heading 1;}{\s2\ql \li0\ri0\sb40\sl259\slmult1'||wwv_flow.LF||
'\keep\keepn\widctlpar\wrapdefault\asp';
    wwv_flow_api.g_varchar2_table(108) := 'alpha\aspnum\faauto\outlinelevel1\adjustright\rin0\lin0\itap0 \rtlch\fcs1 \af0\afs26\alang1025 \ltrc';
    wwv_flow_api.g_varchar2_table(109) := 'h\fcs0 \fs26\cf19\lang9226\langfe1033\loch\f31502\hich\af31502\dbch\af31501\cgrid\langnp9226\langfen';
    wwv_flow_api.g_varchar2_table(110) := 'p1033 '||wwv_flow.LF||
'\sbasedon0 \snext0 \slink16 \sunhideused \sqformat \spriority9 \styrsid14435805 heading 2;}{\';
    wwv_flow_api.g_varchar2_table(111) := '*\cs10 \additive \ssemihidden \sunhideused \spriority1 Default Paragraph Font;}{\*'||wwv_flow.LF||
'\ts11\tsrowd\trft';
    wwv_flow_api.g_varchar2_table(112) := 'sWidthB3\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblind0\tblindtype3\tsvertalt';
    wwv_flow_api.g_varchar2_table(113) := '\tsbrdrt\tsbrdrl\tsbrdrb\tsbrdrr\tsbrdrdgl\tsbrdrdgr\tsbrdrh\tsbrdrv \ql \li0\ri0\sa160\sl259\slmult';
    wwv_flow_api.g_varchar2_table(114) := '1'||wwv_flow.LF||
'\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \rtlch\fcs1 \af31506\afs';
    wwv_flow_api.g_varchar2_table(115) := '22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 \snext11 \ss';
    wwv_flow_api.g_varchar2_table(116) := 'emihidden \sunhideused Normal Table;}{\*\cs15 \additive '||wwv_flow.LF||
'\rtlch\fcs1 \af0\afs32 \ltrch\fcs0 \fs32\cf';
    wwv_flow_api.g_varchar2_table(117) := '19\loch\f31502\hich\af31502\dbch\af31501 \sbasedon10 \slink1 \slocked \spriority9 \styrsid3888528 T\';
    wwv_flow_api.g_varchar2_table(118) := '''edtulo 1 Car;}{\*\cs16 \additive \rtlch\fcs1 \af0\afs26 \ltrch\fcs0 '||wwv_flow.LF||
'\fs26\cf19\loch\f31502\hich\af';
    wwv_flow_api.g_varchar2_table(119) := '31502\dbch\af31501 \sbasedon10 \slink2 \slocked \spriority9 \styrsid14435805 T\''edtulo 2 Car;}{\*\ts';
    wwv_flow_api.g_varchar2_table(120) := '17\tsrowd\trbrdrt\brdrs\brdrw10 \trbrdrl\brdrs\brdrw10 \trbrdrb\brdrs\brdrw10 \trbrdrr\brdrs\brdrw10';
    wwv_flow_api.g_varchar2_table(121) := ' \trbrdrh\brdrs\brdrw10 '||wwv_flow.LF||
'\trbrdrv\brdrs\brdrw10 \trftsWidthB3\trpaddl108\trpaddr108\trpaddfl3\trpadd';
    wwv_flow_api.g_varchar2_table(122) := 'ft3\trpaddfb3\trpaddfr3\tblind0\tblindtype3\tsvertalt\tsbrdrt\tsbrdrl\tsbrdrb\tsbrdrr\tsbrdrdgl\tsbr';
    wwv_flow_api.g_varchar2_table(123) := 'drdgr\tsbrdrh\tsbrdrv '||wwv_flow.LF||
'\ql \li0\ri0\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\li';
    wwv_flow_api.g_varchar2_table(124) := 'n0\itap0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9';
    wwv_flow_api.g_varchar2_table(125) := '226\langfenp1033 \sbasedon11 \snext17 \spriority39 \styrsid1527012 '||wwv_flow.LF||
'Table Grid;}{\s18\ql \li0\ri0\wi';
    wwv_flow_api.g_varchar2_table(126) := 'dctlpar\tqc\tx4419\tqr\tx8838\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \rtlch\';
    wwv_flow_api.g_varchar2_table(127) := 'fcs1 \af0\afs20\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\fs20\lang9226\langfe1033\loch\f31506\hich\af31506\dbch\af315';
    wwv_flow_api.g_varchar2_table(128) := '05\cgrid\langnp9226\langfenp1033 \sbasedon0 \snext18 \slink19 \sunhideused \styrsid475731 header;}{\';
    wwv_flow_api.g_varchar2_table(129) := '*\cs19 \additive \rtlch\fcs1 \af0\afs20 \ltrch\fcs0 \fs20\dbch\af31505 '||wwv_flow.LF||
'\sbasedon10 \slink18 \slocke';
    wwv_flow_api.g_varchar2_table(130) := 'd \styrsid475731 Encabezado Car;}{\s20\ql \li0\ri0\widctlpar\tqc\tx4419\tqr\tx8838\wrapdefault\aspal';
    wwv_flow_api.g_varchar2_table(131) := 'pha\aspnum\faauto\adjustright\rin0\lin0\itap0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\f31506\';
    wwv_flow_api.g_varchar2_table(132) := 'fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 \sbasedon0 \snext20 \slink21 \sunhideused \st';
    wwv_flow_api.g_varchar2_table(133) := 'yrsid2754504 footer;}{\*\cs21 \additive \rtlch\fcs1 \af0 \ltrch\fcs0 \sbasedon10 \slink20 \slocked \';
    wwv_flow_api.g_varchar2_table(134) := 'styrsid2754504 Pie de p\''e1gina Car;}{'||wwv_flow.LF||
'\s22\ql \li0\ri0\widctlpar\wrapdefault\aspalpha\aspnum\faauto';
    wwv_flow_api.g_varchar2_table(135) := '\adjustright\rin0\lin0\itap0 \rtlch\fcs1 \af43\afs18\alang1025 \ltrch\fcs0 \f43\fs18\lang9226\langfe';
    wwv_flow_api.g_varchar2_table(136) := '1033\cgrid\langnp9226\langfenp1033 '||wwv_flow.LF||
'\sbasedon0 \snext22 \slink23 \ssemihidden \sunhideused \styrsid1';
    wwv_flow_api.g_varchar2_table(137) := '6283701 Balloon Text;}{\*\cs23 \additive \rtlch\fcs1 \af43\afs18 \ltrch\fcs0 \f43\fs18 \sbasedon10 \';
    wwv_flow_api.g_varchar2_table(138) := 'slink22 \slocked \ssemihidden \styrsid16283701 Texto de globo Car;}}{\*\pgptbl {\pgp\ipgp0'||wwv_flow.LF||
'\itap0\li';
    wwv_flow_api.g_varchar2_table(139) := '0\ri0\sb0\sa0}{\pgp\ipgp0\itap0\li0\ri0\sb0\sa0}{\pgp\ipgp0\itap0\li0\ri0\sb0\sa0}}{\*\rsidtbl \rsid';
    wwv_flow_api.g_varchar2_table(140) := '21935\rsid83968\rsid162622\rsid220485\rsid269724\rsid280833\rsid284911\rsid329533\rsid348245\rsid352';
    wwv_flow_api.g_varchar2_table(141) := '036\rsid417610\rsid425125\rsid475731'||wwv_flow.LF||
'\rsid538843\rsid545558\rsid547685\rsid655834\rsid680737\rsid735';
    wwv_flow_api.g_varchar2_table(142) := '598\rsid738862\rsid866320\rsid876571\rsid882065\rsid931402\rsid944009\rsid991157\rsid1127355\rsid118';
    wwv_flow_api.g_varchar2_table(143) := '3489\rsid1276678\rsid1314662\rsid1315650\rsid1323680\rsid1323786\rsid1327883\rsid1328872'||wwv_flow.LF||
'\rsid144747';
    wwv_flow_api.g_varchar2_table(144) := '9\rsid1465893\rsid1511611\rsid1527012\rsid1538317\rsid1576316\rsid1646907\rsid1653736\rsid1852721\rs';
    wwv_flow_api.g_varchar2_table(145) := 'id1901944\rsid1903128\rsid1985085\rsid2048125\rsid2055198\rsid2059648\rsid2097641\rsid2101064\rsid21';
    wwv_flow_api.g_varchar2_table(146) := '15454\rsid2128629\rsid2177339\rsid2182049'||wwv_flow.LF||
'\rsid2234298\rsid2242870\rsid2296908\rsid2305980\rsid23098';
    wwv_flow_api.g_varchar2_table(147) := '18\rsid2363257\rsid2381965\rsid2454914\rsid2456668\rsid2499207\rsid2503458\rsid2566620\rsid2578112\r';
    wwv_flow_api.g_varchar2_table(148) := 'sid2627304\rsid2754504\rsid2777943\rsid2818133\rsid2820361\rsid2841172\rsid2963470\rsid2977082'||wwv_flow.LF||
'\rsid';
    wwv_flow_api.g_varchar2_table(149) := '3035960\rsid3110924\rsid3237274\rsid3241361\rsid3299962\rsid3349737\rsid3475361\rsid3485454\rsid3498';
    wwv_flow_api.g_varchar2_table(150) := '847\rsid3552079\rsid3765947\rsid3766645\rsid3872902\rsid3882814\rsid3888528\rsid3946178\rsid4004782\';
    wwv_flow_api.g_varchar2_table(151) := 'rsid4069665\rsid4080990\rsid4086242\rsid4094613'||wwv_flow.LF||
'\rsid4132765\rsid4156572\rsid4274504\rsid4402990\rsi';
    wwv_flow_api.g_varchar2_table(152) := 'd4419678\rsid4457483\rsid4460836\rsid4460837\rsid4461487\rsid4462419\rsid4467881\rsid4528565\rsid453';
    wwv_flow_api.g_varchar2_table(153) := '9752\rsid4605761\rsid4607449\rsid4653096\rsid4655687\rsid4673135\rsid4681775\rsid4800285\rsid4865145';
    wwv_flow_api.g_varchar2_table(154) := ''||wwv_flow.LF||
'\rsid5002468\rsid5004344\rsid5056960\rsid5112505\rsid5121261\rsid5191353\rsid5267575\rsid5273899\rs';
    wwv_flow_api.g_varchar2_table(155) := 'id5275210\rsid5325795\rsid5339801\rsid5448223\rsid5462277\rsid5471252\rsid5587391\rsid5592097\rsid56';
    wwv_flow_api.g_varchar2_table(156) := '02073\rsid5637190\rsid5713460\rsid5714651\rsid5716581'||wwv_flow.LF||
'\rsid5723570\rsid5725979\rsid5794352\rsid58341';
    wwv_flow_api.g_varchar2_table(157) := '41\rsid5839842\rsid5851738\rsid5910790\rsid5972004\rsid5982630\rsid5992177\rsid6038217\rsid6039913\r';
    wwv_flow_api.g_varchar2_table(158) := 'sid6171013\rsid6230929\rsid6232511\rsid6252013\rsid6296472\rsid6299357\rsid6322078\rsid6361358\rsid6';
    wwv_flow_api.g_varchar2_table(159) := '376215'||wwv_flow.LF||
'\rsid6379667\rsid6430224\rsid6495282\rsid6513487\rsid6564855\rsid6571414\rsid6624900\rsid6639';
    wwv_flow_api.g_varchar2_table(160) := '161\rsid6641704\rsid6713352\rsid6828547\rsid6846332\rsid6846715\rsid6881737\rsid6888627\rsid6905327\';
    wwv_flow_api.g_varchar2_table(161) := 'rsid6959970\rsid7097672\rsid7108460\rsid7157110\rsid7228541'||wwv_flow.LF||
'\rsid7345363\rsid7482834\rsid7486533\rsi';
    wwv_flow_api.g_varchar2_table(162) := 'd7494042\rsid7494551\rsid7495530\rsid7555507\rsid7556731\rsid7612416\rsid7617339\rsid7618884\rsid762';
    wwv_flow_api.g_varchar2_table(163) := '4320\rsid7631590\rsid7679619\rsid7688527\rsid7745749\rsid7746615\rsid7748740\rsid7876813\rsid7953924';
    wwv_flow_api.g_varchar2_table(164) := '\rsid7954912'||wwv_flow.LF||
'\rsid8011428\rsid8019231\rsid8027056\rsid8063151\rsid8066431\rsid8136998\rsid8138293\rs';
    wwv_flow_api.g_varchar2_table(165) := 'id8139196\rsid8154407\rsid8274774\rsid8323982\rsid8329625\rsid8393167\rsid8394842\rsid8399248\rsid84';
    wwv_flow_api.g_varchar2_table(166) := '02805\rsid8404187\rsid8454981\rsid8460905\rsid8467388\rsid8486458'||wwv_flow.LF||
'\rsid8521287\rsid8529128\rsid86659';
    wwv_flow_api.g_varchar2_table(167) := '22\rsid8671814\rsid8716562\rsid8791382\rsid8806551\rsid8868734\rsid8920528\rsid8927384\rsid8983680\r';
    wwv_flow_api.g_varchar2_table(168) := 'sid8989655\rsid8993502\rsid9050920\rsid9115223\rsid9184245\rsid9194650\rsid9323090\rsid9331279\rsid9';
    wwv_flow_api.g_varchar2_table(169) := '402494\rsid9443654'||wwv_flow.LF||
'\rsid9449499\rsid9452705\rsid9460174\rsid9469739\rsid9504653\rsid9509720\rsid9515';
    wwv_flow_api.g_varchar2_table(170) := '630\rsid9528211\rsid9530475\rsid9572266\rsid9649200\rsid9655604\rsid9658360\rsid9662098\rsid9715800\';
    wwv_flow_api.g_varchar2_table(171) := 'rsid9788510\rsid9788545\rsid9857312\rsid9860781\rsid9906665\rsid9924607'||wwv_flow.LF||
'\rsid9985899\rsid10095898\rs';
    wwv_flow_api.g_varchar2_table(172) := 'id10098038\rsid10105739\rsid10112721\rsid10120698\rsid10236238\rsid10240608\rsid10240631\rsid1025169';
    wwv_flow_api.g_varchar2_table(173) := '4\rsid10316829\rsid10356311\rsid10430605\rsid10446117\rsid10489548\rsid10494215\rsid10518289\rsid105';
    wwv_flow_api.g_varchar2_table(174) := '53722\rsid10621786'||wwv_flow.LF||
'\rsid10688499\rsid10689959\rsid10701771\rsid10822095\rsid10826811\rsid10828060\rs';
    wwv_flow_api.g_varchar2_table(175) := 'id10845317\rsid10894818\rsid10897470\rsid10903470\rsid10959449\rsid10964758\rsid10965318\rsid1097191';
    wwv_flow_api.g_varchar2_table(176) := '6\rsid11030915\rsid11040125\rsid11081629\rsid11089071\rsid11099566'||wwv_flow.LF||
'\rsid11108010\rsid11151320\rsid11';
    wwv_flow_api.g_varchar2_table(177) := '158968\rsid11162909\rsid11234893\rsid11274374\rsid11285062\rsid11349299\rsid11351376\rsid11365050\rs';
    wwv_flow_api.g_varchar2_table(178) := 'id11411417\rsid11432585\rsid11494519\rsid11500511\rsid11674686\rsid11697034\rsid11757810\rsid1175845';
    wwv_flow_api.g_varchar2_table(179) := '0\rsid11758811'||wwv_flow.LF||
'\rsid11808639\rsid11815201\rsid11828207\rsid11872477\rsid11873316\rsid11887003\rsid11';
    wwv_flow_api.g_varchar2_table(180) := '931011\rsid11950332\rsid11952220\rsid12011512\rsid12020433\rsid12022847\rsid12023237\rsid12140299\rs';
    wwv_flow_api.g_varchar2_table(181) := 'id12147493\rsid12152934\rsid12206928\rsid12258915\rsid12284099'||wwv_flow.LF||
'\rsid12285061\rsid12324839\rsid123457';
    wwv_flow_api.g_varchar2_table(182) := '27\rsid12468725\rsid12522317\rsid12524641\rsid12525807\rsid12530031\rsid12585884\rsid12592288\rsid12';
    wwv_flow_api.g_varchar2_table(183) := '598740\rsid12603670\rsid12606466\rsid12661063\rsid12676317\rsid12714870\rsid12721209\rsid12783193\rs';
    wwv_flow_api.g_varchar2_table(184) := 'id12792961'||wwv_flow.LF||
'\rsid12808024\rsid12911917\rsid12912820\rsid12924776\rsid12989215\rsid13046978\rsid130520';
    wwv_flow_api.g_varchar2_table(185) := '92\rsid13052510\rsid13174990\rsid13186912\rsid13192307\rsid13203660\rsid13253398\rsid13331577\rsid13';
    wwv_flow_api.g_varchar2_table(186) := '376842\rsid13381514\rsid13456993\rsid13461858\rsid13506896'||wwv_flow.LF||
'\rsid13595392\rsid13642079\rsid13648926\r';
    wwv_flow_api.g_varchar2_table(187) := 'sid13708704\rsid13711923\rsid13839927\rsid13850905\rsid13985435\rsid14041797\rsid14042983\rsid140436';
    wwv_flow_api.g_varchar2_table(188) := '49\rsid14045290\rsid14055056\rsid14091697\rsid14166713\rsid14233972\rsid14301706\rsid14305989\rsid14';
    wwv_flow_api.g_varchar2_table(189) := '360914'||wwv_flow.LF||
'\rsid14375015\rsid14420131\rsid14420910\rsid14435805\rsid14440600\rsid14442242\rsid14492859\r';
    wwv_flow_api.g_varchar2_table(190) := 'sid14553866\rsid14565044\rsid14644088\rsid14746014\rsid14752297\rsid14763141\rsid14828032\rsid148890';
    wwv_flow_api.g_varchar2_table(191) := '33\rsid14947296\rsid14961077\rsid14969960\rsid15029165'||wwv_flow.LF||
'\rsid15030782\rsid15085969\rsid15146244\rsid1';
    wwv_flow_api.g_varchar2_table(192) := '5228818\rsid15288099\rsid15293412\rsid15350554\rsid15366672\rsid15409123\rsid15422803\rsid15478504\r';
    wwv_flow_api.g_varchar2_table(193) := 'sid15480616\rsid15485234\rsid15537496\rsid15558841\rsid15563740\rsid15614884\rsid15614913\rsid157446';
    wwv_flow_api.g_varchar2_table(194) := '09'||wwv_flow.LF||
'\rsid15745946\rsid15752364\rsid15800561\rsid15820449\rsid15821089\rsid15822243\rsid15937096\rsid1';
    wwv_flow_api.g_varchar2_table(195) := '5938026\rsid16061695\rsid16069635\rsid16076281\rsid16126945\rsid16142970\rsid16146735\rsid16146929\r';
    wwv_flow_api.g_varchar2_table(196) := 'sid16269167\rsid16283701\rsid16341420\rsid16384523'||wwv_flow.LF||
'\rsid16466333\rsid16481854\rsid16678479\rsid16720';
    wwv_flow_api.g_varchar2_table(197) := '166\rsid16740693}{\mmathPr\mmathFont34\mbrkBin0\mbrkBinSub0\msmallFrac0\mdispDef1\mlMargin0\mrMargin';
    wwv_flow_api.g_varchar2_table(198) := '0\mdefJc1\mwrapIndent1440\mintLim0\mnaryLim1}{\info{\author MARVIN DE JESUS ACOSTA PACHECO}'||wwv_flow.LF||
'{\operat';
    wwv_flow_api.g_varchar2_table(199) := 'or MARVIN DE JESUS ACOSTA PACHECO}{\creatim\yr2018\mo11\dy6\hr10\min53}{\revtim\yr2018\mo11\dy8\hr16';
    wwv_flow_api.g_varchar2_table(200) := '\min17}{\version182}{\edmins301}{\nofpages2}{\nofwords193}{\nofchars1066}{\nofcharsws1257}{\vern93}}';
    wwv_flow_api.g_varchar2_table(201) := '{\*\xmlnstbl {\xmlns1 http://schemas.microsoft.'||wwv_flow.LF||
'com/office/word/2003/wordml}}\paperw15840\paperh1224';
    wwv_flow_api.g_varchar2_table(202) := '0\margl720\margr720\margt720\margb720\gutter0\ltrsect '||wwv_flow.LF||
'\deftab708\widowctrl\ftnbj\aenddoc\hyphhotz42';
    wwv_flow_api.g_varchar2_table(203) := '5\trackmoves0\trackformatting1\donotembedsysfont1\relyonvml0\donotembedlingdata0\grfdocevents0\valid';
    wwv_flow_api.g_varchar2_table(204) := 'atexml1\showplaceholdtext0\ignoremixedcontent0\saveinvalidxml0'||wwv_flow.LF||
'\showxmlerrors1\noxlattoyen\expshrtn\';
    wwv_flow_api.g_varchar2_table(205) := 'noultrlspc\dntblnsbdb\nospaceforul\formshade\horzdoc\dgmargin\dghspace180\dgvspace180\dghorigin720\d';
    wwv_flow_api.g_varchar2_table(206) := 'gvorigin720\dghshow1\dgvshow1'||wwv_flow.LF||
'\jexpand\viewkind1\viewscale100\pgbrdrhead\pgbrdrfoot\splytwnine\ftnly';
    wwv_flow_api.g_varchar2_table(207) := 'twnine\htmautsp\nolnhtadjtbl\useltbaln\alntblind\lytcalctblwd\lyttblrtgr\lnbrkrule\nobrkwrptbl\snapt';
    wwv_flow_api.g_varchar2_table(208) := 'ogridincell\allowfieldendsel\wrppunct'||wwv_flow.LF||
'\asianbrkrule\rsidroot1527012\newtblstyruls\nogrowautofit\usen';
    wwv_flow_api.g_varchar2_table(209) := 'ormstyforlist\noindnmbrts\felnbrelev\nocxsptable\indrlsweleven\noafcnsttbl\afelev\utinl\hwelev\spltp';
    wwv_flow_api.g_varchar2_table(210) := 'gpar\notcvasp\notbrkcnstfrctbl\notvatxbx\krnprsnet\cachedcolbal \nouicompat \fet0'||wwv_flow.LF||
'{\*\wgrffmtfilter ';
    wwv_flow_api.g_varchar2_table(211) := '2450}\nofeaturethrottle1\ilfomacatclnup0{\*\docvar {xdo0001}{PD9mb3ItZWFjaEBjZWxsOiRjNTc5MjUvL0MxPz4';
    wwv_flow_api.g_varchar2_table(212) := '=}}'||wwv_flow.LF||
'{\*\docvar {xdo0002}{PGZvOmluc3RyZWFtLWZvcmVpZ24tb2JqZWN0IGNvbnRlbnQtdHlwZT0iaW1hZ2UvanBlZyIgICB';
    wwv_flow_api.g_varchar2_table(213) := 'oZWlnaHQ9IjQ4IHB4IiB3aWR0aD0iMTE1IHB4IiA+DQo8eHNsOnZhbHVlLW9mIHNlbGVjdD0iLi8vTEdPX1NMR0FOIi8+DQo8L2Z';
    wwv_flow_api.g_varchar2_table(214) := 'vOmluc3RyZWFtLWZvcmVpZ24tb2JqZWN0Pg==}}'||wwv_flow.LF||
'{\*\docvar {xdo0003}{PGZvOmluc3RyZWFtLWZvcmVpZ24tb2JqZWN0IGN';
    wwv_flow_api.g_varchar2_table(215) := 'vbnRlbnQtdHlwZT0iaW1hZ2UvanBlZyIgICBoZWlnaHQ9IjQ4IHB4IiB3aWR0aD0iMTE1IHB4IiA+DQo8eHNsOnZhbHVlLW9mIHN';
    wwv_flow_api.g_varchar2_table(216) := 'lbGVjdD0iLi8vTEdPX1NMR0FOIi8+DQo8L2ZvOmluc3RyZWFtLWZvcmVpZ24tb2JqZWN0Pg==}}'||wwv_flow.LF||
'{\*\docvar {xdo0004}{PD9';
    wwv_flow_api.g_varchar2_table(217) := 'OTUJSRV9DTE5URT8+}}{\*\docvar {xdo0005}{PD9TTEdBTj8+}}{\*\docvar {xdo0006}{PD9Ob21icmVJbXB1ZXN0bz8+}';
    wwv_flow_api.g_varchar2_table(218) := '}{\*\docvar {xdo0007}{PD8uL0g/Pg==}}{\*\docvar {xdo0008}{PD9lbmQgZm9yLWVhY2g/Pg==}}'||wwv_flow.LF||
'{\*\docvar {xdo0';
    wwv_flow_api.g_varchar2_table(219) := '009}{PD9mb3ItZWFjaEBjb2x1bW46JGM1NzkyNSAvL0MxPz4=}}{\*\docvar {xdo0010}{PD9lbmQgZm9yLWVhY2g/Pg==}}{\';
    wwv_flow_api.g_varchar2_table(220) := '*\docvar {xdo0011}{PD9mb3ItZWFjaDokYzU3OTI1Ly9SMT8+}}{\*\docvar {xdo0012}{PD8uL0g/Pg==}}{\*\docvar {';
    wwv_flow_api.g_varchar2_table(221) := 'xdo0013}{PD9lbmQgZm9yLWVhY2g/Pg==}}'||wwv_flow.LF||
'{\*\docvar {xdo0014}{PD9jcm9zc3RhYjpjNTc5MjU7Ii8vUk9XU0VUMV9ST1c';
    wwv_flow_api.g_varchar2_table(222) := 'iOyJNRVN7LG89YSx0PXR9IjsiVklHRU5DSUF7LG89YSx0PXR9IjsiVkFMT1JfUkVDQVVETyxOVU1FUk9TX1BSRURJT1MiOyJzdW0';
    wwv_flow_api.g_varchar2_table(223) := 'iPz4=}}{\*\docvar {xdo0015}{PD9ob3Jpem9udGFsLWJyZWFrLXRhYmxlOjE/Pg==}}'||wwv_flow.LF||
'{\*\docvar {xdo0016}{PD9hY2Mt';
    wwv_flow_api.g_varchar2_table(224) := 'cm93LWhlYWRlcjonMSc/Pg==}}{\*\docvar {xdo0017}{PD9mb3ItZWFjaEBjZWxsOiRjODI5MTgvL0MxPz4=}}{\*\docvar ';
    wwv_flow_api.g_varchar2_table(225) := '{xdo0018}{PD9VU1VBUklPPz4=}}{\*\docvar {xdo0019}{PD9IT1k/Pg==}}{\*\docvar {xdo0020}{PD9JUEFERFI/Pg==';
    wwv_flow_api.g_varchar2_table(226) := '}}'||wwv_flow.LF||
'{\*\docvar {xdo0021}{PD8uL0g/Pg==}}{\*\docvar {xdo0022}{PD9GRUNIQV9ERVNERT8+}}{\*\docvar {xdo0023';
    wwv_flow_api.g_varchar2_table(227) := '}{PD9GRUNIQV9IQVNUQT8+}}{\*\docvar {xdo0024}{PD9mb3ItZWFjaEBjZWxsOiRjNTc5MjUvL0MxPz4=}}{\*\docvar {x';
    wwv_flow_api.g_varchar2_table(228) := 'do0025}{PD8uL1QxPz4=}}{\*\docvar {xdo0026}{PD8uL1QyPz4=}}'||wwv_flow.LF||
'{\*\docvar {xdo0027}{PD9lbmQgZm9yLWVhY2g/P';
    wwv_flow_api.g_varchar2_table(229) := 'g==}}{\*\docvar {xdo0028}{PD9lbmQgZm9yLWVhY2g/Pg==}}{\*\docvar {xdo0029}{PD9mb3ItZWFjaEBjb2x1bW46JGM';
    wwv_flow_api.g_varchar2_table(230) := '4MjkxOCAvL0MxPz4=}}{\*\docvar {xdo0030}{PD9mb3ItZWFjaEBjZWxsOi4vL1IxQzE/Pg==}}{\*\docvar {xdo0031}{P';
    wwv_flow_api.g_varchar2_table(231) := 'D8uL00xPz4=}}'||wwv_flow.LF||
'{\*\docvar {xdo0032}{PD8uL00yPz4=}}{\*\docvar {xdo0033}{PD9lbmQgZm9yLWVhY2g/Pg==}}{\*\';
    wwv_flow_api.g_varchar2_table(232) := 'docvar {xdo0034}{PD9mb3ItZWFjaDokYzgyOTE4Ly9SMT8+}}{\*\docvar {xdo0035}{PD8uL0g/Pg==}}{\*\docvar {xd';
    wwv_flow_api.g_varchar2_table(233) := 'o0036}{PD9lbmQgZm9yLWVhY2g/Pg==}}'||wwv_flow.LF||
'{\*\docvar {xdo0037}{PD9jcm9zc3RhYjpjODI5MTg7Ii8vUk9XU0VUMV9ST1ciO';
    wwv_flow_api.g_varchar2_table(234) := 'yJNRVN7LG89YSx0PXR9IjsiVklHRU5DSUF7LG89YSx0PXR9IjsiVkFMT1JfUkVDQVVETyxOVU1FUk9TX1BSRURJT1MiOyJzdW0iP';
    wwv_flow_api.g_varchar2_table(235) := 'z4=}}{\*\docvar {xdo0038}{PD9ob3Jpem9udGFsLWJyZWFrLXRhYmxlOjE/Pg==}}'||wwv_flow.LF||
'{\*\docvar {xdo0039}{PD9hY2Mtcm';
    wwv_flow_api.g_varchar2_table(236) := '93LWhlYWRlcjonMSc/Pg==}}{\*\docvar {xdo0040}{PD8uL1QyPz4=}}{\*\docvar {xdo0041}{PD8uL1QxPz4=}}{\*\do';
    wwv_flow_api.g_varchar2_table(237) := 'cvar {xdo0042}{PD9mb3ItZWFjaEBjZWxsOiRjODI5MTgvL0MxPz4=}}{\*\docvar {xdo0043}{PD8uL1QxPz4=}}'||wwv_flow.LF||
'{\*\doc';
    wwv_flow_api.g_varchar2_table(238) := 'var {xdo0044}{PD8uL1QyPz4=}}{\*\docvar {xdo0045}{PD9lbmQgZm9yLWVhY2g/Pg==}}{\*\docvar {xdo0046}{PD8k';
    wwv_flow_api.g_varchar2_table(239) := 'YzgyOTE4Ly9NMC9NMi9UPz4=}}{\*\docvar {xdo0047}{PD8kYzgyOTE4Ly9NMC9NMS9UPz4=}}{\*\docvar {xdo0048}{PD';
    wwv_flow_api.g_varchar2_table(240) := '9mb3ItZWFjaEBjZWxsOi4vL1IxQzE/Pg==}}'||wwv_flow.LF||
'{\*\docvar {xdo0049}{PD8uL00xPz4=}}{\*\docvar {xdo0050}{PD8uL00';
    wwv_flow_api.g_varchar2_table(241) := 'yPz4=}}{\*\docvar {xdo0051}{PD9lbmQgZm9yLWVhY2g/Pg==}}{\*\ftnsep \ltrpar \pard\plain \ltrpar'||wwv_flow.LF||
'\ql \li';
    wwv_flow_api.g_varchar2_table(242) := '0\ri0\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsid2754504 \rtlc';
    wwv_flow_api.g_varchar2_table(243) := 'h\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp10';
    wwv_flow_api.g_varchar2_table(244) := '33 {\rtlch\fcs1 \af0 \ltrch\fcs0 '||wwv_flow.LF||
'\insrsid7228541 \chftnsep '||wwv_flow.LF||
'\par }}{\*\ftnsepc \ltrpar \pard\plain ';
    wwv_flow_api.g_varchar2_table(245) := '\ltrpar\ql \li0\ri0\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsi';
    wwv_flow_api.g_varchar2_table(246) := 'd2754504 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9';
    wwv_flow_api.g_varchar2_table(247) := '226\langfenp1033 {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid7228541 \chftnsepc '||wwv_flow.LF||
'\par }}{\*\aftnsep \ltrp';
    wwv_flow_api.g_varchar2_table(248) := 'ar \pard\plain \ltrpar\ql \li0\ri0\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin';
    wwv_flow_api.g_varchar2_table(249) := '0\itap0\pararsid2754504 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe103';
    wwv_flow_api.g_varchar2_table(250) := '3\cgrid\langnp9226\langfenp1033 {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid7228541 \chftnsep '||wwv_flow.LF||
'\par }}{\*';
    wwv_flow_api.g_varchar2_table(251) := '\aftnsepc \ltrpar \pard\plain \ltrpar\ql \li0\ri0\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjus';
    wwv_flow_api.g_varchar2_table(252) := 'tright\rin0\lin0\itap0\pararsid2754504 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lan';
    wwv_flow_api.g_varchar2_table(253) := 'g9226\langfe1033\cgrid\langnp9226\langfenp1033 {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid7228541 \chftn';
    wwv_flow_api.g_varchar2_table(254) := 'sepc '||wwv_flow.LF||
'\par }}\ltrpar \sectd \ltrsect\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectli';
    wwv_flow_api.g_varchar2_table(255) := 'negrid360\sectdefaultcl\sectrsid8529128\sftnbj {\footerr \ltrpar \pard\plain \ltrpar\s18\qc \li0\ri0';
    wwv_flow_api.g_varchar2_table(256) := '\widctlpar'||wwv_flow.LF||
'\tqc\tx4419\tqr\tx8838\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\par';
    wwv_flow_api.g_varchar2_table(257) := 'arsid13203660 \rtlch\fcs1 \af0\afs20\alang1025 \ltrch\fcs0 \fs20\lang9226\langfe1033\loch\af31506\hi';
    wwv_flow_api.g_varchar2_table(258) := 'ch\af31506\dbch\af31505\cgrid\langnp9226\langfenp1033 {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid1320366';
    wwv_flow_api.g_varchar2_table(259) := '0 '||wwv_flow.LF||
'\par \hich\af31506\dbch\af31505\loch\f31506 <?call-template:footer?>'||wwv_flow.LF||
'\par }\pard\plain \ltrpar\s2';
    wwv_flow_api.g_varchar2_table(260) := '0\ql \li0\ri0\widctlpar\tqc\tx4419\tqr\tx8838\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\li';
    wwv_flow_api.g_varchar2_table(261) := 'n0\itap0\pararsid13203660 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\f31506\fs22\lang9226\langfe';
    wwv_flow_api.g_varchar2_table(262) := '1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid9115223 '||wwv_flow.LF||
'\par }{\rtlch\fcs1';
    wwv_flow_api.g_varchar2_table(263) := ' \af0 \ltrch\fcs0 \insrsid13203660\charrsid13203660 '||wwv_flow.LF||
'\par }}{\*\pnseclvl1\pnucrm\pnstart1\pnindent72';
    wwv_flow_api.g_varchar2_table(264) := '0\pnhang {\pntxta .}}{\*\pnseclvl2\pnucltr\pnstart1\pnindent720\pnhang {\pntxta .}}{\*\pnseclvl3\pnd';
    wwv_flow_api.g_varchar2_table(265) := 'ec\pnstart1\pnindent720\pnhang {\pntxta .}}{\*\pnseclvl4\pnlcltr\pnstart1\pnindent720\pnhang {\pntxt';
    wwv_flow_api.g_varchar2_table(266) := 'a )}}'||wwv_flow.LF||
'{\*\pnseclvl5\pndec\pnstart1\pnindent720\pnhang {\pntxtb (}{\pntxta )}}{\*\pnseclvl6\pnlcltr\p';
    wwv_flow_api.g_varchar2_table(267) := 'nstart1\pnindent720\pnhang {\pntxtb (}{\pntxta )}}{\*\pnseclvl7\pnlcrm\pnstart1\pnindent720\pnhang {';
    wwv_flow_api.g_varchar2_table(268) := '\pntxtb (}{\pntxta )}}{\*\pnseclvl8'||wwv_flow.LF||
'\pnlcltr\pnstart1\pnindent720\pnhang {\pntxtb (}{\pntxta )}}{\*\';
    wwv_flow_api.g_varchar2_table(269) := 'pnseclvl9\pnlcrm\pnstart1\pnindent720\pnhang {\pntxtb (}{\pntxta )}}\ltrrow\trowd \irow0\irowband0\l';
    wwv_flow_api.g_varchar2_table(270) := 'trrow'||wwv_flow.LF||
'\ts17\trqc\trgaph70\trleft-426\trftsWidth1\trftsWidthB3\trautofit1\trpaddl108\trpaddr108\trpad';
    wwv_flow_api.g_varchar2_table(271) := 'dfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid6299357\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind-31';
    wwv_flow_api.g_varchar2_table(272) := '8\tblindtype3 \clvmgf\clvertalc\clbrdrt\brdrtbl \clbrdrl'||wwv_flow.LF||
'\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl ';
    wwv_flow_api.g_varchar2_table(273) := '\cltxlrtb\clftsWidth3\clwWidth1942\clshdrawnil \cellx1516\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl';
    wwv_flow_api.g_varchar2_table(274) := ' \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth5244\clshdrawnil \cellx6760\clvmgf\';
    wwv_flow_api.g_varchar2_table(275) := 'clvertalc'||wwv_flow.LF||
'\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\';
    wwv_flow_api.g_varchar2_table(276) := 'clwWidth2110\clshdrawnil \cellx8870\pard\plain \ltrpar\qc \li0\ri0\widctlpar\intbl\wrapdefault\aspal';
    wwv_flow_api.g_varchar2_table(277) := 'pha\aspnum\faauto\adjustright\rin0\lin0\pararsid6299357\yts17 '||wwv_flow.LF||
'\rtlch\fcs1 \af0\afs22\alang1025 \ltr';
    wwv_flow_api.g_varchar2_table(278) := 'ch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\*\bkmkstart Texto347}{\fiel';
    wwv_flow_api.g_varchar2_table(279) := 'd{\*\fldinst {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid7612416  FORMTEXT }{\rtlch\f';
    wwv_flow_api.g_varchar2_table(280) := 'cs1 \af38\afs18 '||wwv_flow.LF||
'\ltrch\fcs0 \b\f31502\fs18\insrsid7612416 {\*\datafield 800300000000000008546578746';
    wwv_flow_api.g_varchar2_table(281) := 'f33343700094c474f5f534c47414e00000000000f3c3f7265663a78646f303030333f3e0000000000}{\*\formfield{\fft';
    wwv_flow_api.g_varchar2_table(282) := 'ype0\ffownhelp\ffownstat\ffprot\fftypetxt0{\*\ffname Texto347}'||wwv_flow.LF||
'{\*\ffdeftext LGO_SLGAN}{\*\ffstattex';
    wwv_flow_api.g_varchar2_table(283) := 't <?ref:xdo0003?>}}}}}{\fldrslt {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\lang1024\langfe1';
    wwv_flow_api.g_varchar2_table(284) := '024\noproof\insrsid7612416 LGO_SLGAN}}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\footery708\colsx';
    wwv_flow_api.g_varchar2_table(285) := '708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af38\afs18 \ltrch\fc';
    wwv_flow_api.g_varchar2_table(286) := 's0 \b\f31502\fs18\insrsid2177339 {\*\bkmkend Texto347}\cell }\pard \ltrpar'||wwv_flow.LF||
'\qc \li0\ri0\widctlpar\in';
    wwv_flow_api.g_varchar2_table(287) := 'tbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid8404187\yts17 {\rtlch\fcs1 \af3';
    wwv_flow_api.g_varchar2_table(288) := '8\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid2177339 \cell }\pard \ltrpar'||wwv_flow.LF||
'\qc \li0\ri0\widctlpar\intbl\';
    wwv_flow_api.g_varchar2_table(289) := 'wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid6299357\yts17 {\*\bkmkstart Texto34';
    wwv_flow_api.g_varchar2_table(290) := '2}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid7612416\cha';
    wwv_flow_api.g_varchar2_table(291) := 'rrsid7612416  FORMTEXT }{'||wwv_flow.LF||
'\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid7612416\charrsid';
    wwv_flow_api.g_varchar2_table(292) := '7612416 {\*\datafield 800100000000000008546578746f33343200094c474f5f534c47414e00000000000f3c3f726566';
    wwv_flow_api.g_varchar2_table(293) := '3a78646f303030323f3e0000000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Text';
    wwv_flow_api.g_varchar2_table(294) := 'o342}{\*\ffdeftext LGO_SLGAN}{\*\ffstattext <?ref:xdo0002?>}}}}}{\fldrslt {\rtlch\fcs1 \af38\afs18 \';
    wwv_flow_api.g_varchar2_table(295) := 'ltrch\fcs0 \b\f31502\fs18\lang1024\langfe1024\noproof\insrsid7612416\charrsid7612416 '||wwv_flow.LF||
'LGO_SLGAN}}}\s';
    wwv_flow_api.g_varchar2_table(296) := 'ectd \ltrsect\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl';
    wwv_flow_api.g_varchar2_table(297) := '\sectrsid8529128\sftnbj {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid2177339 {\*\bkmke';
    wwv_flow_api.g_varchar2_table(298) := 'nd Texto342}\cell }\pard\plain \ltrpar'||wwv_flow.LF||
'\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\intbl\wrapdefault\';
    wwv_flow_api.g_varchar2_table(299) := 'aspalpha\aspnum\faauto\adjustright\rin0\lin0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs';
    wwv_flow_api.g_varchar2_table(300) := '22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 '||wwv_flow.LF||
'\b\f31502';
    wwv_flow_api.g_varchar2_table(301) := '\fs18\insrsid2177339 \trowd \irow0\irowband0\ltrrow'||wwv_flow.LF||
'\ts17\trqc\trgaph70\trleft-426\trftsWidth1\trfts';
    wwv_flow_api.g_varchar2_table(302) := 'WidthB3\trautofit1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid6299357\tbll';
    wwv_flow_api.g_varchar2_table(303) := 'khdrrows\tbllkhdrcols\tbllknocolband\tblind-318\tblindtype3 \clvmgf\clvertalc\clbrdrt\brdrtbl \clbrd';
    wwv_flow_api.g_varchar2_table(304) := 'rl'||wwv_flow.LF||
'\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1942\clshdrawnil \cellx1';
    wwv_flow_api.g_varchar2_table(305) := '516\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidt';
    wwv_flow_api.g_varchar2_table(306) := 'h3\clwWidth5244\clshdrawnil \cellx6760\clvmgf\clvertalc'||wwv_flow.LF||
'\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\b';
    wwv_flow_api.g_varchar2_table(307) := 'rdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2110\clshdrawnil \cellx8870\row \ltrrow}\trowd';
    wwv_flow_api.g_varchar2_table(308) := ' \irow1\irowband1\ltrrow'||wwv_flow.LF||
'\ts17\trqc\trgaph70\trleft-426\trftsWidth1\trftsWidthB3\trautofit1\trpaddl1';
    wwv_flow_api.g_varchar2_table(309) := '08\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid6905327\tbllkhdrrows\tbllkhdrcols\tbllk';
    wwv_flow_api.g_varchar2_table(310) := 'nocolband\tblind-318\tblindtype3 \clvmrg\clvertalt\clbrdrt\brdrtbl \clbrdrl'||wwv_flow.LF||
'\brdrtbl \clbrdrb\brdrtb';
    wwv_flow_api.g_varchar2_table(311) := 'l \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1942\clshdrawnil \cellx1516\clvertalb\clbrdrt\brdrt';
    wwv_flow_api.g_varchar2_table(312) := 'bl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth5244\clshdrawnil';
    wwv_flow_api.g_varchar2_table(313) := ' \cellx6760\clvmrg\clvertalt'||wwv_flow.LF||
'\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cl';
    wwv_flow_api.g_varchar2_table(314) := 'txlrtb\clftsWidth3\clwWidth2110\clshdrawnil \cellx8870\pard\plain \ltrpar\ql \li0\ri0\widctlpar\intb';
    wwv_flow_api.g_varchar2_table(315) := 'l\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid220485\yts17 '||wwv_flow.LF||
'\rtlch\fcs1 \af0\af';
    wwv_flow_api.g_varchar2_table(316) := 's22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs';
    wwv_flow_api.g_varchar2_table(317) := '1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid2177339 \cell }\pard \ltrpar'||wwv_flow.LF||
'\qc \li0\ri0\widctlpar\';
    wwv_flow_api.g_varchar2_table(318) := 'intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid6905327\yts17 {\*\bkmkstart T';
    wwv_flow_api.g_varchar2_table(319) := 'exto344}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid76124';
    wwv_flow_api.g_varchar2_table(320) := '16\charrsid7612416  FORMTEXT }{'||wwv_flow.LF||
'\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid7612416\ch';
    wwv_flow_api.g_varchar2_table(321) := 'arrsid7612416 {\*\datafield 800100000000000008546578746f333434000b4e4d4252455f434c4e544500000000000f';
    wwv_flow_api.g_varchar2_table(322) := '3c3f7265663a78646f303030343f3e0000000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\f';
    wwv_flow_api.g_varchar2_table(323) := 'fname Texto344}{\*\ffdeftext NMBRE_CLNTE}{\*\ffstattext <?ref:xdo0004?>}}}}}{\fldrslt {\rtlch\fcs1 \';
    wwv_flow_api.g_varchar2_table(324) := 'af38\afs18 \ltrch\fcs0 \b\f31502\fs18\lang1024\langfe1024\noproof\insrsid7612416\charrsid7612416 '||wwv_flow.LF||
'NM';
    wwv_flow_api.g_varchar2_table(325) := 'BRE_CLNTE}}}\sectd \ltrsect\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360';
    wwv_flow_api.g_varchar2_table(326) := '\sectdefaultcl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid217';
    wwv_flow_api.g_varchar2_table(327) := '7339 {\*\bkmkend Texto344}\cell }\pard \ltrpar'||wwv_flow.LF||
'\ql \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha\asp';
    wwv_flow_api.g_varchar2_table(328) := 'num\faauto\adjustright\rin0\lin0\pararsid220485\yts17 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502';
    wwv_flow_api.g_varchar2_table(329) := '\fs18\insrsid2177339 \cell }\pard\plain \ltrpar\ql \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\wra';
    wwv_flow_api.g_varchar2_table(330) := 'pdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \';
    wwv_flow_api.g_varchar2_table(331) := 'f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \';
    wwv_flow_api.g_varchar2_table(332) := 'b\f31502\fs18\insrsid2177339 '||wwv_flow.LF||
'\trowd \irow1\irowband1\ltrrow\ts17\trqc\trgaph70\trleft-426\trftsWidt';
    wwv_flow_api.g_varchar2_table(333) := 'h1\trftsWidthB3\trautofit1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid6905';
    wwv_flow_api.g_varchar2_table(334) := '327\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind-318\tblindtype3 \clvmrg\clvertalt'||wwv_flow.LF||
'\clbrdrt\brdrt';
    wwv_flow_api.g_varchar2_table(335) := 'bl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1942\clshdrawnil';
    wwv_flow_api.g_varchar2_table(336) := ' \cellx1516\clvertalb\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\c';
    wwv_flow_api.g_varchar2_table(337) := 'lftsWidth3\clwWidth5244\clshdrawnil '||wwv_flow.LF||
'\cellx6760\clvmrg\clvertalt\clbrdrt\brdrtbl \clbrdrl\brdrtbl \c';
    wwv_flow_api.g_varchar2_table(338) := 'lbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2110\clshdrawnil \cellx8870\row \ltrro';
    wwv_flow_api.g_varchar2_table(339) := 'w}\trowd \irow2\irowband2\ltrrow'||wwv_flow.LF||
'\ts17\trqc\trgaph70\trrh127\trleft-426\trftsWidth1\trftsWidthB3\tra';
    wwv_flow_api.g_varchar2_table(340) := 'utofit1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid11931011\tbllkhdrrows\t';
    wwv_flow_api.g_varchar2_table(341) := 'bllkhdrcols\tbllknocolband\tblind-318\tblindtype3 \clvmrg\clvertalt\clbrdrt\brdrtbl '||wwv_flow.LF||
'\clbrdrl\brdrtb';
    wwv_flow_api.g_varchar2_table(342) := 'l \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1942\clshdrawnil \cellx1516\clvert';
    wwv_flow_api.g_varchar2_table(343) := 'alb\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidt';
    wwv_flow_api.g_varchar2_table(344) := 'h5244\clshdrawnil \cellx6760'||wwv_flow.LF||
'\clvmrg\clvertalt\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \cl';
    wwv_flow_api.g_varchar2_table(345) := 'brdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2110\clshdrawnil \cellx8870\pard\plain \ltrpar'||wwv_flow.LF||
'\ql \li0\';
    wwv_flow_api.g_varchar2_table(346) := 'ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid220485\yts17 \r';
    wwv_flow_api.g_varchar2_table(347) := 'tlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfen';
    wwv_flow_api.g_varchar2_table(348) := 'p1033 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 '||wwv_flow.LF||
'\b\f31502\fs18\insrsid2177339 \cell }\pard \ltrpar\qc \l';
    wwv_flow_api.g_varchar2_table(349) := 'i0\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid11931011\yts';
    wwv_flow_api.g_varchar2_table(350) := '17 {\*\bkmkstart Texto345}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 '||wwv_flow.LF||
'\b\f3150';
    wwv_flow_api.g_varchar2_table(351) := '2\fs18\insrsid7612416\charrsid7612416  FORMTEXT }{\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18';
    wwv_flow_api.g_varchar2_table(352) := '\insrsid7612416\charrsid7612416 {\*\datafield 800100000000000008546578746f3334350005534c47414e000000';
    wwv_flow_api.g_varchar2_table(353) := '00000f3c3f7265663a78646f303030353f3e0000000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt';
    wwv_flow_api.g_varchar2_table(354) := '0{\*\ffname Texto345}{\*\ffdeftext SLGAN}{\*\ffstattext <?ref:xdo0005?>}}}}}{\fldrslt {\rtlch\fcs1 \';
    wwv_flow_api.g_varchar2_table(355) := 'af38\afs18 \ltrch\fcs0 \b\f31502\fs18\lang1024\langfe1024\noproof\insrsid7612416\charrsid7612416 SLG';
    wwv_flow_api.g_varchar2_table(356) := 'AN}'||wwv_flow.LF||
'}}\sectd \ltrsect\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectd';
    wwv_flow_api.g_varchar2_table(357) := 'efaultcl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid2177339 {';
    wwv_flow_api.g_varchar2_table(358) := '\*\bkmkend Texto345}\cell }\pard \ltrpar'||wwv_flow.LF||
'\ql \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\fa';
    wwv_flow_api.g_varchar2_table(359) := 'auto\adjustright\rin0\lin0\pararsid220485\yts17 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\';
    wwv_flow_api.g_varchar2_table(360) := 'insrsid2177339 \cell }\pard\plain \ltrpar\ql \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\wrapdefau';
    wwv_flow_api.g_varchar2_table(361) := 'lt\aspalpha\aspnum\faauto\adjustright\rin0\lin0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506';
    wwv_flow_api.g_varchar2_table(362) := '\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f315';
    wwv_flow_api.g_varchar2_table(363) := '02\fs18\insrsid2177339 '||wwv_flow.LF||
'\trowd \irow2\irowband2\ltrrow\ts17\trqc\trgaph70\trrh127\trleft-426\trftsWi';
    wwv_flow_api.g_varchar2_table(364) := 'dth1\trftsWidthB3\trautofit1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid11';
    wwv_flow_api.g_varchar2_table(365) := '931011\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind-318\tblindtype3 '||wwv_flow.LF||
'\clvmrg\clvertalt\clbrdrt\br';
    wwv_flow_api.g_varchar2_table(366) := 'drtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1942\clshdraw';
    wwv_flow_api.g_varchar2_table(367) := 'nil \cellx1516\clvertalb\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl '||wwv_flow.LF||
'\cltxlr';
    wwv_flow_api.g_varchar2_table(368) := 'tb\clftsWidth3\clwWidth5244\clshdrawnil \cellx6760\clvmrg\clvertalt\clbrdrt\brdrtbl \clbrdrl\brdrtbl';
    wwv_flow_api.g_varchar2_table(369) := ' \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2110\clshdrawnil \cellx8870\row \lt';
    wwv_flow_api.g_varchar2_table(370) := 'rrow}\trowd \irow3\irowband3\lastrow \ltrrow'||wwv_flow.LF||
'\ts17\trqc\trgaph70\trrh80\trleft-426\trftsWidth1\trfts';
    wwv_flow_api.g_varchar2_table(371) := 'WidthB3\trautofit1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid4457483\tbll';
    wwv_flow_api.g_varchar2_table(372) := 'khdrrows\tbllkhdrcols\tbllknocolband\tblind-318\tblindtype3 \clvertalc\clbrdrt\brdrtbl \clbrdrl'||wwv_flow.LF||
'\brd';
    wwv_flow_api.g_varchar2_table(373) := 'rtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1942\clshdrawnil \cellx1516\clv';
    wwv_flow_api.g_varchar2_table(374) := 'ertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwW';
    wwv_flow_api.g_varchar2_table(375) := 'idth5244\clshdrawnil \cellx6760\clvertalc\clbrdrt'||wwv_flow.LF||
'\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdr';
    wwv_flow_api.g_varchar2_table(376) := 'r\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2110\clshdrawnil \cellx8870\pard\plain \ltrpar\qc \li0\ri0\w';
    wwv_flow_api.g_varchar2_table(377) := 'idctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid4457483\yts17 '||wwv_flow.LF||
'\rtlc';
    wwv_flow_api.g_varchar2_table(378) := 'h\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp10';
    wwv_flow_api.g_varchar2_table(379) := '33 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid8993502 \cell {\*\bkmkstart Texto346}}';
    wwv_flow_api.g_varchar2_table(380) := '{\field\flddirty{\*\fldinst {\rtlch\fcs1 '||wwv_flow.LF||
'\af38\afs20 \ltrch\fcs0 \b\f31502\fs20\insrsid7612416\char';
    wwv_flow_api.g_varchar2_table(381) := 'rsid2963470  FORMTEXT }{\rtlch\fcs1 \af38\afs20 \ltrch\fcs0 \b\f31502\fs20\insrsid7612416\charrsid29';
    wwv_flow_api.g_varchar2_table(382) := '63470 {\*\datafield '||wwv_flow.LF||
'800100000000000008546578746f333436000e4e6f6d627265496d70756573746f00000000000f3';
    wwv_flow_api.g_varchar2_table(383) := 'c3f7265663a78646f303030363f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffn';
    wwv_flow_api.g_varchar2_table(384) := 'ame Texto346}{\*\ffdeftext NombreImpuesto}{\*\ffstattext <?ref:xdo0006?>}}}}'||wwv_flow.LF||
'}{\fldrslt {\rtlch\fcs1';
    wwv_flow_api.g_varchar2_table(385) := ' \af38\afs20 \ltrch\fcs0 \b\f31502\fs20\lang1024\langfe1024\noproof\insrsid7612416\charrsid2963470 N';
    wwv_flow_api.g_varchar2_table(386) := 'ombreImpuesto}}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegr';
    wwv_flow_api.g_varchar2_table(387) := 'id360\sectdefaultcl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af38\afs20 \ltrch\fcs0 \b\f31502\fs20\insrs';
    wwv_flow_api.g_varchar2_table(388) := 'id8993502\charrsid2963470 {\*\bkmkend Texto346}\cell }{\rtlch\fcs1 \af38\afs18 '||wwv_flow.LF||
'\ltrch\fcs0 \b\f3150';
    wwv_flow_api.g_varchar2_table(389) := '2\fs18\insrsid8993502 \cell }\pard\plain \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\intbl\wra';
    wwv_flow_api.g_varchar2_table(390) := 'pdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'';
    wwv_flow_api.g_varchar2_table(391) := '\f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 ';
    wwv_flow_api.g_varchar2_table(392) := '\b\f31502\fs18\insrsid8993502 \trowd \irow3\irowband3\lastrow \ltrrow'||wwv_flow.LF||
'\ts17\trqc\trgaph70\trrh80\trl';
    wwv_flow_api.g_varchar2_table(393) := 'eft-426\trftsWidth1\trftsWidthB3\trautofit1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpa';
    wwv_flow_api.g_varchar2_table(394) := 'ddfr3\tblrsid4457483\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind-318\tblindtype3 \clvertalc\clbr';
    wwv_flow_api.g_varchar2_table(395) := 'drt\brdrtbl \clbrdrl'||wwv_flow.LF||
'\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1942\c';
    wwv_flow_api.g_varchar2_table(396) := 'lshdrawnil \cellx1516\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \';
    wwv_flow_api.g_varchar2_table(397) := 'cltxlrtb\clftsWidth3\clwWidth5244\clshdrawnil \cellx6760\clvertalc\clbrdrt'||wwv_flow.LF||
'\brdrtbl \clbrdrl\brdrtbl';
    wwv_flow_api.g_varchar2_table(398) := ' \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2110\clshdrawnil \cellx8870\row }\p';
    wwv_flow_api.g_varchar2_table(399) := 'ard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar'||wwv_flow.LF||
'\tx4590\wrapdefault\aspalpha\aspnum\faauto\adj';
    wwv_flow_api.g_varchar2_table(400) := 'ustright\rin0\lin0\itap0\pararsid12661063 {\rtlch\fcs1 \af38\afs2 \ltrch\fcs0 \b\f31502\fs2\insrsid2';
    wwv_flow_api.g_varchar2_table(401) := '177339\charrsid12661063 '||wwv_flow.LF||
'\par \ltrrow}\trowd \irow0\irowband0\lastrow \ltrrow\ts17\trgaph70\trleft-1';
    wwv_flow_api.g_varchar2_table(402) := '08\tpvpara\tphmrg\tposxc\tposy128\tdfrmtxtLeft141\tdfrmtxtRight141\trftsWidth3\trwWidth10314\trftsWi';
    wwv_flow_api.g_varchar2_table(403) := 'dthB3\trautofit1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3'||wwv_flow.LF||
'\tblrsid4865145\tbllk';
    wwv_flow_api.g_varchar2_table(404) := 'hdrrows\tbllkhdrcols\tbllknocolband\tblind0\tblindtype3 \clvertalb\clbrdrt\brdrtbl \clbrdrl\brdrtbl ';
    wwv_flow_api.g_varchar2_table(405) := '\clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth10314\clshdrawnil \cellx10206\pard\p';
    wwv_flow_api.g_varchar2_table(406) := 'lain \ltrpar'||wwv_flow.LF||
'\qc \li0\ri0\widctlpar\intbl\pvpara\phmrg\posxc\posy128\dxfrtext141\dfrmtxtx141\dfrmtxt';
    wwv_flow_api.g_varchar2_table(407) := 'y0\wraparound\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid7617339\yts17 \rtlch\fcs1 \af0\af';
    wwv_flow_api.g_varchar2_table(408) := 's22\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fc';
    wwv_flow_api.g_varchar2_table(409) := 's1 \af0\afs18 \ltrch\fcs0 \b\fs18\insrsid5725979      }{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0 \b\fs18\i';
    wwv_flow_api.g_varchar2_table(410) := 'nsrsid2177339\charrsid2363257 RECAUDOS }{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0 '||wwv_flow.LF||
'\b\fs18\insrsid7617339 ';
    wwv_flow_api.g_varchar2_table(411) := 'DETALLADOS VIGENCIA ACTUAL Y ANTERIORES }{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0 \b\fs18\insrsid2177339\';
    wwv_flow_api.g_varchar2_table(412) := 'charrsid2363257 ENTRE UN RANGO DE FECHAS}{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0 \b\fs18\insrsid7617339 ';
    wwv_flow_api.g_varchar2_table(413) := ' POR IMPUESTO}{\rtlch\fcs1 '||wwv_flow.LF||
'\af0\afs18 \ltrch\fcs0 \b\fs18\insrsid2177339\charrsid2363257 \cell }\pa';
    wwv_flow_api.g_varchar2_table(414) := 'rd\plain \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\';
    wwv_flow_api.g_varchar2_table(415) := 'adjustright\rin0\lin0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\f31506\fs22\lang9226\langfe1033';
    wwv_flow_api.g_varchar2_table(416) := '\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2177339 \trowd \irow0\irowband0';
    wwv_flow_api.g_varchar2_table(417) := '\lastrow \ltrrow'||wwv_flow.LF||
'\ts17\trgaph70\trleft-108\tpvpara\tphmrg\tposxc\tposy128\tdfrmtxtLeft141\tdfrmtxtRi';
    wwv_flow_api.g_varchar2_table(418) := 'ght141\trftsWidth3\trwWidth10314\trftsWidthB3\trautofit1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\t';
    wwv_flow_api.g_varchar2_table(419) := 'rpaddfb3\trpaddfr3'||wwv_flow.LF||
'\tblrsid4865145\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind0\tblindtype3 \clv';
    wwv_flow_api.g_varchar2_table(420) := 'ertalb\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwW';
    wwv_flow_api.g_varchar2_table(421) := 'idth10314\clshdrawnil \cellx10206\row }\pard \ltrpar'||wwv_flow.LF||
'\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\wrap';
    wwv_flow_api.g_varchar2_table(422) := 'default\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsid220485 {\rtlch\fcs1 \af38\afs4 \l';
    wwv_flow_api.g_varchar2_table(423) := 'trch\fcs0 \b\f31502\fs4\insrsid2177339 '||wwv_flow.LF||
'\par }{\rtlch\fcs1 \af38\afs4 \ltrch\fcs0 \b\f31502\fs4\insr';
    wwv_flow_api.g_varchar2_table(424) := 'sid2048125 '||wwv_flow.LF||
'\par }{\rtlch\fcs1 \af38\afs4 \ltrch\fcs0 \b\f31502\fs4\insrsid2048125\charrsid4865145 '||wwv_flow.LF||
'';
    wwv_flow_api.g_varchar2_table(425) := '\par \ltrrow}\trowd \irow0\irowband0\lastrow \ltrrow\ts17\trgaph70\trrh272\trleft1437\tpvpara\tposy0';
    wwv_flow_api.g_varchar2_table(426) := '\tdfrmtxtLeft141\tdfrmtxtRight141\trftsWidth1\trftsWidthB3\trautofit1\trpaddl108\trpaddr108\trpaddfl';
    wwv_flow_api.g_varchar2_table(427) := '3\trpaddft3\trpaddfb3\trpaddfr3\tabsnoovrlp1\tblrsid2048125'||wwv_flow.LF||
'\tbllkhdrrows\tbllkhdrcols\tbllknocolban';
    wwv_flow_api.g_varchar2_table(428) := 'd\tblind1545\tblindtype3 \clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrt';
    wwv_flow_api.g_varchar2_table(429) := 'bl \cltxlrtb\clftsWidth3\clwWidth3355\clshdrawnil \cellx4792\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdr';
    wwv_flow_api.g_varchar2_table(430) := 'tbl \clbrdrb'||wwv_flow.LF||
'\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2849\clshdrawnil \cellx7641\clv';
    wwv_flow_api.g_varchar2_table(431) := 'ertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwW';
    wwv_flow_api.g_varchar2_table(432) := 'idth1661\clshdrawnil \cellx9302\clvertalc\clbrdrt\brdrtbl \clbrdrl'||wwv_flow.LF||
'\brdrtbl \clbrdrb\brdrtbl \clbrdr';
    wwv_flow_api.g_varchar2_table(433) := 'r\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2864\clshdrawnil \cellx12166\pard\plain \ltrpar'||wwv_flow.LF||
'\qr \li0\ri0';
    wwv_flow_api.g_varchar2_table(434) := '\widctlpar\intbl\pvpara\posy0\dxfrtext141\dfrmtxtx141\dfrmtxty0\wraparound\aspalpha\aspnum\faauto\ad';
    wwv_flow_api.g_varchar2_table(435) := 'justright\rin0\lin0\absnoovrlp1\pararsid8529128\yts17 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'';
    wwv_flow_api.g_varchar2_table(436) := '\f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af38\afs2 \ltrch\fcs0 \';
    wwv_flow_api.g_varchar2_table(437) := 'b\f31502\fs2\insrsid12721209 \tab }{\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid946973';
    wwv_flow_api.g_varchar2_table(438) := '9\charrsid9469739 Fecha Desde}{\rtlch\fcs1 \af38\afs16 '||wwv_flow.LF||
'\ltrch\fcs0 \b\f31502\fs16\insrsid9469739 :}';
    wwv_flow_api.g_varchar2_table(439) := '{\rtlch\fcs1 \af38\afs16 \ltrch\fcs0 \b\f31502\fs16\insrsid9469739\charrsid9469739 \cell }\pard \ltr';
    wwv_flow_api.g_varchar2_table(440) := 'par'||wwv_flow.LF||
'\ql \li0\ri0\widctlpar\intbl\pvpara\posy0\dxfrtext141\dfrmtxtx141\dfrmtxty0\wraparound\aspalpha\';
    wwv_flow_api.g_varchar2_table(441) := 'aspnum\faauto\adjustright\rin0\lin0\absnoovrlp1\pararsid8529128\yts17 {\*\bkmkstart Texto268}{\field';
    wwv_flow_api.g_varchar2_table(442) := '\flddirty{\*\fldinst {\rtlch\fcs1 \af38\afs16 \ltrch\fcs0 '||wwv_flow.LF||
'\b\f31502\fs16\insrsid7748740\charrsid774';
    wwv_flow_api.g_varchar2_table(443) := '8740  FORMTEXT }{\rtlch\fcs1 \af38\afs16 \ltrch\fcs0 \b\f31502\fs16\insrsid7748740\charrsid7748740 {';
    wwv_flow_api.g_varchar2_table(444) := '\*\datafield '||wwv_flow.LF||
'800100000000000008546578746f323638000b46454348415f444553444500000000000f3c3f7265663a78';
    wwv_flow_api.g_varchar2_table(445) := '646f303032323f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto268}';
    wwv_flow_api.g_varchar2_table(446) := '{\*\ffdeftext FECHA_DESDE}{\*\ffstattext <?ref:xdo0022?>}}}}'||wwv_flow.LF||
'}{\fldrslt {\rtlch\fcs1 \af38\afs16 \lt';
    wwv_flow_api.g_varchar2_table(447) := 'rch\fcs0 \b\f31502\fs16\lang1024\langfe1024\noproof\insrsid7748740\charrsid7748740 FECHA_DESDE}}}\se';
    wwv_flow_api.g_varchar2_table(448) := 'ctd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl';
    wwv_flow_api.g_varchar2_table(449) := '\sectrsid8529128\sftnbj {\rtlch\fcs1 \af38\afs16 \ltrch\fcs0 \b\f31502\fs16\insrsid9469739\charrsid8';
    wwv_flow_api.g_varchar2_table(450) := '76571 {\*\bkmkend Texto268}\cell }\pard \ltrpar'||wwv_flow.LF||
'\qr \li0\ri0\widctlpar\intbl\pvpara\posy0\dxfrtext14';
    wwv_flow_api.g_varchar2_table(451) := '1\dfrmtxtx141\dfrmtxty0\wraparound\aspalpha\aspnum\faauto\adjustright\rin0\lin0\absnoovrlp1\pararsid';
    wwv_flow_api.g_varchar2_table(452) := '8529128\yts17 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid9469739\charrsid9469739 '||wwv_flow.LF||
'Fe';
    wwv_flow_api.g_varchar2_table(453) := 'cha Hasta}{\rtlch\fcs1 \af38\afs16 \ltrch\fcs0 \b\f31502\fs16\insrsid9469739 : }{\rtlch\fcs1 \af38\a';
    wwv_flow_api.g_varchar2_table(454) := 'fs16 \ltrch\fcs0 \b\f31502\fs16\insrsid9469739\charrsid9469739 \cell }\pard \ltrpar'||wwv_flow.LF||
'\ql \li0\ri0\wid';
    wwv_flow_api.g_varchar2_table(455) := 'ctlpar\intbl\pvpara\posy0\dxfrtext141\dfrmtxtx141\dfrmtxty0\wraparound\aspalpha\aspnum\faauto\adjust';
    wwv_flow_api.g_varchar2_table(456) := 'right\rin0\lin0\absnoovrlp1\pararsid8529128\yts17 {\*\bkmkstart Texto269}{\field\flddirty{\*\fldinst';
    wwv_flow_api.g_varchar2_table(457) := ' {\rtlch\fcs1 \af38\afs16 \ltrch\fcs0 '||wwv_flow.LF||
'\b\f31502\fs16\insrsid7748740\charrsid7748740  FORMTEXT }{\rt';
    wwv_flow_api.g_varchar2_table(458) := 'lch\fcs1 \af38\afs16 \ltrch\fcs0 \b\f31502\fs16\insrsid7748740\charrsid7748740 {\*\datafield '||wwv_flow.LF||
'800100';
    wwv_flow_api.g_varchar2_table(459) := '000000000008546578746f323639000b46454348415f484153544100000000000f3c3f7265663a78646f303032333f3e0000';
    wwv_flow_api.g_varchar2_table(460) := '000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto269}{\*\ffdeftext FECHA_';
    wwv_flow_api.g_varchar2_table(461) := 'HASTA}{\*\ffstattext <?ref:xdo0023?>}}}}'||wwv_flow.LF||
'}{\fldrslt {\rtlch\fcs1 \af38\afs16 \ltrch\fcs0 \b\f31502\f';
    wwv_flow_api.g_varchar2_table(462) := 's16\lang1024\langfe1024\noproof\insrsid7748740\charrsid7748740 FECHA_HASTA}}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscp';
    wwv_flow_api.g_varchar2_table(463) := 'sxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sft';
    wwv_flow_api.g_varchar2_table(464) := 'nbj {\rtlch\fcs1 \af38\afs16 \ltrch\fcs0 \b\f31502\fs16\insrsid9469739\charrsid876571 {\*\bkmkend Te';
    wwv_flow_api.g_varchar2_table(465) := 'xto269}\cell }\pard\plain \ltrpar'||wwv_flow.LF||
'\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\intbl\wrapdefault\aspal';
    wwv_flow_api.g_varchar2_table(466) := 'pha\aspnum\faauto\adjustright\rin0\lin0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\la';
    wwv_flow_api.g_varchar2_table(467) := 'ng9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 '||wwv_flow.LF||
'\b\f31502\fs18';
    wwv_flow_api.g_varchar2_table(468) := '\insrsid8529128 \trowd \irow0\irowband0\lastrow \ltrrow'||wwv_flow.LF||
'\ts17\trgaph70\trrh272\trleft1437\tpvpara\tp';
    wwv_flow_api.g_varchar2_table(469) := 'osy0\tdfrmtxtLeft141\tdfrmtxtRight141\trftsWidth1\trftsWidthB3\trautofit1\trpaddl108\trpaddr108\trpa';
    wwv_flow_api.g_varchar2_table(470) := 'ddfl3\trpaddft3\trpaddfb3\trpaddfr3\tabsnoovrlp1\tblrsid2048125'||wwv_flow.LF||
'\tbllkhdrrows\tbllkhdrcols\tbllknoco';
    wwv_flow_api.g_varchar2_table(471) := 'lband\tblind1545\tblindtype3 \clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\b';
    wwv_flow_api.g_varchar2_table(472) := 'rdrtbl \cltxlrtb\clftsWidth3\clwWidth3355\clshdrawnil \cellx4792\clvertalc\clbrdrt\brdrtbl \clbrdrl\';
    wwv_flow_api.g_varchar2_table(473) := 'brdrtbl \clbrdrb'||wwv_flow.LF||
'\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2849\clshdrawnil \cellx7641';
    wwv_flow_api.g_varchar2_table(474) := '\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\';
    wwv_flow_api.g_varchar2_table(475) := 'clwWidth1661\clshdrawnil \cellx9302\clvertalc\clbrdrt\brdrtbl \clbrdrl'||wwv_flow.LF||
'\brdrtbl \clbrdrb\brdrtbl \cl';
    wwv_flow_api.g_varchar2_table(476) := 'brdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2864\clshdrawnil \cellx12166\row }\pard \ltrpar\ql \li0\';
    wwv_flow_api.g_varchar2_table(477) := 'ri0\sa160\sl259\slmult1\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\par';
    wwv_flow_api.g_varchar2_table(478) := 'arsid6379667 {\rtlch\fcs1 '||wwv_flow.LF||
'\af0 \ltrch\fcs0 \insrsid8529128 {\*\bkmkstart Texto187}'||wwv_flow.LF||
'\par \ltrrow}\tr';
    wwv_flow_api.g_varchar2_table(479) := 'owd \irow0\irowband0\ltrrow\ts11\trgaph70\trrh152\trleft-70\trhdr\trbrdrt\brdrs\brdrw10 \trbrdrl\brd';
    wwv_flow_api.g_varchar2_table(480) := 'rs\brdrw10 \trbrdrb\brdrs\brdrw10 \trbrdrr\brdrs\brdrw10 \trbrdrh\brdrs\brdrw10 \trbrdrv\brdrs\brdrw';
    wwv_flow_api.g_varchar2_table(481) := '10 '||wwv_flow.LF||
'\tpvpara\tphpg\tposx3620\tposy268\tdfrmtxtLeft141\tdfrmtxtRight141\trftsWidth1\trftsWidthB3\trpa';
    wwv_flow_api.g_varchar2_table(482) := 'ddl70\trpaddr70\trpaddfl3\trpaddfr3\tblrsid2048125\tbllkhdrrows\tblind0\tblindtype3 \clvertalt\clbrd';
    wwv_flow_api.g_varchar2_table(483) := 'rt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrnone '||wwv_flow.LF||
'\clbrdrr\brdrs\brdrw10 \clcbpat20\cltxlrt';
    wwv_flow_api.g_varchar2_table(484) := 'b\clftsWidth3\clwWidth1296\clcbpatraw20 \cellx1226\clvertalt\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\br';
    wwv_flow_api.g_varchar2_table(485) := 'drw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat20\cltxlrtb\clftsWidth3\clwWidth3287\clc';
    wwv_flow_api.g_varchar2_table(486) := 'bpatraw20 '||wwv_flow.LF||
'\cellx4513\pard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\intbl\pvpara\phpg\posx3';
    wwv_flow_api.g_varchar2_table(487) := '620\posy268\dxfrtext141\dfrmtxtx141\dfrmtxty0\wraparound\aspalpha\aspnum\faauto\adjustright\rin0\lin';
    wwv_flow_api.g_varchar2_table(488) := '0\pararsid2048125 {\*\bkmkstart Texto356}'||wwv_flow.LF||
'{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 ';
    wwv_flow_api.g_varchar2_table(489) := '\insrsid2048125\charrsid8521287  FORMTEXT }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid852';
    wwv_flow_api.g_varchar2_table(490) := '1287 {\*\datafield '||wwv_flow.LF||
'800100000000000008546578746f3335360002432000000000000f3c3f7265663a78646f30303134';
    wwv_flow_api.g_varchar2_table(491) := '3f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto356}{\*\ffdeftex';
    wwv_flow_api.g_varchar2_table(492) := 't C }{\*\ffstattext <?ref:xdo0014?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 '||wwv_flow.LF||
'\ltrch\fcs0 \lang1024\langfe102';
    wwv_flow_api.g_varchar2_table(493) := '4\noproof\insrsid2048125\charrsid8521287 C }}}\sectd \ltrsect\lndscpsxn\linex0\headery708\footery708';
    wwv_flow_api.g_varchar2_table(494) := '\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\*\bkmkstart Texto357}{\*\b';
    wwv_flow_api.g_varchar2_table(495) := 'kmkend Texto356}'||wwv_flow.LF||
'{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8';
    wwv_flow_api.g_varchar2_table(496) := '521287  FORMTEXT }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287 {\*\datafield '||wwv_flow.LF||
'80010';
    wwv_flow_api.g_varchar2_table(497) := '0000000000008546578746f3335370002482000000000000f3c3f7265663a78646f303031353f3e0000000000}{\*\formfi';
    wwv_flow_api.g_varchar2_table(498) := 'eld{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto357}{\*\ffdeftext H }{\*\ffstattext <?ref';
    wwv_flow_api.g_varchar2_table(499) := ':xdo0015?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 '||wwv_flow.LF||
'\ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid2048125\';
    wwv_flow_api.g_varchar2_table(500) := 'charrsid8521287 H }}}\sectd \ltrsect\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectli';
end;
/
begin
    wwv_flow_api.g_varchar2_table(501) := 'negrid360\sectdefaultcl\sectrsid8529128\sftnbj {\*\bkmkstart Texto358}{\*\bkmkend Texto357}'||wwv_flow.LF||
'{\field\';
    wwv_flow_api.g_varchar2_table(502) := 'flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287  FORMTEXT }{\rtlch';
    wwv_flow_api.g_varchar2_table(503) := '\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287 {\*\datafield '||wwv_flow.LF||
'800100000000000008546578746f33';
    wwv_flow_api.g_varchar2_table(504) := '3538000341434300000000000f3c3f7265663a78646f303031363f3e0000000000}{\*\formfield{\fftype0\ffownhelp\';
    wwv_flow_api.g_varchar2_table(505) := 'ffownstat\fftypetxt0{\*\ffname Texto358}{\*\ffdeftext ACC}{\*\ffstattext <?ref:xdo0016?>}}}}}{\fldrs';
    wwv_flow_api.g_varchar2_table(506) := 'lt {\rtlch\fcs1 \af0 '||wwv_flow.LF||
'\ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid2048125\charrsid8521287 ACC}}}';
    wwv_flow_api.g_varchar2_table(507) := '\sectd \ltrsect\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefault';
    wwv_flow_api.g_varchar2_table(508) := 'cl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af0 \ltrch\fcs0 '||wwv_flow.LF||
'\insrsid2048125\charrsid8521287 {\*\bkmkend';
    wwv_flow_api.g_varchar2_table(509) := ' Texto358}\cell }\pard \ltrpar\qc \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\pvpara\phpg\posx3620';
    wwv_flow_api.g_varchar2_table(510) := '\posy268\dxfrtext141\dfrmtxtx141\dfrmtxty0\wraparound\aspalpha\aspnum\faauto\adjustright\rin0\lin0\p';
    wwv_flow_api.g_varchar2_table(511) := 'ararsid2048125 {\*\bkmkstart Texto348}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 '||wwv_flow.LF||
'\in';
    wwv_flow_api.g_varchar2_table(512) := 'srsid2048125\charrsid8521287  FORMTEXT }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid852128';
    wwv_flow_api.g_varchar2_table(513) := '7 {\*\datafield 800100000000000008546578746f3334380002472000000000000f3c3f7265663a78646f303030313f3e';
    wwv_flow_api.g_varchar2_table(514) := '0000000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto348}{\*\ffdeftext G';
    wwv_flow_api.g_varchar2_table(515) := ' }{\*\ffstattext <?ref:xdo0001?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1024\no';
    wwv_flow_api.g_varchar2_table(516) := 'proof\insrsid2048125\charrsid8521287 G }}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\footery708\co';
    wwv_flow_api.g_varchar2_table(517) := 'lsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\*\bkmkstart Texto349}{\*\bkmk';
    wwv_flow_api.g_varchar2_table(518) := 'end Texto348}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid85212';
    wwv_flow_api.g_varchar2_table(519) := '87  FORMTEXT '||wwv_flow.LF||
'}{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287 {\*\datafield 800100000';
    wwv_flow_api.g_varchar2_table(520) := '000000008546578746f3334390008564947454e43494100000000000f3c3f7265663a78646f303030373f3e0000000000}{\';
    wwv_flow_api.g_varchar2_table(521) := '*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname '||wwv_flow.LF||
'Texto349}{\*\ffdeftext VIGENCIA}{\*\f';
    wwv_flow_api.g_varchar2_table(522) := 'fstattext <?ref:xdo0007?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1024\noproof\i';
    wwv_flow_api.g_varchar2_table(523) := 'nsrsid2048125\charrsid8521287 VIGENCIA}}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\footery708\col';
    wwv_flow_api.g_varchar2_table(524) := 'sx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\*\bkmkstart Texto350}{\*\bkmke';
    wwv_flow_api.g_varchar2_table(525) := 'nd Texto349}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid852128';
    wwv_flow_api.g_varchar2_table(526) := '7  FORMTEXT '||wwv_flow.LF||
'}{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287 {\*\datafield 8001000000';
    wwv_flow_api.g_varchar2_table(527) := '00000008546578746f3335300002452000000000000f3c3f7265663a78646f303030383f3e0000000000}{\*\formfield{\';
    wwv_flow_api.g_varchar2_table(528) := 'fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto350}'||wwv_flow.LF||
'{\*\ffdeftext E }{\*\ffstattext <?ref:xdo';
    wwv_flow_api.g_varchar2_table(529) := '0008?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid2048125\charr';
    wwv_flow_api.g_varchar2_table(530) := 'sid8521287 E }}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegr';
    wwv_flow_api.g_varchar2_table(531) := 'id360\sectdefaultcl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid852';
    wwv_flow_api.g_varchar2_table(532) := '1287 {\*\bkmkend Texto350}\cell }\pard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\wrap';
    wwv_flow_api.g_varchar2_table(533) := 'default\aspalpha\aspnum\faauto\adjustright\rin0\lin0 {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\c';
    wwv_flow_api.g_varchar2_table(534) := 'harrsid8521287 \trowd \irow0\irowband0\ltrrow\ts11\trgaph70\trrh152\trleft-70\trhdr\trbrdrt\brdrs\br';
    wwv_flow_api.g_varchar2_table(535) := 'drw10 \trbrdrl\brdrs\brdrw10 '||wwv_flow.LF||
'\trbrdrb\brdrs\brdrw10 \trbrdrr\brdrs\brdrw10 \trbrdrh\brdrs\brdrw10 \';
    wwv_flow_api.g_varchar2_table(536) := 'trbrdrv\brdrs\brdrw10 '||wwv_flow.LF||
'\tpvpara\tphpg\tposx3620\tposy268\tdfrmtxtLeft141\tdfrmtxtRight141\trftsWidth';
    wwv_flow_api.g_varchar2_table(537) := '1\trftsWidthB3\trpaddl70\trpaddr70\trpaddfl3\trpaddfr3\tblrsid2048125\tbllkhdrrows\tblind0\tblindtyp';
    wwv_flow_api.g_varchar2_table(538) := 'e3 \clvertalt\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrnone '||wwv_flow.LF||
'\clbrdrr\brdrs\brdrw10';
    wwv_flow_api.g_varchar2_table(539) := ' \clcbpat20\cltxlrtb\clftsWidth3\clwWidth1296\clcbpatraw20 \cellx1226\clvertalt\clbrdrt\brdrs\brdrw1';
    wwv_flow_api.g_varchar2_table(540) := '0 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat20\cltxlrtb\clftsWidt';
    wwv_flow_api.g_varchar2_table(541) := 'h3\clwWidth3287\clcbpatraw20 '||wwv_flow.LF||
'\cellx4513\row \ltrrow}\trowd \irow1\irowband1\ltrrow\ts11\trgaph70\tr';
    wwv_flow_api.g_varchar2_table(542) := 'rh347\trleft-70\trbrdrt\brdrs\brdrw10 \trbrdrl\brdrs\brdrw10 \trbrdrb\brdrs\brdrw10 \trbrdrr\brdrs\b';
    wwv_flow_api.g_varchar2_table(543) := 'rdrw10 \trbrdrh\brdrs\brdrw10 \trbrdrv\brdrs\brdrw10 '||wwv_flow.LF||
'\tpvpara\tphpg\tposx3620\tposy268\tdfrmtxtLeft';
    wwv_flow_api.g_varchar2_table(544) := '141\tdfrmtxtRight141\trftsWidth1\trftsWidthB3\trpaddl70\trpaddr70\trpaddfl3\trpaddfr3\tblrsid2048125';
    wwv_flow_api.g_varchar2_table(545) := '\tbllkhdrrows\tblind0\tblindtype3 \clvertalc\clbrdrt\brdrnone \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\';
    wwv_flow_api.g_varchar2_table(546) := 'brdrw10 '||wwv_flow.LF||
'\clbrdrr\brdrs\brdrw10 \clcbpat20\cltxlrtb\clftsWidth3\clwWidth1296\clcbpatraw20 \cellx1226';
    wwv_flow_api.g_varchar2_table(547) := '\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw1';
    wwv_flow_api.g_varchar2_table(548) := '0 \clcbpat20\cltxlrtb\clftsWidth3\clwWidth1926\clcbpatraw20 '||wwv_flow.LF||
'\cellx3152\clvertalc\clbrdrt\brdrs\brdr';
    wwv_flow_api.g_varchar2_table(549) := 'w10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat20\cltxlrtb\clftsWi';
    wwv_flow_api.g_varchar2_table(550) := 'dth3\clwWidth1361\clcbpatraw20 \cellx4513\pard \ltrpar\qc \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\in';
    wwv_flow_api.g_varchar2_table(551) := 'tbl\pvpara\phpg\posx3620\posy268\dxfrtext141\dfrmtxtx141\dfrmtxty0\wraparound\aspalpha\aspnum\faauto';
    wwv_flow_api.g_varchar2_table(552) := '\adjustright\rin0\lin0\pararsid2048125 {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287';
    wwv_flow_api.g_varchar2_table(553) := ' Mes\cell {\*\bkmkstart Texto351}}'||wwv_flow.LF||
'{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsi';
    wwv_flow_api.g_varchar2_table(554) := 'd2048125\charrsid8521287  FORMTEXT }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287 {\';
    wwv_flow_api.g_varchar2_table(555) := '*\datafield '||wwv_flow.LF||
'800100000000000008546578746f3335310002472000000000000f3c3f7265663a78646f303030393f3e000';
    wwv_flow_api.g_varchar2_table(556) := '0000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto351}{\*\ffdeftext G }{\';
    wwv_flow_api.g_varchar2_table(557) := '*\ffstattext <?ref:xdo0009?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 '||wwv_flow.LF||
'\ltrch\fcs0 \lang1024\langfe1024\nopro';
    wwv_flow_api.g_varchar2_table(558) := 'of\insrsid2048125\charrsid8521287 G }}}\sectd \ltrsect\lndscpsxn\linex0\headery708\footery708\colsx7';
    wwv_flow_api.g_varchar2_table(559) := '08\endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af0 \ltrch\fcs0 '||wwv_flow.LF||
'\ins';
    wwv_flow_api.g_varchar2_table(560) := 'rsid2048125\charrsid8521287 {\*\bkmkend Texto351}VALOR_RECAUDO\cell NUMEROS_PREDIOS{\*\bkmkstart Tex';
    wwv_flow_api.g_varchar2_table(561) := 'to352}}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287  FO';
    wwv_flow_api.g_varchar2_table(562) := 'RMTEXT }{\rtlch\fcs1 \af0 \ltrch\fcs0 '||wwv_flow.LF||
'\insrsid2048125\charrsid8521287 {\*\datafield 800100000000000';
    wwv_flow_api.g_varchar2_table(563) := '008546578746f3335320002452000000000000f3c3f7265663a78646f303031303f3e0000000000}{\*\formfield{\fftyp';
    wwv_flow_api.g_varchar2_table(564) := 'e0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto352}{\*\ffdeftext E }{\*\ffstattext '||wwv_flow.LF||
'<?ref:xdo0010?';
    wwv_flow_api.g_varchar2_table(565) := '>}}}}}{\fldrslt {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid2048125\charrsid85';
    wwv_flow_api.g_varchar2_table(566) := '21287 E }}}\sectd \ltrsect\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\';
    wwv_flow_api.g_varchar2_table(567) := 'sectdefaultcl\sectrsid8529128\sftnbj {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287 ';
    wwv_flow_api.g_varchar2_table(568) := '{\*\bkmkend Texto352}\cell }\pard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\intbl\wrapdefaul';
    wwv_flow_api.g_varchar2_table(569) := 't\aspalpha\aspnum\faauto\adjustright\rin0\lin0 {\rtlch\fcs1 \af0 \ltrch\fcs0 '||wwv_flow.LF||
'\insrsid2048125\charrs';
    wwv_flow_api.g_varchar2_table(570) := 'id8521287 \trowd \irow1\irowband1\ltrrow\ts11\trgaph70\trrh347\trleft-70\trbrdrt\brdrs\brdrw10 \trbr';
    wwv_flow_api.g_varchar2_table(571) := 'drl\brdrs\brdrw10 \trbrdrb\brdrs\brdrw10 \trbrdrr\brdrs\brdrw10 \trbrdrh\brdrs\brdrw10 \trbrdrv\brdr';
    wwv_flow_api.g_varchar2_table(572) := 's\brdrw10 '||wwv_flow.LF||
'\tpvpara\tphpg\tposx3620\tposy268\tdfrmtxtLeft141\tdfrmtxtRight141\trftsWidth1\trftsWidth';
    wwv_flow_api.g_varchar2_table(573) := 'B3\trpaddl70\trpaddr70\trpaddfl3\trpaddfr3\tblrsid2048125\tbllkhdrrows\tblind0\tblindtype3 \clvertal';
    wwv_flow_api.g_varchar2_table(574) := 'c\clbrdrt\brdrnone \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 '||wwv_flow.LF||
'\clbrdrr\brdrs\brdrw10 \clcbpat20\';
    wwv_flow_api.g_varchar2_table(575) := 'cltxlrtb\clftsWidth3\clwWidth1296\clcbpatraw20 \cellx1226\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\b';
    wwv_flow_api.g_varchar2_table(576) := 'rdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat20\cltxlrtb\clftsWidth3\clwWidth1';
    wwv_flow_api.g_varchar2_table(577) := '926\clcbpatraw20 '||wwv_flow.LF||
'\cellx3152\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\b';
    wwv_flow_api.g_varchar2_table(578) := 'rdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat20\cltxlrtb\clftsWidth3\clwWidth1361\clcbpatraw20 \cellx4513\r';
    wwv_flow_api.g_varchar2_table(579) := 'ow \ltrrow}\trowd \irow2\irowband2\ltrrow\ts11\trgaph70\trrh152\trleft-70'||wwv_flow.LF||
'\trbrdrt\brdrs\brdrw10 \tr';
    wwv_flow_api.g_varchar2_table(580) := 'brdrl\brdrs\brdrw10 \trbrdrb\brdrs\brdrw10 \trbrdrr\brdrs\brdrw10 \trbrdrh\brdrs\brdrw10 \trbrdrv\br';
    wwv_flow_api.g_varchar2_table(581) := 'drs\brdrw10 '||wwv_flow.LF||
'\tpvpara\tphpg\tposx3620\tposy268\tdfrmtxtLeft141\tdfrmtxtRight141\trftsWidth1\trftsWid';
    wwv_flow_api.g_varchar2_table(582) := 'thB3\trpaddl70\trpaddr70\trpaddfl3\trpaddfr3\tblrsid2048125\tbllkhdrrows\tblind0\tblindtype3 \clvert';
    wwv_flow_api.g_varchar2_table(583) := 'alt\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb'||wwv_flow.LF||
'\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clc';
    wwv_flow_api.g_varchar2_table(584) := 'bpat20\cltxlrtb\clftsWidth3\clwWidth1296\clcbpatraw20 \cellx1226\clvertalt\clbrdrt\brdrs\brdrw10 \cl';
    wwv_flow_api.g_varchar2_table(585) := 'brdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 '||wwv_flow.LF||
'\clcbpat8\cltxlrtb\clftsWidth3\cl';
    wwv_flow_api.g_varchar2_table(586) := 'wWidth1926\clcbpatraw8 \cellx3152\clvertalt\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\br';
    wwv_flow_api.g_varchar2_table(587) := 'drs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat8\cltxlrtb\clftsWidth3\clwWidth1361\clcbpatraw8 \cellx451';
    wwv_flow_api.g_varchar2_table(588) := '3\pard \ltrpar'||wwv_flow.LF||
'\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\intbl\pvpara\phpg\posx3620\posy268\dxfrtex';
    wwv_flow_api.g_varchar2_table(589) := 't141\dfrmtxtx141\dfrmtxty0\wraparound\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid2048125 {';
    wwv_flow_api.g_varchar2_table(590) := '\*\bkmkstart Texto353}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 '||wwv_flow.LF||
'\ltrch\fcs0 \insrsid2048125\cha';
    wwv_flow_api.g_varchar2_table(591) := 'rrsid8521287  FORMTEXT }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287 {\*\datafield ';
    wwv_flow_api.g_varchar2_table(592) := '800100000000000008546578746f3335330002472000000000000f3c3f7265663a78646f303031313f3e0000000000}'||wwv_flow.LF||
'{\*\';
    wwv_flow_api.g_varchar2_table(593) := 'formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto353}{\*\ffdeftext G }{\*\ffstattext';
    wwv_flow_api.g_varchar2_table(594) := ' <?ref:xdo0011?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid204';
    wwv_flow_api.g_varchar2_table(595) := '8125\charrsid8521287 G }}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\';
    wwv_flow_api.g_varchar2_table(596) := 'sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\*\bkmkstart Texto354}{\*\bkmkend Texto353}{\f';
    wwv_flow_api.g_varchar2_table(597) := 'ield\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287  FORMTEXT '||wwv_flow.LF||
'}{';
    wwv_flow_api.g_varchar2_table(598) := '\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287 {\*\datafield 8001000000000000085465787';
    wwv_flow_api.g_varchar2_table(599) := '46f33353400034d455300000000000f3c3f7265663a78646f303031323f3e0000000000}{\*\formfield{\fftype0\ffown';
    wwv_flow_api.g_varchar2_table(600) := 'help\ffownstat\fftypetxt0{\*\ffname Texto354}'||wwv_flow.LF||
'{\*\ffdeftext MES}{\*\ffstattext <?ref:xdo0012?>}}}}}{';
    wwv_flow_api.g_varchar2_table(601) := '\fldrslt {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid2048125\charrsid8521287 M';
    wwv_flow_api.g_varchar2_table(602) := 'ES}}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectd';
    wwv_flow_api.g_varchar2_table(603) := 'efaultcl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287 {\*\bk';
    wwv_flow_api.g_varchar2_table(604) := 'mkend Texto354}\cell }\pard \ltrpar\qr \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\pvpara\phpg\pos';
    wwv_flow_api.g_varchar2_table(605) := 'x3620\posy268\dxfrtext141\dfrmtxtx141\dfrmtxty0\wraparound\aspalpha\aspnum\faauto\adjustright\rin0\l';
    wwv_flow_api.g_varchar2_table(606) := 'in0\pararsid2048125 {\*\bkmkstart Texto367}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0';
    wwv_flow_api.g_varchar2_table(607) := ' '||wwv_flow.LF||
'\insrsid2048125\charrsid8521287  FORMTEXT }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8';
    wwv_flow_api.g_varchar2_table(608) := '521287 {\*\datafield 800100000000000008546578746f3336370002472000000000000f3c3f7265663a78646f3030333';
    wwv_flow_api.g_varchar2_table(609) := '03f3e0000000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto367}{\*\ffdeft';
    wwv_flow_api.g_varchar2_table(610) := 'ext G }{\*\ffstattext <?ref:xdo0030?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe10';
    wwv_flow_api.g_varchar2_table(611) := '24\noproof\insrsid2048125\charrsid8521287 G }}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\footery7';
    wwv_flow_api.g_varchar2_table(612) := '08\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\*\bkmkstart Texto368}{\*';
    wwv_flow_api.g_varchar2_table(613) := '\bkmkend Texto367}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid';
    wwv_flow_api.g_varchar2_table(614) := '8521287  FORMTEXT '||wwv_flow.LF||
'}{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287 {\*\datafield 8009';
    wwv_flow_api.g_varchar2_table(615) := '00000000000008546578746f333638000539393930300001300000000f3c3f7265663a78646f303033313f3e0000000000}{';
    wwv_flow_api.g_varchar2_table(616) := '\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt1{\*\ffname Texto368}'||wwv_flow.LF||
'{\*\ffdeftext 99900}{\*\fff';
    wwv_flow_api.g_varchar2_table(617) := 'ormat 0}{\*\ffstattext <?ref:xdo0031?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1';
    wwv_flow_api.g_varchar2_table(618) := '024\noproof\insrsid2048125\charrsid8521287 99900}}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\foot';
    wwv_flow_api.g_varchar2_table(619) := 'ery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af0 \ltr';
    wwv_flow_api.g_varchar2_table(620) := 'ch\fcs0 \insrsid2048125\charrsid8521287 {\*\bkmkend Texto368}\cell {\*\bkmkstart Texto369}}{\field\f';
    wwv_flow_api.g_varchar2_table(621) := 'lddirty{\*\fldinst {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287  FORMTEXT }{\rtlch';
    wwv_flow_api.g_varchar2_table(622) := '\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287 {\*\datafield 800900000000000008546578746f333';
    wwv_flow_api.g_varchar2_table(623) := '639000539393930300001300000000f3c3f7265663a78646f303033323f3e0000000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffow';
    wwv_flow_api.g_varchar2_table(624) := 'nhelp\ffownstat\fftypetxt1{\*\ffname Texto369}{\*\ffdeftext 99900}{\*\ffformat 0}{\*\ffstattext <?re';
    wwv_flow_api.g_varchar2_table(625) := 'f:xdo0032?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid2048125\';
    wwv_flow_api.g_varchar2_table(626) := 'charrsid8521287 99900}}}'||wwv_flow.LF||
'\sectd \ltrsect\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\se';
    wwv_flow_api.g_varchar2_table(627) := 'ctlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\*\bkmkend Texto369}{\field\fldedit{\*\fldinst {';
    wwv_flow_api.g_varchar2_table(628) := '\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287  FORMTEXT }{'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fc';
    wwv_flow_api.g_varchar2_table(629) := 's0 \insrsid2048125\charrsid8521287 {\*\datafield 800100000000000008546578746f33353500024520000000000';
    wwv_flow_api.g_varchar2_table(630) := '00f3c3f7265663a78646f303031333f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*';
    wwv_flow_api.g_varchar2_table(631) := '\ffname Texto355}'||wwv_flow.LF||
'{\*\ffdeftext E }{\*\ffstattext <?ref:xdo0013?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 \l';
    wwv_flow_api.g_varchar2_table(632) := 'trch\fcs0 \lang1024\langfe1024\noproof\insrsid2048125\charrsid8521287 E{\*\bkmkstart Texto355}}{\fie';
    wwv_flow_api.g_varchar2_table(633) := 'ld\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 '||wwv_flow.LF||
'\insrsid2048125\charrsid8521287  FORMTEXT }{\r';
    wwv_flow_api.g_varchar2_table(634) := 'tlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287 {\*\datafield 800100000000000008546578746';
    wwv_flow_api.g_varchar2_table(635) := 'f3335350002452000000000000f3c3f7265663a78646f303031333f3e0000000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhel';
    wwv_flow_api.g_varchar2_table(636) := 'p\ffownstat\fftypetxt0{\*\ffname Texto355}{\*\ffdeftext E }{\*\ffstattext <?ref:xdo0013?>}}}}}{\fldr';
    wwv_flow_api.g_varchar2_table(637) := 'slt {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid2048125\charrsid8521287 E }}}\';
    wwv_flow_api.g_varchar2_table(638) := 'sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefault';
    wwv_flow_api.g_varchar2_table(639) := 'cl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid2048125\';
    wwv_flow_api.g_varchar2_table(640) := 'charrsid8521287 {\*\bkmkend Texto355} }}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\footery708\col';
    wwv_flow_api.g_varchar2_table(641) := 'sx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af0 \ltrch\fcs0 \i';
    wwv_flow_api.g_varchar2_table(642) := 'nsrsid2048125\charrsid8521287 \cell }\pard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\';
    wwv_flow_api.g_varchar2_table(643) := 'wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0 {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid20481';
    wwv_flow_api.g_varchar2_table(644) := '25\charrsid8521287 \trowd \irow2\irowband2\ltrrow\ts11\trgaph70\trrh152\trleft-70\trbrdrt\brdrs\brdr';
    wwv_flow_api.g_varchar2_table(645) := 'w10 \trbrdrl\brdrs\brdrw10 \trbrdrb'||wwv_flow.LF||
'\brdrs\brdrw10 \trbrdrr\brdrs\brdrw10 \trbrdrh\brdrs\brdrw10 \tr';
    wwv_flow_api.g_varchar2_table(646) := 'brdrv\brdrs\brdrw10 '||wwv_flow.LF||
'\tpvpara\tphpg\tposx3620\tposy268\tdfrmtxtLeft141\tdfrmtxtRight141\trftsWidth1\';
    wwv_flow_api.g_varchar2_table(647) := 'trftsWidthB3\trpaddl70\trpaddr70\trpaddfl3\trpaddfr3\tblrsid2048125\tbllkhdrrows\tblind0\tblindtype3';
    wwv_flow_api.g_varchar2_table(648) := ' \clvertalt\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb'||wwv_flow.LF||
'\brdrs\brdrw10 \clbrdrr\brdrs\brdr';
    wwv_flow_api.g_varchar2_table(649) := 'w10 \clcbpat20\cltxlrtb\clftsWidth3\clwWidth1296\clcbpatraw20 \cellx1226\clvertalt\clbrdrt\brdrs\brd';
    wwv_flow_api.g_varchar2_table(650) := 'rw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 '||wwv_flow.LF||
'\clcbpat8\cltxlrtb\clftsW';
    wwv_flow_api.g_varchar2_table(651) := 'idth3\clwWidth1926\clcbpatraw8 \cellx3152\clvertalt\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \cl';
    wwv_flow_api.g_varchar2_table(652) := 'brdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat8\cltxlrtb\clftsWidth3\clwWidth1361\clcbpatraw8 \';
    wwv_flow_api.g_varchar2_table(653) := 'cellx4513\row \ltrrow'||wwv_flow.LF||
'}\trowd \irow3\irowband3\lastrow \ltrrow\ts11\trgaph70\trrh148\trleft-70\trbrd';
    wwv_flow_api.g_varchar2_table(654) := 'rt\brdrs\brdrw10 \trbrdrl\brdrs\brdrw10 \trbrdrb\brdrs\brdrw10 \trbrdrr\brdrs\brdrw10 \trbrdrh\brdrs';
    wwv_flow_api.g_varchar2_table(655) := '\brdrw10 \trbrdrv\brdrs\brdrw10 '||wwv_flow.LF||
'\tpvpara\tphpg\tposx3620\tposy268\tdfrmtxtLeft141\tdfrmtxtRight141\';
    wwv_flow_api.g_varchar2_table(656) := 'trftsWidth1\trftsWidthB3\trpaddl70\trpaddr70\trpaddfl3\trpaddfr3\tblrsid2048125\tbllkhdrrows\tblind0';
    wwv_flow_api.g_varchar2_table(657) := '\tblindtype3 \clvertalb\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrnone \clbrdrb\brdrnone '||wwv_flow.LF||
'\clbrdrr\brdrnone';
    wwv_flow_api.g_varchar2_table(658) := ' \clcbpat20\cltxlrtb\clftsWidth3\clwWidth1296\clcbpatraw20 \cellx1226\clvertalt\clbrdrt\brdrs\brdrw1';
    wwv_flow_api.g_varchar2_table(659) := '0 \clbrdrl\brdrnone \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat20\cltxlrtb\clftsWidth3\cl';
    wwv_flow_api.g_varchar2_table(660) := 'wWidth1926\clcbpatraw20 \cellx3152'||wwv_flow.LF||
'\clvertalt\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\';
    wwv_flow_api.g_varchar2_table(661) := 'brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat20\cltxlrtb\clftsWidth3\clwWidth1361\clcbpatraw20 \cell';
    wwv_flow_api.g_varchar2_table(662) := 'x4513\pard \ltrpar\qr \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\pvpara\phpg\posx3620\posy268\dxf';
    wwv_flow_api.g_varchar2_table(663) := 'rtext141\dfrmtxtx141\dfrmtxty0\wraparound\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid20481';
    wwv_flow_api.g_varchar2_table(664) := '25 {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287 \cell {\*\bkmkstart Texto361}}'||wwv_flow.LF||
'{\fi';
    wwv_flow_api.g_varchar2_table(665) := 'eld\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287  FORMTEXT }{\r';
    wwv_flow_api.g_varchar2_table(666) := 'tlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287 {\*\datafield '||wwv_flow.LF||
'80010000000000000854657874';
    wwv_flow_api.g_varchar2_table(667) := '6f3336310002472000000000000f3c3f7265663a78646f303032343f3e0000000000}{\*\formfield{\fftype0\ffownhel';
    wwv_flow_api.g_varchar2_table(668) := 'p\ffownstat\fftypetxt0{\*\ffname Texto361}{\*\ffdeftext G }{\*\ffstattext <?ref:xdo0024?>}}}}}{\fldr';
    wwv_flow_api.g_varchar2_table(669) := 'slt {\rtlch\fcs1 \af0 '||wwv_flow.LF||
'\ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid2048125\charrsid8521287 G }}}';
    wwv_flow_api.g_varchar2_table(670) := '\sectd \ltrsect\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefault';
    wwv_flow_api.g_varchar2_table(671) := 'cl\sectrsid8529128\sftnbj {\*\bkmkstart Texto362}{\*\bkmkend Texto361}'||wwv_flow.LF||
'{\field\flddirty{\*\fldinst {';
    wwv_flow_api.g_varchar2_table(672) := '\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287  FORMTEXT }{\rtlch\fcs1 \af0 \ltrch\fcs';
    wwv_flow_api.g_varchar2_table(673) := '0 \insrsid2048125\charrsid8521287 {\*\datafield '||wwv_flow.LF||
'800900000000000008546578746f33363200053939393030000';
    wwv_flow_api.g_varchar2_table(674) := '1300000000f3c3f7265663a78646f303032353f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftyp';
    wwv_flow_api.g_varchar2_table(675) := 'etxt1{\*\ffname Texto362}{\*\ffdeftext 99900}{\*\ffformat 0}{\*\ffstattext <?ref:xdo0025?>}}}}'||wwv_flow.LF||
'}{\fl';
    wwv_flow_api.g_varchar2_table(676) := 'drslt {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid2048125\charrsid8521287 9990';
    wwv_flow_api.g_varchar2_table(677) := '0}}}\sectd \ltrsect\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdef';
    wwv_flow_api.g_varchar2_table(678) := 'aultcl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af0 '||wwv_flow.LF||
'\ltrch\fcs0 \insrsid2048125\charrsid8521287 {\*\bkm';
    wwv_flow_api.g_varchar2_table(679) := 'kend Texto362}\cell {\*\bkmkstart Texto363}}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs';
    wwv_flow_api.g_varchar2_table(680) := '0 \insrsid2048125\charrsid8521287  FORMTEXT }{\rtlch\fcs1 \af0 \ltrch\fcs0 '||wwv_flow.LF||
'\insrsid2048125\charrsid';
    wwv_flow_api.g_varchar2_table(681) := '8521287 {\*\datafield 800900000000000008546578746f333633000539393930300001300000000f3c3f7265663a7864';
    wwv_flow_api.g_varchar2_table(682) := '6f303032363f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt1{\*\ffname Texto363}{\';
    wwv_flow_api.g_varchar2_table(683) := '*\ffdeftext 99900}{\*\ffformat '||wwv_flow.LF||
'0}{\*\ffstattext <?ref:xdo0026?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 \lt';
    wwv_flow_api.g_varchar2_table(684) := 'rch\fcs0 \lang1024\langfe1024\noproof\insrsid2048125\charrsid8521287 99900}}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscp';
    wwv_flow_api.g_varchar2_table(685) := 'sxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sft';
    wwv_flow_api.g_varchar2_table(686) := 'nbj {\*\bkmkstart Texto364}{\*\bkmkend Texto363}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch';
    wwv_flow_api.g_varchar2_table(687) := '\fcs0 \insrsid2048125\charrsid8521287  FORMTEXT '||wwv_flow.LF||
'}{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125\char';
    wwv_flow_api.g_varchar2_table(688) := 'rsid8521287 {\*\datafield 800100000000000008546578746f3336340002452000000000000f3c3f7265663a78646f30';
    wwv_flow_api.g_varchar2_table(689) := '3032373f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto364}'||wwv_flow.LF||
'{\*\f';
    wwv_flow_api.g_varchar2_table(690) := 'fdeftext E }{\*\ffstattext <?ref:xdo0027?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\lan';
    wwv_flow_api.g_varchar2_table(691) := 'gfe1024\noproof\insrsid2048125\charrsid8521287 E }}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\foo';
    wwv_flow_api.g_varchar2_table(692) := 'tery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af0 \lt';
    wwv_flow_api.g_varchar2_table(693) := 'rch\fcs0 \insrsid2048125\charrsid8521287 {\*\bkmkend Texto364}\cell }\pard \ltrpar\ql \li0\ri0\sa160';
    wwv_flow_api.g_varchar2_table(694) := '\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0 {\rtlch\fcs';
    wwv_flow_api.g_varchar2_table(695) := '1 \af0 \ltrch\fcs0 \insrsid2048125\charrsid8521287 \trowd \irow3\irowband3\lastrow \ltrrow\ts11\trga';
    wwv_flow_api.g_varchar2_table(696) := 'ph70\trrh148\trleft-70\trbrdrt\brdrs\brdrw10 \trbrdrl\brdrs\brdrw10 '||wwv_flow.LF||
'\trbrdrb\brdrs\brdrw10 \trbrdrr';
    wwv_flow_api.g_varchar2_table(697) := '\brdrs\brdrw10 \trbrdrh\brdrs\brdrw10 \trbrdrv\brdrs\brdrw10 '||wwv_flow.LF||
'\tpvpara\tphpg\tposx3620\tposy268\tdfr';
    wwv_flow_api.g_varchar2_table(698) := 'mtxtLeft141\tdfrmtxtRight141\trftsWidth1\trftsWidthB3\trpaddl70\trpaddr70\trpaddfl3\trpaddfr3\tblrsi';
    wwv_flow_api.g_varchar2_table(699) := 'd2048125\tbllkhdrrows\tblind0\tblindtype3 \clvertalb\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrnone \clbrdr';
    wwv_flow_api.g_varchar2_table(700) := 'b\brdrnone '||wwv_flow.LF||
'\clbrdrr\brdrnone \clcbpat20\cltxlrtb\clftsWidth3\clwWidth1296\clcbpatraw20 \cellx1226\c';
    wwv_flow_api.g_varchar2_table(701) := 'lvertalt\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrnone \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcb';
    wwv_flow_api.g_varchar2_table(702) := 'pat20\cltxlrtb\clftsWidth3\clwWidth1926\clcbpatraw20 \cellx3152'||wwv_flow.LF||
'\clvertalt\clbrdrt\brdrs\brdrw10 \cl';
    wwv_flow_api.g_varchar2_table(703) := 'brdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat20\cltxlrtb\clftsWidth3\cl';
    wwv_flow_api.g_varchar2_table(704) := 'wWidth1361\clcbpatraw20 \cellx4513\row }\pard \ltrpar\ql \fi708\li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlp';
    wwv_flow_api.g_varchar2_table(705) := 'ar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsid8529128 {\rtlch\fcs1 \af0 ';
    wwv_flow_api.g_varchar2_table(706) := '\ltrch\fcs0 \insrsid8529128 '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2048125 '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par }';
    wwv_flow_api.g_varchar2_table(707) := '\pard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustrig';
    wwv_flow_api.g_varchar2_table(708) := 'ht\rin0\lin0\itap0\pararsid6379667 {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par ';
    wwv_flow_api.g_varchar2_table(709) := '\ltrrow}\trowd \irow0\irowband0\ltrrow\ts11\trgaph70\trleft-70\trhdr\trbrdrt\brdrs\brdrw10 \trbrdrl\';
    wwv_flow_api.g_varchar2_table(710) := 'brdrs\brdrw10 \trbrdrb\brdrs\brdrw10 \trbrdrr\brdrs\brdrw10 \trbrdrh\brdrs\brdrw10 \trbrdrv\brdrs\br';
    wwv_flow_api.g_varchar2_table(711) := 'drw10 '||wwv_flow.LF||
'\trftsWidth1\trftsWidthB3\trpaddl70\trpaddr70\trpaddfl3\trpaddfr3\tblrsid10240608\tbllkhdrrow';
    wwv_flow_api.g_varchar2_table(712) := 's\tblind0\tblindtype3 \clvertalt\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrnone \clb';
    wwv_flow_api.g_varchar2_table(713) := 'rdrr\brdrs\brdrw10 '||wwv_flow.LF||
'\clcbpat22\cltxlrtb\clftsWidth3\clwWidth1440\clcbpatraw22 \cellx1370\clvertalt\c';
    wwv_flow_api.g_varchar2_table(714) := 'lbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat22';
    wwv_flow_api.g_varchar2_table(715) := '\cltxlrtb\clftsWidth3\clwWidth2880\clcbpatraw22 \cellx4250\pard \ltrpar'||wwv_flow.LF||
'\ql \li0\ri0\sa160\sl259\slm';
    wwv_flow_api.g_varchar2_table(716) := 'ult1\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid6379667 {\fiel';
    wwv_flow_api.g_varchar2_table(717) := 'd\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 {\*\bkmkstart Texto378} FORMTEX';
    wwv_flow_api.g_varchar2_table(718) := 'T }{\rtlch\fcs1 \af0 '||wwv_flow.LF||
'\ltrch\fcs0 \insrsid10240608 {\*\datafield 800100000000000008546578746f3337380';
    wwv_flow_api.g_varchar2_table(719) := '002432000000000000f3c3f7265663a78646f303033373f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownst';
    wwv_flow_api.g_varchar2_table(720) := 'at\fftypetxt0{\*\ffname Texto378}{\*\ffdeftext C }{\*\ffstattext '||wwv_flow.LF||
'<?ref:xdo0037?>}}}}}{\fldrslt {\rt';
    wwv_flow_api.g_varchar2_table(721) := 'lch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid10240608 C }}}\sectd \ltrsect\lndscpsx';
    wwv_flow_api.g_varchar2_table(722) := 'n\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnb';
    wwv_flow_api.g_varchar2_table(723) := 'j '||wwv_flow.LF||
'{\*\bkmkend Texto378}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 {';
    wwv_flow_api.g_varchar2_table(724) := '\*\bkmkstart Texto379} FORMTEXT }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 {\*\datafield '||wwv_flow.LF||
'80010';
    wwv_flow_api.g_varchar2_table(725) := '0000000000008546578746f3337390002482000000000000f3c3f7265663a78646f303033383f3e0000000000}{\*\formfi';
    wwv_flow_api.g_varchar2_table(726) := 'eld{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto379}{\*\ffdeftext H }{\*\ffstattext <?ref';
    wwv_flow_api.g_varchar2_table(727) := ':xdo0038?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 '||wwv_flow.LF||
'\ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid10240608';
    wwv_flow_api.g_varchar2_table(728) := ' H }}}\sectd \ltrsect\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectd';
    wwv_flow_api.g_varchar2_table(729) := 'efaultcl\sectrsid8529128\sftnbj {\*\bkmkend Texto379}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 '||wwv_flow.LF||
'';
    wwv_flow_api.g_varchar2_table(730) := '\ltrch\fcs0 \insrsid10240608 {\*\bkmkstart Texto380} FORMTEXT }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsi';
    wwv_flow_api.g_varchar2_table(731) := 'd10240608 {\*\datafield 800100000000000008546578746f333830000341434300000000000f3c3f7265663a78646f30';
    wwv_flow_api.g_varchar2_table(732) := '3033393f3e0000000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto380}{\*\f';
    wwv_flow_api.g_varchar2_table(733) := 'fdeftext ACC}{\*\ffstattext <?ref:xdo0039?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\la';
    wwv_flow_api.g_varchar2_table(734) := 'ngfe1024\noproof\insrsid10240608 ACC}}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\footery708\colsx';
    wwv_flow_api.g_varchar2_table(735) := '708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af0 \ltrch\fcs0 \ins';
    wwv_flow_api.g_varchar2_table(736) := 'rsid10240608 {\*\bkmkend Texto380}\cell }\pard \ltrpar\qc \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\in';
    wwv_flow_api.g_varchar2_table(737) := 'tbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid10240608 {\field\flddirty{\*\fl';
    wwv_flow_api.g_varchar2_table(738) := 'dinst {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 {\*\bkmkstart Texto370} FORMTEXT }{\rtlch\fcs1 ';
    wwv_flow_api.g_varchar2_table(739) := '\af0 \ltrch\fcs0 \insrsid10240608 '||wwv_flow.LF||
'{\*\datafield 800100000000000008546578746f33373000024720000000000';
    wwv_flow_api.g_varchar2_table(740) := '00f3c3f7265663a78646f303031373f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*';
    wwv_flow_api.g_varchar2_table(741) := '\ffname Texto370}{\*\ffdeftext G }{\*\ffstattext <?ref:xdo0017?>}}}}}{\fldrslt {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \l';
    wwv_flow_api.g_varchar2_table(742) := 'trch\fcs0 \lang1024\langfe1024\noproof\insrsid10240608 G }}}\sectd \ltrsect\lndscpsxn\linex0\headery';
    wwv_flow_api.g_varchar2_table(743) := '708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\*\bkmkend Te';
    wwv_flow_api.g_varchar2_table(744) := 'xto370}{\field\flddirty{\*\fldinst {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 {\*\bkmkstart Tex';
    wwv_flow_api.g_varchar2_table(745) := 'to371} FORMTEXT }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 {\*\datafield 8001000000000000085465';
    wwv_flow_api.g_varchar2_table(746) := '78746f3337310008564947454e43494100000000000f3c3f7265663a78646f303032313f3e0000000000}'||wwv_flow.LF||
'{\*\formfield{';
    wwv_flow_api.g_varchar2_table(747) := '\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto371}{\*\ffdeftext VIGENCIA}{\*\ffstattext <?r';
    wwv_flow_api.g_varchar2_table(748) := 'ef:xdo0021?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid1024060';
    wwv_flow_api.g_varchar2_table(749) := '8 VIGENCIA}}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid3';
    wwv_flow_api.g_varchar2_table(750) := '60\sectdefaultcl\sectrsid8529128\sftnbj {\*\bkmkend Texto371}{\field\flddirty{\*\fldinst {\rtlch\fcs';
    wwv_flow_api.g_varchar2_table(751) := '1 \af0 \ltrch\fcs0 \insrsid10240608 {\*\bkmkstart Texto372} FORMTEXT }{\rtlch\fcs1 '||wwv_flow.LF||
'\af0 \ltrch\fcs0';
    wwv_flow_api.g_varchar2_table(752) := ' \insrsid10240608 {\*\datafield 800100000000000008546578746f3337320002452000000000000f3c3f7265663a78';
    wwv_flow_api.g_varchar2_table(753) := '646f303032383f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto372}';
    wwv_flow_api.g_varchar2_table(754) := '{\*\ffdeftext E }{\*\ffstattext '||wwv_flow.LF||
'<?ref:xdo0028?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang10';
    wwv_flow_api.g_varchar2_table(755) := '24\langfe1024\noproof\insrsid10240608 E }}}\sectd \ltrsect\lndscpsxn\linex0\headery708\footery708\co';
    wwv_flow_api.g_varchar2_table(756) := 'lsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af0 '||wwv_flow.LF||
'\ltrch\fcs0 ';
    wwv_flow_api.g_varchar2_table(757) := '\insrsid10240608 {\*\bkmkend Texto372}\cell }\pard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar';
    wwv_flow_api.g_varchar2_table(758) := '\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0 {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrs';
    wwv_flow_api.g_varchar2_table(759) := 'id10240608 \trowd \irow0\irowband0\ltrrow'||wwv_flow.LF||
'\ts11\trgaph70\trleft-70\trhdr\trbrdrt\brdrs\brdrw10 \trbr';
    wwv_flow_api.g_varchar2_table(760) := 'drl\brdrs\brdrw10 \trbrdrb\brdrs\brdrw10 \trbrdrr\brdrs\brdrw10 \trbrdrh\brdrs\brdrw10 \trbrdrv\brdr';
    wwv_flow_api.g_varchar2_table(761) := 's\brdrw10 '||wwv_flow.LF||
'\trftsWidth1\trftsWidthB3\trpaddl70\trpaddr70\trpaddfl3\trpaddfr3\tblrsid10240608\tbllkhd';
    wwv_flow_api.g_varchar2_table(762) := 'rrows\tblind0\tblindtype3 \clvertalt\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrnone ';
    wwv_flow_api.g_varchar2_table(763) := '\clbrdrr\brdrs\brdrw10 '||wwv_flow.LF||
'\clcbpat22\cltxlrtb\clftsWidth3\clwWidth1440\clcbpatraw22 \cellx1370\clverta';
    wwv_flow_api.g_varchar2_table(764) := 'lt\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbp';
    wwv_flow_api.g_varchar2_table(765) := 'at22\cltxlrtb\clftsWidth3\clwWidth2880\clcbpatraw22 \cellx4250\row \ltrrow'||wwv_flow.LF||
'}\trowd \irow1\irowband1\';
    wwv_flow_api.g_varchar2_table(766) := 'ltrrow\ts11\trgaph70\trleft-70\trbrdrt\brdrs\brdrw10 \trbrdrl\brdrs\brdrw10 \trbrdrb\brdrs\brdrw10 \';
    wwv_flow_api.g_varchar2_table(767) := 'trbrdrr\brdrs\brdrw10 \trbrdrh\brdrs\brdrw10 \trbrdrv\brdrs\brdrw10 '||wwv_flow.LF||
'\trftsWidth1\trftsWidthB3\trpad';
    wwv_flow_api.g_varchar2_table(768) := 'dl70\trpaddr70\trpaddfl3\trpaddfr3\tblrsid10240608\tbllkhdrrows\tblind0\tblindtype3 \clvertalt\clbrd';
    wwv_flow_api.g_varchar2_table(769) := 'rt\brdrnone \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 '||wwv_flow.LF||
'\clcbpat22\cltxlrt';
    wwv_flow_api.g_varchar2_table(770) := 'b\clftsWidth3\clwWidth1440\clcbpatraw22 \cellx1370\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\br';
    wwv_flow_api.g_varchar2_table(771) := 'drw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat22\cltxlrtb\clftsWidth3\clwWidth1440\clc';
    wwv_flow_api.g_varchar2_table(772) := 'bpatraw22 \cellx2810\clvertalc'||wwv_flow.LF||
'\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 ';
    wwv_flow_api.g_varchar2_table(773) := '\clbrdrr\brdrs\brdrw10 \clcbpat22\cltxlrtb\clftsWidth3\clwWidth1440\clcbpatraw22 \cellx4250\pard \lt';
    wwv_flow_api.g_varchar2_table(774) := 'rpar\ql \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright';
    wwv_flow_api.g_varchar2_table(775) := '\rin0\lin0\pararsid6379667 {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 \cell }\pard \ltrpar\qc \l';
    wwv_flow_api.g_varchar2_table(776) := 'i0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0';
    wwv_flow_api.g_varchar2_table(777) := '\pararsid10240608 {\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 {\*\bkm';
    wwv_flow_api.g_varchar2_table(778) := 'kstart Texto373} FORMTEXT }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 '||wwv_flow.LF||
'{\*\datafield 80010000000';
    wwv_flow_api.g_varchar2_table(779) := '0000008546578746f3337330002472000000000000f3c3f7265663a78646f303032393f3e0000000000}{\*\formfield{\f';
    wwv_flow_api.g_varchar2_table(780) := 'ftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto373}{\*\ffdeftext G }{\*\ffstattext <?ref:xdo00';
    wwv_flow_api.g_varchar2_table(781) := '29?>}}}}}{\fldrslt {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid10240608 G }}}';
    wwv_flow_api.g_varchar2_table(782) := '\sectd \ltrsect\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefault';
    wwv_flow_api.g_varchar2_table(783) := 'cl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 '||wwv_flow.LF||
'{\*\bkmkend Texto373}VALOR';
    wwv_flow_api.g_varchar2_table(784) := '_RECAUDO\cell NUMEROS_PREDIOS}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid1024';
    wwv_flow_api.g_varchar2_table(785) := '0608 {\*\bkmkstart Texto374} FORMTEXT }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 {\*\datafield ';
    wwv_flow_api.g_varchar2_table(786) := ''||wwv_flow.LF||
'800100000000000008546578746f3337340002452000000000000f3c3f7265663a78646f303033333f3e0000000000}{\*\';
    wwv_flow_api.g_varchar2_table(787) := 'formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto374}{\*\ffdeftext E }{\*\ffstattext';
    wwv_flow_api.g_varchar2_table(788) := ' <?ref:xdo0033?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 '||wwv_flow.LF||
'\ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid10';
    wwv_flow_api.g_varchar2_table(789) := '240608 E }}}\sectd \ltrsect\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360';
    wwv_flow_api.g_varchar2_table(790) := '\sectdefaultcl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 {\*\bkmkend Tex';
    wwv_flow_api.g_varchar2_table(791) := 'to374'||wwv_flow.LF||
'}\cell }\pard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\intbl\wrapdefault\aspalpha\asp';
    wwv_flow_api.g_varchar2_table(792) := 'num\faauto\adjustright\rin0\lin0 {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 \trowd \irow1\irowba';
    wwv_flow_api.g_varchar2_table(793) := 'nd1\ltrrow\ts11\trgaph70\trleft-70\trbrdrt\brdrs\brdrw10 '||wwv_flow.LF||
'\trbrdrl\brdrs\brdrw10 \trbrdrb\brdrs\brdr';
    wwv_flow_api.g_varchar2_table(794) := 'w10 \trbrdrr\brdrs\brdrw10 \trbrdrh\brdrs\brdrw10 \trbrdrv\brdrs\brdrw10 \trftsWidth1\trftsWidthB3\t';
    wwv_flow_api.g_varchar2_table(795) := 'rpaddl70\trpaddr70\trpaddfl3\trpaddfr3\tblrsid10240608\tbllkhdrrows\tblind0\tblindtype3 \clvertalt\c';
    wwv_flow_api.g_varchar2_table(796) := 'lbrdrt'||wwv_flow.LF||
'\brdrnone \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat22\clt';
    wwv_flow_api.g_varchar2_table(797) := 'xlrtb\clftsWidth3\clwWidth1440\clcbpatraw22 \cellx1370\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdr';
    wwv_flow_api.g_varchar2_table(798) := 's\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 '||wwv_flow.LF||
'\clcbpat22\cltxlrtb\clftsWidth3\clwWidth144';
    wwv_flow_api.g_varchar2_table(799) := '0\clcbpatraw22 \cellx2810\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdr';
    wwv_flow_api.g_varchar2_table(800) := 'w10 \clbrdrr\brdrs\brdrw10 \clcbpat22\cltxlrtb\clftsWidth3\clwWidth1440\clcbpatraw22 \cellx4250\row ';
    wwv_flow_api.g_varchar2_table(801) := '\ltrrow'||wwv_flow.LF||
'}\trowd \irow2\irowband2\ltrrow\ts11\trgaph70\trleft-70\trbrdrt\brdrs\brdrw10 \trbrdrl\brdrs';
    wwv_flow_api.g_varchar2_table(802) := '\brdrw10 \trbrdrb\brdrs\brdrw10 \trbrdrr\brdrs\brdrw10 \trbrdrh\brdrs\brdrw10 \trbrdrv\brdrs\brdrw10';
    wwv_flow_api.g_varchar2_table(803) := ' '||wwv_flow.LF||
'\trftsWidth1\trftsWidthB3\trpaddl70\trpaddr70\trpaddfl3\trpaddfr3\tblrsid10240608\tbllkhdrrows\tbl';
    wwv_flow_api.g_varchar2_table(804) := 'ind0\tblindtype3 \clvertalt\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clb';
    wwv_flow_api.g_varchar2_table(805) := 'rdrr\brdrs\brdrw10 '||wwv_flow.LF||
'\clcbpat22\cltxlrtb\clftsWidth3\clwWidth1440\clcbpatraw22 \cellx1370\clvertalt\c';
    wwv_flow_api.g_varchar2_table(806) := 'lbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat8\';
    wwv_flow_api.g_varchar2_table(807) := 'cltxlrtb\clftsWidth3\clwWidth1440\clcbpatraw8 \cellx2810\clvertalt\clbrdrt'||wwv_flow.LF||
'\brdrs\brdrw10 \clbrdrl\b';
    wwv_flow_api.g_varchar2_table(808) := 'rdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat8\cltxlrtb\clftsWidth3\clwWidth14';
    wwv_flow_api.g_varchar2_table(809) := '40\clcbpatraw8 \cellx4250\pard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\wrapdefault\';
    wwv_flow_api.g_varchar2_table(810) := 'aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid6379667 {\field\flddirty{\*\fldinst {\rtlch\fcs';
    wwv_flow_api.g_varchar2_table(811) := '1 \af0 \ltrch\fcs0 \insrsid10240608 {\*\bkmkstart Texto375} FORMTEXT }{\rtlch\fcs1 \af0 \ltrch\fcs0 ';
    wwv_flow_api.g_varchar2_table(812) := '\insrsid10240608 '||wwv_flow.LF||
'{\*\datafield 800100000000000008546578746f3337350002472000000000000f3c3f7265663a78';
    wwv_flow_api.g_varchar2_table(813) := '646f303033343f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto375}';
    wwv_flow_api.g_varchar2_table(814) := '{\*\ffdeftext G }{\*\ffstattext <?ref:xdo0034?>}}}}}{\fldrslt {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \lang10';
    wwv_flow_api.g_varchar2_table(815) := '24\langfe1024\noproof\insrsid10240608 G }}}\sectd \ltrsect\lndscpsxn\linex0\headery708\footery708\co';
    wwv_flow_api.g_varchar2_table(816) := 'lsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\*\bkmkend Texto375}{\field\fl';
    wwv_flow_api.g_varchar2_table(817) := 'ddirty{\*\fldinst {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 {\*\bkmkstart Texto376} FORMTEXT }';
    wwv_flow_api.g_varchar2_table(818) := '{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 {\*\datafield 800100000000000008546578746f33373600034';
    wwv_flow_api.g_varchar2_table(819) := 'd455300000000000f3c3f7265663a78646f303033353f3e0000000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownsta';
    wwv_flow_api.g_varchar2_table(820) := 't\fftypetxt0{\*\ffname Texto376}{\*\ffdeftext MES}{\*\ffstattext <?ref:xdo0035?>}}}}}{\fldrslt {\rtl';
    wwv_flow_api.g_varchar2_table(821) := 'ch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid10240608 MES}}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscps';
    wwv_flow_api.g_varchar2_table(822) := 'xn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftn';
    wwv_flow_api.g_varchar2_table(823) := 'bj {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 {\*\bkmkend Texto376}\cell }\pard \ltrpar\qr \li0\';
    wwv_flow_api.g_varchar2_table(824) := 'ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pa';
    wwv_flow_api.g_varchar2_table(825) := 'rarsid10240608 {\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 {\*\bkmkst';
    wwv_flow_api.g_varchar2_table(826) := 'art Texto389} FORMTEXT }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 '||wwv_flow.LF||
'{\*\datafield 80010000000000';
    wwv_flow_api.g_varchar2_table(827) := '0008546578746f3338390002472000000000000f3c3f7265663a78646f303034383f3e0000000000}{\*\formfield{\ffty';
    wwv_flow_api.g_varchar2_table(828) := 'pe0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto389}{\*\ffdeftext G }{\*\ffstattext <?ref:xdo0048?';
    wwv_flow_api.g_varchar2_table(829) := '>}}}}}{\fldrslt {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid10240608 G }}}\se';
    wwv_flow_api.g_varchar2_table(830) := 'ctd \ltrsect\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\';
    wwv_flow_api.g_varchar2_table(831) := 'sectrsid8529128\sftnbj {\*\bkmkend Texto389}{\field\flddirty{\*\fldinst {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fc';
    wwv_flow_api.g_varchar2_table(832) := 's0 \insrsid10240608 {\*\bkmkstart Texto390} FORMTEXT }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608';
    wwv_flow_api.g_varchar2_table(833) := ' {\*\datafield 800900000000000008546578746f333930000539393930300001300000000f3c3f7265663a78646f30303';
    wwv_flow_api.g_varchar2_table(834) := '4393f3e0000000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt1{\*\ffname Texto390}{\*\ffde';
    wwv_flow_api.g_varchar2_table(835) := 'ftext 99900}{\*\ffformat 0}{\*\ffstattext <?ref:xdo0049?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 \ltrch\fcs';
    wwv_flow_api.g_varchar2_table(836) := '0 \lang1024\langfe1024\noproof\insrsid10240608 99900}}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\';
    wwv_flow_api.g_varchar2_table(837) := 'footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af0 ';
    wwv_flow_api.g_varchar2_table(838) := '\ltrch\fcs0 \insrsid10240608 {\*\bkmkend Texto390}\cell }{\field\flddirty{\*\fldinst {\rtlch\fcs1 \a';
    wwv_flow_api.g_varchar2_table(839) := 'f0 \ltrch\fcs0 '||wwv_flow.LF||
'\insrsid10240608 {\*\bkmkstart Texto391} FORMTEXT }{\rtlch\fcs1 \af0 \ltrch\fcs0 \in';
    wwv_flow_api.g_varchar2_table(840) := 'srsid10240608 {\*\datafield 800900000000000008546578746f333931000539393930300001300000000f3c3f726566';
    wwv_flow_api.g_varchar2_table(841) := '3a78646f303035303f3e0000000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt1{\*\ffname Text';
    wwv_flow_api.g_varchar2_table(842) := 'o391}{\*\ffdeftext 99900}{\*\ffformat 0}{\*\ffstattext <?ref:xdo0050?>}}}}}{\fldrslt {\rtlch\fcs1 \a';
    wwv_flow_api.g_varchar2_table(843) := 'f0 \ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid10240608 99900}}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex';
    wwv_flow_api.g_varchar2_table(844) := '0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\*\b';
    wwv_flow_api.g_varchar2_table(845) := 'kmkend Texto391}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 {\*\bkmks';
    wwv_flow_api.g_varchar2_table(846) := 'tart Texto392} FORMTEXT }{\rtlch\fcs1 '||wwv_flow.LF||
'\af0 \ltrch\fcs0 \insrsid10240608 {\*\datafield 8001000000000';
    wwv_flow_api.g_varchar2_table(847) := '00008546578746f3339320002452000000000000f3c3f7265663a78646f303035313f3e0000000000}{\*\formfield{\fft';
    wwv_flow_api.g_varchar2_table(848) := 'ype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto392}{\*\ffdeftext E }{\*\ffstattext '||wwv_flow.LF||
'<?ref:xdo005';
    wwv_flow_api.g_varchar2_table(849) := '1?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid10240608 E }}}\s';
    wwv_flow_api.g_varchar2_table(850) := 'ectd \ltrsect\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl';
    wwv_flow_api.g_varchar2_table(851) := '\sectrsid8529128\sftnbj {\rtlch\fcs1 \af0 '||wwv_flow.LF||
'\ltrch\fcs0 \insrsid10240608 {\*\bkmkend Texto392}\cell }';
    wwv_flow_api.g_varchar2_table(852) := '\pard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adj';
    wwv_flow_api.g_varchar2_table(853) := 'ustright\rin0\lin0 {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 \trowd \irow2\irowband2\ltrrow'||wwv_flow.LF||
'\ts';
    wwv_flow_api.g_varchar2_table(854) := '11\trgaph70\trleft-70\trbrdrt\brdrs\brdrw10 \trbrdrl\brdrs\brdrw10 \trbrdrb\brdrs\brdrw10 \trbrdrr\b';
    wwv_flow_api.g_varchar2_table(855) := 'rdrs\brdrw10 \trbrdrh\brdrs\brdrw10 \trbrdrv\brdrs\brdrw10 '||wwv_flow.LF||
'\trftsWidth1\trftsWidthB3\trpaddl70\trpa';
    wwv_flow_api.g_varchar2_table(856) := 'ddr70\trpaddfl3\trpaddfr3\tblrsid10240608\tbllkhdrrows\tblind0\tblindtype3 \clvertalt\clbrdrt\brdrs\';
    wwv_flow_api.g_varchar2_table(857) := 'brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 '||wwv_flow.LF||
'\clcbpat22\cltxlrtb\cl';
    wwv_flow_api.g_varchar2_table(858) := 'ftsWidth3\clwWidth1440\clcbpatraw22 \cellx1370\clvertalt\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw1';
    wwv_flow_api.g_varchar2_table(859) := '0 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat8\cltxlrtb\clftsWidth3\clwWidth1440\clcbpatr';
    wwv_flow_api.g_varchar2_table(860) := 'aw8 \cellx2810\clvertalt\clbrdrt'||wwv_flow.LF||
'\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrd';
    wwv_flow_api.g_varchar2_table(861) := 'rr\brdrs\brdrw10 \clcbpat8\cltxlrtb\clftsWidth3\clwWidth1440\clcbpatraw8 \cellx4250\row \ltrrow}\tro';
    wwv_flow_api.g_varchar2_table(862) := 'wd \irow3\irowband3\lastrow \ltrrow\ts11\trgaph70\trleft-70\trbrdrt\brdrs\brdrw10 '||wwv_flow.LF||
'\trbrdrl\brdrs\br';
    wwv_flow_api.g_varchar2_table(863) := 'drw10 \trbrdrb\brdrs\brdrw10 \trbrdrr\brdrs\brdrw10 \trbrdrh\brdrs\brdrw10 \trbrdrv\brdrs\brdrw10 \t';
    wwv_flow_api.g_varchar2_table(864) := 'rftsWidth1\trftsWidthB3\trpaddl70\trpaddr70\trpaddfl3\trpaddfr3\tblrsid10240608\tbllkhdrrows\tblind0';
    wwv_flow_api.g_varchar2_table(865) := '\tblindtype3 \clvertalt\clbrdrt'||wwv_flow.LF||
'\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdr';
    wwv_flow_api.g_varchar2_table(866) := 'r\brdrs\brdrw10 \clcbpat22\cltxlrtb\clftsWidth3\clwWidth1440\clcbpatraw22 \cellx1370\clvertalt\clbrd';
    wwv_flow_api.g_varchar2_table(867) := 'rt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 '||wwv_flow.LF||
'\clcbpat23\cl';
    wwv_flow_api.g_varchar2_table(868) := 'txlrtb\clftsWidth3\clwWidth1440\clcbpatraw23 \cellx2810\clvertalt\clbrdrt\brdrs\brdrw10 \clbrdrl\brd';
    wwv_flow_api.g_varchar2_table(869) := 'rs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat23\cltxlrtb\clftsWidth3\clwWidth144';
    wwv_flow_api.g_varchar2_table(870) := '0\clcbpatraw23 \cellx4250\pard \ltrpar'||wwv_flow.LF||
'\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\intbl\wrapdefault\';
    wwv_flow_api.g_varchar2_table(871) := 'aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid6379667 {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid1';
    wwv_flow_api.g_varchar2_table(872) := '0240608 \cell }\pard \ltrpar\qr \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\wrapdefault\aspalpha\a';
    wwv_flow_api.g_varchar2_table(873) := 'spnum\faauto\adjustright\rin0\lin0\pararsid10240608 {\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \l';
    wwv_flow_api.g_varchar2_table(874) := 'trch\fcs0 \insrsid10240608 {\*\bkmkstart Texto383} FORMTEXT }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid1';
    wwv_flow_api.g_varchar2_table(875) := '0240608 '||wwv_flow.LF||
'{\*\datafield 800100000000000008546578746f3338330002472000000000000f3c3f7265663a78646f30303';
    wwv_flow_api.g_varchar2_table(876) := '4323f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto383}{\*\ffdef';
    wwv_flow_api.g_varchar2_table(877) := 'text G }{\*\ffstattext <?ref:xdo0042?>}}}}}{\fldrslt {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe';
    wwv_flow_api.g_varchar2_table(878) := '1024\noproof\insrsid10240608 G }}}\sectd \ltrsect\lndscpsxn\linex0\headery708\footery708\colsx708\en';
    wwv_flow_api.g_varchar2_table(879) := 'dnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\*\bkmkend Texto383}{\field\flddirty{\*';
    wwv_flow_api.g_varchar2_table(880) := '\fldinst {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 {\*\bkmkstart Texto384} FORMTEXT }{\rtlch\f';
    wwv_flow_api.g_varchar2_table(881) := 'cs1 \af0 \ltrch\fcs0 \insrsid10240608 {\*\datafield 800900000000000008546578746f33383400053939393030';
    wwv_flow_api.g_varchar2_table(882) := '0001300000000f3c3f7265663a78646f303034333f3e0000000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownstat\f';
    wwv_flow_api.g_varchar2_table(883) := 'ftypetxt1{\*\ffname Texto384}{\*\ffdeftext 99900}{\*\ffformat 0}{\*\ffstattext <?ref:xdo0043?>}}}}}{';
    wwv_flow_api.g_varchar2_table(884) := '\fldrslt {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid10240608 99900}}}\sectd \';
    wwv_flow_api.g_varchar2_table(885) := 'ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sect';
    wwv_flow_api.g_varchar2_table(886) := 'rsid8529128\sftnbj {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 {\*\bkmkend Texto384}\cell }{\fiel';
    wwv_flow_api.g_varchar2_table(887) := 'd\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 '||wwv_flow.LF||
'\insrsid10240608 {\*\bkmkstart Texto385} FORMTE';
    wwv_flow_api.g_varchar2_table(888) := 'XT }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid10240608 {\*\datafield 800900000000000008546578746f3338350';
    wwv_flow_api.g_varchar2_table(889) := '00539393930300001300000000f3c3f7265663a78646f303034343f3e0000000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhel';
    wwv_flow_api.g_varchar2_table(890) := 'p\ffownstat\fftypetxt1{\*\ffname Texto385}{\*\ffdeftext 99900}{\*\ffformat 0}{\*\ffstattext <?ref:xd';
    wwv_flow_api.g_varchar2_table(891) := 'o0044?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1024\noproof\insrsid10240608 999';
    wwv_flow_api.g_varchar2_table(892) := '00}}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectd';
    wwv_flow_api.g_varchar2_table(893) := 'efaultcl\sectrsid8529128\sftnbj {\*\bkmkend Texto385}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0 \';
    wwv_flow_api.g_varchar2_table(894) := 'ltrch\fcs0 \insrsid10240608 {\*\bkmkstart Texto386} FORMTEXT }{\rtlch\fcs1 '||wwv_flow.LF||
'\af0 \ltrch\fcs0 \insrsi';
    wwv_flow_api.g_varchar2_table(895) := 'd10240608 {\*\datafield 800100000000000008546578746f3338360002452000000000000f3c3f7265663a78646f3030';
    wwv_flow_api.g_varchar2_table(896) := '34353f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto386}{\*\ffde';
    wwv_flow_api.g_varchar2_table(897) := 'ftext E }{\*\ffstattext '||wwv_flow.LF||
'<?ref:xdo0045?>}}}}}{\fldrslt {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langf';
    wwv_flow_api.g_varchar2_table(898) := 'e1024\noproof\insrsid10240608 E }}}\sectd \ltrsect\lndscpsxn\linex0\headery708\footery708\colsx708\e';
    wwv_flow_api.g_varchar2_table(899) := 'ndnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af0 '||wwv_flow.LF||
'\ltrch\fcs0 \insrsid';
    wwv_flow_api.g_varchar2_table(900) := '10240608 {\*\bkmkend Texto386}\cell }\pard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\intbl\w';
    wwv_flow_api.g_varchar2_table(901) := 'rapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0 {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid102406';
    wwv_flow_api.g_varchar2_table(902) := '08 '||wwv_flow.LF||
'\trowd \irow3\irowband3\lastrow \ltrrow\ts11\trgaph70\trleft-70\trbrdrt\brdrs\brdrw10 \trbrdrl\b';
    wwv_flow_api.g_varchar2_table(903) := 'rdrs\brdrw10 \trbrdrb\brdrs\brdrw10 \trbrdrr\brdrs\brdrw10 \trbrdrh\brdrs\brdrw10 \trbrdrv\brdrs\brd';
    wwv_flow_api.g_varchar2_table(904) := 'rw10 '||wwv_flow.LF||
'\trftsWidth1\trftsWidthB3\trpaddl70\trpaddr70\trpaddfl3\trpaddfr3\tblrsid10240608\tbllkhdrrows';
    wwv_flow_api.g_varchar2_table(905) := '\tblind0\tblindtype3 \clvertalt\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 ';
    wwv_flow_api.g_varchar2_table(906) := '\clbrdrr\brdrs\brdrw10 '||wwv_flow.LF||
'\clcbpat22\cltxlrtb\clftsWidth3\clwWidth1440\clcbpatraw22 \cellx1370\clverta';
    wwv_flow_api.g_varchar2_table(907) := 'lt\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbp';
    wwv_flow_api.g_varchar2_table(908) := 'at23\cltxlrtb\clftsWidth3\clwWidth1440\clcbpatraw23 \cellx2810\clvertalt'||wwv_flow.LF||
'\clbrdrt\brdrs\brdrw10 \clb';
    wwv_flow_api.g_varchar2_table(909) := 'rdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat23\cltxlrtb\clftsWidth3\clw';
    wwv_flow_api.g_varchar2_table(910) := 'Width1440\clcbpatraw23 \cellx4250\row }\pard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\wrap';
    wwv_flow_api.g_varchar2_table(911) := 'default\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsid6379667 {\rtlch\fcs1 \af0 \ltrch\';
    wwv_flow_api.g_varchar2_table(912) := 'fcs0 \lbr3\insrsid8529128 \line }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid13642079                     ';
    wwv_flow_api.g_varchar2_table(913) := '                    }{\rtlch\fcs1 \af0 '||wwv_flow.LF||
'\ltrch\fcs0 \insrsid7745749\charrsid11081629 '||wwv_flow.LF||
'\par }{\rtlch\';
    wwv_flow_api.g_varchar2_table(914) := 'fcs1 \af0 \ltrch\fcs0 \cf9\insrsid10964758 '||wwv_flow.LF||
'\par }{\rtlch\fcs1 \af0 \ltrch\fcs0 \cf9\insrsid11108010';
    wwv_flow_api.g_varchar2_table(915) := ' '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par }{\rtlch\fcs1 \af0 \ltrch\fcs0 \cf9\insrsid4460837 '||wwv_flow.LF||
'\par }\pard \ltrpar\qc \li0\ri0\sa1';
    wwv_flow_api.g_varchar2_table(916) := '60\sl259\slmult1\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsid12';
    wwv_flow_api.g_varchar2_table(917) := '206928 {\rtlch\fcs1 \af0 \ltrch\fcs0 \cf9\insrsid3237274 '||wwv_flow.LF||
'\par }\pard \ltrpar\ql \li0\ri0\sa160\sl25';
    wwv_flow_api.g_varchar2_table(918) := '9\slmult1\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsid6379667 {';
    wwv_flow_api.g_varchar2_table(919) := '\rtlch\fcs1 \af0 \ltrch\fcs0 \cf9\insrsid3237274 '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par }\pard \ltrpar\';
    wwv_flow_api.g_varchar2_table(920) := 'ql \li0\ri0\sa160\sl259\slmult1\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\i';
    wwv_flow_api.g_varchar2_table(921) := 'tap0\pararsid475731 {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid12603670 {\*\bkmkend Texto187}   }{\rtlch\';
    wwv_flow_api.g_varchar2_table(922) := 'fcs1 \af0\afs16 \ltrch\fcs0 '||wwv_flow.LF||
'\b\fs16\insrsid475731 <?template:footer?>'||wwv_flow.LF||
'\par \ltrrow}\trowd \irow0\ir';
    wwv_flow_api.g_varchar2_table(923) := 'owband0\lastrow \ltrrow\ts17\trqc\trgaph108\trleft-108\trftsWidth1\trftsWidthB3\trautofit1\trpaddl10';
    wwv_flow_api.g_varchar2_table(924) := '8\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid475731\tbllkhdrrows\tbllkhdrcols\tbllkno';
    wwv_flow_api.g_varchar2_table(925) := 'colband\tblind0\tblindtype3 '||wwv_flow.LF||
'\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\b';
    wwv_flow_api.g_varchar2_table(926) := 'rdrtbl \cltxlrtb\clftsWidth3\clwWidth4077\clshdrawnil\clhidemark \cellx3969\clvertalc\clbrdrt\brdrtb';
    wwv_flow_api.g_varchar2_table(927) := 'l \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl '||wwv_flow.LF||
'\cltxlrtb\clftsWidth3\clwWidth2906\clshdrawnil';
    wwv_flow_api.g_varchar2_table(928) := '\clhidemark \cellx6875\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl ';
    wwv_flow_api.g_varchar2_table(929) := '\cltxlrtb\clftsWidth3\clwWidth2552\clshdrawnil\clhidemark \cellx9427\clvertalc\clbrdrt\brdrtbl \clbr';
    wwv_flow_api.g_varchar2_table(930) := 'drl'||wwv_flow.LF||
'\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1560\clshdrawnil\clhide';
    wwv_flow_api.g_varchar2_table(931) := 'mark \cellx10987\pard\plain \ltrpar\s18\qc \li0\ri0\widctlpar\intbl'||wwv_flow.LF||
'\tx2535\tqc\tx4419\tqr\tx8838\wr';
    wwv_flow_api.g_varchar2_table(932) := 'apdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\yts17 \rtlch\fcs1 \af0\afs20\alang1025 \ltrch';
    wwv_flow_api.g_varchar2_table(933) := '\fcs0 \fs20\lang9226\langfe1033\loch\af31506\hich\af31506\dbch\af31505\cgrid\langnp9226\langfenp1033';
    wwv_flow_api.g_varchar2_table(934) := ' {\rtlch\fcs1 '||wwv_flow.LF||
'\af0\afs16 \ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrsid475731 \hich\af315';
    wwv_flow_api.g_varchar2_table(935) := '06\dbch\af31505\loch\f31506 \hich\f31506 Elabor\''f3\loch\f31506 : {\*\bkmkstart Texto332}}{\field\fl';
    wwv_flow_api.g_varchar2_table(936) := 'ddirty{\*\fldinst {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 '||wwv_flow.LF||
'\fs16\lang3082\langfe1033\langnp3082\insrsid1';
    wwv_flow_api.g_varchar2_table(937) := '0494215\charrsid10494215 \hich\af31506\dbch\af31505\loch\f31506  FORMTEXT }{\rtlch\fcs1 \af0\afs16 \';
    wwv_flow_api.g_varchar2_table(938) := 'ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrsid10494215\charrsid10494215 {\*\datafield '||wwv_flow.LF||
'8001';
    wwv_flow_api.g_varchar2_table(939) := '00000000000008546578746f33333200075553554152494f00000000000f3c3f7265663a78646f303031383f3e0000000000';
    wwv_flow_api.g_varchar2_table(940) := '}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto332}{\*\ffdeftext USUARIO}{\*\';
    wwv_flow_api.g_varchar2_table(941) := 'ffstattext <?ref:xdo0018?>}}}}}{\fldrslt {'||wwv_flow.LF||
'\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang1024\langfe1';
    wwv_flow_api.g_varchar2_table(942) := '024\noproof\langnp3082\insrsid10494215\charrsid10494215 \hich\af31506\dbch\af31505\loch\f31506 USUAR';
    wwv_flow_api.g_varchar2_table(943) := 'IO}}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectd';
    wwv_flow_api.g_varchar2_table(944) := 'efaultcl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang3082\langfe1033\langnp';
    wwv_flow_api.g_varchar2_table(945) := '3082\insrsid475731 {\*\bkmkend Texto332}\cell }\pard \ltrpar'||wwv_flow.LF||
'\s18\qc \li0\ri0\widctlpar\intbl\tqc\tx';
    wwv_flow_api.g_varchar2_table(946) := '4419\tqr\tx8838\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\yts17 {\rtlch\fcs1 \af0\afs';
    wwv_flow_api.g_varchar2_table(947) := '16 \ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrsid475731 \hich\af31506\dbch\af31505\loch\f3';
    wwv_flow_api.g_varchar2_table(948) := '1506 Fecha: '||wwv_flow.LF||
'{\*\bkmkstart Texto333}}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0';
    wwv_flow_api.g_varchar2_table(949) := ' \fs16\lang3082\langfe1033\langnp3082\insrsid10494215\charrsid10494215 \hich\af31506\dbch\af31505\lo';
    wwv_flow_api.g_varchar2_table(950) := 'ch\f31506  FORMTEXT }{\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 '||wwv_flow.LF||
'\fs16\lang3082\langfe1033\langnp3082\insrs';
    wwv_flow_api.g_varchar2_table(951) := 'id10494215\charrsid10494215 {\*\datafield 800100000000000008546578746f3333330003484f5900000000000f3c';
    wwv_flow_api.g_varchar2_table(952) := '3f7265663a78646f303031393f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffna';
    wwv_flow_api.g_varchar2_table(953) := 'me Texto333}'||wwv_flow.LF||
'{\*\ffdeftext HOY}{\*\ffstattext <?ref:xdo0019?>}}}}}{\fldrslt {\rtlch\fcs1 \af0\afs16 ';
    wwv_flow_api.g_varchar2_table(954) := '\ltrch\fcs0 \fs16\lang1024\langfe1024\noproof\langnp3082\insrsid10494215\charrsid10494215 \hich\af31';
    wwv_flow_api.g_varchar2_table(955) := '506\dbch\af31505\loch\f31506 HOY}}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\footery708\colsx708\';
    wwv_flow_api.g_varchar2_table(956) := 'endnhere\sectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \f';
    wwv_flow_api.g_varchar2_table(957) := 's16\lang3082\langfe1033\langnp3082\insrsid475731 {\*\bkmkend Texto333}\cell '||wwv_flow.LF||
'\hich\af31506\dbch\af31';
    wwv_flow_api.g_varchar2_table(958) := '505\loch\f31506 \hich\f31506 IP Imprimi\''f3\loch\f31506 : {\*\bkmkstart Texto334}}{\field\flddirty{\';
    wwv_flow_api.g_varchar2_table(959) := '*\fldinst {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrsid10494215\c';
    wwv_flow_api.g_varchar2_table(960) := 'harrsid10494215 '||wwv_flow.LF||
'\hich\af31506\dbch\af31505\loch\f31506  FORMTEXT }{\rtlch\fcs1 \af0\afs16 \ltrch\fc';
    wwv_flow_api.g_varchar2_table(961) := 's0 \fs16\lang3082\langfe1033\langnp3082\insrsid10494215\charrsid10494215 {\*\datafield '||wwv_flow.LF||
'800100000000';
    wwv_flow_api.g_varchar2_table(962) := '000008546578746f333334000649504144445200000000000f3c3f7265663a78646f303032303f3e0000000000}{\*\formf';
    wwv_flow_api.g_varchar2_table(963) := 'ield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto334}{\*\ffdeftext IPADDR}{\*\ffstattext ';
    wwv_flow_api.g_varchar2_table(964) := '<?ref:xdo0020?>}}}}}{\fldrslt {\rtlch\fcs1 '||wwv_flow.LF||
'\af0\afs16 \ltrch\fcs0 \fs16\lang1024\langfe1024\noproof';
    wwv_flow_api.g_varchar2_table(965) := '\langnp3082\insrsid10494215\charrsid10494215 \hich\af31506\dbch\af31505\loch\f31506 IPADDR}}}\sectd ';
    wwv_flow_api.g_varchar2_table(966) := '\ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sec';
    wwv_flow_api.g_varchar2_table(967) := 'trsid8529128\sftnbj {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrsid';
    wwv_flow_api.g_varchar2_table(968) := '475731 {\*\bkmkend Texto334}\cell '||wwv_flow.LF||
'\hich\af31506\dbch\af31505\loch\f31506 \hich\f31506 P\''e1\loch\f3';
    wwv_flow_api.g_varchar2_table(969) := '1506 gina }{\field\fldedit{\*\fldinst {\rtlch\fcs1 \ab\af0\afs16 \ltrch\fcs0 \b\fs16\insrsid475731 \';
    wwv_flow_api.g_varchar2_table(970) := 'hich\af31506\dbch\af31505\loch\f31506 PAGE}}{\fldrslt {\rtlch\fcs1 \ab\af0\afs16 '||wwv_flow.LF||
'\ltrch\fcs0 \b\fs1';
    wwv_flow_api.g_varchar2_table(971) := '6\lang1024\langfe1024\noproof\insrsid475731 \hich\af31506\dbch\af31505\loch\f31506 1}}}\sectd \ltrse';
    wwv_flow_api.g_varchar2_table(972) := 'ct\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid85';
    wwv_flow_api.g_varchar2_table(973) := '29128\sftnbj {\rtlch\fcs1 \af0\afs16 '||wwv_flow.LF||
'\ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrsid475731';
    wwv_flow_api.g_varchar2_table(974) := ' \hich\af31506\dbch\af31505\loch\f31506  de }{\field\fldedit{\*\fldinst {\rtlch\fcs1 \ab\af0\afs16 \';
    wwv_flow_api.g_varchar2_table(975) := 'ltrch\fcs0 \b\fs16\insrsid475731 \hich\af31506\dbch\af31505\loch\f31506 NUMPAGES}}{\fldrslt {'||wwv_flow.LF||
'\rtlch';
    wwv_flow_api.g_varchar2_table(976) := '\fcs1 \ab\af0\afs16 \ltrch\fcs0 \b\fs16\lang1024\langfe1024\noproof\insrsid475731 \hich\af31506\dbch';
    wwv_flow_api.g_varchar2_table(977) := '\af31505\loch\f31506 1}}}\sectd \ltrsect'||wwv_flow.LF||
'\lndscpsxn\linex0\headery708\footery708\colsx708\endnhere\s';
    wwv_flow_api.g_varchar2_table(978) := 'ectlinegrid360\sectdefaultcl\sectrsid8529128\sftnbj {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsi';
    wwv_flow_api.g_varchar2_table(979) := 'd475731 \cell }\pard\plain \ltrpar\ql \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\wrapdefault\aspa';
    wwv_flow_api.g_varchar2_table(980) := 'lpha\aspnum\faauto\adjustright\rin0\lin0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\l';
    wwv_flow_api.g_varchar2_table(981) := 'ang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af37 \ltrch\fcs0 '||wwv_flow.LF||
'\lang9226\langfe922';
    wwv_flow_api.g_varchar2_table(982) := '6\langfenp9226\insrsid7097672 \trowd \irow0\irowband0\lastrow \ltrrow'||wwv_flow.LF||
'\ts17\trqc\trgaph108\trleft-10';
    wwv_flow_api.g_varchar2_table(983) := '8\trftsWidth1\trftsWidthB3\trautofit1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\';
    wwv_flow_api.g_varchar2_table(984) := 'tblrsid475731\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind0\tblindtype3 \clvertalc\clbrdrt\brdrtb';
    wwv_flow_api.g_varchar2_table(985) := 'l \clbrdrl\brdrtbl '||wwv_flow.LF||
'\clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth4077\clshdrawnil';
    wwv_flow_api.g_varchar2_table(986) := '\clhidemark \cellx3969\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl ';
    wwv_flow_api.g_varchar2_table(987) := '\cltxlrtb\clftsWidth3\clwWidth2906\clshdrawnil\clhidemark \cellx6875'||wwv_flow.LF||
'\clvertalc\clbrdrt\brdrtbl \clb';
    wwv_flow_api.g_varchar2_table(988) := 'rdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2552\clshdrawnil\clhide';
    wwv_flow_api.g_varchar2_table(989) := 'mark \cellx9427\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl '||wwv_flow.LF||
'\cltxl';
    wwv_flow_api.g_varchar2_table(990) := 'rtb\clftsWidth3\clwWidth1560\clshdrawnil\clhidemark \cellx10987\row }\pard \ltrpar\ql \li0\ri0\sa160';
    wwv_flow_api.g_varchar2_table(991) := '\sl259\slmult1\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 {\rtlch\fcs1';
    wwv_flow_api.g_varchar2_table(992) := ' \af0\afs16 \ltrch\fcs0 \b\fs16\insrsid475731 '||wwv_flow.LF||
'<?end template?>}{\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 ';
    wwv_flow_api.g_varchar2_table(993) := '\b\fs16\insrsid1527012 '||wwv_flow.LF||
'\par }\pard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\wrapdefault\as';
    wwv_flow_api.g_varchar2_table(994) := 'palpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsid12989215 {\rtlch\fcs1 \af0 \ltrch\fcs0 \ins';
    wwv_flow_api.g_varchar2_table(995) := 'rsid12989215 '||wwv_flow.LF||
'\par }\pard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\tx1080\wrapdefault\aspal';
    wwv_flow_api.g_varchar2_table(996) := 'pha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsid538843 {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid1';
    wwv_flow_api.g_varchar2_table(997) := '0959449\charrsid10959449 '||wwv_flow.LF||
'\par }{\*\themedata 504b030414000600080000002100e9de0fbfff0000001c02000013';
    wwv_flow_api.g_varchar2_table(998) := '0000005b436f6e74656e745f54797065735d2e786d6cac91cb4ec3301045f748fc83e52d4a'||wwv_flow.LF||
'9cb2400825e982c78ec7a27cc';
    wwv_flow_api.g_varchar2_table(999) := '0c8992416c9d8b2a755fbf74cd25442a820166c2cd933f79e3be372bd1f07b5c3989ca74aaff2422b24eb1b475da5df374fd';
    wwv_flow_api.g_varchar2_table(1000) := '9ad'||wwv_flow.LF||
'5689811a183c61a50f98f4babebc2837878049899a52a57be670674cb23d8e90721f90a4d2fa3802cb35762680fd800e';
null;
end;
/
begin
    wwv_flow_api.g_varchar2_table(1001) := 'cd7551dc18eb899138e3c943d7e503b6'||wwv_flow.LF||
'b01d583deee5f99824e290b4ba3f364eac4a430883b3c092d4eca8f946c916422ec';
    wwv_flow_api.g_varchar2_table(1002) := 'ab927f52ea42b89a1cd59c254f919b0e85e6535d135a8de20f20b8c12c3b0'||wwv_flow.LF||
'0c895fcf6720192de6bf3b9e89ecdbd6596cbc';
    wwv_flow_api.g_varchar2_table(1003) := 'dd8eb28e7c365ecc4ec1ff1460f53fe813d3cc7f5b7f020000ffff0300504b030414000600080000002100a5d6'||wwv_flow.LF||
'a7e7c0000';
    wwv_flow_api.g_varchar2_table(1004) := '000360100000b0000005f72656c732f2e72656c73848fcf6ac3300c87ef85bd83d17d51d2c31825762fa590432fa37d00e12';
    wwv_flow_api.g_varchar2_table(1005) := '87f68221bdb1bebdb4f'||wwv_flow.LF||
'c7060abb0884a4eff7a93dfeae8bf9e194e720169aaa06c3e2433fcb68e1763dbf7f82c985a4a725';
    wwv_flow_api.g_varchar2_table(1006) := '085b787086a37bdbb55fbc50d1a33ccd311ba548b6309512'||wwv_flow.LF||
'0f88d94fbc52ae4264d1c910d24a45db3462247fa791715fd71';
    wwv_flow_api.g_varchar2_table(1007) := 'f989e19e0364cd3f51652d73760ae8fa8c9ffb3c330cc9e4fc17faf2ce545046e37944c69e462'||wwv_flow.LF||
'a1a82fe353bd90a865aad4';
    wwv_flow_api.g_varchar2_table(1008) := '1ed0b5b8f9d6fd010000ffff0300504b0304140006000800000021006b799616830000008a0000001c0000007468656d652f';
    wwv_flow_api.g_varchar2_table(1009) := '746865'||wwv_flow.LF||
'6d652f7468656d654d616e616765722e786d6c0ccc4d0ac3201040e17da17790d93763bb284562b2cbaebbf600439';
    wwv_flow_api.g_varchar2_table(1010) := 'c1a41c7a0d29fdbd7e5e38337cedf14d59b'||wwv_flow.LF||
'4b0d592c9c070d8a65cd2e88b7f07c2ca71ba8da481cc52c6ce1c715e6e97818';
    wwv_flow_api.g_varchar2_table(1011) := 'c9b48d13df49c873517d23d59085adb5dd20d6b52bd521ef2cdd5eb9246a3d8b'||wwv_flow.LF||
'4757e8d3f729e245eb2b260a0238fd01000';
    wwv_flow_api.g_varchar2_table(1012) := '0ffff0300504b030414000600080000002100a7259ef29c070000cb200000160000007468656d652f7468656d652f'||wwv_flow.LF||
'746865';
    wwv_flow_api.g_varchar2_table(1013) := '6d65312e786d6cec59cd8b1bc915bf07f23f347d97f5d5ad8fc1f2a24fcfda33b6b164873dd648a5eef2547789aad28cc562';
    wwv_flow_api.g_varchar2_table(1014) := '08de532e81c026e49085bd'||wwv_flow.LF||
'ed21842cecc22eb9e48f31d8249b3f22afaa5bdd5552c99e191c3061463074977eefd5afde7bf';
    wwv_flow_api.g_varchar2_table(1015) := '5de53d5ddcf5e26d4bbc05c1096f6fcfa9d9aefe174ce16248d'||wwv_flow.LF||
'7afeb3d9a4d2f13d2151ba4094a5b8e76fb0f03fbbf7eb5f';
    wwv_flow_api.g_varchar2_table(1016) := 'dd454732c609f6403e1547a8e7c752ae8eaa5531876124eeb0154ee1bb25e30992f0caa3ea82a34b'||wwv_flow.LF||
'd09bd06aa3566b55134';
    wwv_flow_api.g_varchar2_table(1017) := '452df4b51026a6720e32db0f778b92473ecdfdbaa1f53982395420dcc299f2ae5389731b08bf3ba42888d1852ee5d20daf36';
    wwv_flow_api.g_varchar2_table(1018) := '1a605bb9c'||wwv_flow.LF||
'e197d2f7281212bee8f935fde757efddada2a35c88ca03b286dc44ffe572b9c0e2bca1e7e4d1593169108441ab';
    wwv_flow_api.g_varchar2_table(1019) := '5fe8d7002af771e3f6b8356e15fa3400cde7b0'||wwv_flow.LF||
'd28c8badb3dd180639d600658f0edda3f6a859b7f086fee61ee77ea83e165';
    wwv_flow_api.g_varchar2_table(1020) := 'e8332fdc11e7e321982152dbc0665f8700f1f0eba8391ad5f83327c6b0fdfaef547'||wwv_flow.LF||
'41dbd2af413125e9f91eba16b69ac3ed';
    wwv_flow_api.g_varchar2_table(1021) := '6a0bc892d16327bc1b06937623575ea2201a8ae852532c592a0fc55a825e303e018002522449eac9cd0a2fd11ce27888'||wwv_flow.LF||
'283';
    wwv_flow_api.g_varchar2_table(1022) := '9e3c43b21510c81b7422913305c6bd426b526fc579f403f698fa2238c0c69c50b9888bd21c5c713734e56b2e73f00adbe017';
    wwv_flow_api.g_varchar2_table(1023) := '9fbf3cf6f5efff8e6f54f6fbe'||wwv_flow.LF||
'faeacdebbfe7736b5596dc314a2353ee97effef09f6f7eebfdfb876f7ff9fa8fd9d4bb7861';
    wwv_flow_api.g_varchar2_table(1024) := 'e2dffded77effef1cff7a9871597a678fba7efdffdf8fddb3ffffe'||wwv_flow.LF||
'5f7ffddaa1bdcfd199099f91040bef11bef49eb20416e';
    wwv_flow_api.g_varchar2_table(1025) := '8e08fcff8f524663122a6443f8d044a919ac5a17f2c630bfd68832872e006d8b6e3730ea9c605bcbf7e'||wwv_flow.LF||
'61119ec67c2d8943';
    wwv_flow_api.g_varchar2_table(1026) := 'e3c338b180a78cd101e34e2b3c547319669eadd3c83d395f9bb8a7085db8e61ea2d4f2f278bd821c4b5c2a8731b6683ea128';
    wwv_flow_api.g_varchar2_table(1027) := '9528c229969e'||wwv_flow.LF||
'fa8e9d63ec58dd178458763d2573ce045b4aef0be20d10719a6446ceac682a858e49027ed9b80882bf2ddb9';
    wwv_flow_api.g_varchar2_table(1028) := 'c3ef7068cba563dc2173612f606a20ef2334c2d33'||wwv_flow.LF||
'de476b891297ca194aa869f013246317c9e986cf4ddc5848f0748429f3';
    wwv_flow_api.g_varchar2_table(1029) := 'c60b2c844be63187f51a4e7f0869c6edf653ba496c2497e4dca5f30431662247ec7c18'||wwv_flow.LF||
'a364e5c24e491a9bd8cfc5398428f';
    wwv_flow_api.g_varchar2_table(1030) := '29e30e9829f327b87a877f0034a0fbafb39c196bb3f9c0d9e418635299501a2be5973872fef6366c5ef74439708bb524d9f'||wwv_flow.LF||
'';
    wwv_flow_api.g_varchar2_table(1031) := '27568aed73e28c8ec13ab242fb04638a2ed10263efd9e70e0603b6b26c5e927e10435639c6aec07a80ec5855ef2916d8d3cd';
    wwv_flow_api.g_varchar2_table(1032) := 'cd7e9e3c21c20ad9298ed8013ea7'||wwv_flow.LF||
'9b9dc4b3416982f821cd8fc0eba6cdc750ea1257003ca6f37313f888401708f1e234ca6';
    wwv_flow_api.g_varchar2_table(1033) := '3013a8ce03ea8f5498cac02a6de853b5e37dcf2df55f618eccb17168d'||wwv_flow.LF||
'2bec4b90c1d79681c46ecabcd7363344ad09ca8099';
    wwv_flow_api.g_varchar2_table(1034) := '21e8325ce916442cf79722aab86ab1b5536e696fdad20dd01d594d4f42d20f76403bbd4ff8bfeb7da0c378'||wwv_flow.LF||
'fb976f1c9bede';
    wwv_flow_api.g_varchar2_table(1035) := '3f43b6ec556b2ba66a77328991ceff4378770bb5dcd90f105f9f49b9a115aa74f30d491fd8c75dbd3dcf634feff7d4f73683';
    wwv_flow_api.g_varchar2_table(1036) := 'fdf763287fa8ddb'||wwv_flow.LF||
'4ec6870ee3b693c90f573e4e2753362fd0d7a8038feca0471ffb24074f7d9684d2a9dc507c22f4c18f80';
    wwv_flow_api.g_varchar2_table(1037) := 'df338b090c2a397de6898b53c0550c8faaccc104162e'||wwv_flow.LF||
'e248cb789cc9df10194f63b482d3a1baaf944422571d096fc5041c1';
    wwv_flow_api.g_varchar2_table(1038) := 'ae961a76e85a7ebe4942db2c3ce7a5d1d6c66955520598ed7c2621c0eaa64866eb5cb03bc'||wwv_flow.LF||
'42bd661be983d62d01257b1d12';
    wwv_flow_api.g_varchar2_table(1039) := 'c6643689a683447b3ba88ca48f75c1680e127a651f8545d7c1a2a3d46f5db5c702a8155e811fdc1efc4ceff96100222004e7';
    wwv_flow_api.g_varchar2_table(1040) := '71'||wwv_flow.LF||
'd09c2f949f32576fbdab9df9313d7dc89856044083bd8d80d2d35dc5f5e0f2d4eab250bb82a72d1246b8d924b46574832';
    wwv_flow_api.g_varchar2_table(1041) := '762f8199c47a71abd0a8debfaba5bba'||wwv_flow.LF||
'd4a2a74ca1e783d02a69b43bef6371535f83dc6e6ea0a9992968ea5df6fc56338490';
    wwv_flow_api.g_varchar2_table(1042) := '99a355cf5fc2a1313c262b881da17e73211ac1ddcb5cf26cc3df24b3acb8'||wwv_flow.LF||
'902324e2cce03ae964d9202112738f92a4e7abe';
    wwv_flow_api.g_varchar2_table(1043) := '5176ea0a9ce219a5bbd0109e19325d785b4f2a99103a7db4ec6cb259e4bd3edc688b274f60a193ecb15ce6fb5'||wwv_flow.LF||
'f8cdc14a92';
    wwv_flow_api.g_varchar2_table(1044) := 'adc1ddd37871e99dd1357f8a20c4c2765d19704104dc1dd4336b2e085c861589ac8cbf9dc294a75df3364ac750368ee82a46';
    wwv_flow_api.g_varchar2_table(1045) := '794531937906d7a9bc'||wwv_flow.LF||
'a0a3df0a1b186ff99ac1a08649f2427816a9026b1ad5aaa645d5c8381cacba1f1652963392665933a';
    wwv_flow_api.g_varchar2_table(1046) := 'daca2aaa63b8b59336ccbc08e2d6f56e40d565b13434e33'||wwv_flow.LF||
'2b7c96ba77536e779beb76fa84a24a80c10bfb39aaee150a8241';
    wwv_flow_api.g_varchar2_table(1047) := 'ad9ccca2a618efa76195b3f351bb766c17f8016a57291246d66f6dd5eed8ada811cee960f046'||wwv_flow.LF||
'951fe476a3168696dbbe525';
    wwv_flow_api.g_varchar2_table(1048) := 'b5adf9b9b17dbecec05248f1174b96b2a8576255c5b73040dd154f72459da802df252e65b039ebc35273dffcb5ad80f868d7';
    wwv_flow_api.g_varchar2_table(1049) := '058a9'||wwv_flow.LF||
'75c271256806b54a27ec372bfd306cd6c761bd361a345e41619171520fb33bfb095c60d04d7e73afc7f76eef93ed1d';
    wwv_flow_api.g_varchar2_table(1050) := 'cd9d394baa4cdfca5735717d7b5f6f58b7'||wwv_flow.LF||
'f7d94dbc375397f3be4720e97cd96a4cbacdeea055e936fb934a301a742add616';
    wwv_flow_api.g_varchar2_table(1051) := 'b5019b586edd164340c3bddc92bdfbbd0e0a0df1c06ad71a7d2aa0f8795a055'||wwv_flow.LF||
'53f43bdd4a3b6834fa41bbdf1907fd57791b';
    wwv_flow_api.g_varchar2_table(1052) := '032bcfd2476e0b30afe675efbf000000ffff0300504b0304140006000800000021000dd1909fb60000001b010000'||wwv_flow.LF||
'2700000';
    wwv_flow_api.g_varchar2_table(1053) := '07468656d652f7468656d652f5f72656c732f7468656d654d616e616765722e786d6c2e72656c73848f4d0ac2301484f7827';
    wwv_flow_api.g_varchar2_table(1054) := '7086f6fd3ba109126dd88'||wwv_flow.LF||
'd0add40384e4350d363f2451eced0dae2c082e8761be9969bb979dc9136332de3168aa1a083ae9';
    wwv_flow_api.g_varchar2_table(1055) := '95719ac16db8ec8e4052164e89d93b64b060828e6f37ed1567'||wwv_flow.LF||
'914b284d262452282e3198720e274a939cd08a54f980ae38a';
    wwv_flow_api.g_varchar2_table(1056) := '38f56e422a3a641c8bbd048f7757da0f19b017cc524bd62107bd5001996509affb3fd381a89672f'||wwv_flow.LF||
'1f165dfe514173d98505';
    wwv_flow_api.g_varchar2_table(1057) := '28a2c6cce0239baa4c04ca5bbabac4df000000ffff0300504b01022d0014000600080000002100e9de0fbfff0000001c0200';
    wwv_flow_api.g_varchar2_table(1058) := '00130000'||wwv_flow.LF||
'0000000000000000000000000000005b436f6e74656e745f54797065735d2e786d6c504b01022d0014000600080';
    wwv_flow_api.g_varchar2_table(1059) := '000002100a5d6a7e7c0000000360100000b00'||wwv_flow.LF||
'000000000000000000000000300100005f72656c732f2e72656c73504b0102';
    wwv_flow_api.g_varchar2_table(1060) := '2d00140006000800000021006b799616830000008a0000001c0000000000000000'||wwv_flow.LF||
'0000000000190200007468656d652f746';
    wwv_flow_api.g_varchar2_table(1061) := '8656d652f7468656d654d616e616765722e786d6c504b01022d0014000600080000002100a7259ef29c070000cb2000'||wwv_flow.LF||
'0016';
    wwv_flow_api.g_varchar2_table(1062) := '00000000000000000000000000d60200007468656d652f7468656d652f7468656d65312e786d6c504b01022d001400060008';
    wwv_flow_api.g_varchar2_table(1063) := '00000021000dd1909fb60000'||wwv_flow.LF||
'001b0100002700000000000000000000000000a60a00007468656d652f7468656d652f5f726';
    wwv_flow_api.g_varchar2_table(1064) := '56c732f7468656d654d616e616765722e786d6c2e72656c73504b050600000000050005005d010000a10b00000000}'||wwv_flow.LF||
'{\*\c';
    wwv_flow_api.g_varchar2_table(1065) := 'olorschememapping 3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d3822207374616e';
    wwv_flow_api.g_varchar2_table(1066) := '64616c6f6e653d22796573223f3e0d0a3c613a636c724d'||wwv_flow.LF||
'617020786d6c6e733a613d22687474703a2f2f736368656d61732';
    wwv_flow_api.g_varchar2_table(1067) := 'e6f70656e786d6c666f726d6174732e6f72672f64726177696e676d6c2f323030362f6d6169'||wwv_flow.LF||
'6e22206267313d226c743122';
    wwv_flow_api.g_varchar2_table(1068) := '207478313d22646b3122206267323d226c743222207478323d22646b322220616363656e74313d22616363656e7431222061';
    wwv_flow_api.g_varchar2_table(1069) := '6363'||wwv_flow.LF||
'656e74323d22616363656e74322220616363656e74333d22616363656e74332220616363656e74343d22616363656e7';
    wwv_flow_api.g_varchar2_table(1070) := '4342220616363656e74353d22616363656e74352220616363656e74363d22616363656e74362220686c696e6b3d22686c696';
    wwv_flow_api.g_varchar2_table(1071) := 'e6b2220666f6c486c696e6b3d22666f6c486c696e6b222f3e}'||wwv_flow.LF||
'{\*\latentstyles\lsdstimax375\lsdlockeddef0\lsdse';
    wwv_flow_api.g_varchar2_table(1072) := 'mihiddendef0\lsdunhideuseddef0\lsdqformatdef0\lsdprioritydef99{\lsdlockedexcept \lsdqformat1 \lsdpri';
    wwv_flow_api.g_varchar2_table(1073) := 'ority0 \lsdlocked0 Normal;\lsdqformat1 \lsdpriority9 \lsdlocked0 heading 1;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhi';
    wwv_flow_api.g_varchar2_table(1074) := 'deused1 \lsdqformat1 \lsdpriority9 \lsdlocked0 heading 2;\lsdsemihidden1 \lsdunhideused1 \lsdqformat';
    wwv_flow_api.g_varchar2_table(1075) := '1 \lsdpriority9 \lsdlocked0 heading 3;\lsdsemihidden1 \lsdunhideused1 \lsdqformat1 \lsdpriority9 \ls';
    wwv_flow_api.g_varchar2_table(1076) := 'dlocked0 heading 4;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdqformat1 \lsdpriority9 \lsdlocked0 heading 5';
    wwv_flow_api.g_varchar2_table(1077) := ';\lsdsemihidden1 \lsdunhideused1 \lsdqformat1 \lsdpriority9 \lsdlocked0 heading 6;\lsdsemihidden1 \l';
    wwv_flow_api.g_varchar2_table(1078) := 'sdunhideused1 \lsdqformat1 \lsdpriority9 \lsdlocked0 heading 7;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsd';
    wwv_flow_api.g_varchar2_table(1079) := 'qformat1 \lsdpriority9 \lsdlocked0 heading 8;\lsdsemihidden1 \lsdunhideused1 \lsdqformat1 \lsdpriori';
    wwv_flow_api.g_varchar2_table(1080) := 'ty9 \lsdlocked0 heading 9;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 index 1;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdu';
    wwv_flow_api.g_varchar2_table(1081) := 'nhideused1 \lsdlocked0 index 2;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 index 3;\lsdsemihidden1 \';
    wwv_flow_api.g_varchar2_table(1082) := 'lsdunhideused1 \lsdlocked0 index 4;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 index 5;'||wwv_flow.LF||
'\lsdsemihidd';
    wwv_flow_api.g_varchar2_table(1083) := 'en1 \lsdunhideused1 \lsdlocked0 index 6;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 index 7;\lsdsemi';
    wwv_flow_api.g_varchar2_table(1084) := 'hidden1 \lsdunhideused1 \lsdlocked0 index 8;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 index 9;'||wwv_flow.LF||
'\ls';
    wwv_flow_api.g_varchar2_table(1085) := 'dsemihidden1 \lsdunhideused1 \lsdpriority39 \lsdlocked0 toc 1;\lsdsemihidden1 \lsdunhideused1 \lsdpr';
    wwv_flow_api.g_varchar2_table(1086) := 'iority39 \lsdlocked0 toc 2;\lsdsemihidden1 \lsdunhideused1 \lsdpriority39 \lsdlocked0 toc 3;'||wwv_flow.LF||
'\lsdsem';
    wwv_flow_api.g_varchar2_table(1087) := 'ihidden1 \lsdunhideused1 \lsdpriority39 \lsdlocked0 toc 4;\lsdsemihidden1 \lsdunhideused1 \lsdpriori';
    wwv_flow_api.g_varchar2_table(1088) := 'ty39 \lsdlocked0 toc 5;\lsdsemihidden1 \lsdunhideused1 \lsdpriority39 \lsdlocked0 toc 6;'||wwv_flow.LF||
'\lsdsemihid';
    wwv_flow_api.g_varchar2_table(1089) := 'den1 \lsdunhideused1 \lsdpriority39 \lsdlocked0 toc 7;\lsdsemihidden1 \lsdunhideused1 \lsdpriority39';
    wwv_flow_api.g_varchar2_table(1090) := ' \lsdlocked0 toc 8;\lsdsemihidden1 \lsdunhideused1 \lsdpriority39 \lsdlocked0 toc 9;\lsdsemihidden1 ';
    wwv_flow_api.g_varchar2_table(1091) := '\lsdunhideused1 \lsdlocked0 Normal Indent;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 footnote text';
    wwv_flow_api.g_varchar2_table(1092) := ';\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 annotation text;\lsdsemihidden1 \lsdunhideused1 \lsdloc';
    wwv_flow_api.g_varchar2_table(1093) := 'ked0 header;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 footer;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsd';
    wwv_flow_api.g_varchar2_table(1094) := 'locked0 index heading;\lsdsemihidden1 \lsdunhideused1 \lsdqformat1 \lsdpriority35 \lsdlocked0 captio';
    wwv_flow_api.g_varchar2_table(1095) := 'n;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 table of figures;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsd';
    wwv_flow_api.g_varchar2_table(1096) := 'locked0 envelope address;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 envelope return;\lsdsemihidden1';
    wwv_flow_api.g_varchar2_table(1097) := ' \lsdunhideused1 \lsdlocked0 footnote reference;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 annotati';
    wwv_flow_api.g_varchar2_table(1098) := 'on reference;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 line number;\lsdsemihidden1 \lsdunhideused';
    wwv_flow_api.g_varchar2_table(1099) := '1 \lsdlocked0 page number;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 endnote reference;\lsdsemihidd';
    wwv_flow_api.g_varchar2_table(1100) := 'en1 \lsdunhideused1 \lsdlocked0 endnote text;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 table of a';
    wwv_flow_api.g_varchar2_table(1101) := 'uthorities;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 macro;\lsdsemihidden1 \lsdunhideused1 \lsdloc';
    wwv_flow_api.g_varchar2_table(1102) := 'ked0 toa heading;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \';
    wwv_flow_api.g_varchar2_table(1103) := 'lsdlocked0 List Bullet;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Number;\lsdsemihidden1 \lsdu';
    wwv_flow_api.g_varchar2_table(1104) := 'nhideused1 \lsdlocked0 List 2;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List 3;'||wwv_flow.LF||
'\lsdsemihidden1 \l';
    wwv_flow_api.g_varchar2_table(1105) := 'sdunhideused1 \lsdlocked0 List 4;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List 5;\lsdsemihidden1 ';
    wwv_flow_api.g_varchar2_table(1106) := '\lsdunhideused1 \lsdlocked0 List Bullet 2;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Bullet 3;';
    wwv_flow_api.g_varchar2_table(1107) := ''||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Bullet 4;\lsdsemihidden1 \lsdunhideused1 \lsdlocke';
    wwv_flow_api.g_varchar2_table(1108) := 'd0 List Bullet 5;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Number 2;\lsdsemihidden1 \lsdunhid';
    wwv_flow_api.g_varchar2_table(1109) := 'eused1 \lsdlocked0 List Number 3;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Number 4;\lsdsemi';
    wwv_flow_api.g_varchar2_table(1110) := 'hidden1 \lsdunhideused1 \lsdlocked0 List Number 5;\lsdqformat1 \lsdpriority10 \lsdlocked0 Title;\lsd';
    wwv_flow_api.g_varchar2_table(1111) := 'semihidden1 \lsdunhideused1 \lsdlocked0 Closing;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Signatu';
    wwv_flow_api.g_varchar2_table(1112) := 're;\lsdsemihidden1 \lsdunhideused1 \lsdpriority1 \lsdlocked0 Default Paragraph Font;\lsdsemihidden1 ';
    wwv_flow_api.g_varchar2_table(1113) := '\lsdunhideused1 \lsdlocked0 Body Text;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Body Text Indent;'||wwv_flow.LF||
'';
    wwv_flow_api.g_varchar2_table(1114) := '\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Continue;\lsdsemihidden1 \lsdunhideused1 \lsdlocked';
    wwv_flow_api.g_varchar2_table(1115) := '0 List Continue 2;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Continue 3;\lsdsemihidden1 \lsdun';
    wwv_flow_api.g_varchar2_table(1116) := 'hideused1 \lsdlocked0 List Continue 4;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Continue 5;\';
    wwv_flow_api.g_varchar2_table(1117) := 'lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Message Header;\lsdqformat1 \lsdpriority11 \lsdlocked0 Su';
    wwv_flow_api.g_varchar2_table(1118) := 'btitle;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Salutation;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdl';
    wwv_flow_api.g_varchar2_table(1119) := 'ocked0 Date;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Body Text First Indent;\lsdsemihidden1 \lsdu';
    wwv_flow_api.g_varchar2_table(1120) := 'nhideused1 \lsdlocked0 Body Text First Indent 2;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Note Hea';
    wwv_flow_api.g_varchar2_table(1121) := 'ding;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Body Text 2;\lsdsemihidden1 \lsdunhideused1 \lsdlo';
    wwv_flow_api.g_varchar2_table(1122) := 'cked0 Body Text 3;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Body Text Indent 2;\lsdsemihidden1 \ls';
    wwv_flow_api.g_varchar2_table(1123) := 'dunhideused1 \lsdlocked0 Body Text Indent 3;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Block Text;';
    wwv_flow_api.g_varchar2_table(1124) := '\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Hyperlink;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Fo';
    wwv_flow_api.g_varchar2_table(1125) := 'llowedHyperlink;\lsdqformat1 \lsdpriority22 \lsdlocked0 Strong;'||wwv_flow.LF||
'\lsdqformat1 \lsdpriority20 \lsdlock';
    wwv_flow_api.g_varchar2_table(1126) := 'ed0 Emphasis;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Document Map;\lsdsemihidden1 \lsdunhideused';
    wwv_flow_api.g_varchar2_table(1127) := '1 \lsdlocked0 Plain Text;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 E-mail Signature;'||wwv_flow.LF||
'\lsdsemihidde';
    wwv_flow_api.g_varchar2_table(1128) := 'n1 \lsdunhideused1 \lsdlocked0 HTML Top of Form;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 HTML Bot';
    wwv_flow_api.g_varchar2_table(1129) := 'tom of Form;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Normal (Web);\lsdsemihidden1 \lsdunhideused1';
    wwv_flow_api.g_varchar2_table(1130) := ' \lsdlocked0 HTML Acronym;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 HTML Address;\lsdsemihidden1 ';
    wwv_flow_api.g_varchar2_table(1131) := '\lsdunhideused1 \lsdlocked0 HTML Cite;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 HTML Code;\lsdsemi';
    wwv_flow_api.g_varchar2_table(1132) := 'hidden1 \lsdunhideused1 \lsdlocked0 HTML Definition;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 HTM';
    wwv_flow_api.g_varchar2_table(1133) := 'L Keyboard;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 HTML Preformatted;\lsdsemihidden1 \lsdunhideu';
    wwv_flow_api.g_varchar2_table(1134) := 'sed1 \lsdlocked0 HTML Sample;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 HTML Typewriter;'||wwv_flow.LF||
'\lsdsemihi';
    wwv_flow_api.g_varchar2_table(1135) := 'dden1 \lsdunhideused1 \lsdlocked0 HTML Variable;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 annotati';
    wwv_flow_api.g_varchar2_table(1136) := 'on subject;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 No List;\lsdsemihidden1 \lsdunhideused1 \lsdl';
    wwv_flow_api.g_varchar2_table(1137) := 'ocked0 Outline List 1;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Outline List 2;\lsdsemihidden1 \l';
    wwv_flow_api.g_varchar2_table(1138) := 'sdunhideused1 \lsdlocked0 Outline List 3;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Balloon Text;\l';
    wwv_flow_api.g_varchar2_table(1139) := 'sdpriority39 \lsdlocked0 Table Grid;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdlocked0 Placeholder Text;\lsdqformat1 \lsdp';
    wwv_flow_api.g_varchar2_table(1140) := 'riority1 \lsdlocked0 No Spacing;\lsdpriority60 \lsdlocked0 Light Shading;\lsdpriority61 \lsdlocked0 ';
    wwv_flow_api.g_varchar2_table(1141) := 'Light List;\lsdpriority62 \lsdlocked0 Light Grid;'||wwv_flow.LF||
'\lsdpriority63 \lsdlocked0 Medium Shading 1;\lsdpr';
    wwv_flow_api.g_varchar2_table(1142) := 'iority64 \lsdlocked0 Medium Shading 2;\lsdpriority65 \lsdlocked0 Medium List 1;\lsdpriority66 \lsdlo';
    wwv_flow_api.g_varchar2_table(1143) := 'cked0 Medium List 2;\lsdpriority67 \lsdlocked0 Medium Grid 1;\lsdpriority68 \lsdlocked0 Medium Grid ';
    wwv_flow_api.g_varchar2_table(1144) := '2;'||wwv_flow.LF||
'\lsdpriority69 \lsdlocked0 Medium Grid 3;\lsdpriority70 \lsdlocked0 Dark List;\lsdpriority71 \lsd';
    wwv_flow_api.g_varchar2_table(1145) := 'locked0 Colorful Shading;\lsdpriority72 \lsdlocked0 Colorful List;\lsdpriority73 \lsdlocked0 Colorfu';
    wwv_flow_api.g_varchar2_table(1146) := 'l Grid;\lsdpriority60 \lsdlocked0 Light Shading Accent 1;'||wwv_flow.LF||
'\lsdpriority61 \lsdlocked0 Light List Acce';
    wwv_flow_api.g_varchar2_table(1147) := 'nt 1;\lsdpriority62 \lsdlocked0 Light Grid Accent 1;\lsdpriority63 \lsdlocked0 Medium Shading 1 Acce';
    wwv_flow_api.g_varchar2_table(1148) := 'nt 1;\lsdpriority64 \lsdlocked0 Medium Shading 2 Accent 1;\lsdpriority65 \lsdlocked0 Medium List 1 A';
    wwv_flow_api.g_varchar2_table(1149) := 'ccent 1;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdlocked0 Revision;\lsdqformat1 \lsdpriority34 \lsdlocked0 List Paragraph';
    wwv_flow_api.g_varchar2_table(1150) := ';\lsdqformat1 \lsdpriority29 \lsdlocked0 Quote;\lsdqformat1 \lsdpriority30 \lsdlocked0 Intense Quote';
    wwv_flow_api.g_varchar2_table(1151) := ';\lsdpriority66 \lsdlocked0 Medium List 2 Accent 1;'||wwv_flow.LF||
'\lsdpriority67 \lsdlocked0 Medium Grid 1 Accent ';
    wwv_flow_api.g_varchar2_table(1152) := '1;\lsdpriority68 \lsdlocked0 Medium Grid 2 Accent 1;\lsdpriority69 \lsdlocked0 Medium Grid 3 Accent ';
    wwv_flow_api.g_varchar2_table(1153) := '1;\lsdpriority70 \lsdlocked0 Dark List Accent 1;\lsdpriority71 \lsdlocked0 Colorful Shading Accent 1';
    wwv_flow_api.g_varchar2_table(1154) := ';'||wwv_flow.LF||
'\lsdpriority72 \lsdlocked0 Colorful List Accent 1;\lsdpriority73 \lsdlocked0 Colorful Grid Accent ';
    wwv_flow_api.g_varchar2_table(1155) := '1;\lsdpriority60 \lsdlocked0 Light Shading Accent 2;\lsdpriority61 \lsdlocked0 Light List Accent 2;\';
    wwv_flow_api.g_varchar2_table(1156) := 'lsdpriority62 \lsdlocked0 Light Grid Accent 2;'||wwv_flow.LF||
'\lsdpriority63 \lsdlocked0 Medium Shading 1 Accent 2;';
    wwv_flow_api.g_varchar2_table(1157) := '\lsdpriority64 \lsdlocked0 Medium Shading 2 Accent 2;\lsdpriority65 \lsdlocked0 Medium List 1 Accent';
    wwv_flow_api.g_varchar2_table(1158) := ' 2;\lsdpriority66 \lsdlocked0 Medium List 2 Accent 2;'||wwv_flow.LF||
'\lsdpriority67 \lsdlocked0 Medium Grid 1 Accen';
    wwv_flow_api.g_varchar2_table(1159) := 't 2;\lsdpriority68 \lsdlocked0 Medium Grid 2 Accent 2;\lsdpriority69 \lsdlocked0 Medium Grid 3 Accen';
    wwv_flow_api.g_varchar2_table(1160) := 't 2;\lsdpriority70 \lsdlocked0 Dark List Accent 2;\lsdpriority71 \lsdlocked0 Colorful Shading Accent';
    wwv_flow_api.g_varchar2_table(1161) := ' 2;'||wwv_flow.LF||
'\lsdpriority72 \lsdlocked0 Colorful List Accent 2;\lsdpriority73 \lsdlocked0 Colorful Grid Accen';
    wwv_flow_api.g_varchar2_table(1162) := 't 2;\lsdpriority60 \lsdlocked0 Light Shading Accent 3;\lsdpriority61 \lsdlocked0 Light List Accent 3';
    wwv_flow_api.g_varchar2_table(1163) := ';\lsdpriority62 \lsdlocked0 Light Grid Accent 3;'||wwv_flow.LF||
'\lsdpriority63 \lsdlocked0 Medium Shading 1 Accent ';
    wwv_flow_api.g_varchar2_table(1164) := '3;\lsdpriority64 \lsdlocked0 Medium Shading 2 Accent 3;\lsdpriority65 \lsdlocked0 Medium List 1 Acce';
    wwv_flow_api.g_varchar2_table(1165) := 'nt 3;\lsdpriority66 \lsdlocked0 Medium List 2 Accent 3;'||wwv_flow.LF||
'\lsdpriority67 \lsdlocked0 Medium Grid 1 Acc';
    wwv_flow_api.g_varchar2_table(1166) := 'ent 3;\lsdpriority68 \lsdlocked0 Medium Grid 2 Accent 3;\lsdpriority69 \lsdlocked0 Medium Grid 3 Acc';
    wwv_flow_api.g_varchar2_table(1167) := 'ent 3;\lsdpriority70 \lsdlocked0 Dark List Accent 3;\lsdpriority71 \lsdlocked0 Colorful Shading Acce';
    wwv_flow_api.g_varchar2_table(1168) := 'nt 3;'||wwv_flow.LF||
'\lsdpriority72 \lsdlocked0 Colorful List Accent 3;\lsdpriority73 \lsdlocked0 Colorful Grid Acc';
    wwv_flow_api.g_varchar2_table(1169) := 'ent 3;\lsdpriority60 \lsdlocked0 Light Shading Accent 4;\lsdpriority61 \lsdlocked0 Light List Accent';
    wwv_flow_api.g_varchar2_table(1170) := ' 4;\lsdpriority62 \lsdlocked0 Light Grid Accent 4;'||wwv_flow.LF||
'\lsdpriority63 \lsdlocked0 Medium Shading 1 Accen';
    wwv_flow_api.g_varchar2_table(1171) := 't 4;\lsdpriority64 \lsdlocked0 Medium Shading 2 Accent 4;\lsdpriority65 \lsdlocked0 Medium List 1 Ac';
    wwv_flow_api.g_varchar2_table(1172) := 'cent 4;\lsdpriority66 \lsdlocked0 Medium List 2 Accent 4;'||wwv_flow.LF||
'\lsdpriority67 \lsdlocked0 Medium Grid 1 A';
    wwv_flow_api.g_varchar2_table(1173) := 'ccent 4;\lsdpriority68 \lsdlocked0 Medium Grid 2 Accent 4;\lsdpriority69 \lsdlocked0 Medium Grid 3 A';
    wwv_flow_api.g_varchar2_table(1174) := 'ccent 4;\lsdpriority70 \lsdlocked0 Dark List Accent 4;\lsdpriority71 \lsdlocked0 Colorful Shading Ac';
    wwv_flow_api.g_varchar2_table(1175) := 'cent 4;'||wwv_flow.LF||
'\lsdpriority72 \lsdlocked0 Colorful List Accent 4;\lsdpriority73 \lsdlocked0 Colorful Grid A';
    wwv_flow_api.g_varchar2_table(1176) := 'ccent 4;\lsdpriority60 \lsdlocked0 Light Shading Accent 5;\lsdpriority61 \lsdlocked0 Light List Acce';
    wwv_flow_api.g_varchar2_table(1177) := 'nt 5;\lsdpriority62 \lsdlocked0 Light Grid Accent 5;'||wwv_flow.LF||
'\lsdpriority63 \lsdlocked0 Medium Shading 1 Acc';
    wwv_flow_api.g_varchar2_table(1178) := 'ent 5;\lsdpriority64 \lsdlocked0 Medium Shading 2 Accent 5;\lsdpriority65 \lsdlocked0 Medium List 1 ';
    wwv_flow_api.g_varchar2_table(1179) := 'Accent 5;\lsdpriority66 \lsdlocked0 Medium List 2 Accent 5;'||wwv_flow.LF||
'\lsdpriority67 \lsdlocked0 Medium Grid 1';
    wwv_flow_api.g_varchar2_table(1180) := ' Accent 5;\lsdpriority68 \lsdlocked0 Medium Grid 2 Accent 5;\lsdpriority69 \lsdlocked0 Medium Grid 3';
    wwv_flow_api.g_varchar2_table(1181) := ' Accent 5;\lsdpriority70 \lsdlocked0 Dark List Accent 5;\lsdpriority71 \lsdlocked0 Colorful Shading ';
    wwv_flow_api.g_varchar2_table(1182) := 'Accent 5;'||wwv_flow.LF||
'\lsdpriority72 \lsdlocked0 Colorful List Accent 5;\lsdpriority73 \lsdlocked0 Colorful Grid';
    wwv_flow_api.g_varchar2_table(1183) := ' Accent 5;\lsdpriority60 \lsdlocked0 Light Shading Accent 6;\lsdpriority61 \lsdlocked0 Light List Ac';
    wwv_flow_api.g_varchar2_table(1184) := 'cent 6;\lsdpriority62 \lsdlocked0 Light Grid Accent 6;'||wwv_flow.LF||
'\lsdpriority63 \lsdlocked0 Medium Shading 1 A';
    wwv_flow_api.g_varchar2_table(1185) := 'ccent 6;\lsdpriority64 \lsdlocked0 Medium Shading 2 Accent 6;\lsdpriority65 \lsdlocked0 Medium List ';
    wwv_flow_api.g_varchar2_table(1186) := '1 Accent 6;\lsdpriority66 \lsdlocked0 Medium List 2 Accent 6;'||wwv_flow.LF||
'\lsdpriority67 \lsdlocked0 Medium Grid';
    wwv_flow_api.g_varchar2_table(1187) := ' 1 Accent 6;\lsdpriority68 \lsdlocked0 Medium Grid 2 Accent 6;\lsdpriority69 \lsdlocked0 Medium Grid';
    wwv_flow_api.g_varchar2_table(1188) := ' 3 Accent 6;\lsdpriority70 \lsdlocked0 Dark List Accent 6;\lsdpriority71 \lsdlocked0 Colorful Shadin';
    wwv_flow_api.g_varchar2_table(1189) := 'g Accent 6;'||wwv_flow.LF||
'\lsdpriority72 \lsdlocked0 Colorful List Accent 6;\lsdpriority73 \lsdlocked0 Colorful Gr';
    wwv_flow_api.g_varchar2_table(1190) := 'id Accent 6;\lsdqformat1 \lsdpriority19 \lsdlocked0 Subtle Emphasis;\lsdqformat1 \lsdpriority21 \lsd';
    wwv_flow_api.g_varchar2_table(1191) := 'locked0 Intense Emphasis;'||wwv_flow.LF||
'\lsdqformat1 \lsdpriority31 \lsdlocked0 Subtle Reference;\lsdqformat1 \lsd';
    wwv_flow_api.g_varchar2_table(1192) := 'priority32 \lsdlocked0 Intense Reference;\lsdqformat1 \lsdpriority33 \lsdlocked0 Book Title;\lsdsemi';
    wwv_flow_api.g_varchar2_table(1193) := 'hidden1 \lsdunhideused1 \lsdpriority37 \lsdlocked0 Bibliography;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \ls';
    wwv_flow_api.g_varchar2_table(1194) := 'dqformat1 \lsdpriority39 \lsdlocked0 TOC Heading;\lsdpriority41 \lsdlocked0 Plain Table 1;\lsdpriori';
    wwv_flow_api.g_varchar2_table(1195) := 'ty42 \lsdlocked0 Plain Table 2;\lsdpriority43 \lsdlocked0 Plain Table 3;\lsdpriority44 \lsdlocked0 P';
    wwv_flow_api.g_varchar2_table(1196) := 'lain Table 4;'||wwv_flow.LF||
'\lsdpriority45 \lsdlocked0 Plain Table 5;\lsdpriority40 \lsdlocked0 Grid Table Light;\';
    wwv_flow_api.g_varchar2_table(1197) := 'lsdpriority46 \lsdlocked0 Grid Table 1 Light;\lsdpriority47 \lsdlocked0 Grid Table 2;\lsdpriority48 ';
    wwv_flow_api.g_varchar2_table(1198) := '\lsdlocked0 Grid Table 3;\lsdpriority49 \lsdlocked0 Grid Table 4;'||wwv_flow.LF||
'\lsdpriority50 \lsdlocked0 Grid Ta';
    wwv_flow_api.g_varchar2_table(1199) := 'ble 5 Dark;\lsdpriority51 \lsdlocked0 Grid Table 6 Colorful;\lsdpriority52 \lsdlocked0 Grid Table 7 ';
    wwv_flow_api.g_varchar2_table(1200) := 'Colorful;\lsdpriority46 \lsdlocked0 Grid Table 1 Light Accent 1;\lsdpriority47 \lsdlocked0 Grid Tabl';
    wwv_flow_api.g_varchar2_table(1201) := 'e 2 Accent 1;'||wwv_flow.LF||
'\lsdpriority48 \lsdlocked0 Grid Table 3 Accent 1;\lsdpriority49 \lsdlocked0 Grid Table';
    wwv_flow_api.g_varchar2_table(1202) := ' 4 Accent 1;\lsdpriority50 \lsdlocked0 Grid Table 5 Dark Accent 1;\lsdpriority51 \lsdlocked0 Grid Ta';
    wwv_flow_api.g_varchar2_table(1203) := 'ble 6 Colorful Accent 1;'||wwv_flow.LF||
'\lsdpriority52 \lsdlocked0 Grid Table 7 Colorful Accent 1;\lsdpriority46 \l';
    wwv_flow_api.g_varchar2_table(1204) := 'sdlocked0 Grid Table 1 Light Accent 2;\lsdpriority47 \lsdlocked0 Grid Table 2 Accent 2;\lsdpriority4';
    wwv_flow_api.g_varchar2_table(1205) := '8 \lsdlocked0 Grid Table 3 Accent 2;'||wwv_flow.LF||
'\lsdpriority49 \lsdlocked0 Grid Table 4 Accent 2;\lsdpriority50';
    wwv_flow_api.g_varchar2_table(1206) := ' \lsdlocked0 Grid Table 5 Dark Accent 2;\lsdpriority51 \lsdlocked0 Grid Table 6 Colorful Accent 2;\l';
    wwv_flow_api.g_varchar2_table(1207) := 'sdpriority52 \lsdlocked0 Grid Table 7 Colorful Accent 2;'||wwv_flow.LF||
'\lsdpriority46 \lsdlocked0 Grid Table 1 Lig';
    wwv_flow_api.g_varchar2_table(1208) := 'ht Accent 3;\lsdpriority47 \lsdlocked0 Grid Table 2 Accent 3;\lsdpriority48 \lsdlocked0 Grid Table 3';
    wwv_flow_api.g_varchar2_table(1209) := ' Accent 3;\lsdpriority49 \lsdlocked0 Grid Table 4 Accent 3;'||wwv_flow.LF||
'\lsdpriority50 \lsdlocked0 Grid Table 5 ';
    wwv_flow_api.g_varchar2_table(1210) := 'Dark Accent 3;\lsdpriority51 \lsdlocked0 Grid Table 6 Colorful Accent 3;\lsdpriority52 \lsdlocked0 G';
    wwv_flow_api.g_varchar2_table(1211) := 'rid Table 7 Colorful Accent 3;\lsdpriority46 \lsdlocked0 Grid Table 1 Light Accent 4;'||wwv_flow.LF||
'\lsdpriority47';
    wwv_flow_api.g_varchar2_table(1212) := ' \lsdlocked0 Grid Table 2 Accent 4;\lsdpriority48 \lsdlocked0 Grid Table 3 Accent 4;\lsdpriority49 \';
    wwv_flow_api.g_varchar2_table(1213) := 'lsdlocked0 Grid Table 4 Accent 4;\lsdpriority50 \lsdlocked0 Grid Table 5 Dark Accent 4;'||wwv_flow.LF||
'\lsdpriority';
    wwv_flow_api.g_varchar2_table(1214) := '51 \lsdlocked0 Grid Table 6 Colorful Accent 4;\lsdpriority52 \lsdlocked0 Grid Table 7 Colorful Accen';
    wwv_flow_api.g_varchar2_table(1215) := 't 4;\lsdpriority46 \lsdlocked0 Grid Table 1 Light Accent 5;\lsdpriority47 \lsdlocked0 Grid Table 2 A';
    wwv_flow_api.g_varchar2_table(1216) := 'ccent 5;'||wwv_flow.LF||
'\lsdpriority48 \lsdlocked0 Grid Table 3 Accent 5;\lsdpriority49 \lsdlocked0 Grid Table 4 Ac';
    wwv_flow_api.g_varchar2_table(1217) := 'cent 5;\lsdpriority50 \lsdlocked0 Grid Table 5 Dark Accent 5;\lsdpriority51 \lsdlocked0 Grid Table 6';
    wwv_flow_api.g_varchar2_table(1218) := ' Colorful Accent 5;'||wwv_flow.LF||
'\lsdpriority52 \lsdlocked0 Grid Table 7 Colorful Accent 5;\lsdpriority46 \lsdloc';
    wwv_flow_api.g_varchar2_table(1219) := 'ked0 Grid Table 1 Light Accent 6;\lsdpriority47 \lsdlocked0 Grid Table 2 Accent 6;\lsdpriority48 \ls';
    wwv_flow_api.g_varchar2_table(1220) := 'dlocked0 Grid Table 3 Accent 6;'||wwv_flow.LF||
'\lsdpriority49 \lsdlocked0 Grid Table 4 Accent 6;\lsdpriority50 \lsd';
    wwv_flow_api.g_varchar2_table(1221) := 'locked0 Grid Table 5 Dark Accent 6;\lsdpriority51 \lsdlocked0 Grid Table 6 Colorful Accent 6;\lsdpri';
    wwv_flow_api.g_varchar2_table(1222) := 'ority52 \lsdlocked0 Grid Table 7 Colorful Accent 6;'||wwv_flow.LF||
'\lsdpriority46 \lsdlocked0 List Table 1 Light;\l';
    wwv_flow_api.g_varchar2_table(1223) := 'sdpriority47 \lsdlocked0 List Table 2;\lsdpriority48 \lsdlocked0 List Table 3;\lsdpriority49 \lsdloc';
    wwv_flow_api.g_varchar2_table(1224) := 'ked0 List Table 4;\lsdpriority50 \lsdlocked0 List Table 5 Dark;'||wwv_flow.LF||
'\lsdpriority51 \lsdlocked0 List Tabl';
    wwv_flow_api.g_varchar2_table(1225) := 'e 6 Colorful;\lsdpriority52 \lsdlocked0 List Table 7 Colorful;\lsdpriority46 \lsdlocked0 List Table ';
    wwv_flow_api.g_varchar2_table(1226) := '1 Light Accent 1;\lsdpriority47 \lsdlocked0 List Table 2 Accent 1;\lsdpriority48 \lsdlocked0 List Ta';
    wwv_flow_api.g_varchar2_table(1227) := 'ble 3 Accent 1;'||wwv_flow.LF||
'\lsdpriority49 \lsdlocked0 List Table 4 Accent 1;\lsdpriority50 \lsdlocked0 List Tab';
    wwv_flow_api.g_varchar2_table(1228) := 'le 5 Dark Accent 1;\lsdpriority51 \lsdlocked0 List Table 6 Colorful Accent 1;\lsdpriority52 \lsdlock';
    wwv_flow_api.g_varchar2_table(1229) := 'ed0 List Table 7 Colorful Accent 1;'||wwv_flow.LF||
'\lsdpriority46 \lsdlocked0 List Table 1 Light Accent 2;\lsdprior';
    wwv_flow_api.g_varchar2_table(1230) := 'ity47 \lsdlocked0 List Table 2 Accent 2;\lsdpriority48 \lsdlocked0 List Table 3 Accent 2;\lsdpriorit';
    wwv_flow_api.g_varchar2_table(1231) := 'y49 \lsdlocked0 List Table 4 Accent 2;'||wwv_flow.LF||
'\lsdpriority50 \lsdlocked0 List Table 5 Dark Accent 2;\lsdpri';
    wwv_flow_api.g_varchar2_table(1232) := 'ority51 \lsdlocked0 List Table 6 Colorful Accent 2;\lsdpriority52 \lsdlocked0 List Table 7 Colorful ';
    wwv_flow_api.g_varchar2_table(1233) := 'Accent 2;\lsdpriority46 \lsdlocked0 List Table 1 Light Accent 3;'||wwv_flow.LF||
'\lsdpriority47 \lsdlocked0 List Tab';
    wwv_flow_api.g_varchar2_table(1234) := 'le 2 Accent 3;\lsdpriority48 \lsdlocked0 List Table 3 Accent 3;\lsdpriority49 \lsdlocked0 List Table';
    wwv_flow_api.g_varchar2_table(1235) := ' 4 Accent 3;\lsdpriority50 \lsdlocked0 List Table 5 Dark Accent 3;'||wwv_flow.LF||
'\lsdpriority51 \lsdlocked0 List T';
    wwv_flow_api.g_varchar2_table(1236) := 'able 6 Colorful Accent 3;\lsdpriority52 \lsdlocked0 List Table 7 Colorful Accent 3;\lsdpriority46 \l';
    wwv_flow_api.g_varchar2_table(1237) := 'sdlocked0 List Table 1 Light Accent 4;\lsdpriority47 \lsdlocked0 List Table 2 Accent 4;'||wwv_flow.LF||
'\lsdpriority';
    wwv_flow_api.g_varchar2_table(1238) := '48 \lsdlocked0 List Table 3 Accent 4;\lsdpriority49 \lsdlocked0 List Table 4 Accent 4;\lsdpriority50';
    wwv_flow_api.g_varchar2_table(1239) := ' \lsdlocked0 List Table 5 Dark Accent 4;\lsdpriority51 \lsdlocked0 List Table 6 Colorful Accent 4;'||wwv_flow.LF||
'\';
    wwv_flow_api.g_varchar2_table(1240) := 'lsdpriority52 \lsdlocked0 List Table 7 Colorful Accent 4;\lsdpriority46 \lsdlocked0 List Table 1 Lig';
    wwv_flow_api.g_varchar2_table(1241) := 'ht Accent 5;\lsdpriority47 \lsdlocked0 List Table 2 Accent 5;\lsdpriority48 \lsdlocked0 List Table 3';
    wwv_flow_api.g_varchar2_table(1242) := ' Accent 5;'||wwv_flow.LF||
'\lsdpriority49 \lsdlocked0 List Table 4 Accent 5;\lsdpriority50 \lsdlocked0 List Table 5 ';
    wwv_flow_api.g_varchar2_table(1243) := 'Dark Accent 5;\lsdpriority51 \lsdlocked0 List Table 6 Colorful Accent 5;\lsdpriority52 \lsdlocked0 L';
    wwv_flow_api.g_varchar2_table(1244) := 'ist Table 7 Colorful Accent 5;'||wwv_flow.LF||
'\lsdpriority46 \lsdlocked0 List Table 1 Light Accent 6;\lsdpriority47';
    wwv_flow_api.g_varchar2_table(1245) := ' \lsdlocked0 List Table 2 Accent 6;\lsdpriority48 \lsdlocked0 List Table 3 Accent 6;\lsdpriority49 \';
    wwv_flow_api.g_varchar2_table(1246) := 'lsdlocked0 List Table 4 Accent 6;'||wwv_flow.LF||
'\lsdpriority50 \lsdlocked0 List Table 5 Dark Accent 6;\lsdpriority';
    wwv_flow_api.g_varchar2_table(1247) := '51 \lsdlocked0 List Table 6 Colorful Accent 6;\lsdpriority52 \lsdlocked0 List Table 7 Colorful Accen';
    wwv_flow_api.g_varchar2_table(1248) := 't 6;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Mention;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0';
    wwv_flow_api.g_varchar2_table(1249) := ' Smart Hyperlink;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Hashtag;\lsdsemihidden1 \lsdunhideused1';
    wwv_flow_api.g_varchar2_table(1250) := ' \lsdlocked0 Unresolved Mention;}}{\*\datastore 010500000200000018000000'||wwv_flow.LF||
'4d73786d6c322e534158584d4c5';
    wwv_flow_api.g_varchar2_table(1251) := '265616465722e362e30000000000000000000000e0000'||wwv_flow.LF||
'd0cf11e0a1b11ae1000000000000000000000000000000003e0003';
    wwv_flow_api.g_varchar2_table(1252) := '00feff0900060000000000000000000000010000000100000000000000001000000200000001000000feffffff0000000000';
    wwv_flow_api.g_varchar2_table(1253) := '000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'f';
    wwv_flow_api.g_varchar2_table(1254) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1255) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1256) := 'fffffffffffffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'ffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1257) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1258) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1259) := 'ffff'||wwv_flow.LF||
'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1260) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1261) := 'fffffffffffffffffffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'fffffffffffffffffdffffff04000000feffffff05';
    wwv_flow_api.g_varchar2_table(1262) := '000000fefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1263) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1264) := 'ffffffffff'||wwv_flow.LF||
'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1265) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1266) := 'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'ffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1267) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1268) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1269) := 'ffffffffffffffff'||wwv_flow.LF||
'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1270) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1271) := 'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'ffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1272) := 'ff52006f006f007400200045006e007400720079000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1273) := '00000000000000000000000000000016000500ffffffffffffffff010000000c6ad98892f1d411a65f0040963251e5000000';
    wwv_flow_api.g_varchar2_table(1274) := '000000000000000000c0ce'||wwv_flow.LF||
'4382a877d40103000000c0020000000000004d0073006f004400610074006100530074006f007';
    wwv_flow_api.g_varchar2_table(1275) := '2006500000000000000000000000000000000000000000000000000000000000000000000000000000000001a000101fffff';
    wwv_flow_api.g_varchar2_table(1276) := 'fffffffffff020000000000000000000000000000000000000000000000c0ce4382a877d401'||wwv_flow.LF||
'c0ce4382a877d40100000000';
    wwv_flow_api.g_varchar2_table(1277) := '0000000000000000320043003500cb00c20046004f00c6005a005500c20057003200db005a005900d100c3003000ca003200';
    wwv_flow_api.g_varchar2_table(1278) := 'c0003d003d000000000000000000000000000000000032000101ffffffffffffffff03000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1279) := '0000000000000000c0ce4382a877'||wwv_flow.LF||
'd401c0ce4382a877d4010000000000000000000000004900740065006d0000000000000';
    wwv_flow_api.g_varchar2_table(1280) := '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1281) := '00a000201ffffffff04000000ffffffff000000000000000000000000000000000000000000000000'||wwv_flow.LF||
'000000000000000000';
    wwv_flow_api.g_varchar2_table(1282) := '00000000000000320100000000000001000000020000000300000004000000feffffff060000000700000008000000090000';
    wwv_flow_api.g_varchar2_table(1283) := '000a000000feffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1284) := 'ffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1285) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1286) := 'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'ffffffffffff';
    wwv_flow_api.g_varchar2_table(1287) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1288) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1289) := 'ffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1290) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1291) := 'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'ffffff';
    wwv_flow_api.g_varchar2_table(1292) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff3c3f786d6c2076657273696f6e3d22312e30222065';
    wwv_flow_api.g_varchar2_table(1293) := '6e636f64696e673d225554462d3822207374616e64616c6f6e653d226e6f223f3e3c623a536f757263657320786d6c6e733a';
    wwv_flow_api.g_varchar2_table(1294) := '623d22687474703a2f2f736368656d61732e6f70656e78'||wwv_flow.LF||
'6d6c666f726d6174732e6f72672f6f6666696365446f63756d656';
    wwv_flow_api.g_varchar2_table(1295) := 'e742f323030362f6269626c696f6772617068792220786d6c6e733d22687474703a2f2f736368656d61732e6f70656e786d6';
    wwv_flow_api.g_varchar2_table(1296) := 'c666f726d6174732e6f72672f6f6666696365446f63756d656e742f323030362f6269626c696f677261706879222053656c'||wwv_flow.LF||
'';
    wwv_flow_api.g_varchar2_table(1297) := '65637465645374796c653d225c415041536978746845646974696f6e4f66666963654f6e6c696e652e78736c22205374796c';
    wwv_flow_api.g_varchar2_table(1298) := '654e616d653d22415041222056657273696f6e3d2236223e3c2f623a536f75726365733e0000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1299) := '3c3f786d6c2076657273696f6e3d22312e302220656e636f6469'||wwv_flow.LF||
'6e673d225554462d3822207374616e64616c6f6e653d226';
    wwv_flow_api.g_varchar2_table(1300) := 'e6f223f3e0d0a3c64733a6461746173746f72654974656d2064733a6974656d49443d227b38384542323737302d413635332';
    wwv_flow_api.g_varchar2_table(1301) := 'd343836352d393637332d4236353843363336414137327d2220786d6c6e733a64733d22687474703a2f2f736368656d61732';
    wwv_flow_api.g_varchar2_table(1302) := 'e6f70'||wwv_flow.LF||
'656e786d6c666f726d6174732e6f72672f6f6666696365446f63756d656e742f323030362f637573500072006f0070';
    wwv_flow_api.g_varchar2_table(1303) := '0065007200740069006500730000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1304) := '0000000000000016000200ffffffffffffffffffffffff000000000000'||wwv_flow.LF||
'00000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1305) := '0000000000000000000050000005501000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1306) := '0000000000000000000000000000000000000000000000000000000000000000000000000000000fffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1307) := 'fff00000000'||wwv_flow.LF||
'0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1308) := '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1309) := '000000000000000000000000000000000000ffffffffffffffffffffffff0000'||wwv_flow.LF||
'00000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1310) := '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1311) := '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffffff';
    wwv_flow_api.g_varchar2_table(1312) := 'fffffffffffffffff'||wwv_flow.LF||
'0000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1313) := '00000000000000746f6d586d6c223e3c64733a736368656d61526566733e3c64733a736368656d615265662064733a757269';
    wwv_flow_api.g_varchar2_table(1314) := '3d22687474703a2f2f736368656d61732e6f70656e786d6c666f726d6174732e6f7267'||wwv_flow.LF||
'2f6f6666696365446f63756d656e7';
    wwv_flow_api.g_varchar2_table(1315) := '42f323030362f6269626c696f677261706879222f3e3c2f64733a736368656d61526566733e3c2f64733a6461746173746f7';
    wwv_flow_api.g_varchar2_table(1316) := '2654974656d3e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1317) := '00000000000000000000000'||wwv_flow.LF||
'0000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1318) := '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1319) := '0000000000000000000000000000000000000000000000000000000000000000000000000000'||wwv_flow.LF||
'00000000000000000000000';
    wwv_flow_api.g_varchar2_table(1320) := '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1321) := '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1322) := '00000000000000000000000000000'||wwv_flow.LF||
'0000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1323) := '0000000000000000000000000000000000000000000105000000000000}}';
null;
end;
/
begin
wwv_flow_api.create_report_layout(
 p_id=>wwv_flow_api.id(38560961922408068)
,p_report_layout_name=>'re_c_recaudo_anuales_por_vigencia_1'
,p_report_layout_type=>'RTF_FILE'
,p_varchar2_table=>wwv_flow_api.g_varchar2_table
);
null;
end;
/
