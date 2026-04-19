prompt --application/shared_components/reports/report_layouts/pagos_por_banco_fecha
begin
    wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
    wwv_flow_api.g_varchar2_table(1) := '{\rtf1\adeflang1025\ansi\ansicpg1252\uc1\adeff0\deff0\stshfdbch0\stshfloch31506\stshfhich31506\stshf';
    wwv_flow_api.g_varchar2_table(2) := 'bi31506\deflang9226\deflangfe9226\themelang9226\themelangfe0\themelangcs0{\fonttbl{\f0\fbidi \froman';
    wwv_flow_api.g_varchar2_table(3) := '\fcharset0\fprq2{\*\panose 02020603050405020304}Times New Roman{\*\falt Times};}'||wwv_flow.LF||
'{\f34\fbidi \froman';
    wwv_flow_api.g_varchar2_table(4) := '\fcharset0\fprq2{\*\panose 02040503050406030204}Cambria Math;}{\f37\fbidi \fswiss\fcharset0\fprq2{\*';
    wwv_flow_api.g_varchar2_table(5) := '\panose 020f0502020204030204}Calibri;}{\f38\fbidi \fswiss\fcharset0\fprq2{\*\panose 020f030202020403';
    wwv_flow_api.g_varchar2_table(6) := '0204}Calibri Light;}'||wwv_flow.LF||
'{\f43\fbidi \fswiss\fcharset0\fprq2{\*\panose 020b0502040204020203}Segoe UI;}{\';
    wwv_flow_api.g_varchar2_table(7) := 'flomajor\f31500\fbidi \froman\fcharset0\fprq2{\*\panose 02020603050405020304}Times New Roman{\*\falt';
    wwv_flow_api.g_varchar2_table(8) := ' Times};}'||wwv_flow.LF||
'{\fdbmajor\f31501\fbidi \froman\fcharset0\fprq2{\*\panose 02020603050405020304}Times New R';
    wwv_flow_api.g_varchar2_table(9) := 'oman{\*\falt Times};}{\fhimajor\f31502\fbidi \fswiss\fcharset0\fprq2{\*\panose 020f0302020204030204}';
    wwv_flow_api.g_varchar2_table(10) := 'Calibri Light;}'||wwv_flow.LF||
'{\fbimajor\f31503\fbidi \froman\fcharset0\fprq2{\*\panose 02020603050405020304}Times';
    wwv_flow_api.g_varchar2_table(11) := ' New Roman{\*\falt Times};}{\flominor\f31504\fbidi \froman\fcharset0\fprq2{\*\panose 020206030504050';
    wwv_flow_api.g_varchar2_table(12) := '20304}Times New Roman{\*\falt Times};}'||wwv_flow.LF||
'{\fdbminor\f31505\fbidi \froman\fcharset0\fprq2{\*\panose 020';
    wwv_flow_api.g_varchar2_table(13) := '20603050405020304}Times New Roman{\*\falt Times};}{\fhiminor\f31506\fbidi \fswiss\fcharset0\fprq2{\*';
    wwv_flow_api.g_varchar2_table(14) := '\panose 020f0502020204030204}Calibri;}'||wwv_flow.LF||
'{\fbiminor\f31507\fbidi \froman\fcharset0\fprq2{\*\panose 020';
    wwv_flow_api.g_varchar2_table(15) := '20603050405020304}Times New Roman{\*\falt Times};}{\f44\fbidi \froman\fcharset238\fprq2 Times New Ro';
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
    wwv_flow_api.g_varchar2_table(98) := '217\green217\blue217;\red0\green51\blue0;'||wwv_flow.LF||
'\red255\green255\blue255;}{\*\defchp \f31506\fs22\lang9226';
    wwv_flow_api.g_varchar2_table(99) := '\langfe1033\langfenp1033 }{\*\defpap \ql \li0\ri0\sa160\sl259\slmult1\widctlpar\wrapdefault\aspalpha';
    wwv_flow_api.g_varchar2_table(100) := '\aspnum\faauto\adjustright\rin0\lin0\itap0 }\noqfpromote {\stylesheet{'||wwv_flow.LF||
'\ql \li0\ri0\sa160\sl259\slmu';
    wwv_flow_api.g_varchar2_table(101) := 'lt1\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \rtlch\fcs1 \af0\afs22\';
    wwv_flow_api.g_varchar2_table(102) := 'alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 '||wwv_flow.LF||
'\snext0 \sqfor';
    wwv_flow_api.g_varchar2_table(103) := 'mat \spriority0 \styrsid1527012 Normal;}{\s1\ql \li0\ri0\sb240\sl259\slmult1\keep\keepn\widctlpar\wr';
    wwv_flow_api.g_varchar2_table(104) := 'apdefault\aspalpha\aspnum\faauto\outlinelevel0\adjustright\rin0\lin0\itap0 \rtlch\fcs1 \af0\afs32\al';
    wwv_flow_api.g_varchar2_table(105) := 'ang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\fs32\cf19\lang9226\langfe1033\loch\f31502\hich\af31502\dbch\af31501\cgrid\lang';
    wwv_flow_api.g_varchar2_table(106) := 'np9226\langfenp1033 \sbasedon0 \snext0 \slink15 \sqformat \spriority9 \styrsid3888528 heading 1;}{\s';
    wwv_flow_api.g_varchar2_table(107) := '2\ql \li0\ri0\sb40\sl259\slmult1'||wwv_flow.LF||
'\keep\keepn\widctlpar\wrapdefault\aspalpha\aspnum\faauto\outlinelev';
    wwv_flow_api.g_varchar2_table(108) := 'el1\adjustright\rin0\lin0\itap0 \rtlch\fcs1 \af0\afs26\alang1025 \ltrch\fcs0 \fs26\cf19\lang9226\lan';
    wwv_flow_api.g_varchar2_table(109) := 'gfe1033\loch\f31502\hich\af31502\dbch\af31501\cgrid\langnp9226\langfenp1033 '||wwv_flow.LF||
'\sbasedon0 \snext0 \sli';
    wwv_flow_api.g_varchar2_table(110) := 'nk16 \sunhideused \sqformat \spriority9 \styrsid14435805 heading 2;}{\*\cs10 \additive \ssemihidden ';
    wwv_flow_api.g_varchar2_table(111) := '\sunhideused \spriority1 Default Paragraph Font;}{\*'||wwv_flow.LF||
'\ts11\tsrowd\trftsWidthB3\trpaddl108\trpaddr108';
    wwv_flow_api.g_varchar2_table(112) := '\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblind0\tblindtype3\tsvertalt\tsbrdrt\tsbrdrl\tsbrdrb\tsbrd';
    wwv_flow_api.g_varchar2_table(113) := 'rr\tsbrdrdgl\tsbrdrdgr\tsbrdrh\tsbrdrv \ql \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\wrapdefault\aspal';
    wwv_flow_api.g_varchar2_table(114) := 'pha\aspnum\faauto\adjustright\rin0\lin0\itap0 \rtlch\fcs1 \af31506\afs22\alang1025 \ltrch\fcs0 \f315';
    wwv_flow_api.g_varchar2_table(115) := '06\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 \snext11 \ssemihidden \sunhideused Normal ';
    wwv_flow_api.g_varchar2_table(116) := 'Table;}{\*\cs15 \additive '||wwv_flow.LF||
'\rtlch\fcs1 \af0\afs32 \ltrch\fcs0 \fs32\cf19\loch\f31502\hich\af31502\db';
    wwv_flow_api.g_varchar2_table(117) := 'ch\af31501 \sbasedon10 \slink1 \slocked \spriority9 \styrsid3888528 T\''edtulo 1 Car;}{\*\cs16 \addit';
    wwv_flow_api.g_varchar2_table(118) := 'ive \rtlch\fcs1 \af0\afs26 \ltrch\fcs0 '||wwv_flow.LF||
'\fs26\cf19\loch\f31502\hich\af31502\dbch\af31501 \sbasedon10';
    wwv_flow_api.g_varchar2_table(119) := ' \slink2 \slocked \spriority9 \styrsid14435805 T\''edtulo 2 Car;}{\*\ts17\tsrowd\trbrdrt\brdrs\brdrw1';
    wwv_flow_api.g_varchar2_table(120) := '0 \trbrdrl\brdrs\brdrw10 \trbrdrb\brdrs\brdrw10 \trbrdrr\brdrs\brdrw10 \trbrdrh\brdrs\brdrw10 '||wwv_flow.LF||
'\trbr';
    wwv_flow_api.g_varchar2_table(121) := 'drv\brdrs\brdrw10 \trftsWidthB3\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblind';
    wwv_flow_api.g_varchar2_table(122) := '0\tblindtype3\tsvertalt\tsbrdrt\tsbrdrl\tsbrdrb\tsbrdrr\tsbrdrdgl\tsbrdrdgr\tsbrdrh\tsbrdrv '||wwv_flow.LF||
'\ql \li';
    wwv_flow_api.g_varchar2_table(123) := '0\ri0\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \rtlch\fcs1 \af0\afs2';
    wwv_flow_api.g_varchar2_table(124) := '2\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 \sbasedon11 \';
    wwv_flow_api.g_varchar2_table(125) := 'snext17 \spriority39 \styrsid1527012 '||wwv_flow.LF||
'Table Grid;}{\s18\ql \li0\ri0\widctlpar\tqc\tx4419\tqr\tx8838\';
    wwv_flow_api.g_varchar2_table(126) := 'wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \rtlch\fcs1 \af0\afs20\alang1025 \ltr';
    wwv_flow_api.g_varchar2_table(127) := 'ch\fcs0 '||wwv_flow.LF||
'\fs20\lang9226\langfe1033\loch\f31506\hich\af31506\dbch\af31505\cgrid\langnp9226\langfenp10';
    wwv_flow_api.g_varchar2_table(128) := '33 \sbasedon0 \snext18 \slink19 \sunhideused \styrsid475731 header;}{\*\cs19 \additive \rtlch\fcs1 \';
    wwv_flow_api.g_varchar2_table(129) := 'af0\afs20 \ltrch\fcs0 \fs20\dbch\af31505 '||wwv_flow.LF||
'\sbasedon10 \slink18 \slocked \styrsid475731 Encabezado Ca';
    wwv_flow_api.g_varchar2_table(130) := 'r;}{\s20\ql \li0\ri0\widctlpar\tqc\tx4419\tqr\tx8838\wrapdefault\aspalpha\aspnum\faauto\adjustright\';
    wwv_flow_api.g_varchar2_table(131) := 'rin0\lin0\itap0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\f31506\fs22\lang9226\langfe1033\cgrid';
    wwv_flow_api.g_varchar2_table(132) := '\langnp9226\langfenp1033 \sbasedon0 \snext20 \slink21 \sunhideused \styrsid2754504 footer;}{\*\cs21 ';
    wwv_flow_api.g_varchar2_table(133) := '\additive \rtlch\fcs1 \af0 \ltrch\fcs0 \sbasedon10 \slink20 \slocked \styrsid2754504 Pie de p\''e1gin';
    wwv_flow_api.g_varchar2_table(134) := 'a Car;}{'||wwv_flow.LF||
'\s22\ql \li0\ri0\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \';
    wwv_flow_api.g_varchar2_table(135) := 'rtlch\fcs1 \af43\afs18\alang1025 \ltrch\fcs0 \f43\fs18\lang9226\langfe1033\cgrid\langnp9226\langfenp';
    wwv_flow_api.g_varchar2_table(136) := '1033 '||wwv_flow.LF||
'\sbasedon0 \snext22 \slink23 \ssemihidden \sunhideused \styrsid16283701 Balloon Text;}{\*\cs23';
    wwv_flow_api.g_varchar2_table(137) := ' \additive \rtlch\fcs1 \af43\afs18 \ltrch\fcs0 \f43\fs18 \sbasedon10 \slink22 \slocked \ssemihidden ';
    wwv_flow_api.g_varchar2_table(138) := '\styrsid16283701 Texto de globo Car;}}{\*\pgptbl {\pgp\ipgp0'||wwv_flow.LF||
'\itap0\li0\ri0\sb0\sa0}{\pgp\ipgp0\itap';
    wwv_flow_api.g_varchar2_table(139) := '0\li0\ri0\sb0\sa0}{\pgp\ipgp0\itap0\li0\ri0\sb0\sa0}}{\*\rsidtbl \rsid21935\rsid162622\rsid220485\rs';
    wwv_flow_api.g_varchar2_table(140) := 'id269724\rsid280833\rsid284911\rsid329533\rsid348245\rsid425125\rsid475731\rsid545558\rsid547685\rsi';
    wwv_flow_api.g_varchar2_table(141) := 'd655834'||wwv_flow.LF||
'\rsid680737\rsid735598\rsid738862\rsid866320\rsid876571\rsid882065\rsid931402\rsid944009\rsi';
    wwv_flow_api.g_varchar2_table(142) := 'd991157\rsid1127355\rsid1276678\rsid1314662\rsid1315650\rsid1323680\rsid1323786\rsid1328872\rsid1447';
    wwv_flow_api.g_varchar2_table(143) := '479\rsid1465893\rsid1511611\rsid1527012\rsid1646907\rsid1852721'||wwv_flow.LF||
'\rsid1914095\rsid2062640\rsid2097641';
    wwv_flow_api.g_varchar2_table(144) := '\rsid2128629\rsid2177339\rsid2182049\rsid2242870\rsid2296908\rsid2305980\rsid2363257\rsid2381965\rsi';
    wwv_flow_api.g_varchar2_table(145) := 'd2503458\rsid2578112\rsid2627304\rsid2638479\rsid2754504\rsid2777943\rsid2818133\rsid2820361\rsid296';
    wwv_flow_api.g_varchar2_table(146) := '3470\rsid2977082'||wwv_flow.LF||
'\rsid3035960\rsid3241361\rsid3498847\rsid3765947\rsid3766645\rsid3882814\rsid388852';
    wwv_flow_api.g_varchar2_table(147) := '8\rsid3946178\rsid4004782\rsid4021672\rsid4069665\rsid4080990\rsid4132765\rsid4156572\rsid4274504\rs';
    wwv_flow_api.g_varchar2_table(148) := 'id4419678\rsid4462419\rsid4467881\rsid4528565\rsid4539752\rsid4605761'||wwv_flow.LF||
'\rsid4607449\rsid4653096\rsid4';
    wwv_flow_api.g_varchar2_table(149) := '673135\rsid4681775\rsid4865145\rsid5002468\rsid5004344\rsid5056960\rsid5112505\rsid5191353\rsid52675';
    wwv_flow_api.g_varchar2_table(150) := '75\rsid5273899\rsid5275210\rsid5325795\rsid5339801\rsid5448223\rsid5471252\rsid5587391\rsid5592097\r';
    wwv_flow_api.g_varchar2_table(151) := 'sid5602073\rsid5637190'||wwv_flow.LF||
'\rsid5714651\rsid5716581\rsid5723570\rsid5794352\rsid5839842\rsid5851738\rsid';
    wwv_flow_api.g_varchar2_table(152) := '5972004\rsid6038217\rsid6039516\rsid6171013\rsid6230929\rsid6252013\rsid6296472\rsid6299357\rsid6322';
    wwv_flow_api.g_varchar2_table(153) := '078\rsid6379667\rsid6430224\rsid6495282\rsid6513487\rsid6564855\rsid6571414'||wwv_flow.LF||
'\rsid6639161\rsid6641704';
    wwv_flow_api.g_varchar2_table(154) := '\rsid6713352\rsid6828547\rsid6846715\rsid6888627\rsid6905327\rsid7157110\rsid7345363\rsid7406816\rsi';
    wwv_flow_api.g_varchar2_table(155) := 'd7482834\rsid7486533\rsid7494042\rsid7494551\rsid7495530\rsid7555507\rsid7556731\rsid7612416\rsid761';
    wwv_flow_api.g_varchar2_table(156) := '8884\rsid7624320\rsid7631590'||wwv_flow.LF||
'\rsid7679619\rsid7688527\rsid7746615\rsid7748740\rsid7952951\rsid801923';
    wwv_flow_api.g_varchar2_table(157) := '1\rsid8027056\rsid8063151\rsid8066431\rsid8136998\rsid8138293\rsid8139196\rsid8154407\rsid8274774\rs';
    wwv_flow_api.g_varchar2_table(158) := 'id8331715\rsid8393167\rsid8404187\rsid8454981\rsid8460905\rsid8467388\rsid8486458'||wwv_flow.LF||
'\rsid8671814\rsid8';
    wwv_flow_api.g_varchar2_table(159) := '716562\rsid8791382\rsid8806551\rsid8920528\rsid8927384\rsid8983680\rsid8989655\rsid8993502\rsid90509';
    wwv_flow_api.g_varchar2_table(160) := '20\rsid9115223\rsid9194650\rsid9323090\rsid9402494\rsid9443654\rsid9449499\rsid9452705\rsid9469739\r';
    wwv_flow_api.g_varchar2_table(161) := 'sid9504653\rsid9509720\rsid9515630'||wwv_flow.LF||
'\rsid9530475\rsid9572266\rsid9649200\rsid9655604\rsid9662098\rsid';
    wwv_flow_api.g_varchar2_table(162) := '9715800\rsid9788510\rsid9788545\rsid9857312\rsid9924607\rsid9985899\rsid10095898\rsid10098038\rsid10';
    wwv_flow_api.g_varchar2_table(163) := '105739\rsid10112721\rsid10123137\rsid10236238\rsid10240631\rsid10251694\rsid10316829'||wwv_flow.LF||
'\rsid10356311\r';
    wwv_flow_api.g_varchar2_table(164) := 'sid10430605\rsid10446117\rsid10489548\rsid10494215\rsid10518289\rsid10621786\rsid10688499\rsid108280';
    wwv_flow_api.g_varchar2_table(165) := '60\rsid10897470\rsid10903470\rsid10959449\rsid10965318\rsid11040125\rsid11089071\rsid11099566\rsid11';
    wwv_flow_api.g_varchar2_table(166) := '104293\rsid11234893\rsid11349299'||wwv_flow.LF||
'\rsid11365050\rsid11411417\rsid11432585\rsid11494519\rsid11697034\r';
    wwv_flow_api.g_varchar2_table(167) := 'sid11758450\rsid11815201\rsid11828207\rsid11872477\rsid11873316\rsid11887003\rsid11931011\rsid119503';
    wwv_flow_api.g_varchar2_table(168) := '32\rsid11952220\rsid12011512\rsid12020433\rsid12022847\rsid12023237\rsid12140299'||wwv_flow.LF||
'\rsid12147493\rsid1';
    wwv_flow_api.g_varchar2_table(169) := '2152934\rsid12324839\rsid12468725\rsid12522317\rsid12525807\rsid12530031\rsid12598740\rsid12603670\r';
    wwv_flow_api.g_varchar2_table(170) := 'sid12661063\rsid12676317\rsid12721209\rsid12783193\rsid12911917\rsid12912820\rsid12924776\rsid129892';
    wwv_flow_api.g_varchar2_table(171) := '15\rsid13046978\rsid13052510'||wwv_flow.LF||
'\rsid13203660\rsid13381514\rsid13506896\rsid13595392\rsid13648926\rsid1';
    wwv_flow_api.g_varchar2_table(172) := '3708704\rsid13850905\rsid13985435\rsid14041797\rsid14042983\rsid14045290\rsid14091697\rsid14233972\r';
    wwv_flow_api.g_varchar2_table(173) := 'sid14360914\rsid14375015\rsid14420131\rsid14430132\rsid14435805\rsid14440600'||wwv_flow.LF||
'\rsid14553866\rsid14565';
    wwv_flow_api.g_varchar2_table(174) := '044\rsid14752297\rsid14763141\rsid14828032\rsid14947296\rsid14961077\rsid14969960\rsid15029165\rsid1';
    wwv_flow_api.g_varchar2_table(175) := '5030782\rsid15085969\rsid15146244\rsid15228818\rsid15288099\rsid15293412\rsid15350554\rsid15366672\r';
    wwv_flow_api.g_varchar2_table(176) := 'sid15409123\rsid15422803'||wwv_flow.LF||
'\rsid15485234\rsid15537496\rsid15558841\rsid15614884\rsid15745946\rsid15752';
    wwv_flow_api.g_varchar2_table(177) := '364\rsid15795399\rsid15798736\rsid15800561\rsid15820449\rsid15821089\rsid15822243\rsid15887289\rsid1';
    wwv_flow_api.g_varchar2_table(178) := '6061695\rsid16069635\rsid16076281\rsid16142970\rsid16146735\rsid16146929'||wwv_flow.LF||
'\rsid16283701\rsid16341420\';
    wwv_flow_api.g_varchar2_table(179) := 'rsid16384523\rsid16466333\rsid16481854\rsid16740693}{\mmathPr\mmathFont34\mbrkBin0\mbrkBinSub0\msmal';
    wwv_flow_api.g_varchar2_table(180) := 'lFrac0\mdispDef1\mlMargin0\mrMargin0\mdefJc1\mwrapIndent1440\mintLim0\mnaryLim1}{\info{\author MARVI';
    wwv_flow_api.g_varchar2_table(181) := 'N DE JESUS ACOSTA PACHECO}'||wwv_flow.LF||
'{\operator MARVIN DE JESUS ACOSTA PACHECO}{\creatim\yr2018\mo11\dy2\hr10\';
    wwv_flow_api.g_varchar2_table(182) := 'min10}{\revtim\yr2018\mo11\dy6\hr15\min37}{\version178}{\edmins292}{\nofpages2}{\nofwords151}{\nofch';
    wwv_flow_api.g_varchar2_table(183) := 'ars836}{\nofcharsws986}{\vern93}}{\*\xmlnstbl {\xmlns1 http://schemas.microsoft.co'||wwv_flow.LF||
'm/office/word/200';
    wwv_flow_api.g_varchar2_table(184) := '3/wordml}}\paperw12240\paperh15840\margl720\margr720\margt720\margb720\gutter0\ltrsect '||wwv_flow.LF||
'\deftab708\w';
    wwv_flow_api.g_varchar2_table(185) := 'idowctrl\ftnbj\aenddoc\hyphhotz425\trackmoves0\trackformatting1\donotembedsysfont1\relyonvml0\donote';
    wwv_flow_api.g_varchar2_table(186) := 'mbedlingdata0\grfdocevents0\validatexml1\showplaceholdtext0\ignoremixedcontent0\saveinvalidxml0'||wwv_flow.LF||
'\sho';
    wwv_flow_api.g_varchar2_table(187) := 'wxmlerrors1\noxlattoyen\expshrtn\noultrlspc\dntblnsbdb\nospaceforul\formshade\horzdoc\dgmargin\dghsp';
    wwv_flow_api.g_varchar2_table(188) := 'ace180\dgvspace180\dghorigin720\dgvorigin720\dghshow1\dgvshow1'||wwv_flow.LF||
'\jexpand\viewkind1\viewscale100\pgbrd';
    wwv_flow_api.g_varchar2_table(189) := 'rhead\pgbrdrfoot\splytwnine\ftnlytwnine\htmautsp\nolnhtadjtbl\useltbaln\alntblind\lytcalctblwd\lyttb';
    wwv_flow_api.g_varchar2_table(190) := 'lrtgr\lnbrkrule\nobrkwrptbl\snaptogridincell\allowfieldendsel\wrppunct'||wwv_flow.LF||
'\asianbrkrule\rsidroot1527012';
    wwv_flow_api.g_varchar2_table(191) := '\newtblstyruls\nogrowautofit\usenormstyforlist\noindnmbrts\felnbrelev\nocxsptable\indrlsweleven\noaf';
    wwv_flow_api.g_varchar2_table(192) := 'cnsttbl\afelev\utinl\hwelev\spltpgpar\notcvasp\notbrkcnstfrctbl\notvatxbx\krnprsnet\cachedcolbal \no';
    wwv_flow_api.g_varchar2_table(193) := 'uicompat \fet0'||wwv_flow.LF||
'{\*\wgrffmtfilter 2450}\nofeaturethrottle1\ilfomacatclnup0'||wwv_flow.LF||
'{\*\docvar {xdo0002}{PGZvO';
    wwv_flow_api.g_varchar2_table(194) := 'mluc3RyZWFtLWZvcmVpZ24tb2JqZWN0IGNvbnRlbnQtdHlwZT0iaW1hZ2UvanBlZyIgICBoZWlnaHQ9IjQ4IHB4IiB3aWR0aD0iM';
    wwv_flow_api.g_varchar2_table(195) := 'TE1IHB4IiA+DQo8eHNsOnZhbHVlLW9mIHNlbGVjdD0iLi8vTEdPX1NMR0FOIi8+DQo8L2ZvOmluc3RyZWFtLWZvcmVpZ24tb2JqZ';
    wwv_flow_api.g_varchar2_table(196) := 'WN0Pg==}}'||wwv_flow.LF||
'{\*\docvar {xdo0003}{PGZvOmluc3RyZWFtLWZvcmVpZ24tb2JqZWN0IGNvbnRlbnQtdHlwZT0iaW1hZ2UvanBlZ';
    wwv_flow_api.g_varchar2_table(197) := 'yIgICBoZWlnaHQ9IjQ4IHB4IiB3aWR0aD0iMTE1IHB4IiA+DQo8eHNsOnZhbHVlLW9mIHNlbGVjdD0iLi8vTEdPX1NMR0FOIi8+D';
    wwv_flow_api.g_varchar2_table(198) := 'Qo8L2ZvOmluc3RyZWFtLWZvcmVpZ24tb2JqZWN0Pg==}}'||wwv_flow.LF||
'{\*\docvar {xdo0004}{PD9OTUJSRV9DTE5URT8+}}{\*\docvar ';
    wwv_flow_api.g_varchar2_table(199) := '{xdo0005}{PD9TTEdBTj8+}}{\*\docvar {xdo0006}{PD9Ob21icmVJbXB1ZXN0bz8+}}{\*\docvar {xdo0018}{PD9VU1VB';
    wwv_flow_api.g_varchar2_table(200) := 'UklPPz4=}}{\*\docvar {xdo0019}{PD9IT1k/Pg==}}{\*\docvar {xdo0020}{PD9JUEFERFI/Pg==}}'||wwv_flow.LF||
'{\*\docvar {xdo';
    wwv_flow_api.g_varchar2_table(201) := '0022}{PD9GRUNIQV9ERVNERT8+}}{\*\docvar {xdo0023}{PD9GRUNIQV9IQVNUQT8+}}{\*\docvar {xdo0061}{PHhzbDpm';
    wwv_flow_api.g_varchar2_table(202) := 'b3ItZWFjaC1ncm91cCBzZWxlY3Q9Ii4vL1JPV1NFVDFfUk9XIiBncm91cC1hZGphY2VudD0iY2FtcG9fYWdydXBhIj4=}}'||wwv_flow.LF||
'{\*\d';
    wwv_flow_api.g_varchar2_table(203) := 'ocvar {xdo0062}{PD9jYW1wb19hZ3J1cGE/Pg==}}{\*\docvar {xdo0067}{PD9mb3ItZWFjaDpjdXJyZW50LWdyb3VwKCk/P';
    wwv_flow_api.g_varchar2_table(204) := 'jw/c29ydDpQcm9waWV0YXJpbzsnYXNjZW5kaW5nJztkYXRhLXR5cGU9J3RleHQnPz4=}}{\*\docvar {xdo0068}{PD9OdW1lcm';
    wwv_flow_api.g_varchar2_table(205) := '9Eb2N1bWVudG8/Pg==}}'||wwv_flow.LF||
'{\*\docvar {xdo0069}{PD9SZWZlcmVuY2lhPz4=}}{\*\docvar {xdo0070}{PD9Qcm9waWV0YXJ';
    wwv_flow_api.g_varchar2_table(206) := 'pbz8+}}{\*\docvar {xdo0071}{PD9GZWNoYVBhZ28/Pg==}}{\*\docvar {xdo0072}{PD9Fc3RhZG8/Pg==}}{\*\docvar ';
    wwv_flow_api.g_varchar2_table(207) := '{xdo0073}{PD9Nb250b1BhZ28/Pg==}}'||wwv_flow.LF||
'{\*\docvar {xdo0074}{PD9lbmQgZm9yLWVhY2g/Pg==}}{\*\docvar {xdo0075}';
    wwv_flow_api.g_varchar2_table(208) := '{PC94c2w6Zm9yLWVhY2gtZ3JvdXA+}}{\*\docvar {xdo0076}{PD9zdW0oY3VycmVudC1ncm91cCgpL01vbnRvUGFnbyk/Pg==';
    wwv_flow_api.g_varchar2_table(209) := '}}{\*\docvar {xdo0078}{PD9DdWVudGFGaW5hbmNpZXJhPz4=}}{\*\ftnsep \ltrpar '||wwv_flow.LF||
'\pard\plain \ltrpar\ql \li0';
    wwv_flow_api.g_varchar2_table(210) := '\ri0\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsid2754504 \rtlch';
    wwv_flow_api.g_varchar2_table(211) := '\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp103';
    wwv_flow_api.g_varchar2_table(212) := '3 {\rtlch\fcs1 \af0 '||wwv_flow.LF||
'\ltrch\fcs0 \insrsid2638479 \chftnsep '||wwv_flow.LF||
'\par }}{\*\ftnsepc \ltrpar \pard\plain \';
    wwv_flow_api.g_varchar2_table(213) := 'ltrpar\ql \li0\ri0\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsid';
    wwv_flow_api.g_varchar2_table(214) := '2754504 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp92';
    wwv_flow_api.g_varchar2_table(215) := '26\langfenp1033 {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2638479 \chftnsepc '||wwv_flow.LF||
'\par }}{\*\aftnsep \ltrpa';
    wwv_flow_api.g_varchar2_table(216) := 'r \pard\plain \ltrpar\ql \li0\ri0\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0';
    wwv_flow_api.g_varchar2_table(217) := '\itap0\pararsid2754504 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033';
    wwv_flow_api.g_varchar2_table(218) := '\cgrid\langnp9226\langfenp1033 {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2638479 \chftnsep '||wwv_flow.LF||
'\par }}{\*\';
    wwv_flow_api.g_varchar2_table(219) := 'aftnsepc \ltrpar \pard\plain \ltrpar\ql \li0\ri0\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjust';
    wwv_flow_api.g_varchar2_table(220) := 'right\rin0\lin0\itap0\pararsid2754504 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang';
    wwv_flow_api.g_varchar2_table(221) := '9226\langfe1033\cgrid\langnp9226\langfenp1033 {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid2638479 \chftns';
    wwv_flow_api.g_varchar2_table(222) := 'epc '||wwv_flow.LF||
'\par }}\ltrpar \sectd \ltrsect\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\s';
    wwv_flow_api.g_varchar2_table(223) := 'ectdefaultcl\sectrsid2177339\sftnbj {\footerr \ltrpar \pard\plain \ltrpar\s18\qc \li0\ri0\widctlpar'||wwv_flow.LF||
'';
    wwv_flow_api.g_varchar2_table(224) := '\tqc\tx4419\tqr\tx8838\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsid132036';
    wwv_flow_api.g_varchar2_table(225) := '60 \rtlch\fcs1 \af0\afs20\alang1025 \ltrch\fcs0 \fs20\lang9226\langfe1033\loch\af31506\hich\af31506\';
    wwv_flow_api.g_varchar2_table(226) := 'dbch\af31505\cgrid\langnp9226\langfenp1033 {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid13203660 '||wwv_flow.LF||
'\par \hi';
    wwv_flow_api.g_varchar2_table(227) := 'ch\af31506\dbch\af31505\loch\f31506 <?call-template:footer?>'||wwv_flow.LF||
'\par }\pard\plain \ltrpar\s20\ql \li0\r';
    wwv_flow_api.g_varchar2_table(228) := 'i0\widctlpar\tqc\tx4419\tqr\tx8838\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pa';
    wwv_flow_api.g_varchar2_table(229) := 'rarsid13203660 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\f31506\fs22\lang9226\langfe1033\cgrid\';
    wwv_flow_api.g_varchar2_table(230) := 'langnp9226\langfenp1033 {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid9115223 '||wwv_flow.LF||
'\par }{\rtlch\fcs1 \af0 \ltrc';
    wwv_flow_api.g_varchar2_table(231) := 'h\fcs0 \insrsid13203660\charrsid13203660 '||wwv_flow.LF||
'\par }}{\*\pnseclvl1\pnucrm\pnstart1\pnindent720\pnhang {\';
    wwv_flow_api.g_varchar2_table(232) := 'pntxta .}}{\*\pnseclvl2\pnucltr\pnstart1\pnindent720\pnhang {\pntxta .}}{\*\pnseclvl3\pndec\pnstart1';
    wwv_flow_api.g_varchar2_table(233) := '\pnindent720\pnhang {\pntxta .}}{\*\pnseclvl4\pnlcltr\pnstart1\pnindent720\pnhang {\pntxta )}}'||wwv_flow.LF||
'{\*\p';
    wwv_flow_api.g_varchar2_table(234) := 'nseclvl5\pndec\pnstart1\pnindent720\pnhang {\pntxtb (}{\pntxta )}}{\*\pnseclvl6\pnlcltr\pnstart1\pni';
    wwv_flow_api.g_varchar2_table(235) := 'ndent720\pnhang {\pntxtb (}{\pntxta )}}{\*\pnseclvl7\pnlcrm\pnstart1\pnindent720\pnhang {\pntxtb (}{';
    wwv_flow_api.g_varchar2_table(236) := '\pntxta )}}{\*\pnseclvl8'||wwv_flow.LF||
'\pnlcltr\pnstart1\pnindent720\pnhang {\pntxtb (}{\pntxta )}}{\*\pnseclvl9\p';
    wwv_flow_api.g_varchar2_table(237) := 'nlcrm\pnstart1\pnindent720\pnhang {\pntxtb (}{\pntxta )}}\ltrrow\trowd \irow0\irowband0\ltrrow'||wwv_flow.LF||
'\ts17';
    wwv_flow_api.g_varchar2_table(238) := '\trqc\trgaph70\trleft-426\trftsWidth1\trftsWidthB3\trautofit1\trpaddl108\trpaddr108\trpaddfl3\trpadd';
    wwv_flow_api.g_varchar2_table(239) := 'ft3\trpaddfb3\trpaddfr3\tblrsid10123137\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind-318\tblindty';
    wwv_flow_api.g_varchar2_table(240) := 'pe3 \clvmgf\clvertalc\clbrdrt\brdrtbl \clbrdrl'||wwv_flow.LF||
'\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\';
    wwv_flow_api.g_varchar2_table(241) := 'clftsWidth3\clwWidth1942\clshdrawnil \cellx1516\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\';
    wwv_flow_api.g_varchar2_table(242) := 'brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth5244\clshdrawnil \cellx6760\clvmgf\clvertalb'||wwv_flow.LF||
'';
    wwv_flow_api.g_varchar2_table(243) := '\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth21';
    wwv_flow_api.g_varchar2_table(244) := '10\clshdrawnil \cellx8870\pard\plain \ltrpar\qc \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum';
    wwv_flow_api.g_varchar2_table(245) := '\faauto\adjustright\rin0\lin0\pararsid6299357\yts17 '||wwv_flow.LF||
'\rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f';
    wwv_flow_api.g_varchar2_table(246) := '31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\*\bkmkstart Texto347}{\field{\*\fldin';
    wwv_flow_api.g_varchar2_table(247) := 'st {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid7612416  FORMTEXT }{\rtlch\fcs1 \af38\';
    wwv_flow_api.g_varchar2_table(248) := 'afs18 '||wwv_flow.LF||
'\ltrch\fcs0 \b\f31502\fs18\insrsid7612416 {\*\datafield 800300000000000008546578746f333437000';
    wwv_flow_api.g_varchar2_table(249) := '94c474f5f534c47414e00000000000f3c3f7265663a78646f303030333f3e0000000000}{\*\formfield{\fftype0\ffown';
    wwv_flow_api.g_varchar2_table(250) := 'help\ffownstat\ffprot\fftypetxt0{\*\ffname Texto347}'||wwv_flow.LF||
'{\*\ffdeftext LGO_SLGAN}{\*\ffstattext <?ref:xd';
    wwv_flow_api.g_varchar2_table(251) := 'o0003?>}}}}}{\fldrslt {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\lang1024\langfe1024\noproo';
    wwv_flow_api.g_varchar2_table(252) := 'f\insrsid7612416 LGO_SLGAN}}}\sectd \ltrsect'||wwv_flow.LF||
'\linex0\headery708\footery708\colsx708\endnhere\sectlin';
    wwv_flow_api.g_varchar2_table(253) := 'egrid360\sectdefaultcl\sectrsid2177339\sftnbj {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\in';
    wwv_flow_api.g_varchar2_table(254) := 'srsid2177339 {\*\bkmkend Texto347}\cell }\pard \ltrpar'||wwv_flow.LF||
'\qc \li0\ri0\widctlpar\intbl\wrapdefault\aspa';
    wwv_flow_api.g_varchar2_table(255) := 'lpha\aspnum\faauto\adjustright\rin0\lin0\pararsid8404187\yts17 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 ';
    wwv_flow_api.g_varchar2_table(256) := '\b\f31502\fs18\insrsid2177339 \cell }\pard \ltrpar'||wwv_flow.LF||
'\qc \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha';
    wwv_flow_api.g_varchar2_table(257) := '\aspnum\faauto\adjustright\rin0\lin0\pararsid10123137\yts17 {\*\bkmkstart Texto342}{\field\flddirty{';
    wwv_flow_api.g_varchar2_table(258) := '\*\fldinst {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid7612416\charrsid7612416  FORMT';
    wwv_flow_api.g_varchar2_table(259) := 'EXT }{'||wwv_flow.LF||
'\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid7612416\charrsid7612416 {\*\datafie';
    wwv_flow_api.g_varchar2_table(260) := 'ld 800100000000000008546578746f33343200094c474f5f534c47414e00000000000f3c3f7265663a78646f303030323f3';
    wwv_flow_api.g_varchar2_table(261) := 'e0000000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto342}{\*\ffdeftext ';
    wwv_flow_api.g_varchar2_table(262) := 'LGO_SLGAN}{\*\ffstattext <?ref:xdo0002?>}}}}}{\fldrslt {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f3150';
    wwv_flow_api.g_varchar2_table(263) := '2\fs18\lang1024\langfe1024\noproof\insrsid7612416\charrsid7612416 '||wwv_flow.LF||
'LGO_SLGAN}}}\sectd \ltrsect\linex';
    wwv_flow_api.g_varchar2_table(264) := '0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid2177339\sftnbj {\rtl';
    wwv_flow_api.g_varchar2_table(265) := 'ch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid2177339 {\*\bkmkend Texto342}\cell }\pard\plai';
    wwv_flow_api.g_varchar2_table(266) := 'n \ltrpar'||wwv_flow.LF||
'\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjust';
    wwv_flow_api.g_varchar2_table(267) := 'right\rin0\lin0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\';
    wwv_flow_api.g_varchar2_table(268) := 'langnp9226\langfenp1033 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 '||wwv_flow.LF||
'\b\f31502\fs18\insrsid2177339 \trowd \';
    wwv_flow_api.g_varchar2_table(269) := 'irow0\irowband0\ltrrow'||wwv_flow.LF||
'\ts17\trqc\trgaph70\trleft-426\trftsWidth1\trftsWidthB3\trautofit1\trpaddl108';
    wwv_flow_api.g_varchar2_table(270) := '\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid10123137\tbllkhdrrows\tbllkhdrcols\tbllkn';
    wwv_flow_api.g_varchar2_table(271) := 'ocolband\tblind-318\tblindtype3 \clvmgf\clvertalc\clbrdrt\brdrtbl \clbrdrl'||wwv_flow.LF||
'\brdrtbl \clbrdrb\brdrtbl';
    wwv_flow_api.g_varchar2_table(272) := ' \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1942\clshdrawnil \cellx1516\clvertalc\clbrdrt\brdrtb';
    wwv_flow_api.g_varchar2_table(273) := 'l \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth5244\clshdrawnil ';
    wwv_flow_api.g_varchar2_table(274) := '\cellx6760\clvmgf\clvertalb'||wwv_flow.LF||
'\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \clt';
    wwv_flow_api.g_varchar2_table(275) := 'xlrtb\clftsWidth3\clwWidth2110\clshdrawnil \cellx8870\row \ltrrow}\trowd \irow1\irowband1\ltrrow'||wwv_flow.LF||
'\ts';
    wwv_flow_api.g_varchar2_table(276) := '17\trqc\trgaph70\trleft-426\trftsWidth1\trftsWidthB3\trautofit1\trpaddl108\trpaddr108\trpaddfl3\trpa';
    wwv_flow_api.g_varchar2_table(277) := 'ddft3\trpaddfb3\trpaddfr3\tblrsid6905327\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind-318\tblindt';
    wwv_flow_api.g_varchar2_table(278) := 'ype3 \clvmrg\clvertalt\clbrdrt\brdrtbl \clbrdrl'||wwv_flow.LF||
'\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb';
    wwv_flow_api.g_varchar2_table(279) := '\clftsWidth3\clwWidth1942\clshdrawnil \cellx1516\clvertalb\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb';
    wwv_flow_api.g_varchar2_table(280) := '\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth5244\clshdrawnil \cellx6760\clvmrg\clvertalt';
    wwv_flow_api.g_varchar2_table(281) := ''||wwv_flow.LF||
'\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2';
    wwv_flow_api.g_varchar2_table(282) := '110\clshdrawnil \cellx8870\pard\plain \ltrpar\ql \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnu';
    wwv_flow_api.g_varchar2_table(283) := 'm\faauto\adjustright\rin0\lin0\pararsid220485\yts17 '||wwv_flow.LF||
'\rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f';
    wwv_flow_api.g_varchar2_table(284) := '31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b';
    wwv_flow_api.g_varchar2_table(285) := '\f31502\fs18\insrsid2177339 \cell }\pard \ltrpar'||wwv_flow.LF||
'\qc \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha\a';
    wwv_flow_api.g_varchar2_table(286) := 'spnum\faauto\adjustright\rin0\lin0\pararsid6905327\yts17 {\*\bkmkstart Texto344}{\field\flddirty{\*\';
    wwv_flow_api.g_varchar2_table(287) := 'fldinst {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid7612416\charrsid7612416  FORMTEXT';
    wwv_flow_api.g_varchar2_table(288) := ' }{'||wwv_flow.LF||
'\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid7612416\charrsid7612416 {\*\datafield ';
    wwv_flow_api.g_varchar2_table(289) := '800100000000000008546578746f333434000b4e4d4252455f434c4e544500000000000f3c3f7265663a78646f303030343f';
    wwv_flow_api.g_varchar2_table(290) := '3e0000000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto344}{\*\ffdeftext';
    wwv_flow_api.g_varchar2_table(291) := ' NMBRE_CLNTE}{\*\ffstattext <?ref:xdo0004?>}}}}}{\fldrslt {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f3';
    wwv_flow_api.g_varchar2_table(292) := '1502\fs18\lang1024\langfe1024\noproof\insrsid7612416\charrsid7612416 '||wwv_flow.LF||
'NMBRE_CLNTE}}}\sectd \ltrsect\';
    wwv_flow_api.g_varchar2_table(293) := 'linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid2177339\sftnbj ';
    wwv_flow_api.g_varchar2_table(294) := '{\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid2177339 {\*\bkmkend Texto344}\cell }\pard';
    wwv_flow_api.g_varchar2_table(295) := ' \ltrpar'||wwv_flow.LF||
'\ql \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\parar';
    wwv_flow_api.g_varchar2_table(296) := 'sid220485\yts17 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid2177339 \cell }\pard\plai';
    wwv_flow_api.g_varchar2_table(297) := 'n \ltrpar\ql \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjust';
    wwv_flow_api.g_varchar2_table(298) := 'right\rin0\lin0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\';
    wwv_flow_api.g_varchar2_table(299) := 'langnp9226\langfenp1033 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid2177339 '||wwv_flow.LF||
'\trowd \';
    wwv_flow_api.g_varchar2_table(300) := 'irow1\irowband1\ltrrow\ts17\trqc\trgaph70\trleft-426\trftsWidth1\trftsWidthB3\trautofit1\trpaddl108\';
    wwv_flow_api.g_varchar2_table(301) := 'trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid6905327\tbllkhdrrows\tbllkhdrcols\tbllknoc';
    wwv_flow_api.g_varchar2_table(302) := 'olband\tblind-318\tblindtype3 \clvmrg\clvertalt'||wwv_flow.LF||
'\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \';
    wwv_flow_api.g_varchar2_table(303) := 'clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1942\clshdrawnil \cellx1516\clvertalb\clbrdrt\brdrtbl ';
    wwv_flow_api.g_varchar2_table(304) := '\clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth5244\clshdrawnil '||wwv_flow.LF||
'\';
    wwv_flow_api.g_varchar2_table(305) := 'cellx6760\clvmrg\clvertalt\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxl';
    wwv_flow_api.g_varchar2_table(306) := 'rtb\clftsWidth3\clwWidth2110\clshdrawnil \cellx8870\row \ltrrow}\trowd \irow2\irowband2\ltrrow'||wwv_flow.LF||
'\ts17';
    wwv_flow_api.g_varchar2_table(307) := '\trqc\trgaph70\trrh127\trleft-426\trftsWidth1\trftsWidthB3\trautofit1\trpaddl108\trpaddr108\trpaddfl';
    wwv_flow_api.g_varchar2_table(308) := '3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid11931011\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind-318\';
    wwv_flow_api.g_varchar2_table(309) := 'tblindtype3 \clvmrg\clvertalt\clbrdrt\brdrtbl '||wwv_flow.LF||
'\clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \c';
    wwv_flow_api.g_varchar2_table(310) := 'ltxlrtb\clftsWidth3\clwWidth1942\clshdrawnil \cellx1516\clvertalb\clbrdrt\brdrtbl \clbrdrl\brdrtbl \';
    wwv_flow_api.g_varchar2_table(311) := 'clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth5244\clshdrawnil \cellx6760'||wwv_flow.LF||
'\clvmrg\c';
    wwv_flow_api.g_varchar2_table(312) := 'lvertalt\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\cl';
    wwv_flow_api.g_varchar2_table(313) := 'wWidth2110\clshdrawnil \cellx8870\pard\plain \ltrpar'||wwv_flow.LF||
'\ql \li0\ri0\widctlpar\intbl\wrapdefault\aspalp';
    wwv_flow_api.g_varchar2_table(314) := 'ha\aspnum\faauto\adjustright\rin0\lin0\pararsid220485\yts17 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\';
    wwv_flow_api.g_varchar2_table(315) := 'fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af38\afs18 \ltrch\';
    wwv_flow_api.g_varchar2_table(316) := 'fcs0 '||wwv_flow.LF||
'\b\f31502\fs18\insrsid2177339 \cell }\pard \ltrpar\qc \li0\ri0\widctlpar\intbl\wrapdefault\asp';
    wwv_flow_api.g_varchar2_table(317) := 'alpha\aspnum\faauto\adjustright\rin0\lin0\pararsid11931011\yts17 {\*\bkmkstart Texto345}{\field\fldd';
    wwv_flow_api.g_varchar2_table(318) := 'irty{\*\fldinst {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 '||wwv_flow.LF||
'\b\f31502\fs18\insrsid7612416\charrsid7612416 ';
    wwv_flow_api.g_varchar2_table(319) := ' FORMTEXT }{\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid7612416\charrsid7612416 {\*\da';
    wwv_flow_api.g_varchar2_table(320) := 'tafield 800100000000000008546578746f3334350005534c47414e00000000000f3c3f7265663a78646f303030353f3e00';
    wwv_flow_api.g_varchar2_table(321) := '00000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto345}{\*\ffdeftext SLG';
    wwv_flow_api.g_varchar2_table(322) := 'AN}{\*\ffstattext <?ref:xdo0005?>}}}}}{\fldrslt {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\';
    wwv_flow_api.g_varchar2_table(323) := 'lang1024\langfe1024\noproof\insrsid7612416\charrsid7612416 SLGAN}'||wwv_flow.LF||
'}}\sectd \ltrsect\linex0\headery70';
    wwv_flow_api.g_varchar2_table(324) := '8\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid2177339\sftnbj {\rtlch\fcs1 \af';
    wwv_flow_api.g_varchar2_table(325) := '38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid2177339 {\*\bkmkend Texto345}\cell }\pard \ltrpar'||wwv_flow.LF||
'\ql \li';
    wwv_flow_api.g_varchar2_table(326) := '0\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid220485\yts17 ';
    wwv_flow_api.g_varchar2_table(327) := '{\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid2177339 \cell }\pard\plain \ltrpar\ql \li';
    wwv_flow_api.g_varchar2_table(328) := '0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0 ';
    wwv_flow_api.g_varchar2_table(329) := '\rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langf';
    wwv_flow_api.g_varchar2_table(330) := 'enp1033 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid2177339 '||wwv_flow.LF||
'\trowd \irow2\irowband2\';
    wwv_flow_api.g_varchar2_table(331) := 'ltrrow\ts17\trqc\trgaph70\trrh127\trleft-426\trftsWidth1\trftsWidthB3\trautofit1\trpaddl108\trpaddr1';
    wwv_flow_api.g_varchar2_table(332) := '08\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid11931011\tbllkhdrrows\tbllkhdrcols\tbllknocolband\';
    wwv_flow_api.g_varchar2_table(333) := 'tblind-318\tblindtype3 '||wwv_flow.LF||
'\clvmrg\clvertalt\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr';
    wwv_flow_api.g_varchar2_table(334) := '\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1942\clshdrawnil \cellx1516\clvertalb\clbrdrt\brdrtbl \clbrdr';
    wwv_flow_api.g_varchar2_table(335) := 'l\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl '||wwv_flow.LF||
'\cltxlrtb\clftsWidth3\clwWidth5244\clshdrawnil \cellx67';
    wwv_flow_api.g_varchar2_table(336) := '60\clvmrg\clvertalt\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clf';
    wwv_flow_api.g_varchar2_table(337) := 'tsWidth3\clwWidth2110\clshdrawnil \cellx8870\row \ltrrow}\trowd \irow3\irowband3\lastrow \ltrrow'||wwv_flow.LF||
'\ts';
    wwv_flow_api.g_varchar2_table(338) := '17\trqc\trgaph70\trrh80\trleft-426\trftsWidth1\trftsWidthB3\trautofit1\trpaddl108\trpaddr108\trpaddf';
    wwv_flow_api.g_varchar2_table(339) := 'l3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid11931011\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind-318';
    wwv_flow_api.g_varchar2_table(340) := '\tblindtype3 \clvertalt\clbrdrt\brdrtbl \clbrdrl'||wwv_flow.LF||
'\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrt';
    wwv_flow_api.g_varchar2_table(341) := 'b\clftsWidth3\clwWidth1942\clshdrawnil \cellx1516\clvertalt\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdr';
    wwv_flow_api.g_varchar2_table(342) := 'b\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth5244\clshdrawnil \cellx6760\clvertalt\clbrd';
    wwv_flow_api.g_varchar2_table(343) := 'rt'||wwv_flow.LF||
'\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2110\cl';
    wwv_flow_api.g_varchar2_table(344) := 'shdrawnil \cellx8870\pard\plain \ltrpar\ql \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faau';
    wwv_flow_api.g_varchar2_table(345) := 'to\adjustright\rin0\lin0\pararsid220485\yts17 \rtlch\fcs1 '||wwv_flow.LF||
'\af0\afs22\alang1025 \ltrch\fcs0 \f31506\';
    wwv_flow_api.g_varchar2_table(346) := 'fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f3150';
    wwv_flow_api.g_varchar2_table(347) := '2\fs18\insrsid8993502 \cell }\pard \ltrpar'||wwv_flow.LF||
'\qc \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\';
    wwv_flow_api.g_varchar2_table(348) := 'faauto\adjustright\rin0\lin0\pararsid11931011\yts17 {\*\bkmkstart Texto346}{\field\flddirty{\*\fldin';
    wwv_flow_api.g_varchar2_table(349) := 'st {\rtlch\fcs1 \af38\afs20 \ltrch\fcs0 \b\f31502\fs20\insrsid7612416\charrsid2963470  FORMTEXT }{'||wwv_flow.LF||
'\';
    wwv_flow_api.g_varchar2_table(350) := 'rtlch\fcs1 \af38\afs20 \ltrch\fcs0 \b\f31502\fs20\insrsid7612416\charrsid2963470 {\*\datafield 80010';
    wwv_flow_api.g_varchar2_table(351) := '0000000000008546578746f333436000e4e6f6d627265496d70756573746f00000000000f3c3f7265663a78646f303030363';
    wwv_flow_api.g_varchar2_table(352) := 'f3e0000000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto346}{\*\ffdeftex';
    wwv_flow_api.g_varchar2_table(353) := 't NombreImpuesto}{\*\ffstattext <?ref:xdo0006?>}}}}}{\fldrslt {\rtlch\fcs1 \af38\afs20 \ltrch\fcs0 '||wwv_flow.LF||
'';
    wwv_flow_api.g_varchar2_table(354) := '\b\f31502\fs20\lang1024\langfe1024\noproof\insrsid7612416\charrsid2963470 NombreImpuesto}}}\sectd \l';
    wwv_flow_api.g_varchar2_table(355) := 'trsect\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid2177339\';
    wwv_flow_api.g_varchar2_table(356) := 'sftnbj {\rtlch\fcs1 \af38\afs20 \ltrch\fcs0 '||wwv_flow.LF||
'\b\f31502\fs20\insrsid8993502\charrsid2963470 {\*\bkmke';
    wwv_flow_api.g_varchar2_table(357) := 'nd Texto346}\cell }\pard \ltrpar\ql \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adju';
    wwv_flow_api.g_varchar2_table(358) := 'stright\rin0\lin0\pararsid220485\yts17 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 '||wwv_flow.LF||
'\b\f31502\fs18\insrsid8';
    wwv_flow_api.g_varchar2_table(359) := '993502 \cell }\pard\plain \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\intbl\wrapdefault\aspalp';
    wwv_flow_api.g_varchar2_table(360) := 'ha\aspnum\faauto\adjustright\rin0\lin0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\f31506\fs22\la';
    wwv_flow_api.g_varchar2_table(361) := 'ng9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\';
    wwv_flow_api.g_varchar2_table(362) := 'insrsid8993502 \trowd \irow3\irowband3\lastrow \ltrrow'||wwv_flow.LF||
'\ts17\trqc\trgaph70\trrh80\trleft-426\trftsWi';
    wwv_flow_api.g_varchar2_table(363) := 'dth1\trftsWidthB3\trautofit1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid11';
    wwv_flow_api.g_varchar2_table(364) := '931011\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind-318\tblindtype3 \clvertalt\clbrdrt\brdrtbl \c';
    wwv_flow_api.g_varchar2_table(365) := 'lbrdrl'||wwv_flow.LF||
'\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1942\clshdrawnil \ce';
    wwv_flow_api.g_varchar2_table(366) := 'llx1516\clvertalt\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clfts';
    wwv_flow_api.g_varchar2_table(367) := 'Width3\clwWidth5244\clshdrawnil \cellx6760\clvertalt\clbrdrt'||wwv_flow.LF||
'\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdr';
    wwv_flow_api.g_varchar2_table(368) := 'tbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2110\clshdrawnil \cellx8870\row }\pard \ltrpar\ql';
    wwv_flow_api.g_varchar2_table(369) := ' \li0\ri0\sa160\sl259\slmult1\widctlpar'||wwv_flow.LF||
'\tx4590\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\';
    wwv_flow_api.g_varchar2_table(370) := 'lin0\itap0\pararsid12661063 {\rtlch\fcs1 \af38\afs2 \ltrch\fcs0 \b\f31502\fs2\insrsid2177339\charrsi';
    wwv_flow_api.g_varchar2_table(371) := 'd12661063 '||wwv_flow.LF||
'\par \ltrrow}\trowd \irow0\irowband0\lastrow \ltrrow\ts17\trgaph70\trleft-108\tpvpara\tph';
    wwv_flow_api.g_varchar2_table(372) := 'mrg\tposxc\tposy128\tdfrmtxtLeft141\tdfrmtxtRight141\trftsWidth3\trwWidth10314\trftsWidthB3\trautofi';
    wwv_flow_api.g_varchar2_table(373) := 't1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3'||wwv_flow.LF||
'\tblrsid4865145\tbllkhdrrows\tbllkh';
    wwv_flow_api.g_varchar2_table(374) := 'drcols\tbllknocolband\tblind0\tblindtype3 \clvertalb\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrt';
    wwv_flow_api.g_varchar2_table(375) := 'bl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth10314\clshdrawnil \cellx10206\pard\plain \ltrpar'||wwv_flow.LF||
'\';
    wwv_flow_api.g_varchar2_table(376) := 'qc \li0\ri0\widctlpar\intbl\pvpara\phmrg\posxc\posy128\dxfrtext141\dfrmtxtx141\dfrmtxty0\wraparound\';
    wwv_flow_api.g_varchar2_table(377) := 'aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid2177339\yts17 \rtlch\fcs1 \af0\afs22\alang1025 ';
    wwv_flow_api.g_varchar2_table(378) := '\ltrch\fcs0 '||wwv_flow.LF||
'\f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af0\afs18 ';
    wwv_flow_api.g_varchar2_table(379) := '\ltrch\fcs0 \b\fs18\insrsid5602073          }{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0 \b\fs18\insrsid2381';
    wwv_flow_api.g_varchar2_table(380) := '965    }{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0 \b\fs18\insrsid5602073 '||wwv_flow.LF||
'   }{\rtlch\fcs1 \af0\afs18 \ltr';
    wwv_flow_api.g_varchar2_table(381) := 'ch\fcs0 \b\fs18\insrsid4865145   }{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0 \b\fs18\insrsid2754504  }{\rtl';
    wwv_flow_api.g_varchar2_table(382) := 'ch\fcs1 \af0\afs18 \ltrch\fcs0 \b\fs18\insrsid2177339\charrsid2363257 '||wwv_flow.LF||
'LISTADO DE PROCESAMIENTO DE R';
    wwv_flow_api.g_varchar2_table(383) := 'ECAUDOS POR BANCO ENTRE UN RANGO DE FECHAS\cell }\pard\plain \ltrpar\ql \li0\ri0\sa160\sl259\slmult1';
    wwv_flow_api.g_varchar2_table(384) := '\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0 \rtlch\fcs1 \af0\afs22\ala';
    wwv_flow_api.g_varchar2_table(385) := 'ng1025 \ltrch\fcs0 '||wwv_flow.LF||
'\f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af0';
    wwv_flow_api.g_varchar2_table(386) := ' \ltrch\fcs0 \insrsid2177339 \trowd \irow0\irowband0\lastrow \ltrrow'||wwv_flow.LF||
'\ts17\trgaph70\trleft-108\tpvpa';
    wwv_flow_api.g_varchar2_table(387) := 'ra\tphmrg\tposxc\tposy128\tdfrmtxtLeft141\tdfrmtxtRight141\trftsWidth3\trwWidth10314\trftsWidthB3\tr';
    wwv_flow_api.g_varchar2_table(388) := 'autofit1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3'||wwv_flow.LF||
'\tblrsid4865145\tbllkhdrrows\';
    wwv_flow_api.g_varchar2_table(389) := 'tbllkhdrcols\tbllknocolband\tblind0\tblindtype3 \clvertalb\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb';
    wwv_flow_api.g_varchar2_table(390) := '\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth10314\clshdrawnil \cellx10206\row }\pard \lt';
    wwv_flow_api.g_varchar2_table(391) := 'rpar'||wwv_flow.LF||
'\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\';
    wwv_flow_api.g_varchar2_table(392) := 'lin0\itap0\pararsid220485 {\rtlch\fcs1 \af38\afs4 \ltrch\fcs0 \b\f31502\fs4\insrsid2177339\charrsid4';
    wwv_flow_api.g_varchar2_table(393) := '865145 '||wwv_flow.LF||
'\par \ltrrow}\trowd \irow0\irowband0\lastrow \ltrrow\ts17\trqc\trgaph70\trleft-108\trftsWidt';
    wwv_flow_api.g_varchar2_table(394) := 'h1\trftsWidthB3\trautofit1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid8404';
    wwv_flow_api.g_varchar2_table(395) := '187\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind0\tblindtype3 '||wwv_flow.LF||
'\clvertalc\clbrdrt\brdrtbl \clbrdr';
    wwv_flow_api.g_varchar2_table(396) := 'l\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2244\clshdrawnil \cellx213';
    wwv_flow_api.g_varchar2_table(397) := '6\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl '||wwv_flow.LF||
'\cltxlrtb\clftsWidth';
    wwv_flow_api.g_varchar2_table(398) := '3\clwWidth2244\clshdrawnil \cellx4380\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \c';
    wwv_flow_api.g_varchar2_table(399) := 'lbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2245\clshdrawnil \cellx6625\clvertalc\clbrdrt\brdrtbl \';
    wwv_flow_api.g_varchar2_table(400) := 'clbrdrl\brdrtbl \clbrdrb\brdrtbl '||wwv_flow.LF||
'\clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2245\clshdrawnil \c';
    wwv_flow_api.g_varchar2_table(401) := 'ellx8870\pard\plain \ltrpar\qr \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustrig';
    wwv_flow_api.g_varchar2_table(402) := 'ht\rin0\lin0\pararsid9469739\yts17 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\f31506\fs22\lang92';
    wwv_flow_api.g_varchar2_table(403) := '26\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af38\afs2 \ltrch\fcs0 \b\f31502\fs2\insrsi';
    wwv_flow_api.g_varchar2_table(404) := 'd12721209 \tab }{\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid9469739\charrsid9469739 F';
    wwv_flow_api.g_varchar2_table(405) := 'echa Desde}{\rtlch\fcs1 \af38\afs16 '||wwv_flow.LF||
'\ltrch\fcs0 \b\f31502\fs16\insrsid9469739 :}{\rtlch\fcs1 \af38\';
    wwv_flow_api.g_varchar2_table(406) := 'afs16 \ltrch\fcs0 \b\f31502\fs16\insrsid9469739\charrsid9469739 \cell }\pard \ltrpar\ql \li0\ri0\wid';
    wwv_flow_api.g_varchar2_table(407) := 'ctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid876571\yts17 '||wwv_flow.LF||
'{\*\bkmk';
    wwv_flow_api.g_varchar2_table(408) := 'start Texto268}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af38\afs16 \ltrch\fcs0 \b\f31502\fs16\insrs';
    wwv_flow_api.g_varchar2_table(409) := 'id7748740\charrsid7748740  FORMTEXT }{\rtlch\fcs1 \af38\afs16 \ltrch\fcs0 \b\f31502\fs16\insrsid7748';
    wwv_flow_api.g_varchar2_table(410) := '740\charrsid7748740 {\*\datafield '||wwv_flow.LF||
'800100000000000008546578746f323638000b46454348415f444553444500000';
    wwv_flow_api.g_varchar2_table(411) := '000000f3c3f7265663a78646f303032323f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt';
    wwv_flow_api.g_varchar2_table(412) := '0{\*\ffname Texto268}{\*\ffdeftext FECHA_DESDE}{\*\ffstattext <?ref:xdo0022?>}}}}'||wwv_flow.LF||
'}{\fldrslt {\rtlch';
    wwv_flow_api.g_varchar2_table(413) := '\fcs1 \af38\afs16 \ltrch\fcs0 \b\f31502\fs16\lang1024\langfe1024\noproof\insrsid7748740\charrsid7748';
    wwv_flow_api.g_varchar2_table(414) := '740 FECHA_DESDE}}}\sectd \ltrsect\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sec';
    wwv_flow_api.g_varchar2_table(415) := 'tdefaultcl\sectrsid2177339\sftnbj {'||wwv_flow.LF||
'\rtlch\fcs1 \af38\afs16 \ltrch\fcs0 \b\f31502\fs16\insrsid946973';
    wwv_flow_api.g_varchar2_table(416) := '9\charrsid876571 {\*\bkmkend Texto268}\cell }\pard \ltrpar\qr \li0\ri0\widctlpar\intbl\wrapdefault\a';
    wwv_flow_api.g_varchar2_table(417) := 'spalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid9469739\yts17 {\rtlch\fcs1 \af38\afs18 '||wwv_flow.LF||
'\ltrch\f';
    wwv_flow_api.g_varchar2_table(418) := 'cs0 \b\f31502\fs18\insrsid9469739\charrsid9469739 Fecha Hasta}{\rtlch\fcs1 \af38\afs16 \ltrch\fcs0 \';
    wwv_flow_api.g_varchar2_table(419) := 'b\f31502\fs16\insrsid9469739 : }{\rtlch\fcs1 \af38\afs16 \ltrch\fcs0 \b\f31502\fs16\insrsid9469739\c';
    wwv_flow_api.g_varchar2_table(420) := 'harrsid9469739 \cell }\pard \ltrpar'||wwv_flow.LF||
'\ql \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\';
    wwv_flow_api.g_varchar2_table(421) := 'adjustright\rin0\lin0\pararsid876571\yts17 {\*\bkmkstart Texto269}{\field\flddirty{\*\fldinst {\rtlc';
    wwv_flow_api.g_varchar2_table(422) := 'h\fcs1 \af38\afs16 \ltrch\fcs0 \b\f31502\fs16\insrsid7748740\charrsid7748740  FORMTEXT }{'||wwv_flow.LF||
'\rtlch\fcs';
    wwv_flow_api.g_varchar2_table(423) := '1 \af38\afs16 \ltrch\fcs0 \b\f31502\fs16\insrsid7748740\charrsid7748740 {\*\datafield 80010000000000';
    wwv_flow_api.g_varchar2_table(424) := '0008546578746f323639000b46454348415f484153544100000000000f3c3f7265663a78646f303032333f3e0000000000}'||wwv_flow.LF||
'';
    wwv_flow_api.g_varchar2_table(425) := '{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto269}{\*\ffdeftext FECHA_HASTA}{';
    wwv_flow_api.g_varchar2_table(426) := '\*\ffstattext <?ref:xdo0023?>}}}}}{\fldrslt {\rtlch\fcs1 \af38\afs16 \ltrch\fcs0 \b\f31502\fs16\lang';
    wwv_flow_api.g_varchar2_table(427) := '1024\langfe1024\noproof\insrsid7748740\charrsid7748740 '||wwv_flow.LF||
'FECHA_HASTA}}}\sectd \ltrsect\linex0\headery';
    wwv_flow_api.g_varchar2_table(428) := '708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid2177339\sftnbj {\rtlch\fcs1 \';
    wwv_flow_api.g_varchar2_table(429) := 'af38\afs16 \ltrch\fcs0 \b\f31502\fs16\insrsid9469739\charrsid876571 {\*\bkmkend Texto269}\cell '||wwv_flow.LF||
'}\pa';
    wwv_flow_api.g_varchar2_table(430) := 'rd\plain \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\';
    wwv_flow_api.g_varchar2_table(431) := 'adjustright\rin0\lin0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\';
    wwv_flow_api.g_varchar2_table(432) := 'cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 '||wwv_flow.LF||
'\af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid9469739 \t';
    wwv_flow_api.g_varchar2_table(433) := 'rowd \irow0\irowband0\lastrow \ltrrow'||wwv_flow.LF||
'\ts17\trqc\trgaph70\trleft-108\trftsWidth1\trftsWidthB3\trauto';
    wwv_flow_api.g_varchar2_table(434) := 'fit1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid8404187\tbllkhdrrows\tbllk';
    wwv_flow_api.g_varchar2_table(435) := 'hdrcols\tbllknocolband\tblind0\tblindtype3 \clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl '||wwv_flow.LF||
'\clbrdrb\brd';
    wwv_flow_api.g_varchar2_table(436) := 'rtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2244\clshdrawnil \cellx2136\clvertalc\clbrdrt\br';
    wwv_flow_api.g_varchar2_table(437) := 'drtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2244\clshdraw';
    wwv_flow_api.g_varchar2_table(438) := 'nil \cellx4380\clvertalc\clbrdrt\brdrtbl '||wwv_flow.LF||
'\clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlr';
    wwv_flow_api.g_varchar2_table(439) := 'tb\clftsWidth3\clwWidth2245\clshdrawnil \cellx6625\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrd';
    wwv_flow_api.g_varchar2_table(440) := 'rb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2245\clshdrawnil \cellx8870\row '||wwv_flow.LF||
'}\pard \l';
    wwv_flow_api.g_varchar2_table(441) := 'trpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\';
    wwv_flow_api.g_varchar2_table(442) := 'lin0\itap0\pararsid6379667 {\*\bkmkstart Texto405}{\*\bkmkstart Texto187}{\field\flddirty{\*\fldinst';
    wwv_flow_api.g_varchar2_table(443) := ' {\rtlch\fcs1 \af0 \ltrch\fcs0 '||wwv_flow.LF||
'\cf9\insrsid5004344\charrsid5004344  FORMTEXT }{\rtlch\fcs1 \af0 \lt';
    wwv_flow_api.g_varchar2_table(444) := 'rch\fcs0 \cf9\insrsid5004344\charrsid5004344 {\*\datafield '||wwv_flow.LF||
'800100000000000008546578746f343035002167';
    wwv_flow_api.g_varchar2_table(445) := '726f757020524f57534554315f524f572062792063616d706f5f61677275706100000000000f3c3f7265663a78646f303036';
    wwv_flow_api.g_varchar2_table(446) := '313f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto405}{\*\ffdeft';
    wwv_flow_api.g_varchar2_table(447) := 'ext '||wwv_flow.LF||
'group ROWSET1_ROW by campo_agrupa}{\*\ffstattext <?ref:xdo0061?>}}}}}{\fldrslt {\rtlch\fcs1 \af';
    wwv_flow_api.g_varchar2_table(448) := '0 \ltrch\fcs0 \cf9\lang1024\langfe1024\noproof\insrsid5004344\charrsid5004344 group ROWSET1_ROW by c';
    wwv_flow_api.g_varchar2_table(449) := 'ampo_agrupa}}}\sectd \ltrsect'||wwv_flow.LF||
'\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectde';
    wwv_flow_api.g_varchar2_table(450) := 'faultcl\sectrsid2177339\sftnbj {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid5004344 {\*\bkmkend Texto405}'||wwv_flow.LF||
'\';
    wwv_flow_api.g_varchar2_table(451) := 'par }\pard\plain \ltrpar\s1\ql \li0\ri0\sb240\sl259\slmult1\keep\keepn\widctlpar\wrapdefault\aspalph';
    wwv_flow_api.g_varchar2_table(452) := 'a\aspnum\faauto\outlinelevel0\adjustright\rin0\lin0\itap0\pararsid5004344 \rtlch\fcs1 \af0\afs32\ala';
    wwv_flow_api.g_varchar2_table(453) := 'ng1025 \ltrch\fcs0 '||wwv_flow.LF||
'\fs32\cf19\lang9226\langfe1033\loch\af31502\hich\af31502\dbch\af31501\cgrid\lang';
    wwv_flow_api.g_varchar2_table(454) := 'np9226\langfenp1033 {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\cf0\insrsid5004344 '||wwv_flow.LF||
'\par \ltrrow}\trow';
    wwv_flow_api.g_varchar2_table(455) := 'd \irow0\irowband0\ltrrow\ts17\trgaph70\trrh219\trleft-108\trbrdrt\brdrs\brdrw10\brdrcf20 \trbrdrl\b';
    wwv_flow_api.g_varchar2_table(456) := 'rdrs\brdrw10\brdrcf20 \trbrdrb\brdrs\brdrw10\brdrcf20 \trbrdrr\brdrs\brdrw10\brdrcf20 \trbrdrh\brdrs';
    wwv_flow_api.g_varchar2_table(457) := '\brdrw10\brdrcf20 \trbrdrv'||wwv_flow.LF||
'\brdrs\brdrw10\brdrcf20 \trftsWidth1\trftsWidthB3\trftsWidthA3\trwWidthA7';
    wwv_flow_api.g_varchar2_table(458) := '6\trautofit1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid1914095\tbllkhdrro';
    wwv_flow_api.g_varchar2_table(459) := 'ws\tbllkhdrcols\tbllknocolband\tblind0\tblindtype3 \clvertalb\clbrdrt'||wwv_flow.LF||
'\brdrs\brdrw10\brdrcf20 \clbrd';
    wwv_flow_api.g_varchar2_table(460) := 'rl\brdrs\brdrw10\brdrcf20 \clbrdrb\brdrs\brdrw10\brdrcf20 \clbrdrr\brdrs\brdrw10\brdrcf20 \clcbpat20';
    wwv_flow_api.g_varchar2_table(461) := '\cltxlrtb\clftsWidth3\clwWidth10940\clcbpatraw20 \cellx10832\pard\plain \ltrpar'||wwv_flow.LF||
'\ql \li0\ri0\widctlp';
    wwv_flow_api.g_varchar2_table(462) := 'ar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid11104293\yts17 \rtlch\fcs1';
    wwv_flow_api.g_varchar2_table(463) := ' \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\r';
    wwv_flow_api.g_varchar2_table(464) := 'tlch\fcs1 \af0\afs16 \ltrch\fcs0 '||wwv_flow.LF||
'\fs16\insrsid11104293                 {\*\bkmkstart Texto406}}{\fi';
    wwv_flow_api.g_varchar2_table(465) := 'eld\flddirty{\*\fldinst {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid11104293\charrsid13052510  ';
    wwv_flow_api.g_varchar2_table(466) := 'FORMTEXT }{\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid11104293\charrsid13052510 '||wwv_flow.LF||
'{\*\datafield ';
    wwv_flow_api.g_varchar2_table(467) := '800100000000000008546578746f343036000c63616d706f5f61677275706100000000000f3c3f7265663a78646f30303632';
    wwv_flow_api.g_varchar2_table(468) := '3f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto406}{\*\ffdeftex';
    wwv_flow_api.g_varchar2_table(469) := 't campo_agrupa}{\*\ffstattext '||wwv_flow.LF||
'<?ref:xdo0062?>}}}}}{\fldrslt {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs';
    wwv_flow_api.g_varchar2_table(470) := '16\lang1024\langfe1024\noproof\insrsid11104293\charrsid13052510 campo_agrupa}}}\sectd \ltrsect'||wwv_flow.LF||
'\line';
    wwv_flow_api.g_varchar2_table(471) := 'x0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid2177339\sftnbj {\rt';
    wwv_flow_api.g_varchar2_table(472) := 'lch\fcs1 \af0\afs18 \ltrch\fcs0 \fs18\insrsid11104293 {\*\bkmkend Texto406}              }{\rtlch\fc';
    wwv_flow_api.g_varchar2_table(473) := 's1 \af0\afs18 \ltrch\fcs0 \fs18\insrsid15795399   '||wwv_flow.LF||
'}{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0 \fs18\insrsi';
    wwv_flow_api.g_varchar2_table(474) := 'd11104293   }{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0 \fs18\insrsid11104293\charrsid21935 Cuenta Financie';
    wwv_flow_api.g_varchar2_table(475) := 'ra}{\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid11104293\charrsid3498847 :}{\rtlch\fcs1 \af0 '||wwv_flow.LF||
'\l';
    wwv_flow_api.g_varchar2_table(476) := 'trch\fcs0 \insrsid11104293\charrsid3498847  {\*\bkmkstart Texto418}}{\field\flddirty{\*\fldinst {\rt';
    wwv_flow_api.g_varchar2_table(477) := 'lch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid11104293\charrsid13052510  FORMTEXT }{\rtlch\fcs1 \af0\';
    wwv_flow_api.g_varchar2_table(478) := 'afs16 \ltrch\fcs0 '||wwv_flow.LF||
'\fs16\insrsid11104293\charrsid13052510 {\*\datafield 800100000000000008546578746f';
    wwv_flow_api.g_varchar2_table(479) := '34313800104375656e746146696e616e636965726100000000000f3c3f7265663a78646f303037383f3e0000000000}{\*\f';
    wwv_flow_api.g_varchar2_table(480) := 'ormfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto418}'||wwv_flow.LF||
'{\*\ffdeftext CuentaFinanciera}';
    wwv_flow_api.g_varchar2_table(481) := '{\*\ffstattext <?ref:xdo0078?>}}}}}{\fldrslt {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang1024\lang';
    wwv_flow_api.g_varchar2_table(482) := 'fe1024\noproof\insrsid11104293\charrsid13052510 CuentaFinanciera}}}\sectd \ltrsect'||wwv_flow.LF||
'\linex0\headery70';
    wwv_flow_api.g_varchar2_table(483) := '8\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid2177339\sftnbj {\rtlch\fcs1 \af';
    wwv_flow_api.g_varchar2_table(484) := '0\afs2 \ltrch\fcs0 \fs2\insrsid11104293 {\*\bkmkend Texto418}\cell }\pard\plain \ltrpar\ql \li0\ri0\';
    wwv_flow_api.g_varchar2_table(485) := 'sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0 \rtlch';
    wwv_flow_api.g_varchar2_table(486) := '\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp103';
    wwv_flow_api.g_varchar2_table(487) := '3 {\rtlch\fcs1 \af0\afs2 \ltrch\fcs0 \fs2\insrsid11104293 '||wwv_flow.LF||
'\trowd \irow0\irowband0\ltrrow\ts17\trgap';
    wwv_flow_api.g_varchar2_table(488) := 'h70\trrh219\trleft-108\trbrdrt\brdrs\brdrw10\brdrcf20 \trbrdrl\brdrs\brdrw10\brdrcf20 \trbrdrb\brdrs';
    wwv_flow_api.g_varchar2_table(489) := '\brdrw10\brdrcf20 \trbrdrr\brdrs\brdrw10\brdrcf20 \trbrdrh\brdrs\brdrw10\brdrcf20 \trbrdrv\brdrs\brd';
    wwv_flow_api.g_varchar2_table(490) := 'rw10\brdrcf20 '||wwv_flow.LF||
'\trftsWidth1\trftsWidthB3\trftsWidthA3\trwWidthA76\trautofit1\trpaddl108\trpaddr108\t';
    wwv_flow_api.g_varchar2_table(491) := 'rpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid1914095\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblin';
    wwv_flow_api.g_varchar2_table(492) := 'd0\tblindtype3 \clvertalb\clbrdrt\brdrs\brdrw10\brdrcf20 \clbrdrl'||wwv_flow.LF||
'\brdrs\brdrw10\brdrcf20 \clbrdrb\b';
    wwv_flow_api.g_varchar2_table(493) := 'rdrs\brdrw10\brdrcf20 \clbrdrr\brdrs\brdrw10\brdrcf20 \clcbpat20\cltxlrtb\clftsWidth3\clwWidth10940\';
    wwv_flow_api.g_varchar2_table(494) := 'clcbpatraw20 \cellx10832\row \ltrrow}\trowd \irow1\irowband1\ltrrow\ts17\trgaph70\trleft-108\trhdr\t';
    wwv_flow_api.g_varchar2_table(495) := 'rbrdrt\brdrs\brdrw10 '||wwv_flow.LF||
'\trbrdrl\brdrs\brdrw10 \trbrdrb\brdrs\brdrw10 \trbrdrr\brdrs\brdrw10 \trbrdrh\';
    wwv_flow_api.g_varchar2_table(496) := 'brdrs\brdrw10 \trbrdrv\brdrs\brdrw10 '||wwv_flow.LF||
'\trftsWidth1\trftsWidthB3\trautofit1\trpaddl108\trpaddr108\trp';
    wwv_flow_api.g_varchar2_table(497) := 'addfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid2977082\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind0';
    wwv_flow_api.g_varchar2_table(498) := '\tblindtype3 \clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 '||wwv_flow.LF||
'\clbrdr';
    wwv_flow_api.g_varchar2_table(499) := 'r\brdrs\brdrw10 \clcbpat20\cltxlrtb\clftsWidth3\clwWidth1526\clcbpatraw20 \cellx1418\clvertalc\clbrd';
    wwv_flow_api.g_varchar2_table(500) := 'rt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat20\clt';
end;
/
begin
    wwv_flow_api.g_varchar2_table(501) := 'xlrtb\clftsWidth3\clwWidth2306\clcbpatraw20 '||wwv_flow.LF||
'\cellx3724\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brd';
    wwv_flow_api.g_varchar2_table(502) := 'rs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat20\cltxlrtb\clftsWidth3\clwWidth350';
    wwv_flow_api.g_varchar2_table(503) := '6\clcbpatraw20 \cellx7230\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb'||wwv_flow.LF||
'\brdrs\brd';
    wwv_flow_api.g_varchar2_table(504) := 'rw10 \clbrdrr\brdrs\brdrw10 \clcbpat20\cltxlrtb\clftsWidth3\clwWidth1417\clcbpatraw20 \cellx8647\clv';
    wwv_flow_api.g_varchar2_table(505) := 'ertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 '||wwv_flow.LF||
'\';
    wwv_flow_api.g_varchar2_table(506) := 'clcbpat20\cltxlrtb\clftsWidth3\clwWidth1134\clcbpatraw20 \cellx9781\clvertalc\clbrdrt\brdrs\brdrw10 ';
    wwv_flow_api.g_varchar2_table(507) := '\clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat20\cltxlrtb\clftsWidth3';
    wwv_flow_api.g_varchar2_table(508) := '\clwWidth1127\clcbpatraw20 \cellx10908'||wwv_flow.LF||
'\pard\plain \ltrpar\qc \li0\ri0\widctlpar\intbl\wrapdefault\a';
    wwv_flow_api.g_varchar2_table(509) := 'spalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid9443654\yts17 \rtlch\fcs1 \af0\afs22\alang1025 \';
    wwv_flow_api.g_varchar2_table(510) := 'ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 '||wwv_flow.LF||
'\af0\afs18 \';
    wwv_flow_api.g_varchar2_table(511) := 'ltrch\fcs0 \b\fs18\insrsid9443654\charrsid15752364 N}{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0 \b\fs18\ins';
    wwv_flow_api.g_varchar2_table(512) := 'rsid9443654 \''fa}{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0 \b\fs18\insrsid9443654\charrsid15752364 mero}{\';
    wwv_flow_api.g_varchar2_table(513) := 'rtlch\fcs1 \af0\afs18 \ltrch\fcs0 '||wwv_flow.LF||
'\b\fs18\insrsid9443654 '||wwv_flow.LF||
'\par }{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0';
    wwv_flow_api.g_varchar2_table(514) := ' \b\fs18\insrsid9443654\charrsid15752364 Documento}{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0 \fs18\insrsid';
    wwv_flow_api.g_varchar2_table(515) := '9443654\charrsid15752364 \cell }{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0 \b\fs18\insrsid9443654\charrsid1';
    wwv_flow_api.g_varchar2_table(516) := '5752364 Referencia}'||wwv_flow.LF||
'{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0 \fs18\insrsid9443654\charrsid15752364 \cell ';
    wwv_flow_api.g_varchar2_table(517) := '}{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0 \b\fs18\insrsid9443654\charrsid15752364 Propietario}{\rtlch\fcs';
    wwv_flow_api.g_varchar2_table(518) := '1 \af0\afs18 \ltrch\fcs0 \fs18\insrsid9443654\charrsid15752364 \cell }{'||wwv_flow.LF||
'\rtlch\fcs1 \af0\afs18 \ltrc';
    wwv_flow_api.g_varchar2_table(519) := 'h\fcs0 \b\fs18\insrsid9443654\charrsid15752364 Fecha\cell Estado}{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0';
    wwv_flow_api.g_varchar2_table(520) := ' \fs18\insrsid9443654\charrsid15752364 \cell }{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0 \b\fs18\insrsid944';
    wwv_flow_api.g_varchar2_table(521) := '3654\charrsid15752364 Monto'||wwv_flow.LF||
'}{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0 \b\fs18\insrsid9443654 '||wwv_flow.LF||
'\par }{\rtl';
    wwv_flow_api.g_varchar2_table(522) := 'ch\fcs1 \af0\afs18 \ltrch\fcs0 \b\fs18\insrsid9443654\charrsid15752364 Pago}{\rtlch\fcs1 \af0\afs18 ';
    wwv_flow_api.g_varchar2_table(523) := '\ltrch\fcs0 \fs18\insrsid9443654\charrsid15752364 \cell }\pard\plain \ltrpar\ql \li0\ri0\sa160\sl259';
    wwv_flow_api.g_varchar2_table(524) := '\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0 \rtlch\fcs1 \af0\';
    wwv_flow_api.g_varchar2_table(525) := 'afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\f';
    wwv_flow_api.g_varchar2_table(526) := 'cs1 \af0 \ltrch\fcs0 \insrsid9443654 '||wwv_flow.LF||
'\trowd \irow1\irowband1\ltrrow\ts17\trgaph70\trleft-108\trhdr\';
    wwv_flow_api.g_varchar2_table(527) := 'trbrdrt\brdrs\brdrw10 \trbrdrl\brdrs\brdrw10 \trbrdrb\brdrs\brdrw10 \trbrdrr\brdrs\brdrw10 \trbrdrh\';
    wwv_flow_api.g_varchar2_table(528) := 'brdrs\brdrw10 \trbrdrv\brdrs\brdrw10 '||wwv_flow.LF||
'\trftsWidth1\trftsWidthB3\trautofit1\trpaddl108\trpaddr108\trp';
    wwv_flow_api.g_varchar2_table(529) := 'addfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid2977082\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind0';
    wwv_flow_api.g_varchar2_table(530) := '\tblindtype3 \clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 '||wwv_flow.LF||
'\clbrdr';
    wwv_flow_api.g_varchar2_table(531) := 'r\brdrs\brdrw10 \clcbpat20\cltxlrtb\clftsWidth3\clwWidth1526\clcbpatraw20 \cellx1418\clvertalc\clbrd';
    wwv_flow_api.g_varchar2_table(532) := 'rt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat20\clt';
    wwv_flow_api.g_varchar2_table(533) := 'xlrtb\clftsWidth3\clwWidth2306\clcbpatraw20 '||wwv_flow.LF||
'\cellx3724\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brd';
    wwv_flow_api.g_varchar2_table(534) := 'rs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat20\cltxlrtb\clftsWidth3\clwWidth350';
    wwv_flow_api.g_varchar2_table(535) := '6\clcbpatraw20 \cellx7230\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb'||wwv_flow.LF||
'\brdrs\brd';
    wwv_flow_api.g_varchar2_table(536) := 'rw10 \clbrdrr\brdrs\brdrw10 \clcbpat20\cltxlrtb\clftsWidth3\clwWidth1417\clcbpatraw20 \cellx8647\clv';
    wwv_flow_api.g_varchar2_table(537) := 'ertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 '||wwv_flow.LF||
'\';
    wwv_flow_api.g_varchar2_table(538) := 'clcbpat20\cltxlrtb\clftsWidth3\clwWidth1134\clcbpatraw20 \cellx9781\clvertalc\clbrdrt\brdrs\brdrw10 ';
    wwv_flow_api.g_varchar2_table(539) := '\clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat20\cltxlrtb\clftsWidth3';
    wwv_flow_api.g_varchar2_table(540) := '\clwWidth1127\clcbpatraw20 \cellx10908\row \ltrrow'||wwv_flow.LF||
'}\trowd \irow2\irowband2\lastrow \ltrrow\ts17\trg';
    wwv_flow_api.g_varchar2_table(541) := 'aph70\trrh412\trleft-108\trbrdrt\brdrs\brdrw10 \trbrdrl\brdrs\brdrw10 \trbrdrb\brdrs\brdrw10 \trbrdr';
    wwv_flow_api.g_varchar2_table(542) := 'r\brdrs\brdrw10 \trbrdrh\brdrs\brdrw10 \trbrdrv\brdrs\brdrw10 '||wwv_flow.LF||
'\trftsWidth1\trftsWidthB3\trautofit1\';
    wwv_flow_api.g_varchar2_table(543) := 'trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid7495530\tbllkhdrrows\tbllkhdrco';
    wwv_flow_api.g_varchar2_table(544) := 'ls\tbllknocolband\tblind0\tblindtype3 \clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrnone \clbrdrb\br';
    wwv_flow_api.g_varchar2_table(545) := 'drnone \clbrdrr'||wwv_flow.LF||
'\brdrnone \cltxlrtb\clftsWidth3\clwWidth1526\clshdrawnil \cellx1418\clvertalc\clbrdr';
    wwv_flow_api.g_varchar2_table(546) := 't\brdrs\brdrw10 \clbrdrl\brdrnone \clbrdrb\brdrnone \clbrdrr\brdrnone \cltxlrtb\clftsWidth3\clwWidth';
    wwv_flow_api.g_varchar2_table(547) := '2306\clshdrawnil \cellx3724\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl'||wwv_flow.LF||
'\brdrnone \clbrdrb\brdrnone \cl';
    wwv_flow_api.g_varchar2_table(548) := 'brdrr\brdrnone \cltxlrtb\clftsWidth3\clwWidth3506\clshdrawnil \cellx7230\clvertalc\clbrdrt\brdrs\brd';
    wwv_flow_api.g_varchar2_table(549) := 'rw10 \clbrdrl\brdrnone \clbrdrb\brdrnone \clbrdrr\brdrnone \cltxlrtb\clftsWidth3\clwWidth1417\clshdr';
    wwv_flow_api.g_varchar2_table(550) := 'awnil \cellx8647'||wwv_flow.LF||
'\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrnone \clbrdrb\brdrnone \clbrdrr\brdrn';
    wwv_flow_api.g_varchar2_table(551) := 'one \cltxlrtb\clftsWidth3\clwWidth1134\clshdrawnil \cellx9781\clvertalc\clbrdrt\brdrs\brdrw10 \clbrd';
    wwv_flow_api.g_varchar2_table(552) := 'rl\brdrnone \clbrdrb\brdrnone \clbrdrr\brdrnone '||wwv_flow.LF||
'\cltxlrtb\clftsWidth3\clwWidth1127\clshdrawnil \cel';
    wwv_flow_api.g_varchar2_table(553) := 'lx10908\pard\plain \ltrpar\qc \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustrigh';
    wwv_flow_api.g_varchar2_table(554) := 't\rin0\lin0\pararsid9443654\yts17 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\f31506\fs22\lang922';
    wwv_flow_api.g_varchar2_table(555) := '6\langfe1033\cgrid\langnp9226\langfenp1033 {\*\bkmkstart Texto407}{\field\flddirty{\*\fldinst {\rtlc';
    wwv_flow_api.g_varchar2_table(556) := 'h\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\cf21\insrsid5004344\charrsid9443654  FORMTEXT }{\rtlch\fcs1 \af0';
    wwv_flow_api.g_varchar2_table(557) := '\afs16 \ltrch\fcs0 '||wwv_flow.LF||
'\fs16\cf21\insrsid5004344\charrsid9443654 {\*\datafield 800100000000000008546578';
    wwv_flow_api.g_varchar2_table(558) := '746f3430370002462000000000000f3c3f7265663a78646f303036373f3e0000000000}{\*\formfield{\fftype0\ffownh';
    wwv_flow_api.g_varchar2_table(559) := 'elp\ffownstat\fftypetxt0{\*\ffname Texto407}{\*\ffdeftext F }'||wwv_flow.LF||
'{\*\ffstattext <?ref:xdo0067?>}}}}}{\f';
    wwv_flow_api.g_varchar2_table(560) := 'ldrslt {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\cf21\lang1024\langfe1024\noproof\insrsid5004344\cha';
    wwv_flow_api.g_varchar2_table(561) := 'rrsid9443654 F }}}\sectd \ltrsect'||wwv_flow.LF||
'\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\se';
    wwv_flow_api.g_varchar2_table(562) := 'ctdefaultcl\sectrsid2177339\sftnbj {\*\bkmkstart Texto408}{\*\bkmkend Texto407}{\field\flddirty{\*\f';
    wwv_flow_api.g_varchar2_table(563) := 'ldinst {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid5004344\charrsid9443654 '||wwv_flow.LF||
' FORMTEXT }{\rtlch\';
    wwv_flow_api.g_varchar2_table(564) := 'fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid5004344\charrsid9443654 {\*\datafield 800100000000000008546';
    wwv_flow_api.g_varchar2_table(565) := '578746f343038000f4e756d65726f446f63756d656e746f00000000000f3c3f7265663a78646f303036383f3e0000000000}';
    wwv_flow_api.g_varchar2_table(566) := ''||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto408}{\*\ffdeftext NumeroDocume';
    wwv_flow_api.g_varchar2_table(567) := 'nto}{\*\ffstattext <?ref:xdo0068?>}}}}}{\fldrslt {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang1024\';
    wwv_flow_api.g_varchar2_table(568) := 'langfe1024\noproof\insrsid5004344\charrsid9443654 '||wwv_flow.LF||
'NumeroDocumento}}}\sectd \ltrsect\linex0\headery7';
    wwv_flow_api.g_varchar2_table(569) := '08\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid2177339\sftnbj {\rtlch\fcs1 \a';
    wwv_flow_api.g_varchar2_table(570) := 'f0\afs16 \ltrch\fcs0 \fs16\insrsid5004344\charrsid9443654 {\*\bkmkend Texto408}\cell '||wwv_flow.LF||
'{\*\bkmkstart ';
    wwv_flow_api.g_varchar2_table(571) := 'Texto409}}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid5004344\charr';
    wwv_flow_api.g_varchar2_table(572) := 'sid9443654  FORMTEXT }{\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid5004344\charrsid9443654 {\*\d';
    wwv_flow_api.g_varchar2_table(573) := 'atafield '||wwv_flow.LF||
'800100000000000008546578746f343039000a5265666572656e63696100000000000f3c3f7265663a78646f30';
    wwv_flow_api.g_varchar2_table(574) := '3036393f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto409}{\*\ff';
    wwv_flow_api.g_varchar2_table(575) := 'deftext Referencia}{\*\ffstattext <?ref:xdo0069?>}}}}}{\fldrslt {'||wwv_flow.LF||
'\rtlch\fcs1 \af0\afs16 \ltrch\fcs0';
    wwv_flow_api.g_varchar2_table(576) := ' \fs16\lang1024\langfe1024\noproof\insrsid5004344\charrsid9443654 Referencia}}}\sectd \ltrsect\linex';
    wwv_flow_api.g_varchar2_table(577) := '0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid2177339\sftnbj {\rtl';
    wwv_flow_api.g_varchar2_table(578) := 'ch\fcs1 \af0\afs16 '||wwv_flow.LF||
'\ltrch\fcs0 \fs16\insrsid5004344\charrsid9443654 {\*\bkmkend Texto409}\cell {\*\';
    wwv_flow_api.g_varchar2_table(579) := 'bkmkstart Texto410}}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid500';
    wwv_flow_api.g_varchar2_table(580) := '4344\charrsid9443654  FORMTEXT }{\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 '||wwv_flow.LF||
'\fs16\insrsid5004344\charrsid94';
    wwv_flow_api.g_varchar2_table(581) := '43654 {\*\datafield 800100000000000008546578746f343130000b50726f706965746172696f00000000000f3c3f7265';
    wwv_flow_api.g_varchar2_table(582) := '663a78646f303037303f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Tex';
    wwv_flow_api.g_varchar2_table(583) := 'to410}{\*\ffdeftext '||wwv_flow.LF||
'Propietario}{\*\ffstattext <?ref:xdo0070?>}}}}}{\fldrslt {\rtlch\fcs1 \af0\afs1';
    wwv_flow_api.g_varchar2_table(584) := '6 \ltrch\fcs0 \fs16\lang1024\langfe1024\noproof\insrsid5004344\charrsid9443654 Propietario}}}\sectd ';
    wwv_flow_api.g_varchar2_table(585) := '\ltrsect'||wwv_flow.LF||
'\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid21773';
    wwv_flow_api.g_varchar2_table(586) := '39\sftnbj {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid5004344\charrsid9443654 {\*\bkmkend Texto';
    wwv_flow_api.g_varchar2_table(587) := '410}\cell {\*\bkmkstart Texto411}}{\field\flddirty{\*\fldinst {'||wwv_flow.LF||
'\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \';
    wwv_flow_api.g_varchar2_table(588) := 'fs16\insrsid5004344\charrsid9443654  FORMTEXT }{\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid5004';
    wwv_flow_api.g_varchar2_table(589) := '344\charrsid9443654 {\*\datafield '||wwv_flow.LF||
'800100000000000008546578746f343131000946656368615061676f000000000';
    wwv_flow_api.g_varchar2_table(590) := '00f3c3f7265663a78646f303037313f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*';
    wwv_flow_api.g_varchar2_table(591) := '\ffname Texto411}{\*\ffdeftext FechaPago}{\*\ffstattext <?ref:xdo0071?>}}}}}{\fldrslt {'||wwv_flow.LF||
'\rtlch\fcs1 ';
    wwv_flow_api.g_varchar2_table(592) := '\af0\afs16 \ltrch\fcs0 \fs16\lang1024\langfe1024\noproof\insrsid5004344\charrsid9443654 FechaPago}}}';
    wwv_flow_api.g_varchar2_table(593) := '\sectd \ltrsect\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsi';
    wwv_flow_api.g_varchar2_table(594) := 'd2177339\sftnbj {\rtlch\fcs1 \af0\afs16 '||wwv_flow.LF||
'\ltrch\fcs0 \fs16\insrsid5004344\charrsid9443654 {\*\bkmken';
    wwv_flow_api.g_varchar2_table(595) := 'd Texto411}\cell {\*\bkmkstart Texto412}}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0\afs16 \ltrch\';
    wwv_flow_api.g_varchar2_table(596) := 'fcs0 \fs16\insrsid5004344\charrsid9443654  FORMTEXT }{\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 '||wwv_flow.LF||
'\fs16\insr';
    wwv_flow_api.g_varchar2_table(597) := 'sid5004344\charrsid9443654 {\*\datafield 800100000000000008546578746f343132000645737461646f000000000';
    wwv_flow_api.g_varchar2_table(598) := '00f3c3f7265663a78646f303037323f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*';
    wwv_flow_api.g_varchar2_table(599) := '\ffname Texto412}{\*\ffdeftext Estado}'||wwv_flow.LF||
'{\*\ffstattext <?ref:xdo0072?>}}}}}{\fldrslt {\rtlch\fcs1 \af';
    wwv_flow_api.g_varchar2_table(600) := '0\afs16 \ltrch\fcs0 \fs16\lang1024\langfe1024\noproof\insrsid5004344\charrsid9443654 Estado}}}\sectd';
    wwv_flow_api.g_varchar2_table(601) := ' \ltrsect'||wwv_flow.LF||
'\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid2177';
    wwv_flow_api.g_varchar2_table(602) := '339\sftnbj {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid5004344\charrsid9443654 {\*\bkmkend Text';
    wwv_flow_api.g_varchar2_table(603) := 'o412}\cell {\*\bkmkstart Texto416}}{\field\flddirty{\*\fldinst {'||wwv_flow.LF||
'\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 ';
    wwv_flow_api.g_varchar2_table(604) := '\fs16\insrsid9443654  FORMTEXT }{\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid9443654 {\*\datafie';
    wwv_flow_api.g_varchar2_table(605) := 'ld 800b00000000000008546578746f34313600000005232c2323300000000f3c3f7265663a78646f303037333f3e0000000';
    wwv_flow_api.g_varchar2_table(606) := '000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownstat\ffprot\fftypetxt1{\*\ffname Texto416}{\*\ffformat #,';
    wwv_flow_api.g_varchar2_table(607) := '##0}{\*\ffstattext <?ref:xdo0073?>}}}}}{\fldrslt {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang1024\';
    wwv_flow_api.g_varchar2_table(608) := 'langfe1024\noproof\insrsid9443654 \u8194\''20\u8194\''20\u8194'||wwv_flow.LF||
'\''20\u8194\''20\u8194\''20}}}\sectd \ltrs';
    wwv_flow_api.g_varchar2_table(609) := 'ect\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid2177339\sft';
    wwv_flow_api.g_varchar2_table(610) := 'nbj {\*\bkmkstart Texto414}{\*\bkmkend Texto416}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0\afs16 ';
    wwv_flow_api.g_varchar2_table(611) := '\ltrch\fcs0 '||wwv_flow.LF||
'\fs16\cf21\insrsid5004344\charrsid9443654  FORMTEXT }{\rtlch\fcs1 \af0\afs16 \ltrch\fcs';
    wwv_flow_api.g_varchar2_table(612) := '0 \fs16\cf21\insrsid5004344\charrsid9443654 {\*\datafield 800100000000000008546578746f34313400022045';
    wwv_flow_api.g_varchar2_table(613) := '00000000000f3c3f7265663a78646f303037343f3e0000000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownstat\fft';
    wwv_flow_api.g_varchar2_table(614) := 'ypetxt0{\*\ffname Texto414}{\*\ffdeftext  E}{\*\ffstattext <?ref:xdo0074?>}}}}}{\fldrslt {\rtlch\fcs';
    wwv_flow_api.g_varchar2_table(615) := '1 \af0\afs16 \ltrch\fcs0 \fs16\cf21\lang1024\langfe1024\noproof\insrsid5004344\charrsid9443654  E}}}';
    wwv_flow_api.g_varchar2_table(616) := ''||wwv_flow.LF||
'\sectd \ltrsect\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrs';
    wwv_flow_api.g_varchar2_table(617) := 'id2177339\sftnbj {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid5004344\charrsid9443654 {\*\bkmken';
    wwv_flow_api.g_varchar2_table(618) := 'd Texto414}\cell }\pard\plain \ltrpar'||wwv_flow.LF||
'\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\intbl\wrapdefault\a';
    wwv_flow_api.g_varchar2_table(619) := 'spalpha\aspnum\faauto\adjustright\rin0\lin0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs2';
    wwv_flow_api.g_varchar2_table(620) := '2\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af0 \ltrch\fcs0 '||wwv_flow.LF||
'\insrsid9443654 \';
    wwv_flow_api.g_varchar2_table(621) := 'trowd \irow2\irowband2\lastrow \ltrrow\ts17\trgaph70\trrh412\trleft-108\trbrdrt\brdrs\brdrw10 \trbrd';
    wwv_flow_api.g_varchar2_table(622) := 'rl\brdrs\brdrw10 \trbrdrb\brdrs\brdrw10 \trbrdrr\brdrs\brdrw10 \trbrdrh\brdrs\brdrw10 \trbrdrv\brdrs';
    wwv_flow_api.g_varchar2_table(623) := '\brdrw10 '||wwv_flow.LF||
'\trftsWidth1\trftsWidthB3\trautofit1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\t';
    wwv_flow_api.g_varchar2_table(624) := 'rpaddfr3\tblrsid7495530\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind0\tblindtype3 \clvertalc\clbr';
    wwv_flow_api.g_varchar2_table(625) := 'drt\brdrs\brdrw10 \clbrdrl\brdrnone \clbrdrb\brdrnone \clbrdrr'||wwv_flow.LF||
'\brdrnone \cltxlrtb\clftsWidth3\clwWi';
    wwv_flow_api.g_varchar2_table(626) := 'dth1526\clshdrawnil \cellx1418\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrnone \clbrdrb\brdrnone \';
    wwv_flow_api.g_varchar2_table(627) := 'clbrdrr\brdrnone \cltxlrtb\clftsWidth3\clwWidth2306\clshdrawnil \cellx3724\clvertalc\clbrdrt\brdrs\b';
    wwv_flow_api.g_varchar2_table(628) := 'rdrw10 \clbrdrl'||wwv_flow.LF||
'\brdrnone \clbrdrb\brdrnone \clbrdrr\brdrnone \cltxlrtb\clftsWidth3\clwWidth3506\cls';
    wwv_flow_api.g_varchar2_table(629) := 'hdrawnil \cellx7230\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrnone \clbrdrb\brdrnone \clbrdrr\brd';
    wwv_flow_api.g_varchar2_table(630) := 'rnone \cltxlrtb\clftsWidth3\clwWidth1417\clshdrawnil \cellx8647'||wwv_flow.LF||
'\clvertalc\clbrdrt\brdrs\brdrw10 \cl';
    wwv_flow_api.g_varchar2_table(631) := 'brdrl\brdrnone \clbrdrb\brdrnone \clbrdrr\brdrnone \cltxlrtb\clftsWidth3\clwWidth1134\clshdrawnil \c';
    wwv_flow_api.g_varchar2_table(632) := 'ellx9781\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrnone \clbrdrb\brdrnone \clbrdrr\brdrnone '||wwv_flow.LF||
'\clt';
    wwv_flow_api.g_varchar2_table(633) := 'xlrtb\clftsWidth3\clwWidth1127\clshdrawnil \cellx10908\row \ltrrow}\trowd \irow0\irowband0\lastrow \';
    wwv_flow_api.g_varchar2_table(634) := 'ltrrow'||wwv_flow.LF||
'\ts17\trgaph70\trleft-108\tpvpara\tphmrg\tposy76\tdfrmtxtLeft141\tdfrmtxtRight141\trftsWidth3';
    wwv_flow_api.g_varchar2_table(635) := '\trwWidth11023\trftsWidthB3\trftsWidthA3\trautofit1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpadd';
    wwv_flow_api.g_varchar2_table(636) := 'fb3\trpaddfr3'||wwv_flow.LF||
'\tblrsid5339801\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind0\tblindtype3 \clvertal';
    wwv_flow_api.g_varchar2_table(637) := 't\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth7';
    wwv_flow_api.g_varchar2_table(638) := '621\clshdrawnil \cellx7513\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl'||wwv_flow.LF||
'\brdrtbl \clbrdrb\brdrtbl \clbrd';
    wwv_flow_api.g_varchar2_table(639) := 'rr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2268\clshdrawnil \cellx9781\clvertalc\clbrdrt\brdrs\brdrw10';
    wwv_flow_api.g_varchar2_table(640) := ' \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1134\clshdrawnil \';
    wwv_flow_api.g_varchar2_table(641) := 'cellx10915'||wwv_flow.LF||
'\pard\plain \ltrpar\ql \li0\ri0\widctlpar\intbl\pvpara\phmrg\posy76\dxfrtext141\dfrmtxtx1';
    wwv_flow_api.g_varchar2_table(642) := '41\dfrmtxty0\wraparound\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid5339801\yts17 \rtlch\fc';
    wwv_flow_api.g_varchar2_table(643) := 's1 \af0\afs22\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 ';
    wwv_flow_api.g_varchar2_table(644) := '{\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid9443654 \cell }\pard \ltrpar'||wwv_flow.LF||
'\qc \li0\ri0';
    wwv_flow_api.g_varchar2_table(645) := '\widctlpar\intbl\pvpara\phmrg\posy76\dxfrtext141\dfrmtxtx141\dfrmtxty0\wraparound\aspalpha\aspnum\fa';
    wwv_flow_api.g_varchar2_table(646) := 'auto\adjustright\rin0\lin0\pararsid5339801\yts17 {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \b\fs16\insrsid';
    wwv_flow_api.g_varchar2_table(647) := '9443654\charrsid14420131 Total Monto Banco}'||wwv_flow.LF||
'{\rtlch\fcs1 \af0\afs18 \ltrch\fcs0 \b\fs18\insrsid94436';
    wwv_flow_api.g_varchar2_table(648) := '54 :}{\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid9443654 \cell {\*\bkmkstart Texto417';
    wwv_flow_api.g_varchar2_table(649) := '}}{\field{\*\fldinst {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid9443654  FORMTEXT }{'||wwv_flow.LF||
'\rtlch\fc';
    wwv_flow_api.g_varchar2_table(650) := 's1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid9443654 {\*\datafield 800b00000000000008546578746f34313700000';
    wwv_flow_api.g_varchar2_table(651) := '005232c2323300000000f3c3f7265663a78646f303037363f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffown';
    wwv_flow_api.g_varchar2_table(652) := 'stat\ffprot\fftypetxt1{\*\ffname Texto417}'||wwv_flow.LF||
'{\*\ffformat #,##0}{\*\ffstattext <?ref:xdo0076?>}}}}}{\f';
    wwv_flow_api.g_varchar2_table(653) := 'ldrslt {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang1024\langfe1024\noproof\insrsid9443654 \u8194\''';
    wwv_flow_api.g_varchar2_table(654) := '20\u8194\''20\u8194\''20\u8194\''20\u8194\''20}}}\sectd \ltrsect'||wwv_flow.LF||
'\linex0\headery708\footery708\colsx708\';
    wwv_flow_api.g_varchar2_table(655) := 'endnhere\sectlinegrid360\sectdefaultcl\sectrsid2177339\sftnbj {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \';
    wwv_flow_api.g_varchar2_table(656) := 'b\f31502\fs18\insrsid9443654 {\*\bkmkend Texto417}\cell }\pard\plain \ltrpar\ql \li0\ri0\sa160\sl259';
    wwv_flow_api.g_varchar2_table(657) := '\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0 \rtlch\fcs1 \af0\';
    wwv_flow_api.g_varchar2_table(658) := 'afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\f';
    wwv_flow_api.g_varchar2_table(659) := 'cs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid9443654 '||wwv_flow.LF||
'\trowd \irow0\irowband0\lastrow \ltrrow\t';
    wwv_flow_api.g_varchar2_table(660) := 's17\trgaph70\trleft-108\tpvpara\tphmrg\tposy76\tdfrmtxtLeft141\tdfrmtxtRight141\trftsWidth3\trwWidth';
    wwv_flow_api.g_varchar2_table(661) := '11023\trftsWidthB3\trftsWidthA3\trautofit1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpad';
    wwv_flow_api.g_varchar2_table(662) := 'dfr3'||wwv_flow.LF||
'\tblrsid5339801\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind0\tblindtype3 \clvertalt\clbrdrt';
    wwv_flow_api.g_varchar2_table(663) := '\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth7621\clshd';
    wwv_flow_api.g_varchar2_table(664) := 'rawnil \cellx7513\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl'||wwv_flow.LF||
'\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtb';
    wwv_flow_api.g_varchar2_table(665) := 'l \cltxlrtb\clftsWidth3\clwWidth2268\clshdrawnil \cellx9781\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl';
    wwv_flow_api.g_varchar2_table(666) := '\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1134\clshdrawnil \cellx1091';
    wwv_flow_api.g_varchar2_table(667) := '5\row '||wwv_flow.LF||
'}\pard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\wrapdefault\aspalpha\aspnum\faauto\a';
    wwv_flow_api.g_varchar2_table(668) := 'djustright\rin0\lin0\itap0\pararsid6379667 {\rtlch\fcs1 \af0 \ltrch\fcs0 \lang1024\langfe1024\noproo';
    wwv_flow_api.g_varchar2_table(669) := 'f\insrsid2638479 '||wwv_flow.LF||
'{\shp{\*\shpinst\shpleft-75\shptop709\shpright10845\shpbottom709\shpfhdr0\shpbxcol';
    wwv_flow_api.g_varchar2_table(670) := 'umn\shpbxignore\shpbypara\shpbyignore\shpwr3\shpwrk0\shpfblwtxt0\shpz0\shplid1026{\sp{\sn shapeType}';
    wwv_flow_api.g_varchar2_table(671) := '{\sv 32}}{\sp{\sn fFlipH}{\sv 0}}{\sp{\sn fFlipV}{\sv 0}}'||wwv_flow.LF||
'{\sp{\sn lineColor}{\sv 14211288}{\*\hsv \';
    wwv_flow_api.g_varchar2_table(672) := 'cbackgroundone\ctint255\cshade216}}{\sp{\sn lineWidth}{\sv 19050}}{\sp{\sn lineDashing}{\sv 2}}{\sp{';
    wwv_flow_api.g_varchar2_table(673) := '\sn lineEndCapStyle}{\sv 0}}{\sp{\sn fLine}{\sv 1}}{\sp{\sn cxstyle}{\sv 0}}{\sp{\sn dhgt}{\sv 25165';
    wwv_flow_api.g_varchar2_table(674) := '8240}}'||wwv_flow.LF||
'{\sp{\sn fLayoutInCell}{\sv 1}}{\sp{\sn fLayoutInCell}{\sv 1}}}{\shprslt{\*\do\dobxcolumn\dob';
    wwv_flow_api.g_varchar2_table(675) := 'ypara\dodhgt8192\dppolyline\dppolycount2\dpptx0\dppty0\dpptx10920\dppty0\dpx-75\dpy709\dpxsize10920\';
    wwv_flow_api.g_varchar2_table(676) := 'dpysize0'||wwv_flow.LF||
'\dpfillfgcr255\dpfillfgcg255\dpfillfgcb255\dpfillbgcr255\dpfillbgcg255\dpfillbgcb255\dpfill';
    wwv_flow_api.g_varchar2_table(677) := 'pat0\dplinew30\dplinecor172\dplinecog10\dplinecob0}}}}{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid5004344 ';
    wwv_flow_api.g_varchar2_table(678) := ''||wwv_flow.LF||
'\par }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid9443654 '||wwv_flow.LF||
'\par {\*\bkmkstart Texto415}}{\field\flddirty{';
    wwv_flow_api.g_varchar2_table(679) := '\*\fldinst {\rtlch\fcs1 \af0 \ltrch\fcs0 \cf9\insrsid5004344\charrsid5004344  FORMTEXT }{\rtlch\fcs1';
    wwv_flow_api.g_varchar2_table(680) := ' \af0 \ltrch\fcs0 \cf9\insrsid5004344\charrsid5004344 {\*\datafield '||wwv_flow.LF||
'800100000000000008546578746f343';
    wwv_flow_api.g_varchar2_table(681) := '135001f656e6420524f57534554315f524f572062792063616d706f5f61677275706100000000000f3c3f7265663a78646f3';
    wwv_flow_api.g_varchar2_table(682) := '03037353f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto415}{\*\f';
    wwv_flow_api.g_varchar2_table(683) := 'fdeftext '||wwv_flow.LF||
'end ROWSET1_ROW by campo_agrupa}{\*\ffstattext <?ref:xdo0075?>}}}}}{\fldrslt {\rtlch\fcs1 ';
    wwv_flow_api.g_varchar2_table(684) := '\af0 \ltrch\fcs0 \cf9\lang1024\langfe1024\noproof\insrsid5004344\charrsid5004344 end ROWSET1_ROW by ';
    wwv_flow_api.g_varchar2_table(685) := 'campo_agrupa}}}\sectd \ltrsect'||wwv_flow.LF||
'\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectd';
    wwv_flow_api.g_varchar2_table(686) := 'efaultcl\sectrsid2177339\sftnbj {\rtlch\fcs1 \af0 \ltrch\fcs0 \cf9\insrsid5004344 {\*\bkmkend Texto4';
    wwv_flow_api.g_varchar2_table(687) := '15}'||wwv_flow.LF||
'\par }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid5004344 '||wwv_flow.LF||
'\par }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsi';
    wwv_flow_api.g_varchar2_table(688) := 'd5004344\charrsid5004344 '||wwv_flow.LF||
'\par }{\rtlch\fcs1 \af0 \ltrch\fcs0 \cf9\insrsid5004344 '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par ';
    wwv_flow_api.g_varchar2_table(689) := '}\pard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustri';
    wwv_flow_api.g_varchar2_table(690) := 'ght\rin0\lin0\itap0\pararsid475731 {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid12603670 {\*\bkmkend Texto1';
    wwv_flow_api.g_varchar2_table(691) := '87}   }{\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 '||wwv_flow.LF||
'\b\fs16\insrsid475731 <?template:footer?>'||wwv_flow.LF||
'\par \ltrrow}\';
    wwv_flow_api.g_varchar2_table(692) := 'trowd \irow0\irowband0\lastrow \ltrrow\ts17\trqc\trgaph108\trleft-108\trftsWidth1\trftsWidthB3\traut';
    wwv_flow_api.g_varchar2_table(693) := 'ofit1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid475731\tbllkhdrrows\tbllk';
    wwv_flow_api.g_varchar2_table(694) := 'hdrcols\tbllknocolband\tblind0\tblindtype3 '||wwv_flow.LF||
'\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brd';
    wwv_flow_api.g_varchar2_table(695) := 'rtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth4077\clshdrawnil\clhidemark \cellx3938\clvertalc';
    wwv_flow_api.g_varchar2_table(696) := '\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl '||wwv_flow.LF||
'\cltxlrtb\clftsWidth3\clwWidth2';
    wwv_flow_api.g_varchar2_table(697) := '906\clshdrawnil\clhidemark \cellx6822\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \c';
    wwv_flow_api.g_varchar2_table(698) := 'lbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2552\clshdrawnil\clhidemark \cellx9357\clvertalc\clbrdr';
    wwv_flow_api.g_varchar2_table(699) := 't\brdrtbl \clbrdrl'||wwv_flow.LF||
'\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1560\cls';
    wwv_flow_api.g_varchar2_table(700) := 'hdrawnil\clhidemark \cellx10908\pard\plain \ltrpar\s18\qc \li0\ri0\widctlpar\intbl'||wwv_flow.LF||
'\tx2535\tqc\tx441';
    wwv_flow_api.g_varchar2_table(701) := '9\tqr\tx8838\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\yts17 \rtlch\fcs1 \af0\afs20\a';
    wwv_flow_api.g_varchar2_table(702) := 'lang1025 \ltrch\fcs0 \fs20\lang9226\langfe1033\loch\af31506\hich\af31506\dbch\af31505\cgrid\langnp92';
    wwv_flow_api.g_varchar2_table(703) := '26\langfenp1033 {\rtlch\fcs1 '||wwv_flow.LF||
'\af0\afs16 \ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrsid475';
    wwv_flow_api.g_varchar2_table(704) := '731 \hich\af31506\dbch\af31505\loch\f31506 \hich\f31506 Elabor\''f3\loch\f31506 : {\*\bkmkstart Texto';
    wwv_flow_api.g_varchar2_table(705) := '332}}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 '||wwv_flow.LF||
'\fs16\lang3082\langfe1033\lang';
    wwv_flow_api.g_varchar2_table(706) := 'np3082\insrsid10494215\charrsid10494215 \hich\af31506\dbch\af31505\loch\f31506  FORMTEXT }{\rtlch\fc';
    wwv_flow_api.g_varchar2_table(707) := 's1 \af0\afs16 \ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrsid10494215\charrsid10494215 {\*\';
    wwv_flow_api.g_varchar2_table(708) := 'datafield '||wwv_flow.LF||
'800100000000000008546578746f33333200075553554152494f00000000000f3c3f7265663a78646f3030313';
    wwv_flow_api.g_varchar2_table(709) := '83f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto332}{\*\ffdefte';
    wwv_flow_api.g_varchar2_table(710) := 'xt USUARIO}{\*\ffstattext <?ref:xdo0018?>}}}}}{\fldrslt {'||wwv_flow.LF||
'\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\l';
    wwv_flow_api.g_varchar2_table(711) := 'ang1024\langfe1024\noproof\langnp3082\insrsid10494215\charrsid10494215 \hich\af31506\dbch\af31505\lo';
    wwv_flow_api.g_varchar2_table(712) := 'ch\f31506 USUARIO}}}\sectd \ltrsect'||wwv_flow.LF||
'\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\';
    wwv_flow_api.g_varchar2_table(713) := 'sectdefaultcl\sectrsid2177339\sftnbj {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang3082\langfe1033\l';
    wwv_flow_api.g_varchar2_table(714) := 'angnp3082\insrsid475731 {\*\bkmkend Texto332}\cell }\pard \ltrpar'||wwv_flow.LF||
'\s18\qc \li0\ri0\widctlpar\intbl\t';
    wwv_flow_api.g_varchar2_table(715) := 'qc\tx4419\tqr\tx8838\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\yts17 {\rtlch\fcs1 \af';
    wwv_flow_api.g_varchar2_table(716) := '0\afs16 \ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrsid475731 \hich\af31506\dbch\af31505\lo';
    wwv_flow_api.g_varchar2_table(717) := 'ch\f31506 Fecha: '||wwv_flow.LF||
'{\*\bkmkstart Texto333}}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0\afs16 \ltrch';
    wwv_flow_api.g_varchar2_table(718) := '\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrsid10494215\charrsid10494215 \hich\af31506\dbch\af315';
    wwv_flow_api.g_varchar2_table(719) := '05\loch\f31506  FORMTEXT }{\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 '||wwv_flow.LF||
'\fs16\lang3082\langfe1033\langnp3082\';
    wwv_flow_api.g_varchar2_table(720) := 'insrsid10494215\charrsid10494215 {\*\datafield 800100000000000008546578746f3333330003484f59000000000';
    wwv_flow_api.g_varchar2_table(721) := '00f3c3f7265663a78646f303031393f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*';
    wwv_flow_api.g_varchar2_table(722) := '\ffname Texto333}'||wwv_flow.LF||
'{\*\ffdeftext HOY}{\*\ffstattext <?ref:xdo0019?>}}}}}{\fldrslt {\rtlch\fcs1 \af0\a';
    wwv_flow_api.g_varchar2_table(723) := 'fs16 \ltrch\fcs0 \fs16\lang1024\langfe1024\noproof\langnp3082\insrsid10494215\charrsid10494215 \hich';
    wwv_flow_api.g_varchar2_table(724) := '\af31506\dbch\af31505\loch\f31506 HOY}}}\sectd \ltrsect'||wwv_flow.LF||
'\linex0\headery708\footery708\colsx708\endnh';
    wwv_flow_api.g_varchar2_table(725) := 'ere\sectlinegrid360\sectdefaultcl\sectrsid2177339\sftnbj {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\l';
    wwv_flow_api.g_varchar2_table(726) := 'ang3082\langfe1033\langnp3082\insrsid475731 {\*\bkmkend Texto333}\cell \hich\af31506\dbch\af31505\lo';
    wwv_flow_api.g_varchar2_table(727) := 'ch\f31506 '||wwv_flow.LF||
'\hich\f31506 IP Imprimi\''f3\loch\f31506 : {\*\bkmkstart Texto334}}{\field\flddirty{\*\fld';
    wwv_flow_api.g_varchar2_table(728) := 'inst {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrsid10494215\charrs';
    wwv_flow_api.g_varchar2_table(729) := 'id10494215 \hich\af31506\dbch\af31505\loch\f31506  FORMTEXT }{'||wwv_flow.LF||
'\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \f';
    wwv_flow_api.g_varchar2_table(730) := 's16\lang3082\langfe1033\langnp3082\insrsid10494215\charrsid10494215 {\*\datafield 800100000000000008';
    wwv_flow_api.g_varchar2_table(731) := '546578746f333334000649504144445200000000000f3c3f7265663a78646f303032303f3e0000000000}'||wwv_flow.LF||
'{\*\formfield{';
    wwv_flow_api.g_varchar2_table(732) := '\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto334}{\*\ffdeftext IPADDR}{\*\ffstattext <?ref';
    wwv_flow_api.g_varchar2_table(733) := ':xdo0020?>}}}}}{\fldrslt {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang1024\langfe1024\noproof\langn';
    wwv_flow_api.g_varchar2_table(734) := 'p3082\insrsid10494215\charrsid10494215 '||wwv_flow.LF||
'\hich\af31506\dbch\af31505\loch\f31506 IPADDR}}}\sectd \ltrs';
    wwv_flow_api.g_varchar2_table(735) := 'ect\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid2177339\sft';
    wwv_flow_api.g_varchar2_table(736) := 'nbj {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrsid475731 '||wwv_flow.LF||
'{\*\bkmk';
    wwv_flow_api.g_varchar2_table(737) := 'end Texto334}\cell \hich\af31506\dbch\af31505\loch\f31506 \hich\f31506 P\''e1\loch\f31506 gina }{\fie';
    wwv_flow_api.g_varchar2_table(738) := 'ld\fldedit{\*\fldinst {\rtlch\fcs1 \ab\af0\afs16 \ltrch\fcs0 \b\fs16\insrsid475731 \hich\af31506\dbc';
    wwv_flow_api.g_varchar2_table(739) := 'h\af31505\loch\f31506 PAGE}}{\fldrslt {'||wwv_flow.LF||
'\rtlch\fcs1 \ab\af0\afs16 \ltrch\fcs0 \b\fs16\lang1024\langf';
    wwv_flow_api.g_varchar2_table(740) := 'e1024\noproof\insrsid475731 \hich\af31506\dbch\af31505\loch\f31506 1}}}\sectd \ltrsect\linex0\header';
    wwv_flow_api.g_varchar2_table(741) := 'y708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid2177339\sftnbj {'||wwv_flow.LF||
'\rtlch\fcs1';
    wwv_flow_api.g_varchar2_table(742) := ' \af0\afs16 \ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrsid475731 \hich\af31506\dbch\af3150';
    wwv_flow_api.g_varchar2_table(743) := '5\loch\f31506  de }{\field\fldedit{\*\fldinst {\rtlch\fcs1 \ab\af0\afs16 \ltrch\fcs0 \b\fs16\insrsid';
    wwv_flow_api.g_varchar2_table(744) := '475731 '||wwv_flow.LF||
'\hich\af31506\dbch\af31505\loch\f31506 NUMPAGES}}{\fldrslt {\rtlch\fcs1 \ab\af0\afs16 \ltrch';
    wwv_flow_api.g_varchar2_table(745) := '\fcs0 \b\fs16\lang1024\langfe1024\noproof\insrsid475731 \hich\af31506\dbch\af31505\loch\f31506 1}}}\';
    wwv_flow_api.g_varchar2_table(746) := 'sectd \ltrsect'||wwv_flow.LF||
'\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsi';
    wwv_flow_api.g_varchar2_table(747) := 'd2177339\sftnbj {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid475731 \cell }\pard\plain \ltrpar\q';
    wwv_flow_api.g_varchar2_table(748) := 'l \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\';
    wwv_flow_api.g_varchar2_table(749) := 'lin0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\';
    wwv_flow_api.g_varchar2_table(750) := 'langfenp1033 {\rtlch\fcs1 \af37 \ltrch\fcs0 '||wwv_flow.LF||
'\lang9226\langfe9226\langfenp9226\insrsid1315650 \trowd';
    wwv_flow_api.g_varchar2_table(751) := ' \irow0\irowband0\lastrow \ltrrow'||wwv_flow.LF||
'\ts17\trqc\trgaph108\trleft-108\trftsWidth1\trftsWidthB3\trautofit';
    wwv_flow_api.g_varchar2_table(752) := '1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid475731\tbllkhdrrows\tbllkhdrc';
    wwv_flow_api.g_varchar2_table(753) := 'ols\tbllknocolband\tblind0\tblindtype3 \clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl '||wwv_flow.LF||
'\clbrdrb\brdrtbl';
    wwv_flow_api.g_varchar2_table(754) := ' \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth4077\clshdrawnil\clhidemark \cellx3938\clvertalc\clb';
    wwv_flow_api.g_varchar2_table(755) := 'rdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2906\c';
    wwv_flow_api.g_varchar2_table(756) := 'lshdrawnil\clhidemark \cellx6822'||wwv_flow.LF||
'\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrd';
    wwv_flow_api.g_varchar2_table(757) := 'rr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2552\clshdrawnil\clhidemark \cellx9357\clvertalc\clbrdrt\br';
    wwv_flow_api.g_varchar2_table(758) := 'drtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl '||wwv_flow.LF||
'\cltxlrtb\clftsWidth3\clwWidth1560\clshdra';
    wwv_flow_api.g_varchar2_table(759) := 'wnil\clhidemark \cellx10908\row }\pard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\wrapdefault';
    wwv_flow_api.g_varchar2_table(760) := '\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \b\fs16\insr';
    wwv_flow_api.g_varchar2_table(761) := 'sid475731 '||wwv_flow.LF||
'<?end template?>}{\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \b\fs16\insrsid1527012 '||wwv_flow.LF||
'\par }\pard ';
    wwv_flow_api.g_varchar2_table(762) := '\ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin';
    wwv_flow_api.g_varchar2_table(763) := '0\lin0\itap0\pararsid12989215 {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid12989215 '||wwv_flow.LF||
'\par }{\rtlch\fcs1 \af';
    wwv_flow_api.g_varchar2_table(764) := '0 \ltrch\fcs0 \insrsid13203660\charrsid12989215 '||wwv_flow.LF||
'\par }{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid1298921';
    wwv_flow_api.g_varchar2_table(765) := '5\charrsid12989215 '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par }{\rtlch\fcs1 \af0\afs16 \l';
    wwv_flow_api.g_varchar2_table(766) := 'trch\fcs0 \b\fs16\insrsid12989215 '||wwv_flow.LF||
'\par }\pard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\tx1';
    wwv_flow_api.g_varchar2_table(767) := '080\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsid12989215 {\rtlch\fcs1 \af';
    wwv_flow_api.g_varchar2_table(768) := '0 \ltrch\fcs0 \insrsid12989215 \tab '||wwv_flow.LF||
'\par }\pard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\w';
    wwv_flow_api.g_varchar2_table(769) := 'rapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsid10959449 {\rtlch\fcs1 \af0 \lt';
    wwv_flow_api.g_varchar2_table(770) := 'rch\fcs0 \insrsid10959449\charrsid10959449 '||wwv_flow.LF||
'\par }\pard \ltrpar\ql \li0\ri0\sa160\sl259\slmult1\widc';
    wwv_flow_api.g_varchar2_table(771) := 'tlpar\tx2160\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsid10959449 {\rtlch';
    wwv_flow_api.g_varchar2_table(772) := '\fcs1 \af0 \ltrch\fcs0 \insrsid10959449 \tab }{\rtlch\fcs1 \af0 \ltrch\fcs0 '||wwv_flow.LF||
'\insrsid10959449\charrs';
    wwv_flow_api.g_varchar2_table(773) := 'id10959449 '||wwv_flow.LF||
'\par }{\*\themedata 504b030414000600080000002100e9de0fbfff0000001c020000130000005b436f6e';
    wwv_flow_api.g_varchar2_table(774) := '74656e745f54797065735d2e786d6cac91cb4ec3301045f748fc83e52d4a'||wwv_flow.LF||
'9cb2400825e982c78ec7a27cc0c8992416c9d8b';
    wwv_flow_api.g_varchar2_table(775) := '2a755fbf74cd25442a820166c2cd933f79e3be372bd1f07b5c3989ca74aaff2422b24eb1b475da5df374fd9ad'||wwv_flow.LF||
'5689811a18';
    wwv_flow_api.g_varchar2_table(776) := '3c61a50f98f4babebc2837878049899a52a57be670674cb23d8e90721f90a4d2fa3802cb35762680fd800ecd7551dc18eb89';
    wwv_flow_api.g_varchar2_table(777) := '9138e3c943d7e503b6'||wwv_flow.LF||
'b01d583deee5f99824e290b4ba3f364eac4a430883b3c092d4eca8f946c916422ecab927f52ea42b8';
    wwv_flow_api.g_varchar2_table(778) := '9a1cd59c254f919b0e85e6535d135a8de20f20b8c12c3b0'||wwv_flow.LF||
'0c895fcf6720192de6bf3b9e89ecdbd6596cbcdd8eb28e7c365e';
    wwv_flow_api.g_varchar2_table(779) := 'cc4ec1ff1460f53fe813d3cc7f5b7f020000ffff0300504b030414000600080000002100a5d6'||wwv_flow.LF||
'a7e7c0000000360100000b0';
    wwv_flow_api.g_varchar2_table(780) := '000005f72656c732f2e72656c73848fcf6ac3300c87ef85bd83d17d51d2c31825762fa590432fa37d00e1287f68221bdb1be';
    wwv_flow_api.g_varchar2_table(781) := 'bdb4f'||wwv_flow.LF||
'c7060abb0884a4eff7a93dfeae8bf9e194e720169aaa06c3e2433fcb68e1763dbf7f82c985a4a725085b787086a37b';
    wwv_flow_api.g_varchar2_table(782) := 'dbb55fbc50d1a33ccd311ba548b6309512'||wwv_flow.LF||
'0f88d94fbc52ae4264d1c910d24a45db3462247fa791715fd71f989e19e0364cd';
    wwv_flow_api.g_varchar2_table(783) := '3f51652d73760ae8fa8c9ffb3c330cc9e4fc17faf2ce545046e37944c69e462'||wwv_flow.LF||
'a1a82fe353bd90a865aad41ed0b5b8f9d6fd';
    wwv_flow_api.g_varchar2_table(784) := '010000ffff0300504b0304140006000800000021006b799616830000008a0000001c0000007468656d652f746865'||wwv_flow.LF||
'6d652f7';
    wwv_flow_api.g_varchar2_table(785) := '468656d654d616e616765722e786d6c0ccc4d0ac3201040e17da17790d93763bb284562b2cbaebbf600439c1a41c7a0d29fd';
    wwv_flow_api.g_varchar2_table(786) := 'bd7e5e38337cedf14d59b'||wwv_flow.LF||
'4b0d592c9c070d8a65cd2e88b7f07c2ca71ba8da481cc52c6ce1c715e6e97818c9b48d13df49c8';
    wwv_flow_api.g_varchar2_table(787) := '73517d23d59085adb5dd20d6b52bd521ef2cdd5eb9246a3d8b'||wwv_flow.LF||
'4757e8d3f729e245eb2b260a0238fd010000ffff0300504b0';
    wwv_flow_api.g_varchar2_table(788) := '30414000600080000002100a7259ef29c070000cb200000160000007468656d652f7468656d652f'||wwv_flow.LF||
'7468656d65312e786d6c';
    wwv_flow_api.g_varchar2_table(789) := 'ec59cd8b1bc915bf07f23f347d97f5d5ad8fc1f2a24fcfda33b6b164873dd648a5eef2547789aad28cc56208de532e81c026';
    wwv_flow_api.g_varchar2_table(790) := 'e49085bd'||wwv_flow.LF||
'ed21842cecc22eb9e48f31d8249b3f22afaa5bdd5552c99e191c3061463074977eefd5afde7bf5de53d5ddcf5e2';
    wwv_flow_api.g_varchar2_table(791) := '6d4bbc05c1096f6fcfa9d9aefe174ce16248d'||wwv_flow.LF||
'7afeb3d9a4d2f13d2151ba4094a5b8e76fb0f03fbbf7eb5fdd454732c609f6';
    wwv_flow_api.g_varchar2_table(792) := '403e1547a8e7c752ae8eaa5531876124eeb0154ee1bb25e30992f0caa3ea82a34b'||wwv_flow.LF||
'd09bd06aa3566b55134452df4b51026a6';
    wwv_flow_api.g_varchar2_table(793) := '720e32db0f778b92473ecdfdbaa1f53982395420dcc299f2ae5389731b08bf3ba42888d1852ee5d20daf361a605bb9c'||wwv_flow.LF||
'e197';
    wwv_flow_api.g_varchar2_table(794) := 'd2f7281212bee8f935fde757efddada2a35c88ca03b286dc44ffe572b9c0e2bca1e7e4d1593169108441ab5fe8d7002af771';
    wwv_flow_api.g_varchar2_table(795) := 'e3f6b8356e15fa3400cde7b0'||wwv_flow.LF||
'd28c8badb3dd180639d600658f0edda3f6a859b7f086fee61ee77ea83e165e8332fdc11e7e3';
    wwv_flow_api.g_varchar2_table(796) := '21982152dbc0665f8700f1f0eba8391ad5f83327c6b0fdfaef547'||wwv_flow.LF||
'41dbd2af413125e9f91eba16b69ac3ed6a0bc892d16327';
    wwv_flow_api.g_varchar2_table(797) := 'bc1b06937623575ea2201a8ae852532c592a0fc55a825e303e018002522449eac9cd0a2fd11ce27888'||wwv_flow.LF||
'2839e3c43b21510c8';
    wwv_flow_api.g_varchar2_table(798) := '1b7422913305c6bd426b526fc579f403f698fa2238c0c69c50b9888bd21c5c713734e56b2e73f00adbe0179fbf3cf6f5efff';
    wwv_flow_api.g_varchar2_table(799) := '8e6f54f6fbe'||wwv_flow.LF||
'faeacdebbfe7736b5596dc314a2353ee97effef09f6f7eebfdfb876f7ff9fa8fd9d4bb7861e2dffded77effe';
    wwv_flow_api.g_varchar2_table(800) := 'f1cff7a9871597a678fba7efdffdf8fddb3ffffe'||wwv_flow.LF||
'5f7ffddaa1bdcfd199099f91040bef11bef49eb20416e8e08fcff8f5246';
    wwv_flow_api.g_varchar2_table(801) := '63122a6443f8d044a919ac5a17f2c630bfd68832872e006d8b6e3730ea9c605bcbf7e'||wwv_flow.LF||
'61119ec67c2d8943e3c338b180a78c';
    wwv_flow_api.g_varchar2_table(802) := 'd101e34e2b3c547319669eadd3c83d395f9bb8a7085db8e61ea2d4f2f278bd821c4b5c2a8731b6683ea1289528c229969e'||wwv_flow.LF||
'f';
    wwv_flow_api.g_varchar2_table(803) := 'a8e9d63ec58dd178458763d2573ce045b4aef0be20d10719a6446ceac682a858e49027ed9b80882bf2ddb9c3ef7068cba563';
    wwv_flow_api.g_varchar2_table(804) := 'dc2173612f606a20ef2334c2d33'||wwv_flow.LF||
'de476b891297ca194aa869f013246317c9e986cf4ddc5848f0748429f3c60b2c844be631';
    wwv_flow_api.g_varchar2_table(805) := '87f51a4e7f0869c6edf653ba496c2497e4dca5f30431662247ec7c18'||wwv_flow.LF||
'a364e5c24e491a9bd8cfc5398428f29e30e9829f327';
    wwv_flow_api.g_varchar2_table(806) := 'b87a877f0034a0fbafb39c196bb3f9c0d9e418635299501a2be5973872fef6366c5ef74439708bb524d9f'||wwv_flow.LF||
'27568aed73e28c';
    wwv_flow_api.g_varchar2_table(807) := '8ec13ab242fb04638a2ed10263efd9e70e0603b6b26c5e927e10435639c6aec07a80ec5855ef2916d8d3cdcd7e9e3c21c20a';
    wwv_flow_api.g_varchar2_table(808) := 'd9298ed8013ea7'||wwv_flow.LF||
'9b9dc4b3416982f821cd8fc0eba6cdc750ea1257003ca6f37313f888401708f1e234ca63013a8ce03ea8f';
    wwv_flow_api.g_varchar2_table(809) := '5498cac02a6de853b5e37dcf2df55f618eccb17168d'||wwv_flow.LF||
'2bec4b90c1d79681c46ecabcd7363344ad09ca809921e8325ce91644';
    wwv_flow_api.g_varchar2_table(810) := '2cf79722aab86ab1b5536e696fdad20dd01d594d4f42d20f76403bbd4ff8bfeb7da0c378'||wwv_flow.LF||
'fb976f1c9bede3f43b6ec556b2b';
    wwv_flow_api.g_varchar2_table(811) := 'a66a77328991ceff4378770bb5dcd90f105f9f49b9a115aa74f30d491fd8c75dbd3dcf634feff7d4f73683fdf763287fa8dd';
    wwv_flow_api.g_varchar2_table(812) := 'b'||wwv_flow.LF||
'4ec6870ee3b693c90f573e4e2753362fd0d7a8038feca0471ffb24074f7d9684d2a9dc507c22f4c18f80df338b090c2a39';
    wwv_flow_api.g_varchar2_table(813) := '7de6898b53c0550c8faaccc104162e'||wwv_flow.LF||
'e248cb789cc9df10194f63b482d3a1baaf944422571d096fc5041c1ae961a76e85a7e';
    wwv_flow_api.g_varchar2_table(814) := 'be4942db2c3ce7a5d1d6c66955520598ed7c2621c0eaa64866eb5cb03bc'||wwv_flow.LF||
'42bd661be983d62d01257b1d12c6643689a68344';
    wwv_flow_api.g_varchar2_table(815) := '7b3ba88ca48f75c1680e127a651f8545d7c1a2a3d46f5db5c702a8155e811fdc1efc4ceff96100222004e771'||wwv_flow.LF||
'd09c2f949f3';
    wwv_flow_api.g_varchar2_table(816) := '2576fbdab9df9313d7dc89856044083bd8d80d2d35dc5f5e0f2d4eab250bb82a72d1246b8d924b46574832762f8199c47a71';
    wwv_flow_api.g_varchar2_table(817) := 'abd0a8debfaba5bba'||wwv_flow.LF||
'd4a2a74ca1e783d02a69b43bef6371535f83dc6e6ea0a9992968ea5df6fc5633849099a355cf5fc2a1';
    wwv_flow_api.g_varchar2_table(818) := '313c262b881da17e73211ac1ddcb5cf26cc3df24b3acb8'||wwv_flow.LF||
'902324e2cce03ae964d9202112738f92a4e7abe5176ea0a9ce219';
    wwv_flow_api.g_varchar2_table(819) := 'a5bbd0109e19325d785b4f2a99103a7db4ec6cb259e4bd3edc688b274f60a193ecb15ce6fb5'||wwv_flow.LF||
'f8cdc14a92adc1ddd37871e9';
    wwv_flow_api.g_varchar2_table(820) := '9dd1357f8a20c4c2765d19704104dc1dd4336b2e085c861589ac8cbf9dc294a75df3364ac750368ee82a46794531937906d7';
    wwv_flow_api.g_varchar2_table(821) := 'a9bc'||wwv_flow.LF||
'a0a3df0a1b186ff99ac1a08649f2427816a9026b1ad5aaa645d5c8381cacba1f1652963392665933adaca2aaa63b8b5';
    wwv_flow_api.g_varchar2_table(822) := '9336ccbc08e2d6f56e40d565b13434e33'||wwv_flow.LF||
'2b7c96ba77536e779beb76fa84a24a80c10bfb39aaee150a8241ad9ccca2a618ef';
    wwv_flow_api.g_varchar2_table(823) := 'a76195b3f351bb766c17f8016a57291246d66f6dd5eed8ada811cee960f046'||wwv_flow.LF||
'951fe476a3168696dbbe525b5adf9b9b17dbe';
    wwv_flow_api.g_varchar2_table(824) := 'cec05248f1174b96b2a8576255c5b73040dd154f72459da802df252e65b039ebc35273dffcb5ad80f868d7058a9'||wwv_flow.LF||
'75c27125';
    wwv_flow_api.g_varchar2_table(825) := '6806b54a27ec372bfd306cd6c761bd361a345e41619171520fb33bfb095c60d04d7e73afc7f76eef93ed1dcd9d394baa4cdf';
    wwv_flow_api.g_varchar2_table(826) := 'ca5735717d7b5f6f58b7'||wwv_flow.LF||
'f7d94dbc375397f3be4720e97cd96a4cbacdeea055e936fb934a301a742add616b5019b586edd16';
    wwv_flow_api.g_varchar2_table(827) := '4340c3bddc92bdfbbd0e0a0df1c06ad71a7d2aa0f8795a055'||wwv_flow.LF||
'53f43bdd4a3b6834fa41bbdf1907fd57791b032bcfd2476e0b';
    wwv_flow_api.g_varchar2_table(828) := '30afe675efbf000000ffff0300504b0304140006000800000021000dd1909fb60000001b010000'||wwv_flow.LF||
'270000007468656d652f7';
    wwv_flow_api.g_varchar2_table(829) := '468656d652f5f72656c732f7468656d654d616e616765722e786d6c2e72656c73848f4d0ac2301484f78277086f6fd3ba109';
    wwv_flow_api.g_varchar2_table(830) := '126dd88'||wwv_flow.LF||
'd0add40384e4350d363f2451eced0dae2c082e8761be9969bb979dc9136332de3168aa1a083ae995719ac16db8ec';
    wwv_flow_api.g_varchar2_table(831) := '8e4052164e89d93b64b060828e6f37ed1567'||wwv_flow.LF||
'914b284d262452282e3198720e274a939cd08a54f980ae38a38f56e422a3a64';
    wwv_flow_api.g_varchar2_table(832) := '1c8bbd048f7757da0f19b017cc524bd62107bd5001996509affb3fd381a89672f'||wwv_flow.LF||
'1f165dfe514173d9850528a2c6cce0239b';
    wwv_flow_api.g_varchar2_table(833) := 'aa4c04ca5bbabac4df000000ffff0300504b01022d0014000600080000002100e9de0fbfff0000001c020000130000'||wwv_flow.LF||
'00000';
    wwv_flow_api.g_varchar2_table(834) := '00000000000000000000000005b436f6e74656e745f54797065735d2e786d6c504b01022d0014000600080000002100a5d6a';
    wwv_flow_api.g_varchar2_table(835) := '7e7c0000000360100000b00'||wwv_flow.LF||
'000000000000000000000000300100005f72656c732f2e72656c73504b01022d001400060008';
    wwv_flow_api.g_varchar2_table(836) := '00000021006b799616830000008a0000001c0000000000000000'||wwv_flow.LF||
'0000000000190200007468656d652f7468656d652f74686';
    wwv_flow_api.g_varchar2_table(837) := '56d654d616e616765722e786d6c504b01022d0014000600080000002100a7259ef29c070000cb2000'||wwv_flow.LF||
'001600000000000000';
    wwv_flow_api.g_varchar2_table(838) := '000000000000d60200007468656d652f7468656d652f7468656d65312e786d6c504b01022d00140006000800000021000dd1';
    wwv_flow_api.g_varchar2_table(839) := '909fb60000'||wwv_flow.LF||
'001b0100002700000000000000000000000000a60a00007468656d652f7468656d652f5f72656c732f7468656';
    wwv_flow_api.g_varchar2_table(840) := 'd654d616e616765722e786d6c2e72656c73504b050600000000050005005d010000a10b00000000}'||wwv_flow.LF||
'{\*\colorschememapp';
    wwv_flow_api.g_varchar2_table(841) := 'ing 3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d3822207374616e64616c6f6e653d';
    wwv_flow_api.g_varchar2_table(842) := '22796573223f3e0d0a3c613a636c724d'||wwv_flow.LF||
'617020786d6c6e733a613d22687474703a2f2f736368656d61732e6f70656e786d6';
    wwv_flow_api.g_varchar2_table(843) := 'c666f726d6174732e6f72672f64726177696e676d6c2f323030362f6d6169'||wwv_flow.LF||
'6e22206267313d226c743122207478313d2264';
    wwv_flow_api.g_varchar2_table(844) := '6b3122206267323d226c743222207478323d22646b322220616363656e74313d22616363656e74312220616363'||wwv_flow.LF||
'656e74323';
    wwv_flow_api.g_varchar2_table(845) := 'd22616363656e74322220616363656e74333d22616363656e74332220616363656e74343d22616363656e743422206163636';
    wwv_flow_api.g_varchar2_table(846) := '56e74353d22616363656e74352220616363656e74363d22616363656e74362220686c696e6b3d22686c696e6b2220666f6c4';
    wwv_flow_api.g_varchar2_table(847) := '86c696e6b3d22666f6c486c696e6b222f3e}'||wwv_flow.LF||
'{\*\latentstyles\lsdstimax375\lsdlockeddef0\lsdsemihiddendef0\l';
    wwv_flow_api.g_varchar2_table(848) := 'sdunhideuseddef0\lsdqformatdef0\lsdprioritydef99{\lsdlockedexcept \lsdqformat1 \lsdpriority0 \lsdloc';
    wwv_flow_api.g_varchar2_table(849) := 'ked0 Normal;\lsdqformat1 \lsdpriority9 \lsdlocked0 heading 1;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdqf';
    wwv_flow_api.g_varchar2_table(850) := 'ormat1 \lsdpriority9 \lsdlocked0 heading 2;\lsdsemihidden1 \lsdunhideused1 \lsdqformat1 \lsdpriority';
    wwv_flow_api.g_varchar2_table(851) := '9 \lsdlocked0 heading 3;\lsdsemihidden1 \lsdunhideused1 \lsdqformat1 \lsdpriority9 \lsdlocked0 headi';
    wwv_flow_api.g_varchar2_table(852) := 'ng 4;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdqformat1 \lsdpriority9 \lsdlocked0 heading 5;\lsdsemihidde';
    wwv_flow_api.g_varchar2_table(853) := 'n1 \lsdunhideused1 \lsdqformat1 \lsdpriority9 \lsdlocked0 heading 6;\lsdsemihidden1 \lsdunhideused1 ';
    wwv_flow_api.g_varchar2_table(854) := '\lsdqformat1 \lsdpriority9 \lsdlocked0 heading 7;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdqformat1 \lsdp';
    wwv_flow_api.g_varchar2_table(855) := 'riority9 \lsdlocked0 heading 8;\lsdsemihidden1 \lsdunhideused1 \lsdqformat1 \lsdpriority9 \lsdlocked';
    wwv_flow_api.g_varchar2_table(856) := '0 heading 9;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 index 1;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \ls';
    wwv_flow_api.g_varchar2_table(857) := 'dlocked0 index 2;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 index 3;\lsdsemihidden1 \lsdunhideused1';
    wwv_flow_api.g_varchar2_table(858) := ' \lsdlocked0 index 4;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 index 5;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhide';
    wwv_flow_api.g_varchar2_table(859) := 'used1 \lsdlocked0 index 6;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 index 7;\lsdsemihidden1 \lsdun';
    wwv_flow_api.g_varchar2_table(860) := 'hideused1 \lsdlocked0 index 8;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 index 9;'||wwv_flow.LF||
'\lsdsemihidden1 \';
    wwv_flow_api.g_varchar2_table(861) := 'lsdunhideused1 \lsdpriority39 \lsdlocked0 toc 1;\lsdsemihidden1 \lsdunhideused1 \lsdpriority39 \lsdl';
    wwv_flow_api.g_varchar2_table(862) := 'ocked0 toc 2;\lsdsemihidden1 \lsdunhideused1 \lsdpriority39 \lsdlocked0 toc 3;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdu';
    wwv_flow_api.g_varchar2_table(863) := 'nhideused1 \lsdpriority39 \lsdlocked0 toc 4;\lsdsemihidden1 \lsdunhideused1 \lsdpriority39 \lsdlocke';
    wwv_flow_api.g_varchar2_table(864) := 'd0 toc 5;\lsdsemihidden1 \lsdunhideused1 \lsdpriority39 \lsdlocked0 toc 6;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhid';
    wwv_flow_api.g_varchar2_table(865) := 'eused1 \lsdpriority39 \lsdlocked0 toc 7;\lsdsemihidden1 \lsdunhideused1 \lsdpriority39 \lsdlocked0 t';
    wwv_flow_api.g_varchar2_table(866) := 'oc 8;\lsdsemihidden1 \lsdunhideused1 \lsdpriority39 \lsdlocked0 toc 9;\lsdsemihidden1 \lsdunhideused';
    wwv_flow_api.g_varchar2_table(867) := '1 \lsdlocked0 Normal Indent;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 footnote text;\lsdsemihidde';
    wwv_flow_api.g_varchar2_table(868) := 'n1 \lsdunhideused1 \lsdlocked0 annotation text;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 header;\l';
    wwv_flow_api.g_varchar2_table(869) := 'sdsemihidden1 \lsdunhideused1 \lsdlocked0 footer;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 index ';
    wwv_flow_api.g_varchar2_table(870) := 'heading;\lsdsemihidden1 \lsdunhideused1 \lsdqformat1 \lsdpriority35 \lsdlocked0 caption;\lsdsemihidd';
    wwv_flow_api.g_varchar2_table(871) := 'en1 \lsdunhideused1 \lsdlocked0 table of figures;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 envelo';
    wwv_flow_api.g_varchar2_table(872) := 'pe address;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 envelope return;\lsdsemihidden1 \lsdunhideuse';
    wwv_flow_api.g_varchar2_table(873) := 'd1 \lsdlocked0 footnote reference;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 annotation reference;'||wwv_flow.LF||
'';
    wwv_flow_api.g_varchar2_table(874) := '\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 line number;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 ';
    wwv_flow_api.g_varchar2_table(875) := 'page number;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 endnote reference;\lsdsemihidden1 \lsdunhide';
    wwv_flow_api.g_varchar2_table(876) := 'used1 \lsdlocked0 endnote text;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 table of authorities;\ls';
    wwv_flow_api.g_varchar2_table(877) := 'dsemihidden1 \lsdunhideused1 \lsdlocked0 macro;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 toa headi';
    wwv_flow_api.g_varchar2_table(878) := 'ng;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Lis';
    wwv_flow_api.g_varchar2_table(879) := 't Bullet;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Number;\lsdsemihidden1 \lsdunhideused1 \ls';
    wwv_flow_api.g_varchar2_table(880) := 'dlocked0 List 2;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List 3;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 ';
    wwv_flow_api.g_varchar2_table(881) := '\lsdlocked0 List 4;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List 5;\lsdsemihidden1 \lsdunhideused';
    wwv_flow_api.g_varchar2_table(882) := '1 \lsdlocked0 List Bullet 2;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Bullet 3;'||wwv_flow.LF||
'\lsdsemihidde';
    wwv_flow_api.g_varchar2_table(883) := 'n1 \lsdunhideused1 \lsdlocked0 List Bullet 4;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Bullet';
    wwv_flow_api.g_varchar2_table(884) := ' 5;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Number 2;\lsdsemihidden1 \lsdunhideused1 \lsdloc';
    wwv_flow_api.g_varchar2_table(885) := 'ked0 List Number 3;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Number 4;\lsdsemihidden1 \lsdun';
    wwv_flow_api.g_varchar2_table(886) := 'hideused1 \lsdlocked0 List Number 5;\lsdqformat1 \lsdpriority10 \lsdlocked0 Title;\lsdsemihidden1 \l';
    wwv_flow_api.g_varchar2_table(887) := 'sdunhideused1 \lsdlocked0 Closing;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Signature;\lsdsemihid';
    wwv_flow_api.g_varchar2_table(888) := 'den1 \lsdunhideused1 \lsdpriority1 \lsdlocked0 Default Paragraph Font;\lsdsemihidden1 \lsdunhideused';
    wwv_flow_api.g_varchar2_table(889) := '1 \lsdlocked0 Body Text;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Body Text Indent;'||wwv_flow.LF||
'\lsdsemihidden';
    wwv_flow_api.g_varchar2_table(890) := '1 \lsdunhideused1 \lsdlocked0 List Continue;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Continu';
    wwv_flow_api.g_varchar2_table(891) := 'e 2;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Continue 3;\lsdsemihidden1 \lsdunhideused1 \lsd';
    wwv_flow_api.g_varchar2_table(892) := 'locked0 List Continue 4;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Continue 5;\lsdsemihidden1';
    wwv_flow_api.g_varchar2_table(893) := ' \lsdunhideused1 \lsdlocked0 Message Header;\lsdqformat1 \lsdpriority11 \lsdlocked0 Subtitle;\lsdsem';
    wwv_flow_api.g_varchar2_table(894) := 'ihidden1 \lsdunhideused1 \lsdlocked0 Salutation;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Date;\l';
    wwv_flow_api.g_varchar2_table(895) := 'sdsemihidden1 \lsdunhideused1 \lsdlocked0 Body Text First Indent;\lsdsemihidden1 \lsdunhideused1 \ls';
    wwv_flow_api.g_varchar2_table(896) := 'dlocked0 Body Text First Indent 2;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Note Heading;'||wwv_flow.LF||
'\lsdsemi';
    wwv_flow_api.g_varchar2_table(897) := 'hidden1 \lsdunhideused1 \lsdlocked0 Body Text 2;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Body Tex';
    wwv_flow_api.g_varchar2_table(898) := 't 3;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Body Text Indent 2;\lsdsemihidden1 \lsdunhideused1 \';
    wwv_flow_api.g_varchar2_table(899) := 'lsdlocked0 Body Text Indent 3;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Block Text;\lsdsemihidden';
    wwv_flow_api.g_varchar2_table(900) := '1 \lsdunhideused1 \lsdlocked0 Hyperlink;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 FollowedHyperlin';
    wwv_flow_api.g_varchar2_table(901) := 'k;\lsdqformat1 \lsdpriority22 \lsdlocked0 Strong;'||wwv_flow.LF||
'\lsdqformat1 \lsdpriority20 \lsdlocked0 Emphasis;\';
    wwv_flow_api.g_varchar2_table(902) := 'lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Document Map;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 ';
    wwv_flow_api.g_varchar2_table(903) := 'Plain Text;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 E-mail Signature;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideu';
    wwv_flow_api.g_varchar2_table(904) := 'sed1 \lsdlocked0 HTML Top of Form;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 HTML Bottom of Form;\l';
    wwv_flow_api.g_varchar2_table(905) := 'sdsemihidden1 \lsdunhideused1 \lsdlocked0 Normal (Web);\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 H';
    wwv_flow_api.g_varchar2_table(906) := 'TML Acronym;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 HTML Address;\lsdsemihidden1 \lsdunhideused';
    wwv_flow_api.g_varchar2_table(907) := '1 \lsdlocked0 HTML Cite;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 HTML Code;\lsdsemihidden1 \lsdun';
    wwv_flow_api.g_varchar2_table(908) := 'hideused1 \lsdlocked0 HTML Definition;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 HTML Keyboard;\ls';
    wwv_flow_api.g_varchar2_table(909) := 'dsemihidden1 \lsdunhideused1 \lsdlocked0 HTML Preformatted;\lsdsemihidden1 \lsdunhideused1 \lsdlocke';
    wwv_flow_api.g_varchar2_table(910) := 'd0 HTML Sample;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 HTML Typewriter;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhi';
    wwv_flow_api.g_varchar2_table(911) := 'deused1 \lsdlocked0 HTML Variable;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 annotation subject;\ls';
    wwv_flow_api.g_varchar2_table(912) := 'dsemihidden1 \lsdunhideused1 \lsdlocked0 No List;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Outline';
    wwv_flow_api.g_varchar2_table(913) := ' List 1;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Outline List 2;\lsdsemihidden1 \lsdunhideused1 ';
    wwv_flow_api.g_varchar2_table(914) := '\lsdlocked0 Outline List 3;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Balloon Text;\lsdpriority39 \';
    wwv_flow_api.g_varchar2_table(915) := 'lsdlocked0 Table Grid;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdlocked0 Placeholder Text;\lsdqformat1 \lsdpriority1 \lsdl';
    wwv_flow_api.g_varchar2_table(916) := 'ocked0 No Spacing;\lsdpriority60 \lsdlocked0 Light Shading;\lsdpriority61 \lsdlocked0 Light List;\ls';
    wwv_flow_api.g_varchar2_table(917) := 'dpriority62 \lsdlocked0 Light Grid;'||wwv_flow.LF||
'\lsdpriority63 \lsdlocked0 Medium Shading 1;\lsdpriority64 \lsdl';
    wwv_flow_api.g_varchar2_table(918) := 'ocked0 Medium Shading 2;\lsdpriority65 \lsdlocked0 Medium List 1;\lsdpriority66 \lsdlocked0 Medium L';
    wwv_flow_api.g_varchar2_table(919) := 'ist 2;\lsdpriority67 \lsdlocked0 Medium Grid 1;\lsdpriority68 \lsdlocked0 Medium Grid 2;'||wwv_flow.LF||
'\lsdpriorit';
    wwv_flow_api.g_varchar2_table(920) := 'y69 \lsdlocked0 Medium Grid 3;\lsdpriority70 \lsdlocked0 Dark List;\lsdpriority71 \lsdlocked0 Colorf';
    wwv_flow_api.g_varchar2_table(921) := 'ul Shading;\lsdpriority72 \lsdlocked0 Colorful List;\lsdpriority73 \lsdlocked0 Colorful Grid;\lsdpri';
    wwv_flow_api.g_varchar2_table(922) := 'ority60 \lsdlocked0 Light Shading Accent 1;'||wwv_flow.LF||
'\lsdpriority61 \lsdlocked0 Light List Accent 1;\lsdprior';
    wwv_flow_api.g_varchar2_table(923) := 'ity62 \lsdlocked0 Light Grid Accent 1;\lsdpriority63 \lsdlocked0 Medium Shading 1 Accent 1;\lsdprior';
    wwv_flow_api.g_varchar2_table(924) := 'ity64 \lsdlocked0 Medium Shading 2 Accent 1;\lsdpriority65 \lsdlocked0 Medium List 1 Accent 1;'||wwv_flow.LF||
'\lsds';
    wwv_flow_api.g_varchar2_table(925) := 'emihidden1 \lsdlocked0 Revision;\lsdqformat1 \lsdpriority34 \lsdlocked0 List Paragraph;\lsdqformat1 ';
    wwv_flow_api.g_varchar2_table(926) := '\lsdpriority29 \lsdlocked0 Quote;\lsdqformat1 \lsdpriority30 \lsdlocked0 Intense Quote;\lsdpriority6';
    wwv_flow_api.g_varchar2_table(927) := '6 \lsdlocked0 Medium List 2 Accent 1;'||wwv_flow.LF||
'\lsdpriority67 \lsdlocked0 Medium Grid 1 Accent 1;\lsdpriority';
    wwv_flow_api.g_varchar2_table(928) := '68 \lsdlocked0 Medium Grid 2 Accent 1;\lsdpriority69 \lsdlocked0 Medium Grid 3 Accent 1;\lsdpriority';
    wwv_flow_api.g_varchar2_table(929) := '70 \lsdlocked0 Dark List Accent 1;\lsdpriority71 \lsdlocked0 Colorful Shading Accent 1;'||wwv_flow.LF||
'\lsdpriority';
    wwv_flow_api.g_varchar2_table(930) := '72 \lsdlocked0 Colorful List Accent 1;\lsdpriority73 \lsdlocked0 Colorful Grid Accent 1;\lsdpriority';
    wwv_flow_api.g_varchar2_table(931) := '60 \lsdlocked0 Light Shading Accent 2;\lsdpriority61 \lsdlocked0 Light List Accent 2;\lsdpriority62 ';
    wwv_flow_api.g_varchar2_table(932) := '\lsdlocked0 Light Grid Accent 2;'||wwv_flow.LF||
'\lsdpriority63 \lsdlocked0 Medium Shading 1 Accent 2;\lsdpriority64';
    wwv_flow_api.g_varchar2_table(933) := ' \lsdlocked0 Medium Shading 2 Accent 2;\lsdpriority65 \lsdlocked0 Medium List 1 Accent 2;\lsdpriorit';
    wwv_flow_api.g_varchar2_table(934) := 'y66 \lsdlocked0 Medium List 2 Accent 2;'||wwv_flow.LF||
'\lsdpriority67 \lsdlocked0 Medium Grid 1 Accent 2;\lsdpriori';
    wwv_flow_api.g_varchar2_table(935) := 'ty68 \lsdlocked0 Medium Grid 2 Accent 2;\lsdpriority69 \lsdlocked0 Medium Grid 3 Accent 2;\lsdpriori';
    wwv_flow_api.g_varchar2_table(936) := 'ty70 \lsdlocked0 Dark List Accent 2;\lsdpriority71 \lsdlocked0 Colorful Shading Accent 2;'||wwv_flow.LF||
'\lsdpriori';
    wwv_flow_api.g_varchar2_table(937) := 'ty72 \lsdlocked0 Colorful List Accent 2;\lsdpriority73 \lsdlocked0 Colorful Grid Accent 2;\lsdpriori';
    wwv_flow_api.g_varchar2_table(938) := 'ty60 \lsdlocked0 Light Shading Accent 3;\lsdpriority61 \lsdlocked0 Light List Accent 3;\lsdpriority6';
    wwv_flow_api.g_varchar2_table(939) := '2 \lsdlocked0 Light Grid Accent 3;'||wwv_flow.LF||
'\lsdpriority63 \lsdlocked0 Medium Shading 1 Accent 3;\lsdpriority';
    wwv_flow_api.g_varchar2_table(940) := '64 \lsdlocked0 Medium Shading 2 Accent 3;\lsdpriority65 \lsdlocked0 Medium List 1 Accent 3;\lsdprior';
    wwv_flow_api.g_varchar2_table(941) := 'ity66 \lsdlocked0 Medium List 2 Accent 3;'||wwv_flow.LF||
'\lsdpriority67 \lsdlocked0 Medium Grid 1 Accent 3;\lsdprio';
    wwv_flow_api.g_varchar2_table(942) := 'rity68 \lsdlocked0 Medium Grid 2 Accent 3;\lsdpriority69 \lsdlocked0 Medium Grid 3 Accent 3;\lsdprio';
    wwv_flow_api.g_varchar2_table(943) := 'rity70 \lsdlocked0 Dark List Accent 3;\lsdpriority71 \lsdlocked0 Colorful Shading Accent 3;'||wwv_flow.LF||
'\lsdprio';
    wwv_flow_api.g_varchar2_table(944) := 'rity72 \lsdlocked0 Colorful List Accent 3;\lsdpriority73 \lsdlocked0 Colorful Grid Accent 3;\lsdprio';
    wwv_flow_api.g_varchar2_table(945) := 'rity60 \lsdlocked0 Light Shading Accent 4;\lsdpriority61 \lsdlocked0 Light List Accent 4;\lsdpriorit';
    wwv_flow_api.g_varchar2_table(946) := 'y62 \lsdlocked0 Light Grid Accent 4;'||wwv_flow.LF||
'\lsdpriority63 \lsdlocked0 Medium Shading 1 Accent 4;\lsdpriori';
    wwv_flow_api.g_varchar2_table(947) := 'ty64 \lsdlocked0 Medium Shading 2 Accent 4;\lsdpriority65 \lsdlocked0 Medium List 1 Accent 4;\lsdpri';
    wwv_flow_api.g_varchar2_table(948) := 'ority66 \lsdlocked0 Medium List 2 Accent 4;'||wwv_flow.LF||
'\lsdpriority67 \lsdlocked0 Medium Grid 1 Accent 4;\lsdpr';
    wwv_flow_api.g_varchar2_table(949) := 'iority68 \lsdlocked0 Medium Grid 2 Accent 4;\lsdpriority69 \lsdlocked0 Medium Grid 3 Accent 4;\lsdpr';
    wwv_flow_api.g_varchar2_table(950) := 'iority70 \lsdlocked0 Dark List Accent 4;\lsdpriority71 \lsdlocked0 Colorful Shading Accent 4;'||wwv_flow.LF||
'\lsdpr';
    wwv_flow_api.g_varchar2_table(951) := 'iority72 \lsdlocked0 Colorful List Accent 4;\lsdpriority73 \lsdlocked0 Colorful Grid Accent 4;\lsdpr';
    wwv_flow_api.g_varchar2_table(952) := 'iority60 \lsdlocked0 Light Shading Accent 5;\lsdpriority61 \lsdlocked0 Light List Accent 5;\lsdprior';
    wwv_flow_api.g_varchar2_table(953) := 'ity62 \lsdlocked0 Light Grid Accent 5;'||wwv_flow.LF||
'\lsdpriority63 \lsdlocked0 Medium Shading 1 Accent 5;\lsdprio';
    wwv_flow_api.g_varchar2_table(954) := 'rity64 \lsdlocked0 Medium Shading 2 Accent 5;\lsdpriority65 \lsdlocked0 Medium List 1 Accent 5;\lsdp';
    wwv_flow_api.g_varchar2_table(955) := 'riority66 \lsdlocked0 Medium List 2 Accent 5;'||wwv_flow.LF||
'\lsdpriority67 \lsdlocked0 Medium Grid 1 Accent 5;\lsd';
    wwv_flow_api.g_varchar2_table(956) := 'priority68 \lsdlocked0 Medium Grid 2 Accent 5;\lsdpriority69 \lsdlocked0 Medium Grid 3 Accent 5;\lsd';
    wwv_flow_api.g_varchar2_table(957) := 'priority70 \lsdlocked0 Dark List Accent 5;\lsdpriority71 \lsdlocked0 Colorful Shading Accent 5;'||wwv_flow.LF||
'\lsd';
    wwv_flow_api.g_varchar2_table(958) := 'priority72 \lsdlocked0 Colorful List Accent 5;\lsdpriority73 \lsdlocked0 Colorful Grid Accent 5;\lsd';
    wwv_flow_api.g_varchar2_table(959) := 'priority60 \lsdlocked0 Light Shading Accent 6;\lsdpriority61 \lsdlocked0 Light List Accent 6;\lsdpri';
    wwv_flow_api.g_varchar2_table(960) := 'ority62 \lsdlocked0 Light Grid Accent 6;'||wwv_flow.LF||
'\lsdpriority63 \lsdlocked0 Medium Shading 1 Accent 6;\lsdpr';
    wwv_flow_api.g_varchar2_table(961) := 'iority64 \lsdlocked0 Medium Shading 2 Accent 6;\lsdpriority65 \lsdlocked0 Medium List 1 Accent 6;\ls';
    wwv_flow_api.g_varchar2_table(962) := 'dpriority66 \lsdlocked0 Medium List 2 Accent 6;'||wwv_flow.LF||
'\lsdpriority67 \lsdlocked0 Medium Grid 1 Accent 6;\l';
    wwv_flow_api.g_varchar2_table(963) := 'sdpriority68 \lsdlocked0 Medium Grid 2 Accent 6;\lsdpriority69 \lsdlocked0 Medium Grid 3 Accent 6;\l';
    wwv_flow_api.g_varchar2_table(964) := 'sdpriority70 \lsdlocked0 Dark List Accent 6;\lsdpriority71 \lsdlocked0 Colorful Shading Accent 6;'||wwv_flow.LF||
'\l';
    wwv_flow_api.g_varchar2_table(965) := 'sdpriority72 \lsdlocked0 Colorful List Accent 6;\lsdpriority73 \lsdlocked0 Colorful Grid Accent 6;\l';
    wwv_flow_api.g_varchar2_table(966) := 'sdqformat1 \lsdpriority19 \lsdlocked0 Subtle Emphasis;\lsdqformat1 \lsdpriority21 \lsdlocked0 Intens';
    wwv_flow_api.g_varchar2_table(967) := 'e Emphasis;'||wwv_flow.LF||
'\lsdqformat1 \lsdpriority31 \lsdlocked0 Subtle Reference;\lsdqformat1 \lsdpriority32 \ls';
    wwv_flow_api.g_varchar2_table(968) := 'dlocked0 Intense Reference;\lsdqformat1 \lsdpriority33 \lsdlocked0 Book Title;\lsdsemihidden1 \lsdun';
    wwv_flow_api.g_varchar2_table(969) := 'hideused1 \lsdpriority37 \lsdlocked0 Bibliography;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdqformat1 \lsd';
    wwv_flow_api.g_varchar2_table(970) := 'priority39 \lsdlocked0 TOC Heading;\lsdpriority41 \lsdlocked0 Plain Table 1;\lsdpriority42 \lsdlocke';
    wwv_flow_api.g_varchar2_table(971) := 'd0 Plain Table 2;\lsdpriority43 \lsdlocked0 Plain Table 3;\lsdpriority44 \lsdlocked0 Plain Table 4;'||wwv_flow.LF||
'';
    wwv_flow_api.g_varchar2_table(972) := '\lsdpriority45 \lsdlocked0 Plain Table 5;\lsdpriority40 \lsdlocked0 Grid Table Light;\lsdpriority46 ';
    wwv_flow_api.g_varchar2_table(973) := '\lsdlocked0 Grid Table 1 Light;\lsdpriority47 \lsdlocked0 Grid Table 2;\lsdpriority48 \lsdlocked0 Gr';
    wwv_flow_api.g_varchar2_table(974) := 'id Table 3;\lsdpriority49 \lsdlocked0 Grid Table 4;'||wwv_flow.LF||
'\lsdpriority50 \lsdlocked0 Grid Table 5 Dark;\ls';
    wwv_flow_api.g_varchar2_table(975) := 'dpriority51 \lsdlocked0 Grid Table 6 Colorful;\lsdpriority52 \lsdlocked0 Grid Table 7 Colorful;\lsdp';
    wwv_flow_api.g_varchar2_table(976) := 'riority46 \lsdlocked0 Grid Table 1 Light Accent 1;\lsdpriority47 \lsdlocked0 Grid Table 2 Accent 1;'||wwv_flow.LF||
'';
    wwv_flow_api.g_varchar2_table(977) := '\lsdpriority48 \lsdlocked0 Grid Table 3 Accent 1;\lsdpriority49 \lsdlocked0 Grid Table 4 Accent 1;\l';
    wwv_flow_api.g_varchar2_table(978) := 'sdpriority50 \lsdlocked0 Grid Table 5 Dark Accent 1;\lsdpriority51 \lsdlocked0 Grid Table 6 Colorful';
    wwv_flow_api.g_varchar2_table(979) := ' Accent 1;'||wwv_flow.LF||
'\lsdpriority52 \lsdlocked0 Grid Table 7 Colorful Accent 1;\lsdpriority46 \lsdlocked0 Grid';
    wwv_flow_api.g_varchar2_table(980) := ' Table 1 Light Accent 2;\lsdpriority47 \lsdlocked0 Grid Table 2 Accent 2;\lsdpriority48 \lsdlocked0 ';
    wwv_flow_api.g_varchar2_table(981) := 'Grid Table 3 Accent 2;'||wwv_flow.LF||
'\lsdpriority49 \lsdlocked0 Grid Table 4 Accent 2;\lsdpriority50 \lsdlocked0 G';
    wwv_flow_api.g_varchar2_table(982) := 'rid Table 5 Dark Accent 2;\lsdpriority51 \lsdlocked0 Grid Table 6 Colorful Accent 2;\lsdpriority52 \';
    wwv_flow_api.g_varchar2_table(983) := 'lsdlocked0 Grid Table 7 Colorful Accent 2;'||wwv_flow.LF||
'\lsdpriority46 \lsdlocked0 Grid Table 1 Light Accent 3;\l';
    wwv_flow_api.g_varchar2_table(984) := 'sdpriority47 \lsdlocked0 Grid Table 2 Accent 3;\lsdpriority48 \lsdlocked0 Grid Table 3 Accent 3;\lsd';
    wwv_flow_api.g_varchar2_table(985) := 'priority49 \lsdlocked0 Grid Table 4 Accent 3;'||wwv_flow.LF||
'\lsdpriority50 \lsdlocked0 Grid Table 5 Dark Accent 3;';
    wwv_flow_api.g_varchar2_table(986) := '\lsdpriority51 \lsdlocked0 Grid Table 6 Colorful Accent 3;\lsdpriority52 \lsdlocked0 Grid Table 7 Co';
    wwv_flow_api.g_varchar2_table(987) := 'lorful Accent 3;\lsdpriority46 \lsdlocked0 Grid Table 1 Light Accent 4;'||wwv_flow.LF||
'\lsdpriority47 \lsdlocked0 G';
    wwv_flow_api.g_varchar2_table(988) := 'rid Table 2 Accent 4;\lsdpriority48 \lsdlocked0 Grid Table 3 Accent 4;\lsdpriority49 \lsdlocked0 Gri';
    wwv_flow_api.g_varchar2_table(989) := 'd Table 4 Accent 4;\lsdpriority50 \lsdlocked0 Grid Table 5 Dark Accent 4;'||wwv_flow.LF||
'\lsdpriority51 \lsdlocked0';
    wwv_flow_api.g_varchar2_table(990) := ' Grid Table 6 Colorful Accent 4;\lsdpriority52 \lsdlocked0 Grid Table 7 Colorful Accent 4;\lsdpriori';
    wwv_flow_api.g_varchar2_table(991) := 'ty46 \lsdlocked0 Grid Table 1 Light Accent 5;\lsdpriority47 \lsdlocked0 Grid Table 2 Accent 5;'||wwv_flow.LF||
'\lsdp';
    wwv_flow_api.g_varchar2_table(992) := 'riority48 \lsdlocked0 Grid Table 3 Accent 5;\lsdpriority49 \lsdlocked0 Grid Table 4 Accent 5;\lsdpri';
    wwv_flow_api.g_varchar2_table(993) := 'ority50 \lsdlocked0 Grid Table 5 Dark Accent 5;\lsdpriority51 \lsdlocked0 Grid Table 6 Colorful Acce';
    wwv_flow_api.g_varchar2_table(994) := 'nt 5;'||wwv_flow.LF||
'\lsdpriority52 \lsdlocked0 Grid Table 7 Colorful Accent 5;\lsdpriority46 \lsdlocked0 Grid Tabl';
    wwv_flow_api.g_varchar2_table(995) := 'e 1 Light Accent 6;\lsdpriority47 \lsdlocked0 Grid Table 2 Accent 6;\lsdpriority48 \lsdlocked0 Grid ';
    wwv_flow_api.g_varchar2_table(996) := 'Table 3 Accent 6;'||wwv_flow.LF||
'\lsdpriority49 \lsdlocked0 Grid Table 4 Accent 6;\lsdpriority50 \lsdlocked0 Grid T';
    wwv_flow_api.g_varchar2_table(997) := 'able 5 Dark Accent 6;\lsdpriority51 \lsdlocked0 Grid Table 6 Colorful Accent 6;\lsdpriority52 \lsdlo';
    wwv_flow_api.g_varchar2_table(998) := 'cked0 Grid Table 7 Colorful Accent 6;'||wwv_flow.LF||
'\lsdpriority46 \lsdlocked0 List Table 1 Light;\lsdpriority47 \';
    wwv_flow_api.g_varchar2_table(999) := 'lsdlocked0 List Table 2;\lsdpriority48 \lsdlocked0 List Table 3;\lsdpriority49 \lsdlocked0 List Tabl';
    wwv_flow_api.g_varchar2_table(1000) := 'e 4;\lsdpriority50 \lsdlocked0 List Table 5 Dark;'||wwv_flow.LF||
'\lsdpriority51 \lsdlocked0 List Table 6 Colorful;\';
null;
end;
/
begin
    wwv_flow_api.g_varchar2_table(1001) := 'lsdpriority52 \lsdlocked0 List Table 7 Colorful;\lsdpriority46 \lsdlocked0 List Table 1 Light Accent';
    wwv_flow_api.g_varchar2_table(1002) := ' 1;\lsdpriority47 \lsdlocked0 List Table 2 Accent 1;\lsdpriority48 \lsdlocked0 List Table 3 Accent 1';
    wwv_flow_api.g_varchar2_table(1003) := ';'||wwv_flow.LF||
'\lsdpriority49 \lsdlocked0 List Table 4 Accent 1;\lsdpriority50 \lsdlocked0 List Table 5 Dark Acce';
    wwv_flow_api.g_varchar2_table(1004) := 'nt 1;\lsdpriority51 \lsdlocked0 List Table 6 Colorful Accent 1;\lsdpriority52 \lsdlocked0 List Table';
    wwv_flow_api.g_varchar2_table(1005) := ' 7 Colorful Accent 1;'||wwv_flow.LF||
'\lsdpriority46 \lsdlocked0 List Table 1 Light Accent 2;\lsdpriority47 \lsdlock';
    wwv_flow_api.g_varchar2_table(1006) := 'ed0 List Table 2 Accent 2;\lsdpriority48 \lsdlocked0 List Table 3 Accent 2;\lsdpriority49 \lsdlocked';
    wwv_flow_api.g_varchar2_table(1007) := '0 List Table 4 Accent 2;'||wwv_flow.LF||
'\lsdpriority50 \lsdlocked0 List Table 5 Dark Accent 2;\lsdpriority51 \lsdlo';
    wwv_flow_api.g_varchar2_table(1008) := 'cked0 List Table 6 Colorful Accent 2;\lsdpriority52 \lsdlocked0 List Table 7 Colorful Accent 2;\lsdp';
    wwv_flow_api.g_varchar2_table(1009) := 'riority46 \lsdlocked0 List Table 1 Light Accent 3;'||wwv_flow.LF||
'\lsdpriority47 \lsdlocked0 List Table 2 Accent 3;';
    wwv_flow_api.g_varchar2_table(1010) := '\lsdpriority48 \lsdlocked0 List Table 3 Accent 3;\lsdpriority49 \lsdlocked0 List Table 4 Accent 3;\l';
    wwv_flow_api.g_varchar2_table(1011) := 'sdpriority50 \lsdlocked0 List Table 5 Dark Accent 3;'||wwv_flow.LF||
'\lsdpriority51 \lsdlocked0 List Table 6 Colorfu';
    wwv_flow_api.g_varchar2_table(1012) := 'l Accent 3;\lsdpriority52 \lsdlocked0 List Table 7 Colorful Accent 3;\lsdpriority46 \lsdlocked0 List';
    wwv_flow_api.g_varchar2_table(1013) := ' Table 1 Light Accent 4;\lsdpriority47 \lsdlocked0 List Table 2 Accent 4;'||wwv_flow.LF||
'\lsdpriority48 \lsdlocked0';
    wwv_flow_api.g_varchar2_table(1014) := ' List Table 3 Accent 4;\lsdpriority49 \lsdlocked0 List Table 4 Accent 4;\lsdpriority50 \lsdlocked0 L';
    wwv_flow_api.g_varchar2_table(1015) := 'ist Table 5 Dark Accent 4;\lsdpriority51 \lsdlocked0 List Table 6 Colorful Accent 4;'||wwv_flow.LF||
'\lsdpriority52 ';
    wwv_flow_api.g_varchar2_table(1016) := '\lsdlocked0 List Table 7 Colorful Accent 4;\lsdpriority46 \lsdlocked0 List Table 1 Light Accent 5;\l';
    wwv_flow_api.g_varchar2_table(1017) := 'sdpriority47 \lsdlocked0 List Table 2 Accent 5;\lsdpriority48 \lsdlocked0 List Table 3 Accent 5;'||wwv_flow.LF||
'\ls';
    wwv_flow_api.g_varchar2_table(1018) := 'dpriority49 \lsdlocked0 List Table 4 Accent 5;\lsdpriority50 \lsdlocked0 List Table 5 Dark Accent 5;';
    wwv_flow_api.g_varchar2_table(1019) := '\lsdpriority51 \lsdlocked0 List Table 6 Colorful Accent 5;\lsdpriority52 \lsdlocked0 List Table 7 Co';
    wwv_flow_api.g_varchar2_table(1020) := 'lorful Accent 5;'||wwv_flow.LF||
'\lsdpriority46 \lsdlocked0 List Table 1 Light Accent 6;\lsdpriority47 \lsdlocked0 L';
    wwv_flow_api.g_varchar2_table(1021) := 'ist Table 2 Accent 6;\lsdpriority48 \lsdlocked0 List Table 3 Accent 6;\lsdpriority49 \lsdlocked0 Lis';
    wwv_flow_api.g_varchar2_table(1022) := 't Table 4 Accent 6;'||wwv_flow.LF||
'\lsdpriority50 \lsdlocked0 List Table 5 Dark Accent 6;\lsdpriority51 \lsdlocked0';
    wwv_flow_api.g_varchar2_table(1023) := ' List Table 6 Colorful Accent 6;\lsdpriority52 \lsdlocked0 List Table 7 Colorful Accent 6;\lsdsemihi';
    wwv_flow_api.g_varchar2_table(1024) := 'dden1 \lsdunhideused1 \lsdlocked0 Mention;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Smart Hyperli';
    wwv_flow_api.g_varchar2_table(1025) := 'nk;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Hashtag;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 U';
    wwv_flow_api.g_varchar2_table(1026) := 'nresolved Mention;}}{\*\datastore 010500000200000018000000'||wwv_flow.LF||
'4d73786d6c322e534158584d4c5265616465722e3';
    wwv_flow_api.g_varchar2_table(1027) := '62e30000000000000000000000e0000'||wwv_flow.LF||
'd0cf11e0a1b11ae1000000000000000000000000000000003e000300feff09000600';
    wwv_flow_api.g_varchar2_table(1028) := '00000000000000000000010000000100000000000000001000000200000001000000feffffff0000000000000000ffffffff';
    wwv_flow_api.g_varchar2_table(1029) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'fffffffffffffff';
    wwv_flow_api.g_varchar2_table(1030) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1031) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1032) := 'fffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1033) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1034) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'fffffffff';
    wwv_flow_api.g_varchar2_table(1035) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1036) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1037) := 'fffffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'fffffffffffffffffdffffff04000000feffffff05000000feffffff';
    wwv_flow_api.g_varchar2_table(1038) := 'feffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1039) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'fff';
    wwv_flow_api.g_varchar2_table(1040) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1041) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1042) := 'fffffffffffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'ffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1043) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1044) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1045) := 'ff'||wwv_flow.LF||
'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1046) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1047) := 'fffffffffffffffffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'ffffffffffffffffffffffffffffffff52006f006f00';
    wwv_flow_api.g_varchar2_table(1048) := '7400200045006e00740072007900000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1049) := '000000000000000016000500ffffffffffffffff010000000c6ad98892f1d411a65f0040963251e500000000000000000000';
    wwv_flow_api.g_varchar2_table(1050) := '000070b7'||wwv_flow.LF||
'2a7e1076d40103000000c0020000000000004d0073006f004400610074006100530074006f00720065000000000';
    wwv_flow_api.g_varchar2_table(1051) := '00000000000000000000000000000000000000000000000000000000000000000000000001a000101ffffffffffffffff020';
    wwv_flow_api.g_varchar2_table(1052) := '00000000000000000000000000000000000000000000070b72a7e1076d401'||wwv_flow.LF||
'70b72a7e1076d4010000000000000000000000';
    wwv_flow_api.g_varchar2_table(1053) := '00dc00cf004c004b004e0059003500490042004500c6004f00cb00cc00ce00df00c800c300cf00d400c40041003d003d0000';
    wwv_flow_api.g_varchar2_table(1054) := '00000000000000000000000000000032000101ffffffffffffffff0300000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1055) := '0070b72a7e1076'||wwv_flow.LF||
'd40170b72a7e1076d4010000000000000000000000004900740065006d000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1056) := '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a000201fffff';
    wwv_flow_api.g_varchar2_table(1057) := 'fff04000000ffffffff000000000000000000000000000000000000000000000000'||wwv_flow.LF||
'00000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1058) := '320100000000000001000000020000000300000004000000feffffff060000000700000008000000090000000a000000feff';
    wwv_flow_api.g_varchar2_table(1059) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1060) := 'ffffffffffffffffffff'||wwv_flow.LF||
'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1061) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1062) := 'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'ffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1063) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1064) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1065) := 'ffffffffffffffffffffffffff'||wwv_flow.LF||
'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1066) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1067) := 'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'ffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1068) := 'ffffffffffffffffffffffffffffffffffffffffffff3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e67';
    wwv_flow_api.g_varchar2_table(1069) := '3d225554462d3822207374616e64616c6f6e653d226e6f223f3e3c623a536f757263657320786d6c6e733a623d2268747470';
    wwv_flow_api.g_varchar2_table(1070) := '3a2f2f736368656d61732e6f70656e78'||wwv_flow.LF||
'6d6c666f726d6174732e6f72672f6f6666696365446f63756d656e742f323030362';
    wwv_flow_api.g_varchar2_table(1071) := 'f6269626c696f6772617068792220786d6c6e733d22687474703a2f2f736368656d61732e6f70656e786d6c666f726d61747';
    wwv_flow_api.g_varchar2_table(1072) := '32e6f72672f6f6666696365446f63756d656e742f323030362f6269626c696f677261706879222053656c'||wwv_flow.LF||
'65637465645374';
    wwv_flow_api.g_varchar2_table(1073) := '796c653d225c415041536978746845646974696f6e4f66666963654f6e6c696e652e78736c22205374796c654e616d653d22';
    wwv_flow_api.g_varchar2_table(1074) := '415041222056657273696f6e3d2236223e3c2f623a536f75726365733e00000000000000000000000000003c3f786d6c2076';
    wwv_flow_api.g_varchar2_table(1075) := '657273696f6e3d22312e302220656e636f6469'||wwv_flow.LF||
'6e673d225554462d3822207374616e64616c6f6e653d226e6f223f3e0d0a3';
    wwv_flow_api.g_varchar2_table(1076) := 'c64733a6461746173746f72654974656d2064733a6974656d49443d227b33354341463246322d433838372d343930342d384';
    wwv_flow_api.g_varchar2_table(1077) := '541452d4342424641323342463439307d2220786d6c6e733a64733d22687474703a2f2f736368656d61732e6f70'||wwv_flow.LF||
'656e786d';
    wwv_flow_api.g_varchar2_table(1078) := '6c666f726d6174732e6f72672f6f6666696365446f63756d656e742f323030362f637573500072006f007000650072007400';
    wwv_flow_api.g_varchar2_table(1079) := '6900650073000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1080) := '16000200ffffffffffffffffffffffff000000000000'||wwv_flow.LF||
'0000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1081) := '0000005000000550100000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1082) := '00000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000'||wwv_flow.LF||
'00';
    wwv_flow_api.g_varchar2_table(1083) := '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1084) := '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1085) := '0000000000000000000000ffffffffffffffffffffffff0000'||wwv_flow.LF||
'0000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1086) := '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1087) := '0000000000000000000000000000000000000000000000000000000000000000000000000000000fffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(1088) := 'fff'||wwv_flow.LF||
'000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1089) := '746f6d586d6c223e3c64733a736368656d61526566733e3c64733a736368656d615265662064733a7572693d22687474703a';
    wwv_flow_api.g_varchar2_table(1090) := '2f2f736368656d61732e6f70656e786d6c666f726d6174732e6f7267'||wwv_flow.LF||
'2f6f6666696365446f63756d656e742f323030362f6';
    wwv_flow_api.g_varchar2_table(1091) := '269626c696f677261706879222f3e3c2f64733a736368656d61526566733e3c2f64733a6461746173746f72654974656d3e0';
    wwv_flow_api.g_varchar2_table(1092) := '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1093) := '000000000'||wwv_flow.LF||
'000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1094) := '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1095) := '00000000000000000000000000000000000000000000000000000000000000'||wwv_flow.LF||
'0000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1096) := '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1097) := '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1098) := '000000000000000'||wwv_flow.LF||
'000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(1099) := '00000000000000000000000000000105000000000000}}';
wwv_flow_api.create_report_layout(
 p_id=>wwv_flow_api.id(37937545481944646)
,p_report_layout_name=>'pagos_por_banco_fecha'
,p_report_layout_type=>'RTF_FILE'
,p_varchar2_table=>wwv_flow_api.g_varchar2_table
);
end;
/
