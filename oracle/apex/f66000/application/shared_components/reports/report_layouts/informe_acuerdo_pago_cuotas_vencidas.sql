prompt --application/shared_components/reports/report_layouts/informe_acuerdo_pago_cuotas_vencidas
begin
    wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
    wwv_flow_api.g_varchar2_table(1) := '{\rtf1\adeflang1025\ansi\ansicpg1252\uc1\adeff0\deff0\stshfdbch0\stshfloch31506\stshfhich31506\stshf';
    wwv_flow_api.g_varchar2_table(2) := 'bi31506\deflang9226\deflangfe9226\themelang9226\themelangfe0\themelangcs0{\fonttbl{\f0\fbidi \froman';
    wwv_flow_api.g_varchar2_table(3) := '\fcharset0\fprq2{\*\panose 02020603050405020304}Times New Roman{\*\falt Times};}'||wwv_flow.LF||
'{\f1\fbidi \fswiss\';
    wwv_flow_api.g_varchar2_table(4) := 'fcharset0\fprq2{\*\panose 020b0604020202020204}Arial;}{\f34\fbidi \froman\fcharset0\fprq2{\*\panose ';
    wwv_flow_api.g_varchar2_table(5) := '02040503050406030204}Cambria Math;}{\f37\fbidi \fswiss\fcharset0\fprq2{\*\panose 020f050202020403020';
    wwv_flow_api.g_varchar2_table(6) := '4}Calibri;}'||wwv_flow.LF||
'{\f38\fbidi \fswiss\fcharset0\fprq2{\*\panose 020f0302020204030204}Calibri Light;}{\flom';
    wwv_flow_api.g_varchar2_table(7) := 'ajor\f31500\fbidi \froman\fcharset0\fprq2{\*\panose 02020603050405020304}Times New Roman{\*\falt Tim';
    wwv_flow_api.g_varchar2_table(8) := 'es};}'||wwv_flow.LF||
'{\fdbmajor\f31501\fbidi \froman\fcharset0\fprq2{\*\panose 02020603050405020304}Times New Roman';
    wwv_flow_api.g_varchar2_table(9) := '{\*\falt Times};}{\fhimajor\f31502\fbidi \fswiss\fcharset0\fprq2{\*\panose 020f0302020204030204}Cali';
    wwv_flow_api.g_varchar2_table(10) := 'bri Light;}'||wwv_flow.LF||
'{\fbimajor\f31503\fbidi \froman\fcharset0\fprq2{\*\panose 02020603050405020304}Times New';
    wwv_flow_api.g_varchar2_table(11) := ' Roman{\*\falt Times};}{\flominor\f31504\fbidi \froman\fcharset0\fprq2{\*\panose 0202060305040502030';
    wwv_flow_api.g_varchar2_table(12) := '4}Times New Roman{\*\falt Times};}'||wwv_flow.LF||
'{\fdbminor\f31505\fbidi \froman\fcharset0\fprq2{\*\panose 0202060';
    wwv_flow_api.g_varchar2_table(13) := '3050405020304}Times New Roman{\*\falt Times};}{\fhiminor\f31506\fbidi \fswiss\fcharset0\fprq2{\*\pan';
    wwv_flow_api.g_varchar2_table(14) := 'ose 020f0502020204030204}Calibri;}'||wwv_flow.LF||
'{\fbiminor\f31507\fbidi \froman\fcharset0\fprq2{\*\panose 0202060';
    wwv_flow_api.g_varchar2_table(15) := '3050405020304}Times New Roman{\*\falt Times};}{\f44\fbidi \froman\fcharset238\fprq2 Times New Roman ';
    wwv_flow_api.g_varchar2_table(16) := 'CE{\*\falt Times};}'||wwv_flow.LF||
'{\f45\fbidi \froman\fcharset204\fprq2 Times New Roman Cyr{\*\falt Times};}{\f47\';
    wwv_flow_api.g_varchar2_table(17) := 'fbidi \froman\fcharset161\fprq2 Times New Roman Greek{\*\falt Times};}{\f48\fbidi \froman\fcharset16';
    wwv_flow_api.g_varchar2_table(18) := '2\fprq2 Times New Roman Tur{\*\falt Times};}'||wwv_flow.LF||
'{\f49\fbidi \froman\fcharset177\fprq2 Times New Roman (';
    wwv_flow_api.g_varchar2_table(19) := 'Hebrew){\*\falt Times};}{\f50\fbidi \froman\fcharset178\fprq2 Times New Roman (Arabic){\*\falt Times';
    wwv_flow_api.g_varchar2_table(20) := '};}{\f51\fbidi \froman\fcharset186\fprq2 Times New Roman Baltic{\*\falt Times};}'||wwv_flow.LF||
'{\f52\fbidi \froman';
    wwv_flow_api.g_varchar2_table(21) := '\fcharset163\fprq2 Times New Roman (Vietnamese){\*\falt Times};}{\f54\fbidi \fswiss\fcharset238\fprq';
    wwv_flow_api.g_varchar2_table(22) := '2 Arial CE;}{\f55\fbidi \fswiss\fcharset204\fprq2 Arial Cyr;}{\f57\fbidi \fswiss\fcharset161\fprq2 A';
    wwv_flow_api.g_varchar2_table(23) := 'rial Greek;}'||wwv_flow.LF||
'{\f58\fbidi \fswiss\fcharset162\fprq2 Arial Tur;}{\f59\fbidi \fswiss\fcharset177\fprq2 ';
    wwv_flow_api.g_varchar2_table(24) := 'Arial (Hebrew);}{\f60\fbidi \fswiss\fcharset178\fprq2 Arial (Arabic);}{\f61\fbidi \fswiss\fcharset18';
    wwv_flow_api.g_varchar2_table(25) := '6\fprq2 Arial Baltic;}'||wwv_flow.LF||
'{\f62\fbidi \fswiss\fcharset163\fprq2 Arial (Vietnamese);}{\f384\fbidi \froma';
    wwv_flow_api.g_varchar2_table(26) := 'n\fcharset238\fprq2 Cambria Math CE;}{\f385\fbidi \froman\fcharset204\fprq2 Cambria Math Cyr;}{\f387';
    wwv_flow_api.g_varchar2_table(27) := '\fbidi \froman\fcharset161\fprq2 Cambria Math Greek;}'||wwv_flow.LF||
'{\f388\fbidi \froman\fcharset162\fprq2 Cambria';
    wwv_flow_api.g_varchar2_table(28) := ' Math Tur;}{\f391\fbidi \froman\fcharset186\fprq2 Cambria Math Baltic;}{\f392\fbidi \froman\fcharset';
    wwv_flow_api.g_varchar2_table(29) := '163\fprq2 Cambria Math (Vietnamese);}{\f414\fbidi \fswiss\fcharset238\fprq2 Calibri CE;}'||wwv_flow.LF||
'{\f415\fbid';
    wwv_flow_api.g_varchar2_table(30) := 'i \fswiss\fcharset204\fprq2 Calibri Cyr;}{\f417\fbidi \fswiss\fcharset161\fprq2 Calibri Greek;}{\f41';
    wwv_flow_api.g_varchar2_table(31) := '8\fbidi \fswiss\fcharset162\fprq2 Calibri Tur;}{\f419\fbidi \fswiss\fcharset177\fprq2 Calibri (Hebre';
    wwv_flow_api.g_varchar2_table(32) := 'w);}'||wwv_flow.LF||
'{\f420\fbidi \fswiss\fcharset178\fprq2 Calibri (Arabic);}{\f421\fbidi \fswiss\fcharset186\fprq2';
    wwv_flow_api.g_varchar2_table(33) := ' Calibri Baltic;}{\f422\fbidi \fswiss\fcharset163\fprq2 Calibri (Vietnamese);}{\f424\fbidi \fswiss\f';
    wwv_flow_api.g_varchar2_table(34) := 'charset238\fprq2 Calibri Light CE;}'||wwv_flow.LF||
'{\f425\fbidi \fswiss\fcharset204\fprq2 Calibri Light Cyr;}{\f427';
    wwv_flow_api.g_varchar2_table(35) := '\fbidi \fswiss\fcharset161\fprq2 Calibri Light Greek;}{\f428\fbidi \fswiss\fcharset162\fprq2 Calibri';
    wwv_flow_api.g_varchar2_table(36) := ' Light Tur;}{\f429\fbidi \fswiss\fcharset177\fprq2 Calibri Light (Hebrew);}'||wwv_flow.LF||
'{\f430\fbidi \fswiss\fch';
    wwv_flow_api.g_varchar2_table(37) := 'arset178\fprq2 Calibri Light (Arabic);}{\f431\fbidi \fswiss\fcharset186\fprq2 Calibri Light Baltic;}';
    wwv_flow_api.g_varchar2_table(38) := '{\f432\fbidi \fswiss\fcharset163\fprq2 Calibri Light (Vietnamese);}'||wwv_flow.LF||
'{\flomajor\f31508\fbidi \froman\';
    wwv_flow_api.g_varchar2_table(39) := 'fcharset238\fprq2 Times New Roman CE{\*\falt Times};}{\flomajor\f31509\fbidi \froman\fcharset204\fpr';
    wwv_flow_api.g_varchar2_table(40) := 'q2 Times New Roman Cyr{\*\falt Times};}'||wwv_flow.LF||
'{\flomajor\f31511\fbidi \froman\fcharset161\fprq2 Times New ';
    wwv_flow_api.g_varchar2_table(41) := 'Roman Greek{\*\falt Times};}{\flomajor\f31512\fbidi \froman\fcharset162\fprq2 Times New Roman Tur{\*';
    wwv_flow_api.g_varchar2_table(42) := '\falt Times};}'||wwv_flow.LF||
'{\flomajor\f31513\fbidi \froman\fcharset177\fprq2 Times New Roman (Hebrew){\*\falt Ti';
    wwv_flow_api.g_varchar2_table(43) := 'mes};}{\flomajor\f31514\fbidi \froman\fcharset178\fprq2 Times New Roman (Arabic){\*\falt Times};}'||wwv_flow.LF||
'{\';
    wwv_flow_api.g_varchar2_table(44) := 'flomajor\f31515\fbidi \froman\fcharset186\fprq2 Times New Roman Baltic{\*\falt Times};}{\flomajor\f3';
    wwv_flow_api.g_varchar2_table(45) := '1516\fbidi \froman\fcharset163\fprq2 Times New Roman (Vietnamese){\*\falt Times};}'||wwv_flow.LF||
'{\fdbmajor\f31518';
    wwv_flow_api.g_varchar2_table(46) := '\fbidi \froman\fcharset238\fprq2 Times New Roman CE{\*\falt Times};}{\fdbmajor\f31519\fbidi \froman\';
    wwv_flow_api.g_varchar2_table(47) := 'fcharset204\fprq2 Times New Roman Cyr{\*\falt Times};}'||wwv_flow.LF||
'{\fdbmajor\f31521\fbidi \froman\fcharset161\f';
    wwv_flow_api.g_varchar2_table(48) := 'prq2 Times New Roman Greek{\*\falt Times};}{\fdbmajor\f31522\fbidi \froman\fcharset162\fprq2 Times N';
    wwv_flow_api.g_varchar2_table(49) := 'ew Roman Tur{\*\falt Times};}'||wwv_flow.LF||
'{\fdbmajor\f31523\fbidi \froman\fcharset177\fprq2 Times New Roman (Heb';
    wwv_flow_api.g_varchar2_table(50) := 'rew){\*\falt Times};}{\fdbmajor\f31524\fbidi \froman\fcharset178\fprq2 Times New Roman (Arabic){\*\f';
    wwv_flow_api.g_varchar2_table(51) := 'alt Times};}'||wwv_flow.LF||
'{\fdbmajor\f31525\fbidi \froman\fcharset186\fprq2 Times New Roman Baltic{\*\falt Times}';
    wwv_flow_api.g_varchar2_table(52) := ';}{\fdbmajor\f31526\fbidi \froman\fcharset163\fprq2 Times New Roman (Vietnamese){\*\falt Times};}{\f';
    wwv_flow_api.g_varchar2_table(53) := 'himajor\f31528\fbidi \fswiss\fcharset238\fprq2 Calibri Light CE;}'||wwv_flow.LF||
'{\fhimajor\f31529\fbidi \fswiss\fc';
    wwv_flow_api.g_varchar2_table(54) := 'harset204\fprq2 Calibri Light Cyr;}{\fhimajor\f31531\fbidi \fswiss\fcharset161\fprq2 Calibri Light G';
    wwv_flow_api.g_varchar2_table(55) := 'reek;}{\fhimajor\f31532\fbidi \fswiss\fcharset162\fprq2 Calibri Light Tur;}'||wwv_flow.LF||
'{\fhimajor\f31533\fbidi ';
    wwv_flow_api.g_varchar2_table(56) := '\fswiss\fcharset177\fprq2 Calibri Light (Hebrew);}{\fhimajor\f31534\fbidi \fswiss\fcharset178\fprq2 ';
    wwv_flow_api.g_varchar2_table(57) := 'Calibri Light (Arabic);}{\fhimajor\f31535\fbidi \fswiss\fcharset186\fprq2 Calibri Light Baltic;}'||wwv_flow.LF||
'{\f';
    wwv_flow_api.g_varchar2_table(58) := 'himajor\f31536\fbidi \fswiss\fcharset163\fprq2 Calibri Light (Vietnamese);}{\fbimajor\f31538\fbidi \';
    wwv_flow_api.g_varchar2_table(59) := 'froman\fcharset238\fprq2 Times New Roman CE{\*\falt Times};}{\fbimajor\f31539\fbidi \froman\fcharset';
    wwv_flow_api.g_varchar2_table(60) := '204\fprq2 Times New Roman Cyr{\*\falt Times};}'||wwv_flow.LF||
'{\fbimajor\f31541\fbidi \froman\fcharset161\fprq2 Tim';
    wwv_flow_api.g_varchar2_table(61) := 'es New Roman Greek{\*\falt Times};}{\fbimajor\f31542\fbidi \froman\fcharset162\fprq2 Times New Roman';
    wwv_flow_api.g_varchar2_table(62) := ' Tur{\*\falt Times};}'||wwv_flow.LF||
'{\fbimajor\f31543\fbidi \froman\fcharset177\fprq2 Times New Roman (Hebrew){\*\';
    wwv_flow_api.g_varchar2_table(63) := 'falt Times};}{\fbimajor\f31544\fbidi \froman\fcharset178\fprq2 Times New Roman (Arabic){\*\falt Time';
    wwv_flow_api.g_varchar2_table(64) := 's};}'||wwv_flow.LF||
'{\fbimajor\f31545\fbidi \froman\fcharset186\fprq2 Times New Roman Baltic{\*\falt Times};}{\fbim';
    wwv_flow_api.g_varchar2_table(65) := 'ajor\f31546\fbidi \froman\fcharset163\fprq2 Times New Roman (Vietnamese){\*\falt Times};}'||wwv_flow.LF||
'{\flominor';
    wwv_flow_api.g_varchar2_table(66) := '\f31548\fbidi \froman\fcharset238\fprq2 Times New Roman CE{\*\falt Times};}{\flominor\f31549\fbidi \';
    wwv_flow_api.g_varchar2_table(67) := 'froman\fcharset204\fprq2 Times New Roman Cyr{\*\falt Times};}'||wwv_flow.LF||
'{\flominor\f31551\fbidi \froman\fchars';
    wwv_flow_api.g_varchar2_table(68) := 'et161\fprq2 Times New Roman Greek{\*\falt Times};}{\flominor\f31552\fbidi \froman\fcharset162\fprq2 ';
    wwv_flow_api.g_varchar2_table(69) := 'Times New Roman Tur{\*\falt Times};}'||wwv_flow.LF||
'{\flominor\f31553\fbidi \froman\fcharset177\fprq2 Times New Rom';
    wwv_flow_api.g_varchar2_table(70) := 'an (Hebrew){\*\falt Times};}{\flominor\f31554\fbidi \froman\fcharset178\fprq2 Times New Roman (Arabi';
    wwv_flow_api.g_varchar2_table(71) := 'c){\*\falt Times};}'||wwv_flow.LF||
'{\flominor\f31555\fbidi \froman\fcharset186\fprq2 Times New Roman Baltic{\*\falt';
    wwv_flow_api.g_varchar2_table(72) := ' Times};}{\flominor\f31556\fbidi \froman\fcharset163\fprq2 Times New Roman (Vietnamese){\*\falt Time';
    wwv_flow_api.g_varchar2_table(73) := 's};}'||wwv_flow.LF||
'{\fdbminor\f31558\fbidi \froman\fcharset238\fprq2 Times New Roman CE{\*\falt Times};}{\fdbminor';
    wwv_flow_api.g_varchar2_table(74) := '\f31559\fbidi \froman\fcharset204\fprq2 Times New Roman Cyr{\*\falt Times};}'||wwv_flow.LF||
'{\fdbminor\f31561\fbidi';
    wwv_flow_api.g_varchar2_table(75) := ' \froman\fcharset161\fprq2 Times New Roman Greek{\*\falt Times};}{\fdbminor\f31562\fbidi \froman\fch';
    wwv_flow_api.g_varchar2_table(76) := 'arset162\fprq2 Times New Roman Tur{\*\falt Times};}'||wwv_flow.LF||
'{\fdbminor\f31563\fbidi \froman\fcharset177\fprq';
    wwv_flow_api.g_varchar2_table(77) := '2 Times New Roman (Hebrew){\*\falt Times};}{\fdbminor\f31564\fbidi \froman\fcharset178\fprq2 Times N';
    wwv_flow_api.g_varchar2_table(78) := 'ew Roman (Arabic){\*\falt Times};}'||wwv_flow.LF||
'{\fdbminor\f31565\fbidi \froman\fcharset186\fprq2 Times New Roman';
    wwv_flow_api.g_varchar2_table(79) := ' Baltic{\*\falt Times};}{\fdbminor\f31566\fbidi \froman\fcharset163\fprq2 Times New Roman (Vietnames';
    wwv_flow_api.g_varchar2_table(80) := 'e){\*\falt Times};}{\fhiminor\f31568\fbidi \fswiss\fcharset238\fprq2 Calibri CE;}'||wwv_flow.LF||
'{\fhiminor\f31569\';
    wwv_flow_api.g_varchar2_table(81) := 'fbidi \fswiss\fcharset204\fprq2 Calibri Cyr;}{\fhiminor\f31571\fbidi \fswiss\fcharset161\fprq2 Calib';
    wwv_flow_api.g_varchar2_table(82) := 'ri Greek;}{\fhiminor\f31572\fbidi \fswiss\fcharset162\fprq2 Calibri Tur;}'||wwv_flow.LF||
'{\fhiminor\f31573\fbidi \f';
    wwv_flow_api.g_varchar2_table(83) := 'swiss\fcharset177\fprq2 Calibri (Hebrew);}{\fhiminor\f31574\fbidi \fswiss\fcharset178\fprq2 Calibri ';
    wwv_flow_api.g_varchar2_table(84) := '(Arabic);}{\fhiminor\f31575\fbidi \fswiss\fcharset186\fprq2 Calibri Baltic;}'||wwv_flow.LF||
'{\fhiminor\f31576\fbidi';
    wwv_flow_api.g_varchar2_table(85) := ' \fswiss\fcharset163\fprq2 Calibri (Vietnamese);}{\fbiminor\f31578\fbidi \froman\fcharset238\fprq2 T';
    wwv_flow_api.g_varchar2_table(86) := 'imes New Roman CE{\*\falt Times};}{\fbiminor\f31579\fbidi \froman\fcharset204\fprq2 Times New Roman ';
    wwv_flow_api.g_varchar2_table(87) := 'Cyr{\*\falt Times};}'||wwv_flow.LF||
'{\fbiminor\f31581\fbidi \froman\fcharset161\fprq2 Times New Roman Greek{\*\falt';
    wwv_flow_api.g_varchar2_table(88) := ' Times};}{\fbiminor\f31582\fbidi \froman\fcharset162\fprq2 Times New Roman Tur{\*\falt Times};}'||wwv_flow.LF||
'{\fb';
    wwv_flow_api.g_varchar2_table(89) := 'iminor\f31583\fbidi \froman\fcharset177\fprq2 Times New Roman (Hebrew){\*\falt Times};}{\fbiminor\f3';
    wwv_flow_api.g_varchar2_table(90) := '1584\fbidi \froman\fcharset178\fprq2 Times New Roman (Arabic){\*\falt Times};}'||wwv_flow.LF||
'{\fbiminor\f31585\fbi';
    wwv_flow_api.g_varchar2_table(91) := 'di \froman\fcharset186\fprq2 Times New Roman Baltic{\*\falt Times};}{\fbiminor\f31586\fbidi \froman\';
    wwv_flow_api.g_varchar2_table(92) := 'fcharset163\fprq2 Times New Roman (Vietnamese){\*\falt Times};}}{\colortbl;\red0\green0\blue0;\red0\';
    wwv_flow_api.g_varchar2_table(93) := 'green0\blue255;'||wwv_flow.LF||
'\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\bl';
    wwv_flow_api.g_varchar2_table(94) := 'ue0;\red255\green255\blue0;\red255\green255\blue255;\red0\green0\blue128;\red0\green128\blue128;\red';
    wwv_flow_api.g_varchar2_table(95) := '0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;'||wwv_flow.LF||
'\red128\green128\blue0;\red128\green12';
    wwv_flow_api.g_varchar2_table(96) := '8\blue128;\red192\green192\blue192;\red0\green0\blue0;\red0\green0\blue0;\caccentone\ctint255\cshade';
    wwv_flow_api.g_varchar2_table(97) := '191\red47\green84\blue150;\red68\green68\blue68;\red231\green243\blue253;'||wwv_flow.LF||
'\caccentfive\ctint153\csha';
    wwv_flow_api.g_varchar2_table(98) := 'de255\red156\green194\blue229;\cbackgroundone\ctint255\cshade255\red255\green255\blue255;\red0\green';
    wwv_flow_api.g_varchar2_table(99) := '32\blue96;}{\*\defchp \f31506\fs22\lang9226\langfe1033\langfenp1033 }{\*\defpap \ql \li0\ri0\sa160\s';
    wwv_flow_api.g_varchar2_table(100) := 'l259\slmult1'||wwv_flow.LF||
'\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 }\noqfpromote';
    wwv_flow_api.g_varchar2_table(101) := ' {\stylesheet{\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustri';
    wwv_flow_api.g_varchar2_table(102) := 'ght\rin0\lin0\itap0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\f31506\fs22\lang9226\langfe1033\c';
    wwv_flow_api.g_varchar2_table(103) := 'grid\langnp9226\langfenp1033 \snext0 \sqformat \spriority0 \styrsid9701167 Normal;}{\s1\qc \li0\ri0\';
    wwv_flow_api.g_varchar2_table(104) := 'sl480\slmult1\widctlpar\wrapdefault\faauto\outlinelevel0\rin0\lin0\itap0 \rtlch\fcs1 \ab\af0\afs24\a';
    wwv_flow_api.g_varchar2_table(105) := 'lang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\b\f31506\fs24\lang3082\langfe1033\cgrid\langnp3082\langfenp1033 \sbasedon0 \s';
    wwv_flow_api.g_varchar2_table(106) := 'next0 \sautoupd \slink15 \sqformat \spriority9 \styrsid7668035 heading 1;}{\s2\ql \li0\ri0\sb40\sl25';
    wwv_flow_api.g_varchar2_table(107) := '9\slmult1'||wwv_flow.LF||
'\keep\keepn\widctlpar\wrapdefault\aspalpha\aspnum\faauto\outlinelevel1\adjustright\rin0\li';
    wwv_flow_api.g_varchar2_table(108) := 'n0\itap0 \rtlch\fcs1 \af0\afs26\alang1025 \ltrch\fcs0 \fs26\cf19\lang9226\langfe1033\loch\f31502\hic';
    wwv_flow_api.g_varchar2_table(109) := 'h\af31502\dbch\af31501\cgrid\langnp9226\langfenp1033 '||wwv_flow.LF||
'\sbasedon0 \snext0 \slink16 \sunhideused \sqfo';
    wwv_flow_api.g_varchar2_table(110) := 'rmat \spriority9 \styrsid1597860 heading 2;}{\*\cs10 \additive \ssemihidden \sunhideused \spriority1';
    wwv_flow_api.g_varchar2_table(111) := ' Default Paragraph Font;}{\*'||wwv_flow.LF||
'\ts11\tsrowd\trftsWidthB3\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trp';
    wwv_flow_api.g_varchar2_table(112) := 'addfb3\trpaddfr3\tblind0\tblindtype3\tsvertalt\tsbrdrt\tsbrdrl\tsbrdrb\tsbrdrr\tsbrdrdgl\tsbrdrdgr\t';
    wwv_flow_api.g_varchar2_table(113) := 'sbrdrh\tsbrdrv \ql \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjust';
    wwv_flow_api.g_varchar2_table(114) := 'right\rin0\lin0\itap0 \rtlch\fcs1 \af31506\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1';
    wwv_flow_api.g_varchar2_table(115) := '033\cgrid\langnp9226\langfenp1033 \snext11 \ssemihidden \sunhideused Normal Table;}{\*\cs15 \additiv';
    wwv_flow_api.g_varchar2_table(116) := 'e '||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \b\fs24\lang3082\langfe0\langnp3082\langfenp0 \sbasedon10 \slink1 \s';
    wwv_flow_api.g_varchar2_table(117) := 'locked \spriority9 \styrsid7668035 T\''edtulo 1 Car;}{\*\cs16 \additive \rtlch\fcs1 \af0\afs26 \ltrch';
    wwv_flow_api.g_varchar2_table(118) := '\fcs0 \fs26\cf19\loch\f31502\hich\af31502\dbch\af31501 '||wwv_flow.LF||
'\sbasedon10 \slink2 \slocked \spriority9 \st';
    wwv_flow_api.g_varchar2_table(119) := 'yrsid1597860 T\''edtulo 2 Car;}{\*\ts17\tsrowd\trbrdrt\brdrs\brdrw10 \trbrdrl\brdrs\brdrw10 \trbrdrb\';
    wwv_flow_api.g_varchar2_table(120) := 'brdrs\brdrw10 \trbrdrr\brdrs\brdrw10 \trbrdrh\brdrs\brdrw10 \trbrdrv\brdrs\brdrw10 '||wwv_flow.LF||
'\trftsWidthB3\tr';
    wwv_flow_api.g_varchar2_table(121) := 'paddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblind0\tblindtype3\tsvertalt\tsbrdrt\ts';
    wwv_flow_api.g_varchar2_table(122) := 'brdrl\tsbrdrb\tsbrdrr\tsbrdrdgl\tsbrdrdgr\tsbrdrh\tsbrdrv '||wwv_flow.LF||
'\ql \li0\ri0\widctlpar\wrapdefault\aspalp';
    wwv_flow_api.g_varchar2_table(123) := 'ha\aspnum\faauto\adjustright\rin0\lin0\itap0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs';
    wwv_flow_api.g_varchar2_table(124) := '22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 \sbasedon11 \snext17 \spriority39 \styrsid55842';
    wwv_flow_api.g_varchar2_table(125) := '23 '||wwv_flow.LF||
'Table Grid;}{\s18\ql \li0\ri0\widctlpar\tqc\tx4419\tqr\tx8838\wrapdefault\aspalpha\aspnum\faauto';
    wwv_flow_api.g_varchar2_table(126) := '\adjustright\rin0\lin0\itap0 \rtlch\fcs1 \af0\afs20\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\fs20\lang9226\langfe1033';
    wwv_flow_api.g_varchar2_table(127) := '\loch\f31506\hich\af31506\dbch\af31505\cgrid\langnp9226\langfenp1033 \sbasedon0 \snext18 \slink19 \s';
    wwv_flow_api.g_varchar2_table(128) := 'unhideused \styrsid5255267 header;}{\*\cs19 \additive \rtlch\fcs1 \af0\afs20 \ltrch\fcs0 \fs20\dbch\';
    wwv_flow_api.g_varchar2_table(129) := 'af31505 '||wwv_flow.LF||
'\sbasedon10 \slink18 \slocked \styrsid5255267 Encabezado Car;}{\s20\ql \li0\ri0\widctlpar\t';
    wwv_flow_api.g_varchar2_table(130) := 'qc\tx4419\tqr\tx8838\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \rtlch\fcs1 \af0';
    wwv_flow_api.g_varchar2_table(131) := '\afs22\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 \sbased';
    wwv_flow_api.g_varchar2_table(132) := 'on0 \snext20 \slink21 \sunhideused \styrsid5255267 footer;}{\*\cs21 \additive \rtlch\fcs1 \af0 \ltrc';
    wwv_flow_api.g_varchar2_table(133) := 'h\fcs0 \sbasedon10 \slink20 \slocked \styrsid5255267 Pie de p\''e1gina Car;}}'||wwv_flow.LF||
'{\*\listtable{\list\lis';
    wwv_flow_api.g_varchar2_table(134) := 'ttemplateid1157423738\listhybrid{\listlevel\levelnfc0\levelnfcn0\leveljc0\leveljcn0\levelfollow0\lev';
    wwv_flow_api.g_varchar2_table(135) := 'elstartat1\levelspace0\levelindent0{\leveltext\leveltemplateid1965561178\''02\''00.;}{\levelnumbers\''0';
    wwv_flow_api.g_varchar2_table(136) := '1;}\rtlch\fcs1 \af0 \ltrch\fcs0 '||wwv_flow.LF||
'\fi-360\li720\lin720 }{\listlevel\levelnfc4\levelnfcn4\leveljc0\lev';
    wwv_flow_api.g_varchar2_table(137) := 'eljcn0\levelfollow0\levelstartat1\lvltentative\levelspace0\levelindent0{\leveltext\leveltemplateid60';
    wwv_flow_api.g_varchar2_table(138) := '4635161\''02\''01.;}{\levelnumbers\''01;}\rtlch\fcs1 \af0 \ltrch\fcs0 '||wwv_flow.LF||
'\fi-360\li1440\lin1440 }{\listle';
    wwv_flow_api.g_varchar2_table(139) := 'vel\levelnfc2\levelnfcn2\leveljc2\leveljcn2\levelfollow0\levelstartat1\lvltentative\levelspace0\leve';
    wwv_flow_api.g_varchar2_table(140) := 'lindent0{\leveltext\leveltemplateid604635163\''02\''02.;}{\levelnumbers\''01;}\rtlch\fcs1 \af0 \ltrch\f';
    wwv_flow_api.g_varchar2_table(141) := 'cs0 '||wwv_flow.LF||
'\fi-180\li2160\lin2160 }{\listlevel\levelnfc0\levelnfcn0\leveljc0\leveljcn0\levelfollow0\levels';
    wwv_flow_api.g_varchar2_table(142) := 'tartat1\lvltentative\levelspace0\levelindent0{\leveltext\leveltemplateid604635151\''02\''03.;}{\leveln';
    wwv_flow_api.g_varchar2_table(143) := 'umbers\''01;}\rtlch\fcs1 \af0 \ltrch\fcs0 '||wwv_flow.LF||
'\fi-360\li2880\lin2880 }{\listlevel\levelnfc4\levelnfcn4\l';
    wwv_flow_api.g_varchar2_table(144) := 'eveljc0\leveljcn0\levelfollow0\levelstartat1\lvltentative\levelspace0\levelindent0{\leveltext\levelt';
    wwv_flow_api.g_varchar2_table(145) := 'emplateid604635161\''02\''04.;}{\levelnumbers\''01;}\rtlch\fcs1 \af0 \ltrch\fcs0 '||wwv_flow.LF||
'\fi-360\li3600\lin360';
    wwv_flow_api.g_varchar2_table(146) := '0 }{\listlevel\levelnfc2\levelnfcn2\leveljc2\leveljcn2\levelfollow0\levelstartat1\lvltentative\level';
    wwv_flow_api.g_varchar2_table(147) := 'space0\levelindent0{\leveltext\leveltemplateid604635163\''02\''05.;}{\levelnumbers\''01;}\rtlch\fcs1 \a';
    wwv_flow_api.g_varchar2_table(148) := 'f0 \ltrch\fcs0 '||wwv_flow.LF||
'\fi-180\li4320\lin4320 }{\listlevel\levelnfc0\levelnfcn0\leveljc0\leveljcn0\levelfol';
    wwv_flow_api.g_varchar2_table(149) := 'low0\levelstartat1\lvltentative\levelspace0\levelindent0{\leveltext\leveltemplateid604635151\''02\''06';
    wwv_flow_api.g_varchar2_table(150) := '.;}{\levelnumbers\''01;}\rtlch\fcs1 \af0 \ltrch\fcs0 '||wwv_flow.LF||
'\fi-360\li5040\lin5040 }{\listlevel\levelnfc4\l';
    wwv_flow_api.g_varchar2_table(151) := 'evelnfcn4\leveljc0\leveljcn0\levelfollow0\levelstartat1\lvltentative\levelspace0\levelindent0{\level';
    wwv_flow_api.g_varchar2_table(152) := 'text\leveltemplateid604635161\''02\''07.;}{\levelnumbers\''01;}\rtlch\fcs1 \af0 \ltrch\fcs0 '||wwv_flow.LF||
'\fi-360\li';
    wwv_flow_api.g_varchar2_table(153) := '5760\lin5760 }{\listlevel\levelnfc2\levelnfcn2\leveljc2\leveljcn2\levelfollow0\levelstartat1\lvltent';
    wwv_flow_api.g_varchar2_table(154) := 'ative\levelspace0\levelindent0{\leveltext\leveltemplateid604635163\''02\''08.;}{\levelnumbers\''01;}\rt';
    wwv_flow_api.g_varchar2_table(155) := 'lch\fcs1 \af0 \ltrch\fcs0 '||wwv_flow.LF||
'\fi-180\li6480\lin6480 }{\listname ;}\listid807669578}}{\*\listoverrideta';
    wwv_flow_api.g_varchar2_table(156) := 'ble{\listoverride\listid807669578\listoverridecount0\ls1}}{\*\rsidtbl \rsid400223\rsid491236\rsid524';
    wwv_flow_api.g_varchar2_table(157) := '589\rsid549439\rsid876571\rsid1008570\rsid1013515\rsid1269636\rsid1312448'||wwv_flow.LF||
'\rsid1597860\rsid1641819\r';
    wwv_flow_api.g_varchar2_table(158) := 'sid1652526\rsid1712114\rsid1900840\rsid1923854\rsid2051713\rsid2307888\rsid2363493\rsid2495807\rsid2';
    wwv_flow_api.g_varchar2_table(159) := '642439\rsid2824873\rsid2840351\rsid2893860\rsid2965459\rsid3285288\rsid3349445\rsid3627754\rsid38668';
    wwv_flow_api.g_varchar2_table(160) := '69\rsid3867104\rsid3898672'||wwv_flow.LF||
'\rsid4129472\rsid4353357\rsid4413377\rsid4737841\rsid5255267\rsid5337505\';
    wwv_flow_api.g_varchar2_table(161) := 'rsid5395150\rsid5450001\rsid5584223\rsid5598115\rsid5660657\rsid5844976\rsid6426580\rsid6515214\rsid';
    wwv_flow_api.g_varchar2_table(162) := '6555525\rsid6648602\rsid6757021\rsid6896358\rsid6977746\rsid7039538\rsid7153754'||wwv_flow.LF||
'\rsid7352105\rsid740';
    wwv_flow_api.g_varchar2_table(163) := '6157\rsid7427375\rsid7549383\rsid7668035\rsid7754578\rsid7799087\rsid7881758\rsid8065154\rsid8069346';
    wwv_flow_api.g_varchar2_table(164) := '\rsid8259926\rsid8346779\rsid8353295\rsid8404187\rsid8411402\rsid8456252\rsid8463086\rsid8536278\rsi';
    wwv_flow_api.g_varchar2_table(165) := 'd8538935\rsid8678022\rsid8743188'||wwv_flow.LF||
'\rsid8853441\rsid8878196\rsid8981075\rsid9000762\rsid9183075\rsid94';
    wwv_flow_api.g_varchar2_table(166) := '69739\rsid9508238\rsid9576758\rsid9641864\rsid9701167\rsid9727823\rsid9852003\rsid9992874\rsid100374';
    wwv_flow_api.g_varchar2_table(167) := '74\rsid10056378\rsid10159452\rsid10167836\rsid10248090\rsid10290435\rsid10370145'||wwv_flow.LF||
'\rsid10428498\rsid1';
    wwv_flow_api.g_varchar2_table(168) := '0492064\rsid10571159\rsid10826415\rsid11022588\rsid11142185\rsid11289308\rsid11421646\rsid11746086\r';
    wwv_flow_api.g_varchar2_table(169) := 'sid11879702\rsid11941190\rsid12213133\rsid12339025\rsid12344137\rsid12395934\rsid12483528\rsid127833';
    wwv_flow_api.g_varchar2_table(170) := '64\rsid12919107\rsid12976427'||wwv_flow.LF||
'\rsid13059501\rsid13203660\rsid13327416\rsid13333637\rsid13381093\rsid1';
    wwv_flow_api.g_varchar2_table(171) := '3449544\rsid13772618\rsid13967392\rsid14055924\rsid14158079\rsid14316622\rsid14356770\rsid14368541\r';
    wwv_flow_api.g_varchar2_table(172) := 'sid14438673\rsid14500887\rsid14686561\rsid15036574\rsid15073655\rsid15214887'||wwv_flow.LF||
'\rsid15285408\rsid15359';
    wwv_flow_api.g_varchar2_table(173) := '579\rsid15409893\rsid15623596\rsid15877303\rsid16192610\rsid16391739\rsid16476144\rsid16542540\rsid1';
    wwv_flow_api.g_varchar2_table(174) := '6647866}{\mmathPr\mmathFont34\mbrkBin0\mbrkBinSub0\msmallFrac0\mdispDef1\mlMargin0\mrMargin0\mdefJc1';
    wwv_flow_api.g_varchar2_table(175) := '\mwrapIndent1440\mintLim0'||wwv_flow.LF||
'\mnaryLim1}{\info{\author Shirley Romero Martinez}{\operator Javier Lujan}';
    wwv_flow_api.g_varchar2_table(176) := '{\creatim\yr2021\mo3\dy31\hr10\min48}{\revtim\yr2022\mo2\dy5\hr8\min47}{\version18}{\edmins73}{\nofp';
    wwv_flow_api.g_varchar2_table(177) := 'ages1}{\nofwords119}{\nofchars659}{\nofcharsws777}{\vern41}}'||wwv_flow.LF||
'{\*\xmlnstbl {\xmlns1 http://schemas.mi';
    wwv_flow_api.g_varchar2_table(178) := 'crosoft.com/office/word/2003/wordml}}\paperw12240\paperh15840\margl1701\margr1276\margt1134\margb113';
    wwv_flow_api.g_varchar2_table(179) := '4\gutter0\ltrsect '||wwv_flow.LF||
'\deftab708\widowctrl\ftnbj\aenddoc\hyphhotz425\trackmoves0\trackformatting1\donot';
    wwv_flow_api.g_varchar2_table(180) := 'embedsysfont1\relyonvml0\donotembedlingdata0\grfdocevents0\validatexml1\showplaceholdtext0\ignoremix';
    wwv_flow_api.g_varchar2_table(181) := 'edcontent0\saveinvalidxml0'||wwv_flow.LF||
'\showxmlerrors1\noxlattoyen\expshrtn\noultrlspc\dntblnsbdb\nospaceforul\f';
    wwv_flow_api.g_varchar2_table(182) := 'ormshade\horzdoc\dgmargin\dghspace180\dgvspace180\dghorigin1701\dgvorigin1134\dghshow1\dgvshow1'||wwv_flow.LF||
'\jex';
    wwv_flow_api.g_varchar2_table(183) := 'pand\viewkind1\viewscale100\pgbrdrhead\pgbrdrfoot\splytwnine\ftnlytwnine\htmautsp\nolnhtadjtbl\uselt';
    wwv_flow_api.g_varchar2_table(184) := 'baln\alntblind\lytcalctblwd\lyttblrtgr\lnbrkrule\nobrkwrptbl\snaptogridincell\allowfieldendsel\wrppu';
    wwv_flow_api.g_varchar2_table(185) := 'nct'||wwv_flow.LF||
'\asianbrkrule\rsidroot8456252\newtblstyruls\nogrowautofit\usenormstyforlist\noindnmbrts\felnbrel';
    wwv_flow_api.g_varchar2_table(186) := 'ev\nocxsptable\indrlsweleven\noafcnsttbl\afelev\utinl\hwelev\spltpgpar\notcvasp\notbrkcnstfrctbl\not';
    wwv_flow_api.g_varchar2_table(187) := 'vatxbx\krnprsnet\cachedcolbal \nouicompat \fet0'||wwv_flow.LF||
'{\*\wgrffmtfilter 2450}\nofeaturethrottle1\ilfomacat';
    wwv_flow_api.g_varchar2_table(188) := 'clnup0{\*\docvar {xdo0001}{PD9OTUJSRV9DTE5URT8+}}{\*\docvar {xdo0002}{PD9TTEdBTj8+}}{\*\docvar {xdo0';
    wwv_flow_api.g_varchar2_table(189) := '003}{PD9JTVBTVE9fU0JNUFNUTz8+}}{\*\docvar {xdo0004}{PD9OTUJSRV9SUFJURT8+}}'||wwv_flow.LF||
'{\*\docvar {xdo0005}{PD9V';
    wwv_flow_api.g_varchar2_table(190) := 'U1VBUklPPz4=}}{\*\docvar {xdo0006}{PD9IT1k/Pg==}}{\*\docvar {xdo0007}{PD9JUEFERFI/Pg==}}{\*\docvar {';
    wwv_flow_api.g_varchar2_table(191) := 'xdo0008}{PD9mb3ItZWFjaDpST1dTRVQyX1JPVz8+PD9zb3J0OklETlRGQ0NJT05fU0pUTzsnYXNjZW5kaW5nJztkYXRhLXR5cGU';
    wwv_flow_api.g_varchar2_table(192) := '9J3RleHQnPz4=}}'||wwv_flow.LF||
'{\*\docvar {xdo0009}{PD9JRE5URkNDSU9OX1NKVE8/Pg==}}{\*\docvar {xdo0010}{PD9OTVJPX0NO';
    wwv_flow_api.g_varchar2_table(193) := 'Vk5JTz8+}}{\*\docvar {xdo0011}{PD9OTVJPX0NUQV9WTkNEQVM/Pg==}}{\*\docvar {xdo0012}{PD9UVEFMX0NQVEFMX0';
    wwv_flow_api.g_varchar2_table(194) := 'FQPz4=}}{\*\docvar {xdo0013}{PD9UVEFMX0lOVFJFU19BUD8+}}'||wwv_flow.LF||
'{\*\docvar {xdo0014}{PD9UVEFMX0FQPz4=}}{\*\d';
    wwv_flow_api.g_varchar2_table(195) := 'ocvar {xdo0015}{PD9lbmQgZm9yLWVhY2g/Pg==}}{\*\docvar {xdo0016}{PD9GQ0hBX1NMQ1RVRD8+}}'||wwv_flow.LF||
'{\*\docvar {xd';
    wwv_flow_api.g_varchar2_table(196) := 'o0017}{PGZvOmluc3RyZWFtLWZvcmVpZ24tb2JqZWN0IGNvbnRlbnQtdHlwZT0iaW1hZ2UvanBlZyIgICBoZWlnaHQ9IjQ4IHB4I';
    wwv_flow_api.g_varchar2_table(197) := 'iB3aWR0aD0iNzAgcHgiID4NCjx4c2w6dmFsdWUtb2Ygc2VsZWN0PSIuLy9MR09fU0xHQU4iLz4NCjwvZm86aW5zdHJlYW0tZm9yZ';
    wwv_flow_api.g_varchar2_table(198) := 'Wlnbi1vYmplY3Q+}}'||wwv_flow.LF||
'{\*\docvar {xdo0018}{PGZvOmluc3RyZWFtLWZvcmVpZ24tb2JqZWN0IGNvbnRlbnQtdHlwZT0iaW1hZ';
    wwv_flow_api.g_varchar2_table(199) := '2UvanBlZyIgICBoZWlnaHQ9IjQ4IHB4IiB3aWR0aD0iNzAgcHgiID4NCjx4c2w6dmFsdWUtb2Ygc2VsZWN0PSIuLy9MR09fU0xHQ';
    wwv_flow_api.g_varchar2_table(200) := 'U4iLz4NCjwvZm86aW5zdHJlYW0tZm9yZWlnbi1vYmplY3Q+}}'||wwv_flow.LF||
'{\*\docvar {xdo0019}{PD9OTVJPX0NUQVNfVk5DREFTPz4=}';
    wwv_flow_api.g_varchar2_table(201) := '}{\*\docvar {xdo0020}{PD9mb3ItZWFjaDpST1dTRVQzX1JPVz8+}}{\*\docvar {xdo0021}{PD9UVExBX0FDUkRPUz8+}}{';
    wwv_flow_api.g_varchar2_table(202) := '\*\docvar {xdo0022}{PD9UVEFMX0NQVEFMX0FQPz4=}}{\*\docvar {xdo0023}{PD9UVEFMX0lOVFJFU19BUD8+}}'||wwv_flow.LF||
'{\*\do';
    wwv_flow_api.g_varchar2_table(203) := 'cvar {xdo0024}{PD9UVEFMX0FQPz4=}}{\*\docvar {xdo0025}{PD9lbmQgZm9yLWVhY2g/Pg==}}{\*\ftnsep \ltrpar \';
    wwv_flow_api.g_varchar2_table(204) := 'pard\plain \ltrpar\ql \li0\ri0\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\it';
    wwv_flow_api.g_varchar2_table(205) := 'ap0\pararsid5255267 \rtlch\fcs1 '||wwv_flow.LF||
'\af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\c';
    wwv_flow_api.g_varchar2_table(206) := 'grid\langnp9226\langfenp1033 {\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid6757021 \chftnsep '||wwv_flow.LF||
'\par }}{\*\ftn';
    wwv_flow_api.g_varchar2_table(207) := 'sepc \ltrpar \pard\plain \ltrpar\ql \li0\ri0\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustrigh';
    wwv_flow_api.g_varchar2_table(208) := 't\rin0\lin0\itap0\pararsid5255267 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226';
    wwv_flow_api.g_varchar2_table(209) := '\langfe1033\cgrid\langnp9226\langfenp1033 {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid6757021 \chftnsepc ';
    wwv_flow_api.g_varchar2_table(210) := ''||wwv_flow.LF||
'\par }}{\*\aftnsep \ltrpar \pard\plain \ltrpar\ql \li0\ri0\widctlpar\wrapdefault\aspalpha\aspnum\fa';
    wwv_flow_api.g_varchar2_table(211) := 'auto\adjustright\rin0\lin0\itap0\pararsid5255267 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f3150';
    wwv_flow_api.g_varchar2_table(212) := '6\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid6757';
    wwv_flow_api.g_varchar2_table(213) := '021 \chftnsep '||wwv_flow.LF||
'\par }}{\*\aftnsepc \ltrpar \pard\plain \ltrpar\ql \li0\ri0\widctlpar\wrapdefault\asp';
    wwv_flow_api.g_varchar2_table(214) := 'alpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsid5255267 \rtlch\fcs1 \af0\afs22\alang1025 \lt';
    wwv_flow_api.g_varchar2_table(215) := 'rch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {'||wwv_flow.LF||
'\rtlch\fcs1 \af0 \ltrch\fc';
    wwv_flow_api.g_varchar2_table(216) := 's0 \insrsid6757021 \chftnsepc '||wwv_flow.LF||
'\par }}\ltrpar \sectd \ltrsect\psz1\linex0\headery709\footery0\colsx7';
    wwv_flow_api.g_varchar2_table(217) := '08\endnhere\sectlinegrid360\sectdefaultcl\sectrsid13967392\sftnbj {\headerr \ltrpar \pard\plain \ltr';
    wwv_flow_api.g_varchar2_table(218) := 'par\s18\qc \li0\ri0\widctlpar'||wwv_flow.LF||
'\tqc\tx4419\tqr\tx8838\wrapdefault\aspalpha\aspnum\faauto\adjustright\';
    wwv_flow_api.g_varchar2_table(219) := 'rin0\lin0\itap0\pararsid9641864 \rtlch\fcs1 \af0\afs20\alang1025 \ltrch\fcs0 \fs20\lang9226\langfe10';
    wwv_flow_api.g_varchar2_table(220) := '33\loch\af31506\hich\af31506\dbch\af31505\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 '||wwv_flow.LF||
'\af1 \ltrch\fc';
    wwv_flow_api.g_varchar2_table(221) := 's0 \f1\cf20\chshdng0\chcfpat0\chcbpat8\insrsid9641864 \hich\af1\dbch\af31505\loch\f1 <?call-template';
    wwv_flow_api.g_varchar2_table(222) := ':header?>}{\rtlch\fcs1 \af0 \ltrch\fcs0 \insrsid9641864 '||wwv_flow.LF||
'\par }}{\footerr \ltrpar \pard\plain \ltrpa';
    wwv_flow_api.g_varchar2_table(223) := 'r\s18\qc \li0\ri0\widctlpar\tqc\tx4419\tqr\tx8838\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin';
    wwv_flow_api.g_varchar2_table(224) := '0\lin0\itap0\pararsid5255267 \rtlch\fcs1 \af0\afs20\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\fs20\lang9226\langfe1033';
    wwv_flow_api.g_varchar2_table(225) := '\loch\af31506\hich\af31506\dbch\af31505\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af0 \ltrch\fcs0 ';
    wwv_flow_api.g_varchar2_table(226) := '\insrsid5255267 \hich\af31506\dbch\af31505\loch\f31506 <?call-template:footer?>}{\rtlch\fcs1 \af0 \l';
    wwv_flow_api.g_varchar2_table(227) := 'trch\fcs0 '||wwv_flow.LF||
'\insrsid5255267\charrsid13203660 '||wwv_flow.LF||
'\par }\pard\plain \ltrpar\s20\ql \li0\ri0\widctlpar\tqc';
    wwv_flow_api.g_varchar2_table(228) := '\tx4419\tqr\tx8838\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \rtlch\fcs1 \af0\a';
    wwv_flow_api.g_varchar2_table(229) := 'fs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fc';
    wwv_flow_api.g_varchar2_table(230) := 's1 '||wwv_flow.LF||
'\af0 \ltrch\fcs0 \insrsid5255267 '||wwv_flow.LF||
'\par }}{\*\pnseclvl1\pnucrm\pnstart1\pnindent720\pnhang {\pntx';
    wwv_flow_api.g_varchar2_table(231) := 'ta .}}{\*\pnseclvl2\pnucltr\pnstart1\pnindent720\pnhang {\pntxta .}}{\*\pnseclvl3\pndec\pnstart1\pni';
    wwv_flow_api.g_varchar2_table(232) := 'ndent720\pnhang {\pntxta .}}{\*\pnseclvl4\pnlcltr\pnstart1\pnindent720\pnhang {\pntxta )}}'||wwv_flow.LF||
'{\*\pnsec';
    wwv_flow_api.g_varchar2_table(233) := 'lvl5\pndec\pnstart1\pnindent720\pnhang {\pntxtb (}{\pntxta )}}{\*\pnseclvl6\pnlcltr\pnstart1\pninden';
    wwv_flow_api.g_varchar2_table(234) := 't720\pnhang {\pntxtb (}{\pntxta )}}{\*\pnseclvl7\pnlcrm\pnstart1\pnindent720\pnhang {\pntxtb (}{\pnt';
    wwv_flow_api.g_varchar2_table(235) := 'xta )}}{\*\pnseclvl8'||wwv_flow.LF||
'\pnlcltr\pnstart1\pnindent720\pnhang {\pntxtb (}{\pntxta )}}{\*\pnseclvl9\pnlcr';
    wwv_flow_api.g_varchar2_table(236) := 'm\pnstart1\pnindent720\pnhang {\pntxtb (}{\pntxta )}}\pard\plain \ltrpar'||wwv_flow.LF||
'\ql \li0\ri0\sb100\sa100\sb';
    wwv_flow_api.g_varchar2_table(237) := 'auto1\saauto1\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsid52552';
    wwv_flow_api.g_varchar2_table(238) := '67 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\la';
    wwv_flow_api.g_varchar2_table(239) := 'ngfenp1033 {\rtlch\fcs1 '||wwv_flow.LF||
'\af1\afs12 \ltrch\fcs0 \f1\fs12\cf20\lang9226\langfe9226\langfenp9226\insrs';
    wwv_flow_api.g_varchar2_table(240) := 'id5255267\charrsid15073655 {\*\bkmkstart Texto187}<?template:header?>'||wwv_flow.LF||
'\par \ltrrow}\trowd \irow0\iro';
    wwv_flow_api.g_varchar2_table(241) := 'wband0\ltrrow\ts17\trgaph70\trrh303\trleft-982\trftsWidth3\trwWidth10991\trftsWidthB3\trpaddl108\trp';
    wwv_flow_api.g_varchar2_table(242) := 'addr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid13967392\tbllkhdrrows\tbllkhdrcols\tbllknocol';
    wwv_flow_api.g_varchar2_table(243) := 'band\tblind-874\tblindtype3 '||wwv_flow.LF||
'\clvmgf\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \cl';
    wwv_flow_api.g_varchar2_table(244) := 'brdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1877\clshdrawnil \cellx895\clvertalb\clbrdrt\brdrtbl \cl';
    wwv_flow_api.g_varchar2_table(245) := 'brdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl '||wwv_flow.LF||
'\cltxlrtb\clftsWidth3\clwWidth7262\clshdrawnil \cel';
    wwv_flow_api.g_varchar2_table(246) := 'lx8157\clvmgf\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb';
    wwv_flow_api.g_varchar2_table(247) := '\clftsWidth3\clwWidth1852\clshdrawnil \cellx10009\pard\plain \ltrpar'||wwv_flow.LF||
'\qc \li-190\ri0\widctlpar\intbl';
    wwv_flow_api.g_varchar2_table(248) := '\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin-190\pararsid10159452\yts17 \rtlch\fcs1 \af0';
    wwv_flow_api.g_varchar2_table(249) := '\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\*\bkmk';
    wwv_flow_api.g_varchar2_table(250) := 'start Texto285}'||wwv_flow.LF||
'{\field{\*\fldinst {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid119411';
    wwv_flow_api.g_varchar2_table(251) := '90  FORMTEXT }{\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid11941190 {\*\datafield '||wwv_flow.LF||
'800';
    wwv_flow_api.g_varchar2_table(252) := '300000000000008546578746f32383500094c474f5f534c47414e00000000000f3c3f7265663a78646f303031373f3e00000';
    wwv_flow_api.g_varchar2_table(253) := '00000}{\*\formfield{\fftype0\ffownhelp\ffownstat\ffprot\fftypetxt0{\*\ffname Texto285}{\*\ffdeftext ';
    wwv_flow_api.g_varchar2_table(254) := 'LGO_SLGAN}{\*\ffstattext <?ref:xdo0017?>}}}}'||wwv_flow.LF||
'}{\fldrslt {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f315';
    wwv_flow_api.g_varchar2_table(255) := '02\fs18\lang1024\langfe1024\noproof\insrsid11941190 LGO_SLGAN}}}\sectd \ltrsect\psz1\linex0\headery7';
    wwv_flow_api.g_varchar2_table(256) := '09\footery0\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid13967392\sftnbj {\rtlch\fcs1 '||wwv_flow.LF||
'\a';
    wwv_flow_api.g_varchar2_table(257) := 'f38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid5255267\charrsid10290435 {\*\bkmkend Texto285}\cell {\*\';
    wwv_flow_api.g_varchar2_table(258) := 'bkmkstart Texto268}}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\';
    wwv_flow_api.g_varchar2_table(259) := 'insrsid11941190\charrsid11941190  FORMTEXT }{'||wwv_flow.LF||
'\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\ins';
    wwv_flow_api.g_varchar2_table(260) := 'rsid11941190\charrsid11941190 {\*\datafield 800100000000000008546578746f323638000b4e4d4252455f434c4e';
    wwv_flow_api.g_varchar2_table(261) := '544500000000000f3c3f7265663a78646f303030313f3e0000000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownstat';
    wwv_flow_api.g_varchar2_table(262) := '\fftypetxt0{\*\ffname Texto268}{\*\ffdeftext NMBRE_CLNTE}{\*\ffstattext <?ref:xdo0001?>}}}}}{\fldrsl';
    wwv_flow_api.g_varchar2_table(263) := 't {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 '||wwv_flow.LF||
'\b\f31502\fs18\lang1024\langfe1024\noproof\insrsid11941190\c';
    wwv_flow_api.g_varchar2_table(264) := 'harrsid11941190 NMBRE_CLNTE}}}\sectd \ltrsect\psz1\linex0\headery709\footery0\colsx708\endnhere\sect';
    wwv_flow_api.g_varchar2_table(265) := 'linegrid360\sectdefaultcl\sectrsid13967392\sftnbj {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 '||wwv_flow.LF||
'\b\f31502\fs';
    wwv_flow_api.g_varchar2_table(266) := '18\insrsid5255267 {\*\bkmkend Texto268}\cell {\*\bkmkstart Texto286}}{\field{\*\fldinst {\rtlch\fcs1';
    wwv_flow_api.g_varchar2_table(267) := ' \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid11941190  FORMTEXT }{\rtlch\fcs1 \af38\afs18 \ltrch\f';
    wwv_flow_api.g_varchar2_table(268) := 'cs0 \b\f31502\fs18\insrsid11941190 '||wwv_flow.LF||
'{\*\datafield 800300000000000008546578746f32383600094c474f5f534c';
    wwv_flow_api.g_varchar2_table(269) := '47414e00000000000f3c3f7265663a78646f303031383f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownsta';
    wwv_flow_api.g_varchar2_table(270) := 't\ffprot\fftypetxt0{\*\ffname Texto286}{\*\ffdeftext LGO_SLGAN}{\*\ffstattext '||wwv_flow.LF||
'<?ref:xdo0018?>}}}}}{';
    wwv_flow_api.g_varchar2_table(271) := '\fldrslt {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\lang1024\langfe1024\noproof\insrsid1194';
    wwv_flow_api.g_varchar2_table(272) := '1190 LGO_SLGAN}}}\sectd \ltrsect'||wwv_flow.LF||
'\psz1\linex0\headery709\footery0\colsx708\endnhere\sectlinegrid360\';
    wwv_flow_api.g_varchar2_table(273) := 'sectdefaultcl\sectrsid13967392\sftnbj {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid525';
    wwv_flow_api.g_varchar2_table(274) := '5267 {\*\bkmkend Texto286}\cell }\pard\plain \ltrpar\ql \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intb';
    wwv_flow_api.g_varchar2_table(275) := 'l\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\f';
    wwv_flow_api.g_varchar2_table(276) := 'cs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af38\afs18 \ltrch\f';
    wwv_flow_api.g_varchar2_table(277) := 'cs0 \b\f31502\fs18\insrsid5255267 '||wwv_flow.LF||
'\trowd \irow0\irowband0\ltrrow\ts17\trgaph70\trrh303\trleft-982\t';
    wwv_flow_api.g_varchar2_table(278) := 'rftsWidth3\trwWidth10991\trftsWidthB3\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\';
    wwv_flow_api.g_varchar2_table(279) := 'tblrsid13967392\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind-874\tblindtype3 '||wwv_flow.LF||
'\clvmgf\clvertalc\c';
    wwv_flow_api.g_varchar2_table(280) := 'lbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1877';
    wwv_flow_api.g_varchar2_table(281) := '\clshdrawnil \cellx895\clvertalb\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl ';
    wwv_flow_api.g_varchar2_table(282) := ''||wwv_flow.LF||
'\cltxlrtb\clftsWidth3\clwWidth7262\clshdrawnil \cellx8157\clvmgf\clvertalc\clbrdrt\brdrtbl \clbrdrl';
    wwv_flow_api.g_varchar2_table(283) := '\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1852\clshdrawnil \cellx1000';
    wwv_flow_api.g_varchar2_table(284) := '9\row \ltrrow}\trowd \irow1\irowband1\ltrrow'||wwv_flow.LF||
'\ts17\trgaph70\trrh303\trleft-982\trftsWidth3\trwWidth1';
    wwv_flow_api.g_varchar2_table(285) := '0991\trftsWidthB3\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid13967392\tbll';
    wwv_flow_api.g_varchar2_table(286) := 'khdrrows\tbllkhdrcols\tbllknocolband\tblind-874\tblindtype3 \clvmrg\clvertalt\clbrdrt\brdrtbl '||wwv_flow.LF||
'\clbr';
    wwv_flow_api.g_varchar2_table(287) := 'drl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1877\clshdrawnil \cellx8';
    wwv_flow_api.g_varchar2_table(288) := '95\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth';
    wwv_flow_api.g_varchar2_table(289) := '3\clwWidth7262\clshdrawnil \cellx8157'||wwv_flow.LF||
'\clvmrg\clvertalt\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\br';
    wwv_flow_api.g_varchar2_table(290) := 'drtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1852\clshdrawnil \cellx10009\pard\plain \ltrpar';
    wwv_flow_api.g_varchar2_table(291) := ''||wwv_flow.LF||
'\ql \li-190\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin-190\pararsi';
    wwv_flow_api.g_varchar2_table(292) := 'd10159452\yts17 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\';
    wwv_flow_api.g_varchar2_table(293) := 'langnp9226\langfenp1033 {\rtlch\fcs1 \af38\afs8 '||wwv_flow.LF||
'\ltrch\fcs0 \b\f31502\fs8\insrsid5255267\charrsid77';
    wwv_flow_api.g_varchar2_table(294) := '54578 \cell }\pard \ltrpar\qc \li-190\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustr';
    wwv_flow_api.g_varchar2_table(295) := 'ight\rin0\lin-190\pararsid10159452\yts17 {\*\bkmkstart Texto269}{\field\flddirty{\*\fldinst {'||wwv_flow.LF||
'\rtlch';
    wwv_flow_api.g_varchar2_table(296) := '\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid11941190\charrsid11941190  FORMTEXT }{\rtlch\fcs';
    wwv_flow_api.g_varchar2_table(297) := '1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid11941190\charrsid11941190 {\*\datafield '||wwv_flow.LF||
'80010000000';
    wwv_flow_api.g_varchar2_table(298) := '0000008546578746f3236390005534c47414e00000000000f3c3f7265663a78646f303030323f3e0000000000}{\*\formfi';
    wwv_flow_api.g_varchar2_table(299) := 'eld{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto269}{\*\ffdeftext SLGAN}{\*\ffstattext <?';
    wwv_flow_api.g_varchar2_table(300) := 'ref:xdo0002?>}}}}}{\fldrslt {\rtlch\fcs1 '||wwv_flow.LF||
'\af38\afs18 \ltrch\fcs0 \b\f31502\fs18\lang1024\langfe1024';
    wwv_flow_api.g_varchar2_table(301) := '\noproof\insrsid11941190\charrsid11941190 SLGAN}}}\sectd \ltrsect\psz1\linex0\headery709\footery0\co';
    wwv_flow_api.g_varchar2_table(302) := 'lsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid13967392\sftnbj {\rtlch\fcs1 \af38\afs18 '||wwv_flow.LF||
'\ltr';
    wwv_flow_api.g_varchar2_table(303) := 'ch\fcs0 \b\f31502\fs18\insrsid5255267 {\*\bkmkend Texto269}\cell }\pard \ltrpar\ql \li-190\ri0\widct';
    wwv_flow_api.g_varchar2_table(304) := 'lpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin-190\pararsid10159452\yts17 {\rtlc';
    wwv_flow_api.g_varchar2_table(305) := 'h\fcs1 \af38\afs18 \ltrch\fcs0 '||wwv_flow.LF||
'\b\f31502\fs18\insrsid5255267 \cell }\pard\plain \ltrpar\ql \li0\ri0';
    wwv_flow_api.g_varchar2_table(306) := '\sa160\sl259\slmult1\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0 \rtlch';
    wwv_flow_api.g_varchar2_table(307) := '\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp10';
    wwv_flow_api.g_varchar2_table(308) := '33 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid5255267 \trowd \irow1\irowband1\ltrrow';
    wwv_flow_api.g_varchar2_table(309) := ''||wwv_flow.LF||
'\ts17\trgaph70\trrh303\trleft-982\trftsWidth3\trwWidth10991\trftsWidthB3\trpaddl108\trpaddr108\trpa';
    wwv_flow_api.g_varchar2_table(310) := 'ddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid13967392\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind-';
    wwv_flow_api.g_varchar2_table(311) := '874\tblindtype3 \clvmrg\clvertalt\clbrdrt\brdrtbl '||wwv_flow.LF||
'\clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtb';
    wwv_flow_api.g_varchar2_table(312) := 'l \cltxlrtb\clftsWidth3\clwWidth1877\clshdrawnil \cellx895\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtb';
    wwv_flow_api.g_varchar2_table(313) := 'l \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth7262\clshdrawnil \cellx8157'||wwv_flow.LF||
'\clvmr';
    wwv_flow_api.g_varchar2_table(314) := 'g\clvertalt\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3';
    wwv_flow_api.g_varchar2_table(315) := '\clwWidth1852\clshdrawnil \cellx10009\row \ltrrow}\trowd \irow2\irowband2\ltrrow'||wwv_flow.LF||
'\ts17\trgaph70\trrh';
    wwv_flow_api.g_varchar2_table(316) := '323\trleft-982\trftsWidth3\trwWidth10991\trftsWidthB3\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpa';
    wwv_flow_api.g_varchar2_table(317) := 'ddfb3\trpaddfr3\tblrsid13967392\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind-874\tblindtype3 \clv';
    wwv_flow_api.g_varchar2_table(318) := 'mrg\clvertalt\clbrdrt\brdrtbl '||wwv_flow.LF||
'\clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWid';
    wwv_flow_api.g_varchar2_table(319) := 'th3\clwWidth1877\clshdrawnil \cellx895\clvertalt\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \';
    wwv_flow_api.g_varchar2_table(320) := 'clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth7262\clshdrawnil \cellx8157'||wwv_flow.LF||
'\clvmrg\clvertalt\clbrdrt\';
    wwv_flow_api.g_varchar2_table(321) := 'brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1852\clshdr';
    wwv_flow_api.g_varchar2_table(322) := 'awnil \cellx10009\pard\plain \ltrpar'||wwv_flow.LF||
'\ql \li-190\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faa';
    wwv_flow_api.g_varchar2_table(323) := 'uto\adjustright\rin0\lin-190\pararsid10159452\yts17 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f3';
    wwv_flow_api.g_varchar2_table(324) := '1506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af38\afs8 '||wwv_flow.LF||
'\ltrch\fcs0 \b\';
    wwv_flow_api.g_varchar2_table(325) := 'f31502\fs8\insrsid5255267\charrsid7754578 \cell }\pard \ltrpar\qc \li-190\ri0\widctlpar\intbl\wrapde';
    wwv_flow_api.g_varchar2_table(326) := 'fault\aspalpha\aspnum\faauto\adjustright\rin0\lin-190\pararsid10159452\yts17 {\*\bkmkstart Texto270}';
    wwv_flow_api.g_varchar2_table(327) := '{\field\flddirty{\*\fldinst {'||wwv_flow.LF||
'\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid11941190\cha';
    wwv_flow_api.g_varchar2_table(328) := 'rrsid11941190  FORMTEXT }{\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid11941190\charrsi';
    wwv_flow_api.g_varchar2_table(329) := 'd11941190 {\*\datafield '||wwv_flow.LF||
'800100000000000008546578746f323730000b4e4d4252455f525052544500000000000f3c3';
    wwv_flow_api.g_varchar2_table(330) := 'f7265663a78646f303030343f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffnam';
    wwv_flow_api.g_varchar2_table(331) := 'e Texto270}{\*\ffdeftext NMBRE_RPRTE}{\*\ffstattext <?ref:xdo0004?>}}}}'||wwv_flow.LF||
'}{\fldrslt {\rtlch\fcs1 \af3';
    wwv_flow_api.g_varchar2_table(332) := '8\afs18 \ltrch\fcs0 \b\f31502\fs18\lang1024\langfe1024\noproof\insrsid11941190\charrsid11941190 NMBR';
    wwv_flow_api.g_varchar2_table(333) := 'E_RPRTE}}}\sectd \ltrsect'||wwv_flow.LF||
'\psz1\linex0\headery709\footery0\colsx708\endnhere\sectlinegrid360\sectdef';
    wwv_flow_api.g_varchar2_table(334) := 'aultcl\sectrsid13967392\sftnbj {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid5255267 {\';
    wwv_flow_api.g_varchar2_table(335) := '*\bkmkend Texto270}\cell }\pard \ltrpar'||wwv_flow.LF||
'\ql \li-190\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\';
    wwv_flow_api.g_varchar2_table(336) := 'faauto\adjustright\rin0\lin-190\pararsid10159452\yts17 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f3150';
    wwv_flow_api.g_varchar2_table(337) := '2\fs18\insrsid5255267 \cell }\pard\plain \ltrpar\ql \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\widctlpar\intbl\wr';
    wwv_flow_api.g_varchar2_table(338) := 'apdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 ';
    wwv_flow_api.g_varchar2_table(339) := '\f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 ';
    wwv_flow_api.g_varchar2_table(340) := '\b\f31502\fs18\insrsid5255267 '||wwv_flow.LF||
'\trowd \irow2\irowband2\ltrrow\ts17\trgaph70\trrh323\trleft-982\trfts';
    wwv_flow_api.g_varchar2_table(341) := 'Width3\trwWidth10991\trftsWidthB3\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblr';
    wwv_flow_api.g_varchar2_table(342) := 'sid13967392\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind-874\tblindtype3 '||wwv_flow.LF||
'\clvmrg\clvertalt\clbrd';
    wwv_flow_api.g_varchar2_table(343) := 'rt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1877\cls';
    wwv_flow_api.g_varchar2_table(344) := 'hdrawnil \cellx895\clvertalt\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl '||wwv_flow.LF||
'\cl';
    wwv_flow_api.g_varchar2_table(345) := 'txlrtb\clftsWidth3\clwWidth7262\clshdrawnil \cellx8157\clvmrg\clvertalt\clbrdrt\brdrtbl \clbrdrl\brd';
    wwv_flow_api.g_varchar2_table(346) := 'rtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1852\clshdrawnil \cellx10009\ro';
    wwv_flow_api.g_varchar2_table(347) := 'w \ltrrow}\trowd \irow3\irowband3\lastrow \ltrrow'||wwv_flow.LF||
'\ts17\trgaph70\trrh303\trleft-982\trftsWidth3\trwW';
    wwv_flow_api.g_varchar2_table(348) := 'idth10991\trftsWidthB3\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid13967392';
    wwv_flow_api.g_varchar2_table(349) := '\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind-874\tblindtype3 \clvertalt\clbrdrt\brdrtbl \clbrdrl';
    wwv_flow_api.g_varchar2_table(350) := ''||wwv_flow.LF||
'\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1877\clshdrawnil \cellx895';
    wwv_flow_api.g_varchar2_table(351) := '\clvertalt\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\';
    wwv_flow_api.g_varchar2_table(352) := 'clwWidth7262\clshdrawnil \cellx8157\clvertalt\clbrdrt'||wwv_flow.LF||
'\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \cl';
    wwv_flow_api.g_varchar2_table(353) := 'brdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1852\clshdrawnil \cellx10009\pard\plain \ltrpar\ql \li0\';
    wwv_flow_api.g_varchar2_table(354) := 'ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid10159452\yts17 ';
    wwv_flow_api.g_varchar2_table(355) := ''||wwv_flow.LF||
'\rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\lang';
    wwv_flow_api.g_varchar2_table(356) := 'fenp1033 {\rtlch\fcs1 \af38\afs8 \ltrch\fcs0 \b\f31502\fs8\insrsid5255267\charrsid7754578 \cell }\pa';
    wwv_flow_api.g_varchar2_table(357) := 'rd \ltrpar'||wwv_flow.LF||
'\qc \li-190\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin-1';
    wwv_flow_api.g_varchar2_table(358) := '90\pararsid10159452\yts17 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid7881758\charrsi';
    wwv_flow_api.g_varchar2_table(359) := 'd15623596 ACUERDOS DE PAGOS }{\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 '||wwv_flow.LF||
'\b\f31502\fs18\insrsid10428498 CO';
    wwv_flow_api.g_varchar2_table(360) := 'N {\*\bkmkstart Texto287}}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502';
    wwv_flow_api.g_varchar2_table(361) := '\fs18\insrsid10428498\charrsid10428498  FORMTEXT }{\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 '||wwv_flow.LF||
'\b\f31502\fs';
    wwv_flow_api.g_varchar2_table(362) := '18\insrsid10428498\charrsid10428498 {\*\datafield 800100000000000008546578746f32383700104e4d524f5f43';
    wwv_flow_api.g_varchar2_table(363) := '5441535f564e4344415300000000000f3c3f7265663a78646f303031393f3e0000000000}{\*\formfield{\fftype0\ffow';
    wwv_flow_api.g_varchar2_table(364) := 'nhelp\ffownstat\fftypetxt0{\*\ffname '||wwv_flow.LF||
'Texto287}{\*\ffdeftext NMRO_CTAS_VNCDAS}{\*\ffstattext <?ref:x';
    wwv_flow_api.g_varchar2_table(365) := 'do0019?>}}}}}{\fldrslt {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\lang1024\langfe1024\nopro';
    wwv_flow_api.g_varchar2_table(366) := 'of\insrsid10428498\charrsid10428498 NMRO_CTAS_VNCDAS}}}\sectd \ltrsect'||wwv_flow.LF||
'\psz1\linex0\headery709\foote';
    wwv_flow_api.g_varchar2_table(367) := 'ry0\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid13967392\sftnbj {\rtlch\fcs1 \af38\afs18';
    wwv_flow_api.g_varchar2_table(368) := ' \ltrch\fcs0 \b\f31502\fs18\insrsid10428498 {\*\bkmkend Texto287} O M\''c1S CUOTA VENCIDAS}{\rtlch\fc';
    wwv_flow_api.g_varchar2_table(369) := 's1 \af38\afs18 '||wwv_flow.LF||
'\ltrch\fcs0 \b\f31502\fs18\insrsid5255267\charrsid15623596 \cell }\pard \ltrpar\ql \';
    wwv_flow_api.g_varchar2_table(370) := 'li-190\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin-190\pararsid10159';
    wwv_flow_api.g_varchar2_table(371) := '452\yts17 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 '||wwv_flow.LF||
'\b\f31502\fs18\insrsid5255267 \cell }\pard\plain \lt';
    wwv_flow_api.g_varchar2_table(372) := 'rpar\ql \li0\ri0\sa160\sl259\slmult1\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\';
    wwv_flow_api.g_varchar2_table(373) := 'rin0\lin0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 '||wwv_flow.LF||
'\f31506\fs22\lang9226\langfe1033\cgrid\langn';
    wwv_flow_api.g_varchar2_table(374) := 'p9226\langfenp1033 {\rtlch\fcs1 \af38\afs18 \ltrch\fcs0 \b\f31502\fs18\insrsid5255267 \trowd \irow3\';
    wwv_flow_api.g_varchar2_table(375) := 'irowband3\lastrow \ltrrow'||wwv_flow.LF||
'\ts17\trgaph70\trrh303\trleft-982\trftsWidth3\trwWidth10991\trftsWidthB3\t';
    wwv_flow_api.g_varchar2_table(376) := 'rpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid13967392\tbllkhdrrows\tbllkhdrco';
    wwv_flow_api.g_varchar2_table(377) := 'ls\tbllknocolband\tblind-874\tblindtype3 \clvertalt\clbrdrt\brdrtbl \clbrdrl'||wwv_flow.LF||
'\brdrtbl \clbrdrb\brdrt';
    wwv_flow_api.g_varchar2_table(378) := 'bl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth1877\clshdrawnil \cellx895\clvertalt\clbrdrt\brdrt';
    wwv_flow_api.g_varchar2_table(379) := 'bl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth7262\clshdrawnil';
    wwv_flow_api.g_varchar2_table(380) := ' \cellx8157\clvertalt\clbrdrt'||wwv_flow.LF||
'\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\';
    wwv_flow_api.g_varchar2_table(381) := 'clftsWidth3\clwWidth1852\clshdrawnil \cellx10009\row }\pard \ltrpar\ql \li0\ri0\widctlpar\tx4590\wra';
    wwv_flow_api.g_varchar2_table(382) := 'pdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsid5255267 {'||wwv_flow.LF||
'\rtlch\fcs1 \af1\afs14';
    wwv_flow_api.g_varchar2_table(383) := ' \ltrch\fcs0 \f1\fs14\cf20\lang9226\langfe9226\langfenp9226\insrsid5255267\charrsid15073655 <?end te';
    wwv_flow_api.g_varchar2_table(384) := 'mplate?>}{\rtlch\fcs1 \af1\afs14 \ltrch\fcs0 \f1\fs14\cf20\lang9226\langfe9226\langfenp9226\insrsid5';
    wwv_flow_api.g_varchar2_table(385) := '255267\charrsid2495807 '||wwv_flow.LF||
'{\*\bkmkend Texto187} }{\rtlch\fcs1 \af1\afs14 \ltrch\fcs0 \f1\fs14\cf20\lan';
    wwv_flow_api.g_varchar2_table(386) := 'g9226\langfe9226\langfenp9226\insrsid5255267 '||wwv_flow.LF||
'\par }\pard \ltrpar\ql \li0\ri0\sa160\widctlpar\wrapde';
    wwv_flow_api.g_varchar2_table(387) := 'fault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsid5255267 {\rtlch\fcs1 \af0\afs16 \lt';
    wwv_flow_api.g_varchar2_table(388) := 'rch\fcs0 \b\fs16\insrsid5255267 <?template:footer?>'||wwv_flow.LF||
'\par \ltrrow}\trowd \irow0\irowband0\lastrow \lt';
    wwv_flow_api.g_varchar2_table(389) := 'rrow'||wwv_flow.LF||
'\ts17\trqc\trgaph108\trleft-1204\trftsWidth1\trftsWidthB3\trautofit1\trpaddl108\trpaddr108\trpa';
    wwv_flow_api.g_varchar2_table(390) := 'ddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid5255267\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind-1';
    wwv_flow_api.g_varchar2_table(391) := '096\tblindtype3 \clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl '||wwv_flow.LF||
'\clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltx';
    wwv_flow_api.g_varchar2_table(392) := 'lrtb\clftsWidth3\clwWidth5173\clshdrawnil\clhidemark \cellx3260\clvertalc\clbrdrt\brdrtbl \clbrdrl\b';
    wwv_flow_api.g_varchar2_table(393) := 'rdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2906\clshdrawnil\clhidemark \';
    wwv_flow_api.g_varchar2_table(394) := 'cellx5745'||wwv_flow.LF||
'\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\cl';
    wwv_flow_api.g_varchar2_table(395) := 'ftsWidth3\clwWidth2552\clshdrawnil\clhidemark \cellx7981\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl ';
    wwv_flow_api.g_varchar2_table(396) := '\clbrdrb\brdrtbl \clbrdrr\brdrtbl '||wwv_flow.LF||
'\cltxlrtb\clftsWidth3\clwWidth1560\clshdrawnil\clhidemark \cellx9';
    wwv_flow_api.g_varchar2_table(397) := '371\pard\plain \ltrpar\s18\qc \li0\ri0\widctlpar\intbl\tx2535\tqc\tx4419\tqr\tx8838\wrapdefault\aspa';
    wwv_flow_api.g_varchar2_table(398) := 'lpha\aspnum\faauto\adjustright\rin0\lin0\pararsid10159452\yts17 \rtlch\fcs1 '||wwv_flow.LF||
'\af0\afs20\alang1025 \l';
    wwv_flow_api.g_varchar2_table(399) := 'trch\fcs0 \fs20\lang9226\langfe1033\loch\af31506\hich\af31506\dbch\af31505\cgrid\langnp9226\langfenp';
    wwv_flow_api.g_varchar2_table(400) := '1033 {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrsid5255267 \hich\a';
    wwv_flow_api.g_varchar2_table(401) := 'f31506\dbch\af31505\loch\f31506 '||wwv_flow.LF||
'\hich\f31506 Elabor\''f3\loch\f31506 :{\*\bkmkstart Texto271}}{\fiel';
    wwv_flow_api.g_varchar2_table(402) := 'd\flddirty{\*\fldinst {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrs';
    wwv_flow_api.g_varchar2_table(403) := 'id11941190\charrsid11941190 \hich\af31506\dbch\af31505\loch\f31506  FORMTEXT }{'||wwv_flow.LF||
'\rtlch\fcs1 \af0\afs';
    wwv_flow_api.g_varchar2_table(404) := '16 \ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrsid11941190\charrsid11941190 {\*\datafield 8';
    wwv_flow_api.g_varchar2_table(405) := '00100000000000008546578746f32373100075553554152494f00000000000f3c3f7265663a78646f303030353f3e0000000';
    wwv_flow_api.g_varchar2_table(406) := '000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto271}{\*\ffdeftext USUARIO}';
    wwv_flow_api.g_varchar2_table(407) := '{\*\ffstattext <?ref:xdo0005?>}}}}}{\fldrslt {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang1024\lang';
    wwv_flow_api.g_varchar2_table(408) := 'fe1024\noproof\langnp3082\insrsid11941190\charrsid11941190 '||wwv_flow.LF||
'\hich\af31506\dbch\af31505\loch\f31506 U';
    wwv_flow_api.g_varchar2_table(409) := 'SUARIO}}}\sectd \ltrsect\psz1\linex0\headery709\footery0\colsx708\endnhere\sectlinegrid360\sectdefau';
    wwv_flow_api.g_varchar2_table(410) := 'ltcl\sectrsid13967392\sftnbj {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 '||wwv_flow.LF||
'\fs16\lang3082\langfe1033\langnp30';
    wwv_flow_api.g_varchar2_table(411) := '82\insrsid14055924 {\*\bkmkend Texto271}\hich\af31506\dbch\af31505\loch\f31506  }{\rtlch\fcs1 \af0\a';
    wwv_flow_api.g_varchar2_table(412) := 'fs16 \ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrsid5255267 \cell }\pard \ltrpar\s18\qc \li';
    wwv_flow_api.g_varchar2_table(413) := '0\ri0\widctlpar\intbl'||wwv_flow.LF||
'\tqc\tx4419\tqr\tx8838\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin';
    wwv_flow_api.g_varchar2_table(414) := '0\pararsid10159452\yts17 {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\in';
    wwv_flow_api.g_varchar2_table(415) := 'srsid5255267 \hich\af31506\dbch\af31505\loch\f31506 Fecha: '||wwv_flow.LF||
'{\*\bkmkstart Texto272}}{\field\flddirty';
    wwv_flow_api.g_varchar2_table(416) := '{\*\fldinst {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrsid11941190';
    wwv_flow_api.g_varchar2_table(417) := '\charrsid11941190 \hich\af31506\dbch\af31505\loch\f31506  FORMTEXT }{\rtlch\fcs1 \af0\afs16 \ltrch\f';
    wwv_flow_api.g_varchar2_table(418) := 'cs0 '||wwv_flow.LF||
'\fs16\lang3082\langfe1033\langnp3082\insrsid11941190\charrsid11941190 {\*\datafield 80010000000';
    wwv_flow_api.g_varchar2_table(419) := '0000008546578746f3237320003484f5900000000000f3c3f7265663a78646f303030363f3e0000000000}{\*\formfield{';
    wwv_flow_api.g_varchar2_table(420) := '\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto272}'||wwv_flow.LF||
'{\*\ffdeftext HOY}{\*\ffstattext <?ref:x';
    wwv_flow_api.g_varchar2_table(421) := 'do0006?>}}}}}{\fldrslt {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang1024\langfe1024\noproof\langnp3';
    wwv_flow_api.g_varchar2_table(422) := '082\insrsid11941190\charrsid11941190 \hich\af31506\dbch\af31505\loch\f31506 HOY}}}\sectd \ltrsect'||wwv_flow.LF||
'\p';
    wwv_flow_api.g_varchar2_table(423) := 'sz1\linex0\headery709\footery0\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid13967392\sftn';
    wwv_flow_api.g_varchar2_table(424) := 'bj {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrsid5255267 {\*\bkmke';
    wwv_flow_api.g_varchar2_table(425) := 'nd Texto272}\cell '||wwv_flow.LF||
'\hich\af31506\dbch\af31505\loch\f31506 \hich\f31506 IP Imprimi\''f3\loch\f31506 : ';
    wwv_flow_api.g_varchar2_table(426) := '{\*\bkmkstart Texto273}}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang30';
    wwv_flow_api.g_varchar2_table(427) := '82\langfe1033\langnp3082\insrsid11941190\charrsid11941190 '||wwv_flow.LF||
'\hich\af31506\dbch\af31505\loch\f31506  F';
    wwv_flow_api.g_varchar2_table(428) := 'ORMTEXT }{\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang3082\langfe1033\langnp3082\insrsid11941190\ch';
    wwv_flow_api.g_varchar2_table(429) := 'arrsid11941190 {\*\datafield '||wwv_flow.LF||
'800100000000000008546578746f323733000649504144445200000000000f3c3f7265';
    wwv_flow_api.g_varchar2_table(430) := '663a78646f303030373f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Tex';
    wwv_flow_api.g_varchar2_table(431) := 'to273}{\*\ffdeftext IPADDR}{\*\ffstattext <?ref:xdo0007?>}}}}}{\fldrslt {\rtlch\fcs1 '||wwv_flow.LF||
'\af0\afs16 \lt';
    wwv_flow_api.g_varchar2_table(432) := 'rch\fcs0 \fs16\lang1024\langfe1024\noproof\langnp3082\insrsid11941190\charrsid11941190 \hich\af31506';
    wwv_flow_api.g_varchar2_table(433) := '\dbch\af31505\loch\f31506 IPADDR}}}\sectd \ltrsect'||wwv_flow.LF||
'\psz1\linex0\headery709\footery0\colsx708\endnher';
    wwv_flow_api.g_varchar2_table(434) := 'e\sectlinegrid360\sectdefaultcl\sectrsid13967392\sftnbj {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\la';
    wwv_flow_api.g_varchar2_table(435) := 'ng3082\langfe1033\langnp3082\insrsid5255267 {\*\bkmkend Texto273}\cell '||wwv_flow.LF||
'\hich\af31506\dbch\af31505\l';
    wwv_flow_api.g_varchar2_table(436) := 'och\f31506 \hich\f31506 P\''e1\loch\f31506 gina }{\field\fldedit{\*\fldinst {\rtlch\fcs1 \ab\af0\afs1';
    wwv_flow_api.g_varchar2_table(437) := '6 \ltrch\fcs0 \b\fs16\insrsid5255267 \hich\af31506\dbch\af31505\loch\f31506 PAGE}}{\fldrslt {\rtlch\';
    wwv_flow_api.g_varchar2_table(438) := 'fcs1 \ab\af0\afs16 '||wwv_flow.LF||
'\ltrch\fcs0 \b\fs16\lang1024\langfe1024\noproof\insrsid5255267 \hich\af31506\dbc';
    wwv_flow_api.g_varchar2_table(439) := 'h\af31505\loch\f31506 1}}}\sectd \ltrsect\psz1\linex0\headery709\footery0\colsx708\endnhere\sectline';
    wwv_flow_api.g_varchar2_table(440) := 'grid360\sectdefaultcl\sectrsid13967392\sftnbj {\rtlch\fcs1 \af0\afs16 '||wwv_flow.LF||
'\ltrch\fcs0 \fs16\lang3082\la';
    wwv_flow_api.g_varchar2_table(441) := 'ngfe1033\langnp3082\insrsid5255267 \hich\af31506\dbch\af31505\loch\f31506  de }{\field\fldedit{\*\fl';
    wwv_flow_api.g_varchar2_table(442) := 'dinst {\rtlch\fcs1 \ab\af0\afs16 \ltrch\fcs0 \b\fs16\insrsid5255267 \hich\af31506\dbch\af31505\loch\';
    wwv_flow_api.g_varchar2_table(443) := 'f31506 NUMPAGES}'||wwv_flow.LF||
'}{\fldrslt {\rtlch\fcs1 \ab\af0\afs16 \ltrch\fcs0 \b\fs16\lang1024\langfe1024\nopro';
    wwv_flow_api.g_varchar2_table(444) := 'of\insrsid5255267 \hich\af31506\dbch\af31505\loch\f31506 1}}}\sectd \ltrsect'||wwv_flow.LF||
'\psz1\linex0\headery709';
    wwv_flow_api.g_varchar2_table(445) := '\footery0\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid13967392\sftnbj {\rtlch\fcs1 \af0\';
    wwv_flow_api.g_varchar2_table(446) := 'afs16 \ltrch\fcs0 \fs16\insrsid5255267 \cell }\pard\plain \ltrpar\ql \li0\ri0\sa160\sl259\slmult1'||wwv_flow.LF||
'\w';
    wwv_flow_api.g_varchar2_table(447) := 'idctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0 \rtlch\fcs1 \af0\afs22\alang';
    wwv_flow_api.g_varchar2_table(448) := '1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af37 \';
    wwv_flow_api.g_varchar2_table(449) := 'ltrch\fcs0 '||wwv_flow.LF||
'\lang9226\langfe9226\langfenp9226\insrsid5255267 \trowd \irow0\irowband0\lastrow \ltrrow';
    wwv_flow_api.g_varchar2_table(450) := ''||wwv_flow.LF||
'\ts17\trqc\trgaph108\trleft-1204\trftsWidth1\trftsWidthB3\trautofit1\trpaddl108\trpaddr108\trpaddfl';
    wwv_flow_api.g_varchar2_table(451) := '3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid5255267\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind-1096\';
    wwv_flow_api.g_varchar2_table(452) := 'tblindtype3 \clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl '||wwv_flow.LF||
'\clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb';
    wwv_flow_api.g_varchar2_table(453) := '\clftsWidth3\clwWidth5173\clshdrawnil\clhidemark \cellx3260\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrt';
    wwv_flow_api.g_varchar2_table(454) := 'bl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsWidth3\clwWidth2906\clshdrawnil\clhidemark \cell';
    wwv_flow_api.g_varchar2_table(455) := 'x5745'||wwv_flow.LF||
'\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clbrdrb\brdrtbl \clbrdrr\brdrtbl \cltxlrtb\clftsW';
    wwv_flow_api.g_varchar2_table(456) := 'idth3\clwWidth2552\clshdrawnil\clhidemark \cellx7981\clvertalc\clbrdrt\brdrtbl \clbrdrl\brdrtbl \clb';
    wwv_flow_api.g_varchar2_table(457) := 'rdrb\brdrtbl \clbrdrr\brdrtbl '||wwv_flow.LF||
'\cltxlrtb\clftsWidth3\clwWidth1560\clshdrawnil\clhidemark \cellx9371\';
    wwv_flow_api.g_varchar2_table(458) := 'row }\pard \ltrpar\ql \li0\ri0\sa160\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\l';
    wwv_flow_api.g_varchar2_table(459) := 'in0\itap0\pararsid5255267 {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \b\fs16\insrsid5255267 '||wwv_flow.LF||
'<?end template';
    wwv_flow_api.g_varchar2_table(460) := '?>'||wwv_flow.LF||
'\par }\pard \ltrpar\ql \li0\ri0\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin';
    wwv_flow_api.g_varchar2_table(461) := '0\itap0\pararsid1652526 {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid11941190 '||wwv_flow.LF||
'\par \ltrrow}\tro';
    wwv_flow_api.g_varchar2_table(462) := 'wd \irow0\irowband0\ltrrow\ts17\trgaph70\trleft-1134\trhdr\trbrdrt\brdrs\brdrw10 \trbrdrl\brdrs\brdr';
    wwv_flow_api.g_varchar2_table(463) := 'w10 \trbrdrb\brdrs\brdrw10 \trbrdrr\brdrs\brdrw10 \trbrdrh\brdrs\brdrw10 \trbrdrv\brdrs\brdrw10 '||wwv_flow.LF||
'\tr';
    wwv_flow_api.g_varchar2_table(464) := 'ftsWidth3\trwWidth11199\trftsWidthB3\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\t';
    wwv_flow_api.g_varchar2_table(465) := 'blrsid11142185\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind-1026\tblindtype3 \clvertalc\clbrdrt\b';
    wwv_flow_api.g_varchar2_table(466) := 'rdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb'||wwv_flow.LF||
'\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat21\cltxlr';
    wwv_flow_api.g_varchar2_table(467) := 'tb\clftsWidth3\clwWidth2694\clcbpatraw21 \cellx1560\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\b';
    wwv_flow_api.g_varchar2_table(468) := 'rdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 '||wwv_flow.LF||
'\clcbpat21\cltxlrtb\clftsWidth3\clwWidth3118\c';
    wwv_flow_api.g_varchar2_table(469) := 'lcbpatraw21 \cellx4678\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10';
    wwv_flow_api.g_varchar2_table(470) := ' \clbrdrr\brdrs\brdrw10 \clcbpat21\cltxlrtb\clftsWidth3\clwWidth1418\clcbpatraw21 \cellx6096\clverta';
    wwv_flow_api.g_varchar2_table(471) := 'lc'||wwv_flow.LF||
'\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcb';
    wwv_flow_api.g_varchar2_table(472) := 'pat21\cltxlrtb\clftsWidth3\clwWidth1275\clcbpatraw21 \cellx7371\clvertalc\clbrdrt\brdrs\brdrw10 \clb';
    wwv_flow_api.g_varchar2_table(473) := 'rdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr'||wwv_flow.LF||
'\brdrs\brdrw10 \clcbpat21\cltxlrtb\clftsWidth3\cl';
    wwv_flow_api.g_varchar2_table(474) := 'wWidth1276\clcbpatraw21 \cellx8647\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\b';
    wwv_flow_api.g_varchar2_table(475) := 'rdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat22\cltxlrtb\clftsWidth3\clwWidth1418\clcbpatraw22 \cellx';
    wwv_flow_api.g_varchar2_table(476) := '10065'||wwv_flow.LF||
'\pard\plain \ltrpar\qc \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright';
    wwv_flow_api.g_varchar2_table(477) := '\rin0\lin0\pararsid11941190\yts17 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226';
    wwv_flow_api.g_varchar2_table(478) := '\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 '||wwv_flow.LF||
'\ab\af0\afs18 \ltrch\fcs0 \b\fs18\insrsid412';
    wwv_flow_api.g_varchar2_table(479) := '9472 IDENTIFICACION}{\rtlch\fcs1 \ab\af0\afs18 \ltrch\fcs0 \b\fs18\insrsid4129472\charrsid3627754 \c';
    wwv_flow_api.g_varchar2_table(480) := 'ell }\pard \ltrpar'||wwv_flow.LF||
'\qc \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\';
    wwv_flow_api.g_varchar2_table(481) := 'lin0\pararsid3627754\yts17 {\rtlch\fcs1 \ab\af0\afs18 \ltrch\fcs0 \b\fs18\insrsid4129472 IMPUESTO}{\';
    wwv_flow_api.g_varchar2_table(482) := 'rtlch\fcs1 \ab\af0\afs18 \ltrch\fcs0 '||wwv_flow.LF||
'\b\fs18\insrsid4129472\charrsid6977746 \cell }\pard \ltrpar\qc';
    wwv_flow_api.g_varchar2_table(483) := ' \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid11941190\';
    wwv_flow_api.g_varchar2_table(484) := 'yts17 {\rtlch\fcs1 \ab\af0\afs18 \ltrch\fcs0 \b\fs18\insrsid4129472\charrsid6977746 N\''b0'||wwv_flow.LF||
' ACUERDO'||wwv_flow.LF||
'\';
    wwv_flow_api.g_varchar2_table(485) := 'par PAGO}{\rtlch\fcs1 \ab\af0\afs18 \ltrch\fcs0 \b\fs18\insrsid4129472\charrsid4129472 \cell }\pard ';
    wwv_flow_api.g_varchar2_table(486) := '\ltrpar\qc \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsi';
    wwv_flow_api.g_varchar2_table(487) := 'd4129472\yts17 {\rtlch\fcs1 \ab\af0\afs18 \ltrch\fcs0 '||wwv_flow.LF||
'\b\fs18\insrsid4129472 FECHA ACUERDO\cell }\p';
    wwv_flow_api.g_varchar2_table(488) := 'ard \ltrpar\qc \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\par';
    wwv_flow_api.g_varchar2_table(489) := 'arsid11941190\yts17 {\rtlch\fcs1 \ab\af0\afs18 \ltrch\fcs0 \b\fs18\insrsid4129472 N\''b0 CUOTAS VENCI';
    wwv_flow_api.g_varchar2_table(490) := 'DAS}{'||wwv_flow.LF||
'\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid4129472\charrsid11941190 \cell }{\rtlch\fcs1 \';
    wwv_flow_api.g_varchar2_table(491) := 'ab\af0\afs18 \ltrch\fcs0 \b\fs18\insrsid4129472\charrsid6977746 TOTAL}{\rtlch\fcs1 \af0\afs16 \ltrch';
    wwv_flow_api.g_varchar2_table(492) := '\fcs0 \fs16\insrsid4129472\charrsid11941190 \cell '||wwv_flow.LF||
'}\pard\plain \ltrpar\ql \li0\ri0\sa160\sl259\slmu';
    wwv_flow_api.g_varchar2_table(493) := 'lt1\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0 \rtlch\fcs1 \af0\afs22\';
    wwv_flow_api.g_varchar2_table(494) := 'alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 '||wwv_flow.LF||
'\';
    wwv_flow_api.g_varchar2_table(495) := 'af0\afs16 \ltrch\fcs0 \fs16\insrsid11142185 \trowd \irow0\irowband0\ltrrow\ts17\trgaph70\trleft-1134';
    wwv_flow_api.g_varchar2_table(496) := '\trhdr\trbrdrt\brdrs\brdrw10 \trbrdrl\brdrs\brdrw10 \trbrdrb\brdrs\brdrw10 \trbrdrr\brdrs\brdrw10 \t';
    wwv_flow_api.g_varchar2_table(497) := 'rbrdrh\brdrs\brdrw10 \trbrdrv\brdrs\brdrw10 '||wwv_flow.LF||
'\trftsWidth3\trwWidth11199\trftsWidthB3\trpaddl108\trpa';
    wwv_flow_api.g_varchar2_table(498) := 'ddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid11142185\tbllkhdrrows\tbllkhdrcols\tbllknocolb';
    wwv_flow_api.g_varchar2_table(499) := 'and\tblind-1026\tblindtype3 \clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb'||wwv_flow.LF||
'\brdrs\';
    wwv_flow_api.g_varchar2_table(500) := 'brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat21\cltxlrtb\clftsWidth3\clwWidth2694\clcbpatraw21 \cellx1560\';
end;
/
begin
    wwv_flow_api.g_varchar2_table(501) := 'clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10';
    wwv_flow_api.g_varchar2_table(502) := ' '||wwv_flow.LF||
'\clcbpat21\cltxlrtb\clftsWidth3\clwWidth3118\clcbpatraw21 \cellx4678\clvertalc\clbrdrt\brdrs\brdrw';
    wwv_flow_api.g_varchar2_table(503) := '10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat21\cltxlrtb\clftsWid';
    wwv_flow_api.g_varchar2_table(504) := 'th3\clwWidth1418\clcbpatraw21 \cellx6096\clvertalc'||wwv_flow.LF||
'\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \cl';
    wwv_flow_api.g_varchar2_table(505) := 'brdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat21\cltxlrtb\clftsWidth3\clwWidth1275\clcbpatraw21';
    wwv_flow_api.g_varchar2_table(506) := ' \cellx7371\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr'||wwv_flow.LF||
'\';
    wwv_flow_api.g_varchar2_table(507) := 'brdrs\brdrw10 \clcbpat21\cltxlrtb\clftsWidth3\clwWidth1276\clcbpatraw21 \cellx8647\clvertalc\clbrdrt';
    wwv_flow_api.g_varchar2_table(508) := '\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \clcbpat22\cltxl';
    wwv_flow_api.g_varchar2_table(509) := 'rtb\clftsWidth3\clwWidth1418\clcbpatraw22 \cellx10065'||wwv_flow.LF||
'\row \ltrrow}\trowd \irow1\irowband1\lastrow \';
    wwv_flow_api.g_varchar2_table(510) := 'ltrrow\ts17\trgaph70\trrh226\trleft-1134\trbrdrt\brdrs\brdrw10 \trbrdrl\brdrs\brdrw10 \trbrdrb\brdrs';
    wwv_flow_api.g_varchar2_table(511) := '\brdrw10 \trbrdrr\brdrs\brdrw10 \trbrdrh\brdrs\brdrw10 \trbrdrv\brdrs\brdrw10 '||wwv_flow.LF||
'\trftsWidth3\trwWidth';
    wwv_flow_api.g_varchar2_table(512) := '11199\trftsWidthB3\trftsWidthA3\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsi';
    wwv_flow_api.g_varchar2_table(513) := 'd11142185\tbllkhdrrows\tbllkhdrcols\tbllknocolband\tblind-1026\tblindtype3 \clvertalc\clbrdrt\brdrs\';
    wwv_flow_api.g_varchar2_table(514) := 'brdrw10 \clbrdrl\brdrs\brdrw10 '||wwv_flow.LF||
'\clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \cltxlrtb\clftsWidth3\';
    wwv_flow_api.g_varchar2_table(515) := 'clwWidth2694\clshdrawnil \cellx1560\clvertalt\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\';
    wwv_flow_api.g_varchar2_table(516) := 'brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \cltxlrtb\clftsWidth3\clwWidth3118\clshdrawnil '||wwv_flow.LF||
'\cellx4678\clve';
    wwv_flow_api.g_varchar2_table(517) := 'rtalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \cl';
    wwv_flow_api.g_varchar2_table(518) := 'txlrtb\clftsWidth3\clwWidth1418\clshdrawnil \cellx6096\clvertalt\clbrdrt\brdrs\brdrw10 \clbrdrl\brdr';
    wwv_flow_api.g_varchar2_table(519) := 's\brdrw10 \clbrdrb\brdrs\brdrw10 '||wwv_flow.LF||
'\clbrdrr\brdrs\brdrw10 \cltxlrtb\clftsWidth3\clwWidth1275\clshdraw';
    wwv_flow_api.g_varchar2_table(520) := 'nil \cellx7371\clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdr';
    wwv_flow_api.g_varchar2_table(521) := 'r\brdrs\brdrw10 \cltxlrtb\clftsWidth3\clwWidth1276\clshdrawnil \cellx8647\clvertalc'||wwv_flow.LF||
'\clbrdrt\brdrs\b';
    wwv_flow_api.g_varchar2_table(522) := 'rdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \cltxlrtb\clftsWidth3\cl';
    wwv_flow_api.g_varchar2_table(523) := 'wWidth1418\clshdrawnil \cellx10065\pard\plain \ltrpar'||wwv_flow.LF||
'\qc \li0\ri0\widctlpar\intbl\wrapdefault\aspal';
    wwv_flow_api.g_varchar2_table(524) := 'pha\aspnum\faauto\adjustright\rin0\lin0\pararsid8878196\yts17 \rtlch\fcs1 \af0\afs22\alang1025 \ltrc';
    wwv_flow_api.g_varchar2_table(525) := 'h\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\*\bkmkstart Texto274}'||wwv_flow.LF||
'{\fiel';
    wwv_flow_api.g_varchar2_table(526) := 'd\flddirty{\*\fldinst {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\cf9\insrsid4129472\charrsid11941190 ';
    wwv_flow_api.g_varchar2_table(527) := ' FORMTEXT }{\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\cf9\insrsid4129472\charrsid11941190 {\*\datafie';
    wwv_flow_api.g_varchar2_table(528) := 'ld '||wwv_flow.LF||
'800100000000000008546578746f3237340002462000000000000f3c3f7265663a78646f303030383f3e0000000000}{';
    wwv_flow_api.g_varchar2_table(529) := '\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto274}{\*\ffdeftext F }{\*\ffstatt';
    wwv_flow_api.g_varchar2_table(530) := 'ext <?ref:xdo0008?>}}}}}{\fldrslt {\rtlch\fcs1 \af0\afs16 '||wwv_flow.LF||
'\ltrch\fcs0 \fs16\cf9\lang1024\langfe1024';
    wwv_flow_api.g_varchar2_table(531) := '\noproof\insrsid4129472\charrsid11941190 F }}}\sectd \ltrsect\psz1\linex0\headery709\footery0\colsx7';
    wwv_flow_api.g_varchar2_table(532) := '08\endnhere\sectlinegrid360\sectdefaultcl\sectrsid13967392\sftnbj {\*\bkmkstart Texto275}{\*\bkmkend';
    wwv_flow_api.g_varchar2_table(533) := ' Texto274}'||wwv_flow.LF||
'{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid4129472\char';
    wwv_flow_api.g_varchar2_table(534) := 'rsid11941190  FORMTEXT }{\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid4129472\charrsid11941190 {\';
    wwv_flow_api.g_varchar2_table(535) := '*\datafield '||wwv_flow.LF||
'800100000000000008546578746f323735000f49444e54464343494f4e5f534a544f00000000000f3c3f726';
    wwv_flow_api.g_varchar2_table(536) := '5663a78646f303030393f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Te';
    wwv_flow_api.g_varchar2_table(537) := 'xto275}{\*\ffdeftext IDNTFCCION_SJTO}{\*\ffstattext <?ref:xdo0009?>}'||wwv_flow.LF||
'}}}}{\fldrslt {\rtlch\fcs1 \af0';
    wwv_flow_api.g_varchar2_table(538) := '\afs16 \ltrch\fcs0 \fs16\lang1024\langfe1024\noproof\insrsid4129472\charrsid11941190 IDNTFCCION_SJTO';
    wwv_flow_api.g_varchar2_table(539) := '}}}\sectd \ltrsect\psz1\linex0\headery709\footery0\colsx708\endnhere\sectlinegrid360\sectdefaultcl\s';
    wwv_flow_api.g_varchar2_table(540) := 'ectrsid13967392\sftnbj {'||wwv_flow.LF||
'\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid4129472 {\*\bkmkend Texto27';
    wwv_flow_api.g_varchar2_table(541) := '5}\cell }{\field\flddirty{\*\fldinst {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid4129472\charrs';
    wwv_flow_api.g_varchar2_table(542) := 'id4129472 {\*\bkmkstart Texto294} FORMTEXT }{\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 '||wwv_flow.LF||
'\fs16\insrsid412947';
    wwv_flow_api.g_varchar2_table(543) := '2\charrsid4129472 {\*\datafield 800100000000000008546578746f323934000e494d5053544f5f53424d5053544f00';
    wwv_flow_api.g_varchar2_table(544) := '000000000f3c3f7265663a78646f303030333f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftype';
    wwv_flow_api.g_varchar2_table(545) := 'txt0{\*\ffname Texto294}'||wwv_flow.LF||
'{\*\ffdeftext IMPSTO_SBMPSTO}{\*\ffstattext <?ref:xdo0003?>}}}}}{\fldrslt {';
    wwv_flow_api.g_varchar2_table(546) := '\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang1024\langfe1024\noproof\insrsid4129472\charrsid4129472 ';
    wwv_flow_api.g_varchar2_table(547) := 'IMPSTO_SBMPSTO}}}\sectd \ltrsect'||wwv_flow.LF||
'\psz1\linex0\headery709\footery0\colsx708\endnhere\sectlinegrid360\';
    wwv_flow_api.g_varchar2_table(548) := 'sectdefaultcl\sectrsid13967392\sftnbj {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid4129472\charr';
    wwv_flow_api.g_varchar2_table(549) := 'sid11941190 {\*\bkmkend Texto294}\cell {\*\bkmkstart Texto276}}'||wwv_flow.LF||
'{\field\flddirty{\*\fldinst {\rtlch\';
    wwv_flow_api.g_varchar2_table(550) := 'fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid4129472\charrsid11941190  FORMTEXT }{\rtlch\fcs1 \af0\afs16';
    wwv_flow_api.g_varchar2_table(551) := ' \ltrch\fcs0 \fs16\insrsid4129472\charrsid11941190 {\*\datafield '||wwv_flow.LF||
'800100000000000008546578746f323736';
    wwv_flow_api.g_varchar2_table(552) := '000b4e4d524f5f434e564e494f00000000000f3c3f7265663a78646f303031303f3e0000000000}{\*\formfield{\fftype';
    wwv_flow_api.g_varchar2_table(553) := '0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto276}{\*\ffdeftext NMRO_CNVNIO}{\*\ffstattext <?ref:x';
    wwv_flow_api.g_varchar2_table(554) := 'do0010?>}}}}'||wwv_flow.LF||
'}{\fldrslt {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang1024\langfe1024\noproof\insrsi';
    wwv_flow_api.g_varchar2_table(555) := 'd4129472\charrsid11941190 NMRO_CNVNIO}}}\sectd \ltrsect\psz1\linex0\headery709\footery0\colsx708\end';
    wwv_flow_api.g_varchar2_table(556) := 'nhere\sectlinegrid360\sectdefaultcl\sectrsid13967392\sftnbj {'||wwv_flow.LF||
'\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs';
    wwv_flow_api.g_varchar2_table(557) := '16\insrsid4129472 {\*\bkmkend Texto276}\cell }\pard \ltrpar\qc \li0\ri0\widctlpar\intbl\wrapdefault\';
    wwv_flow_api.g_varchar2_table(558) := 'aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid11941190\yts17 {\field\flddirty{\*\fldinst {\rt';
    wwv_flow_api.g_varchar2_table(559) := 'lch\fcs1 '||wwv_flow.LF||
'\af0\afs16 \ltrch\fcs0 \fs16\insrsid4129472\charrsid4129472 {\*\bkmkstart Texto295} FORMTE';
    wwv_flow_api.g_varchar2_table(560) := 'XT }{\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid4129472\charrsid4129472 {\*\datafield '||wwv_flow.LF||
'80010000';
    wwv_flow_api.g_varchar2_table(561) := '0000000008546578746f323935000b464348415f534c4354554400000000000f3c3f7265663a78646f303031363f3e000000';
    wwv_flow_api.g_varchar2_table(562) := '0000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto295}{\*\ffdeftext FCHA_SLC';
    wwv_flow_api.g_varchar2_table(563) := 'TUD}{\*\ffstattext <?ref:xdo0016?>}}}}'||wwv_flow.LF||
'}{\fldrslt {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang1024';
    wwv_flow_api.g_varchar2_table(564) := '\langfe1024\noproof\insrsid4129472\charrsid4129472 FCHA_SLCTUD}}}\sectd \ltrsect\psz1\linex0\headery';
    wwv_flow_api.g_varchar2_table(565) := '709\footery0\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid13967392\sftnbj {'||wwv_flow.LF||
'\rtlch\fcs1 \';
    wwv_flow_api.g_varchar2_table(566) := 'af0\afs16 \ltrch\fcs0 \fs16\insrsid4129472\charrsid11941190 {\*\bkmkend Texto295}\cell }{\field{\*\f';
    wwv_flow_api.g_varchar2_table(567) := 'ldinst {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid4129472 {\*\bkmkstart Texto296} FORMTEXT }{\';
    wwv_flow_api.g_varchar2_table(568) := 'rtlch\fcs1 \af0\afs16 \ltrch\fcs0 '||wwv_flow.LF||
'\fs16\insrsid4129472 {\*\datafield 800300000000000008546578746f32';
    wwv_flow_api.g_varchar2_table(569) := '39360006564e4344415300000000000f3c3f7265663a78646f303031313f3e0000000000}{\*\formfield{\fftype0\ffow';
    wwv_flow_api.g_varchar2_table(570) := 'nhelp\ffownstat\ffprot\fftypetxt0{\*\ffname Texto296}{\*\ffdeftext VNCDAS}{\*\ffstattext '||wwv_flow.LF||
'<?ref:xdo0';
    wwv_flow_api.g_varchar2_table(571) := '011?>}}}}}{\fldrslt {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang1024\langfe1024\noproof\insrsid412';
    wwv_flow_api.g_varchar2_table(572) := '9472 VNCDAS}}}\sectd \ltrsect\psz1\linex0\headery709\footery0\colsx708\endnhere\sectlinegrid360\sect';
    wwv_flow_api.g_varchar2_table(573) := 'defaultcl\sectrsid13967392\sftnbj {'||wwv_flow.LF||
'\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid4129472 {\*\bkmk';
    wwv_flow_api.g_varchar2_table(574) := 'end Texto296}\cell }\pard \ltrpar\qr \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adj';
    wwv_flow_api.g_varchar2_table(575) := 'ustright\rin0\lin0\pararsid11941190\yts17 {\*\bkmkstart Texto280}'||wwv_flow.LF||
'{\field\flddirty{\*\fldinst {\rtlc';
    wwv_flow_api.g_varchar2_table(576) := 'h\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid4129472\charrsid11941190  FORMTEXT }{\rtlch\fcs1 \af0\afs';
    wwv_flow_api.g_varchar2_table(577) := '16 \ltrch\fcs0 \fs16\insrsid4129472\charrsid11941190 {\*\datafield '||wwv_flow.LF||
'800100000000000008546578746f3238';
    wwv_flow_api.g_varchar2_table(578) := '3000075454414c5f415000000000000f3c3f7265663a78646f303031343f3e0000000000}{\*\formfield{\fftype0\ffow';
    wwv_flow_api.g_varchar2_table(579) := 'nhelp\ffownstat\fftypetxt0{\*\ffname Texto280}{\*\ffdeftext TTAL_AP}{\*\ffstattext <?ref:xdo0014?>}}';
    wwv_flow_api.g_varchar2_table(580) := '}}}{\fldrslt {'||wwv_flow.LF||
'\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\lang1024\langfe1024\noproof\insrsid4129472\c';
    wwv_flow_api.g_varchar2_table(581) := 'harrsid11941190 TTAL_AP}}}\sectd \ltrsect\psz1\linex0\headery709\footery0\colsx708\endnhere\sectline';
    wwv_flow_api.g_varchar2_table(582) := 'grid360\sectdefaultcl\sectrsid13967392\sftnbj {\*\bkmkstart Texto281}'||wwv_flow.LF||
'{\*\bkmkend Texto280}{\field\f';
    wwv_flow_api.g_varchar2_table(583) := 'lddirty{\*\fldinst {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\cf9\insrsid4129472\charrsid11941190  FO';
    wwv_flow_api.g_varchar2_table(584) := 'RMTEXT }{\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\cf9\insrsid4129472\charrsid11941190 {\*\datafield ';
    wwv_flow_api.g_varchar2_table(585) := ''||wwv_flow.LF||
'800100000000000008546578746f3238310002204500000000000f3c3f7265663a78646f303031353f3e0000000000}{\*\';
    wwv_flow_api.g_varchar2_table(586) := 'formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto281}{\*\ffdeftext  E}{\*\ffstattext';
    wwv_flow_api.g_varchar2_table(587) := ' <?ref:xdo0015?>}}}}}{\fldrslt {\rtlch\fcs1 \af0\afs16 '||wwv_flow.LF||
'\ltrch\fcs0 \fs16\cf9\lang1024\langfe1024\no';
    wwv_flow_api.g_varchar2_table(588) := 'proof\insrsid4129472\charrsid11941190  E}}}\sectd \ltrsect\psz1\linex0\headery709\footery0\colsx708\';
    wwv_flow_api.g_varchar2_table(589) := 'endnhere\sectlinegrid360\sectdefaultcl\sectrsid13967392\sftnbj {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 '||wwv_flow.LF||
'';
    wwv_flow_api.g_varchar2_table(590) := '\fs16\insrsid4129472 {\*\bkmkend Texto281}\cell }\pard\plain \ltrpar\ql \li0\ri0\sa160\sl259\slmult1';
    wwv_flow_api.g_varchar2_table(591) := '\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0 \rtlch\fcs1 \af0\afs22\ala';
    wwv_flow_api.g_varchar2_table(592) := 'ng1025 \ltrch\fcs0 '||wwv_flow.LF||
'\f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\langfenp1033 {\rtlch\fcs1 \af0';
    wwv_flow_api.g_varchar2_table(593) := '\afs16 \ltrch\fcs0 \fs16\insrsid11142185 \trowd \irow1\irowband1\lastrow \ltrrow\ts17\trgaph70\trrh2';
    wwv_flow_api.g_varchar2_table(594) := '26\trleft-1134\trbrdrt\brdrs\brdrw10 \trbrdrl\brdrs\brdrw10 \trbrdrb'||wwv_flow.LF||
'\brdrs\brdrw10 \trbrdrr\brdrs\b';
    wwv_flow_api.g_varchar2_table(595) := 'rdrw10 \trbrdrh\brdrs\brdrw10 \trbrdrv\brdrs\brdrw10 '||wwv_flow.LF||
'\trftsWidth3\trwWidth11199\trftsWidthB3\trftsW';
    wwv_flow_api.g_varchar2_table(596) := 'idthA3\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid11142185\tbllkhdrrows\tb';
    wwv_flow_api.g_varchar2_table(597) := 'llkhdrcols\tbllknocolband\tblind-1026\tblindtype3 \clvertalc\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\br';
    wwv_flow_api.g_varchar2_table(598) := 'drw10 '||wwv_flow.LF||
'\clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \cltxlrtb\clftsWidth3\clwWidth2694\clshdrawnil ';
    wwv_flow_api.g_varchar2_table(599) := '\cellx1560\clvertalt\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\br';
    wwv_flow_api.g_varchar2_table(600) := 'drs\brdrw10 \cltxlrtb\clftsWidth3\clwWidth3118\clshdrawnil '||wwv_flow.LF||
'\cellx4678\clvertalc\clbrdrt\brdrs\brdrw';
    wwv_flow_api.g_varchar2_table(601) := '10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \cltxlrtb\clftsWidth3\clwWid';
    wwv_flow_api.g_varchar2_table(602) := 'th1418\clshdrawnil \cellx6096\clvertalt\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\';
    wwv_flow_api.g_varchar2_table(603) := 'brdrw10 '||wwv_flow.LF||
'\clbrdrr\brdrs\brdrw10 \cltxlrtb\clftsWidth3\clwWidth1275\clshdrawnil \cellx7371\clvertalc\';
    wwv_flow_api.g_varchar2_table(604) := 'clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brdrw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \cltxlrtb';
    wwv_flow_api.g_varchar2_table(605) := '\clftsWidth3\clwWidth1276\clshdrawnil \cellx8647\clvertalc'||wwv_flow.LF||
'\clbrdrt\brdrs\brdrw10 \clbrdrl\brdrs\brd';
    wwv_flow_api.g_varchar2_table(606) := 'rw10 \clbrdrb\brdrs\brdrw10 \clbrdrr\brdrs\brdrw10 \cltxlrtb\clftsWidth3\clwWidth1418\clshdrawnil \c';
    wwv_flow_api.g_varchar2_table(607) := 'ellx10065\row }\pard \ltrpar'||wwv_flow.LF||
'\ql \li0\ri0\widctlpar\wrapdefault\aspalpha\aspnum\faauto\adjustright\r';
    wwv_flow_api.g_varchar2_table(608) := 'in0\lin0\itap0\pararsid1652526 {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 \fs16\insrsid3866869 '||wwv_flow.LF||
'\par \ltrro';
    wwv_flow_api.g_varchar2_table(609) := 'w}\trowd \irow0\irowband0\lastrow \ltrrow\ts17\trgaph70\trrh268\trleft-1134\trbrdrt\brdrs\brdrw10\br';
    wwv_flow_api.g_varchar2_table(610) := 'drcf23 \trbrdrl\brdrs\brdrw10\brdrcf23 \trbrdrb\brdrs\brdrw10\brdrcf23 \trbrdrr\brdrs\brdrw10\brdrcf';
    wwv_flow_api.g_varchar2_table(611) := '23 \trbrdrh\brdrs\brdrw10\brdrcf23 \trbrdrv'||wwv_flow.LF||
'\brdrs\brdrw10\brdrcf23 \trftsWidth3\trwWidth11199\trfts';
    wwv_flow_api.g_varchar2_table(612) := 'WidthB3\trautofit1\trpaddl108\trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid14500887\tbl';
    wwv_flow_api.g_varchar2_table(613) := 'lkhdrrows\tbllkhdrcols\tbllknocolband\tblind-1026\tblindtype3 \clvertalt\clbrdrt'||wwv_flow.LF||
'\brdrs\brdrw10\brdr';
    wwv_flow_api.g_varchar2_table(614) := 'cf23 \clbrdrl\brdrs\brdrw10\brdrcf23 \clbrdrb\brdrs\brdrw10\brdrcf23 \clbrdrr\brdrs\brdrw10\brdrcf23';
    wwv_flow_api.g_varchar2_table(615) := ' \clcbpat24\cltxlrtb\clftsWidth3\clwWidth9639\clcbpatraw24 \cellx8505\clvertalt\clbrdrt\brdrs\brdrw1';
    wwv_flow_api.g_varchar2_table(616) := '0\brdrcf23 \clbrdrl'||wwv_flow.LF||
'\brdrs\brdrw10\brdrcf23 \clbrdrb\brdrs\brdrw10\brdrcf23 \clbrdrr\brdrs\brdrw10\b';
    wwv_flow_api.g_varchar2_table(617) := 'rdrcf23 \clcbpat24\cltxlrtb\clftsWidth3\clwWidth1560\clcbpatraw24 \cellx10065\pard\plain \ltrpar'||wwv_flow.LF||
'\ql';
    wwv_flow_api.g_varchar2_table(618) := ' \li0\ri0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid1652526\y';
    wwv_flow_api.g_varchar2_table(619) := 'ts17 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\';
    wwv_flow_api.g_varchar2_table(620) := 'langfenp1033 {\rtlch\fcs1 \ab\af0\afs16 \ltrch\fcs0 '||wwv_flow.LF||
'\b\fs16\cf23\insrsid14500887\charrsid3866869 TO';
    wwv_flow_api.g_varchar2_table(621) := 'TAL}{\rtlch\fcs1 \ab\af0\afs16 \ltrch\fcs0 \b\fs16\cf23\insrsid14500887  ACUERDOS DE PAGO}{\rtlch\fc';
    wwv_flow_api.g_varchar2_table(622) := 's1 \ab\af0\afs16 \ltrch\fcs0 \b\fs16\cf23\insrsid14500887\charrsid3866869 : {\*\bkmkstart Texto288}}';
    wwv_flow_api.g_varchar2_table(623) := ''||wwv_flow.LF||
'{\field\flddirty{\*\fldinst {\rtlch\fcs1 \ab\af0\afs16 \ltrch\fcs0 \b\fs16\cf23\insrsid14500887\cha';
    wwv_flow_api.g_varchar2_table(624) := 'rrsid3866869  FORMTEXT }{\rtlch\fcs1 \ab\af0\afs16 \ltrch\fcs0 \b\fs16\cf23\insrsid14500887\charrsid';
    wwv_flow_api.g_varchar2_table(625) := '3866869 {\*\datafield '||wwv_flow.LF||
'800100000000000008546578746f3238380002462000000000000f3c3f7265663a78646f30303';
    wwv_flow_api.g_varchar2_table(626) := '2303f3e0000000000}{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto288}{\*\ffdef';
    wwv_flow_api.g_varchar2_table(627) := 'text F }{\*\ffstattext <?ref:xdo0020?>}}}}}{\fldrslt {\rtlch\fcs1 '||wwv_flow.LF||
'\ab\af0\afs16 \ltrch\fcs0 \b\fs16';
    wwv_flow_api.g_varchar2_table(628) := '\cf23\lang1024\langfe1024\noproof\insrsid14500887\charrsid3866869 F }}}\sectd \ltrsect\psz1\linex0\h';
    wwv_flow_api.g_varchar2_table(629) := 'eadery709\footery0\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid13967392\sftnbj {\*\bkmks';
    wwv_flow_api.g_varchar2_table(630) := 'tart Texto289}'||wwv_flow.LF||
'{\*\bkmkend Texto288}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \ab\af0\afs16 \ltrch\fc';
    wwv_flow_api.g_varchar2_table(631) := 's0 \b\fs16\cf23\insrsid14500887\charrsid3866869  FORMTEXT }{\rtlch\fcs1 \ab\af0\afs16 \ltrch\fcs0 \b';
    wwv_flow_api.g_varchar2_table(632) := '\fs16\cf23\insrsid14500887\charrsid3866869 {\*\datafield '||wwv_flow.LF||
'800100000000000008546578746f323839000b5454';
    wwv_flow_api.g_varchar2_table(633) := '4c415f414352444f5300000000000f3c3f7265663a78646f303032313f3e0000000000}{\*\formfield{\fftype0\ffownh';
    wwv_flow_api.g_varchar2_table(634) := 'elp\ffownstat\fftypetxt0{\*\ffname Texto289}{\*\ffdeftext TTLA_ACRDOS}{\*\ffstattext <?ref:xdo0021?>';
    wwv_flow_api.g_varchar2_table(635) := '}}}}'||wwv_flow.LF||
'}{\fldrslt {\rtlch\fcs1 \ab\af0\afs16 \ltrch\fcs0 \b\fs16\cf23\lang1024\langfe1024\noproof\insr';
    wwv_flow_api.g_varchar2_table(636) := 'sid14500887\charrsid3866869 TTLA_ACRDOS}}}\sectd \ltrsect'||wwv_flow.LF||
'\psz1\linex0\headery709\footery0\colsx708\';
    wwv_flow_api.g_varchar2_table(637) := 'endnhere\sectlinegrid360\sectdefaultcl\sectrsid13967392\sftnbj {\rtlch\fcs1 \ab\af0\afs16 \ltrch\fcs';
    wwv_flow_api.g_varchar2_table(638) := '0 \b\fs16\cf23\insrsid14500887\charrsid3866869 {\*\bkmkend Texto289}\cell }\pard \ltrpar'||wwv_flow.LF||
'\qr \li0\ri';
    wwv_flow_api.g_varchar2_table(639) := '0\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\lin0\pararsid13449544\yts17 {\';
    wwv_flow_api.g_varchar2_table(640) := '*\bkmkstart Texto292}{\field\flddirty{\*\fldinst {\rtlch\fcs1 \ab\af0\afs16 \ltrch\fcs0 \b\fs16\cf23';
    wwv_flow_api.g_varchar2_table(641) := '\insrsid14500887\charrsid3866869  FORMTEXT }'||wwv_flow.LF||
'{\rtlch\fcs1 \ab\af0\afs16 \ltrch\fcs0 \b\fs16\cf23\ins';
    wwv_flow_api.g_varchar2_table(642) := 'rsid14500887\charrsid3866869 {\*\datafield 800100000000000008546578746f32393200075454414c5f415000000';
    wwv_flow_api.g_varchar2_table(643) := '000000f3c3f7265663a78646f303032343f3e0000000000}'||wwv_flow.LF||
'{\*\formfield{\fftype0\ffownhelp\ffownstat\fftypetx';
    wwv_flow_api.g_varchar2_table(644) := 't0{\*\ffname Texto292}{\*\ffdeftext TTAL_AP}{\*\ffstattext <?ref:xdo0024?>}}}}}{\fldrslt {\rtlch\fcs';
    wwv_flow_api.g_varchar2_table(645) := '1 \ab\af0\afs16 \ltrch\fcs0 \b\fs16\cf23\lang1024\langfe1024\noproof\insrsid14500887\charrsid3866869';
    wwv_flow_api.g_varchar2_table(646) := ' '||wwv_flow.LF||
'TTAL_AP}}}\sectd \ltrsect\psz1\linex0\headery709\footery0\colsx708\endnhere\sectlinegrid360\sectde';
    wwv_flow_api.g_varchar2_table(647) := 'faultcl\sectrsid13967392\sftnbj {\*\bkmkstart Texto293}{\*\bkmkend Texto292}{\field\flddirty{\*\fldi';
    wwv_flow_api.g_varchar2_table(648) := 'nst {\rtlch\fcs1 \ab\af0\afs16 \ltrch\fcs0 '||wwv_flow.LF||
'\b\fs16\cf23\insrsid14500887\charrsid3866869  FORMTEXT }';
    wwv_flow_api.g_varchar2_table(649) := '{\rtlch\fcs1 \ab\af0\afs16 \ltrch\fcs0 \b\fs16\cf23\insrsid14500887\charrsid3866869 {\*\datafield 80';
    wwv_flow_api.g_varchar2_table(650) := '0100000000000008546578746f3239330002204500000000000f3c3f7265663a78646f303032353f3e0000000000}'||wwv_flow.LF||
'{\*\fo';
    wwv_flow_api.g_varchar2_table(651) := 'rmfield{\fftype0\ffownhelp\ffownstat\fftypetxt0{\*\ffname Texto293}{\*\ffdeftext  E}{\*\ffstattext <';
    wwv_flow_api.g_varchar2_table(652) := '?ref:xdo0025?>}}}}}{\fldrslt {\rtlch\fcs1 \ab\af0\afs16 \ltrch\fcs0 \b\fs16\cf23\lang1024\langfe1024';
    wwv_flow_api.g_varchar2_table(653) := '\noproof\insrsid14500887\charrsid3866869  E}}}'||wwv_flow.LF||
'\sectd \ltrsect\psz1\linex0\headery709\footery0\colsx';
    wwv_flow_api.g_varchar2_table(654) := '708\endnhere\sectlinegrid360\sectdefaultcl\sectrsid13967392\sftnbj {\rtlch\fcs1 \ab\af0\afs16 \ltrch';
    wwv_flow_api.g_varchar2_table(655) := '\fcs0 \b\fs16\cf23\insrsid14500887\charrsid3866869 {\*\bkmkend Texto293}\cell }\pard\plain \ltrpar'||wwv_flow.LF||
'\';
    wwv_flow_api.g_varchar2_table(656) := 'ql \li0\ri0\sa160\sl259\slmult1\widctlpar\intbl\wrapdefault\aspalpha\aspnum\faauto\adjustright\rin0\';
    wwv_flow_api.g_varchar2_table(657) := 'lin0 \rtlch\fcs1 \af0\afs22\alang1025 \ltrch\fcs0 \f31506\fs22\lang9226\langfe1033\cgrid\langnp9226\';
    wwv_flow_api.g_varchar2_table(658) := 'langfenp1033 {\rtlch\fcs1 \af0\afs16 \ltrch\fcs0 '||wwv_flow.LF||
'\fs16\insrsid14500887 \trowd \irow0\irowband0\last';
    wwv_flow_api.g_varchar2_table(659) := 'row \ltrrow\ts17\trgaph70\trrh268\trleft-1134\trbrdrt\brdrs\brdrw10\brdrcf23 \trbrdrl\brdrs\brdrw10\';
    wwv_flow_api.g_varchar2_table(660) := 'brdrcf23 \trbrdrb\brdrs\brdrw10\brdrcf23 \trbrdrr\brdrs\brdrw10\brdrcf23 \trbrdrh\brdrs\brdrw10\brdr';
    wwv_flow_api.g_varchar2_table(661) := 'cf23 '||wwv_flow.LF||
'\trbrdrv\brdrs\brdrw10\brdrcf23 \trftsWidth3\trwWidth11199\trftsWidthB3\trautofit1\trpaddl108\';
    wwv_flow_api.g_varchar2_table(662) := 'trpaddr108\trpaddfl3\trpaddft3\trpaddfb3\trpaddfr3\tblrsid14500887\tbllkhdrrows\tbllkhdrcols\tbllkno';
    wwv_flow_api.g_varchar2_table(663) := 'colband\tblind-1026\tblindtype3 \clvertalt\clbrdrt'||wwv_flow.LF||
'\brdrs\brdrw10\brdrcf23 \clbrdrl\brdrs\brdrw10\br';
    wwv_flow_api.g_varchar2_table(664) := 'drcf23 \clbrdrb\brdrs\brdrw10\brdrcf23 \clbrdrr\brdrs\brdrw10\brdrcf23 \clcbpat24\cltxlrtb\clftsWidt';
    wwv_flow_api.g_varchar2_table(665) := 'h3\clwWidth9639\clcbpatraw24 \cellx8505\clvertalt\clbrdrt\brdrs\brdrw10\brdrcf23 \clbrdrl'||wwv_flow.LF||
'\brdrs\brd';
    wwv_flow_api.g_varchar2_table(666) := 'rw10\brdrcf23 \clbrdrb\brdrs\brdrw10\brdrcf23 \clbrdrr\brdrs\brdrw10\brdrcf23 \clcbpat24\cltxlrtb\cl';
    wwv_flow_api.g_varchar2_table(667) := 'ftsWidth3\clwWidth1560\clcbpatraw24 \cellx10065\row }\pard \ltrpar'||wwv_flow.LF||
'\ql \li0\ri0\widctlpar\wrapdefaul';
    wwv_flow_api.g_varchar2_table(668) := 't\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0\pararsid1652526 {\rtlch\fcs1 \af0\afs16 \ltrch\';
    wwv_flow_api.g_varchar2_table(669) := 'fcs0 \fs16\insrsid3866869 '||wwv_flow.LF||
'\par '||wwv_flow.LF||
'\par }{\*\themedata 504b030414000600080000002100e9de0fbfff0000001c0';
    wwv_flow_api.g_varchar2_table(670) := '20000130000005b436f6e74656e745f54797065735d2e786d6cac91cb4ec3301045f748fc83e52d4a'||wwv_flow.LF||
'9cb2400825e982c78e';
    wwv_flow_api.g_varchar2_table(671) := 'c7a27cc0c8992416c9d8b2a755fbf74cd25442a820166c2cd933f79e3be372bd1f07b5c3989ca74aaff2422b24eb1b475da5';
    wwv_flow_api.g_varchar2_table(672) := 'df374fd9ad'||wwv_flow.LF||
'5689811a183c61a50f98f4babebc2837878049899a52a57be670674cb23d8e90721f90a4d2fa3802cb3576268';
    wwv_flow_api.g_varchar2_table(673) := '0fd800ecd7551dc18eb899138e3c943d7e503b6'||wwv_flow.LF||
'b01d583deee5f99824e290b4ba3f364eac4a430883b3c092d4eca8f946c9';
    wwv_flow_api.g_varchar2_table(674) := '16422ecab927f52ea42b89a1cd59c254f919b0e85e6535d135a8de20f20b8c12c3b0'||wwv_flow.LF||
'0c895fcf6720192de6bf3b9e89ecdbd';
    wwv_flow_api.g_varchar2_table(675) := '6596cbcdd8eb28e7c365ecc4ec1ff1460f53fe813d3cc7f5b7f020000ffff0300504b030414000600080000002100a5d6'||wwv_flow.LF||
'a7';
    wwv_flow_api.g_varchar2_table(676) := 'e7c0000000360100000b0000005f72656c732f2e72656c73848fcf6ac3300c87ef85bd83d17d51d2c31825762fa590432fa3';
    wwv_flow_api.g_varchar2_table(677) := '7d00e1287f68221bdb1bebdb4f'||wwv_flow.LF||
'c7060abb0884a4eff7a93dfeae8bf9e194e720169aaa06c3e2433fcb68e1763dbf7f82c98';
    wwv_flow_api.g_varchar2_table(678) := '5a4a725085b787086a37bdbb55fbc50d1a33ccd311ba548b6309512'||wwv_flow.LF||
'0f88d94fbc52ae4264d1c910d24a45db3462247fa791';
    wwv_flow_api.g_varchar2_table(679) := '715fd71f989e19e0364cd3f51652d73760ae8fa8c9ffb3c330cc9e4fc17faf2ce545046e37944c69e462'||wwv_flow.LF||
'a1a82fe353bd90a';
    wwv_flow_api.g_varchar2_table(680) := '865aad41ed0b5b8f9d6fd010000ffff0300504b0304140006000800000021006b799616830000008a0000001c00000074686';
    wwv_flow_api.g_varchar2_table(681) := '56d652f746865'||wwv_flow.LF||
'6d652f7468656d654d616e616765722e786d6c0ccc4d0ac3201040e17da17790d93763bb284562b2cbaebb';
    wwv_flow_api.g_varchar2_table(682) := 'f600439c1a41c7a0d29fdbd7e5e38337cedf14d59b'||wwv_flow.LF||
'4b0d592c9c070d8a65cd2e88b7f07c2ca71ba8da481cc52c6ce1c715e';
    wwv_flow_api.g_varchar2_table(683) := '6e97818c9b48d13df49c873517d23d59085adb5dd20d6b52bd521ef2cdd5eb9246a3d8b'||wwv_flow.LF||
'4757e8d3f729e245eb2b260a0238';
    wwv_flow_api.g_varchar2_table(684) := 'fd010000ffff0300504b030414000600080000002100a7259ef29c070000cb200000160000007468656d652f7468656d652f';
    wwv_flow_api.g_varchar2_table(685) := ''||wwv_flow.LF||
'7468656d65312e786d6cec59cd8b1bc915bf07f23f347d97f5d5ad8fc1f2a24fcfda33b6b164873dd648a5eef2547789aad';
    wwv_flow_api.g_varchar2_table(686) := '28cc56208de532e81c026e49085bd'||wwv_flow.LF||
'ed21842cecc22eb9e48f31d8249b3f22afaa5bdd5552c99e191c3061463074977eefd5';
    wwv_flow_api.g_varchar2_table(687) := 'afde7bf5de53d5ddcf5e26d4bbc05c1096f6fcfa9d9aefe174ce16248d'||wwv_flow.LF||
'7afeb3d9a4d2f13d2151ba4094a5b8e76fb0f03fb';
    wwv_flow_api.g_varchar2_table(688) := 'bf7eb5fdd454732c609f6403e1547a8e7c752ae8eaa5531876124eeb0154ee1bb25e30992f0caa3ea82a34b'||wwv_flow.LF||
'd09bd06aa356';
    wwv_flow_api.g_varchar2_table(689) := '6b55134452df4b51026a6720e32db0f778b92473ecdfdbaa1f53982395420dcc299f2ae5389731b08bf3ba42888d1852ee5d';
    wwv_flow_api.g_varchar2_table(690) := '20daf361a605bb9c'||wwv_flow.LF||
'e197d2f7281212bee8f935fde757efddada2a35c88ca03b286dc44ffe572b9c0e2bca1e7e4d15931691';
    wwv_flow_api.g_varchar2_table(691) := '08441ab5fe8d7002af771e3f6b8356e15fa3400cde7b0'||wwv_flow.LF||
'd28c8badb3dd180639d600658f0edda3f6a859b7f086fee61ee77e';
    wwv_flow_api.g_varchar2_table(692) := 'a83e165e8332fdc11e7e321982152dbc0665f8700f1f0eba8391ad5f83327c6b0fdfaef547'||wwv_flow.LF||
'41dbd2af413125e9f91eba16b';
    wwv_flow_api.g_varchar2_table(693) := '69ac3ed6a0bc892d16327bc1b06937623575ea2201a8ae852532c592a0fc55a825e303e018002522449eac9cd0a2fd11ce27';
    wwv_flow_api.g_varchar2_table(694) := '888'||wwv_flow.LF||
'2839e3c43b21510c81b7422913305c6bd426b526fc579f403f698fa2238c0c69c50b9888bd21c5c713734e56b2e73f00';
    wwv_flow_api.g_varchar2_table(695) := 'adbe0179fbf3cf6f5efff8e6f54f6fbe'||wwv_flow.LF||
'faeacdebbfe7736b5596dc314a2353ee97effef09f6f7eebfdfb876f7ff9fa8fd9d';
    wwv_flow_api.g_varchar2_table(696) := '4bb7861e2dffded77effef1cff7a9871597a678fba7efdffdf8fddb3ffffe'||wwv_flow.LF||
'5f7ffddaa1bdcfd199099f91040bef11bef49e';
    wwv_flow_api.g_varchar2_table(697) := 'b20416e8e08fcff8f524663122a6443f8d044a919ac5a17f2c630bfd68832872e006d8b6e3730ea9c605bcbf7e'||wwv_flow.LF||
'61119ec67';
    wwv_flow_api.g_varchar2_table(698) := 'c2d8943e3c338b180a78cd101e34e2b3c547319669eadd3c83d395f9bb8a7085db8e61ea2d4f2f278bd821c4b5c2a8731b66';
    wwv_flow_api.g_varchar2_table(699) := '83ea1289528c229969e'||wwv_flow.LF||
'fa8e9d63ec58dd178458763d2573ce045b4aef0be20d10719a6446ceac682a858e49027ed9b80882';
    wwv_flow_api.g_varchar2_table(700) := 'bf2ddb9c3ef7068cba563dc2173612f606a20ef2334c2d33'||wwv_flow.LF||
'de476b891297ca194aa869f013246317c9e986cf4ddc5848f07';
    wwv_flow_api.g_varchar2_table(701) := '48429f3c60b2c844be63187f51a4e7f0869c6edf653ba496c2497e4dca5f30431662247ec7c18'||wwv_flow.LF||
'a364e5c24e491a9bd8cfc5';
    wwv_flow_api.g_varchar2_table(702) := '398428f29e30e9829f327b87a877f0034a0fbafb39c196bb3f9c0d9e418635299501a2be5973872fef6366c5ef74439708bb';
    wwv_flow_api.g_varchar2_table(703) := '524d9f'||wwv_flow.LF||
'27568aed73e28c8ec13ab242fb04638a2ed10263efd9e70e0603b6b26c5e927e10435639c6aec07a80ec5855ef291';
    wwv_flow_api.g_varchar2_table(704) := '6d8d3cdcd7e9e3c21c20ad9298ed8013ea7'||wwv_flow.LF||
'9b9dc4b3416982f821cd8fc0eba6cdc750ea1257003ca6f37313f888401708f1';
    wwv_flow_api.g_varchar2_table(705) := 'e234ca63013a8ce03ea8f5498cac02a6de853b5e37dcf2df55f618eccb17168d'||wwv_flow.LF||
'2bec4b90c1d79681c46ecabcd7363344ad0';
    wwv_flow_api.g_varchar2_table(706) := '9ca809921e8325ce916442cf79722aab86ab1b5536e696fdad20dd01d594d4f42d20f76403bbd4ff8bfeb7da0c378'||wwv_flow.LF||
'fb976f';
    wwv_flow_api.g_varchar2_table(707) := '1c9bede3f43b6ec556b2ba66a77328991ceff4378770bb5dcd90f105f9f49b9a115aa74f30d491fd8c75dbd3dcf634feff7d';
    wwv_flow_api.g_varchar2_table(708) := '4f73683fdf763287fa8ddb'||wwv_flow.LF||
'4ec6870ee3b693c90f573e4e2753362fd0d7a8038feca0471ffb24074f7d9684d2a9dc507c22f';
    wwv_flow_api.g_varchar2_table(709) := '4c18f80df338b090c2a397de6898b53c0550c8faaccc104162e'||wwv_flow.LF||
'e248cb789cc9df10194f63b482d3a1baaf944422571d096f';
    wwv_flow_api.g_varchar2_table(710) := 'c5041c1ae961a76e85a7ebe4942db2c3ce7a5d1d6c66955520598ed7c2621c0eaa64866eb5cb03bc'||wwv_flow.LF||
'42bd661be983d62d012';
    wwv_flow_api.g_varchar2_table(711) := '57b1d12c6643689a683447b3ba88ca48f75c1680e127a651f8545d7c1a2a3d46f5db5c702a8155e811fdc1efc4ceff961002';
    wwv_flow_api.g_varchar2_table(712) := '22004e771'||wwv_flow.LF||
'd09c2f949f32576fbdab9df9313d7dc89856044083bd8d80d2d35dc5f5e0f2d4eab250bb82a72d1246b8d924b4';
    wwv_flow_api.g_varchar2_table(713) := '6574832762f8199c47a71abd0a8debfaba5bba'||wwv_flow.LF||
'd4a2a74ca1e783d02a69b43bef6371535f83dc6e6ea0a9992968ea5df6fc5';
    wwv_flow_api.g_varchar2_table(714) := '633849099a355cf5fc2a1313c262b881da17e73211ac1ddcb5cf26cc3df24b3acb8'||wwv_flow.LF||
'902324e2cce03ae964d9202112738f92';
    wwv_flow_api.g_varchar2_table(715) := 'a4e7abe5176ea0a9ce219a5bbd0109e19325d785b4f2a99103a7db4ec6cb259e4bd3edc688b274f60a193ecb15ce6fb5'||wwv_flow.LF||
'f8c';
    wwv_flow_api.g_varchar2_table(716) := 'dc14a92adc1ddd37871e99dd1357f8a20c4c2765d19704104dc1dd4336b2e085c861589ac8cbf9dc294a75df3364ac750368';
    wwv_flow_api.g_varchar2_table(717) := 'ee82a46794531937906d7a9bc'||wwv_flow.LF||
'a0a3df0a1b186ff99ac1a08649f2427816a9026b1ad5aaa645d5c8381cacba1f1652963392';
    wwv_flow_api.g_varchar2_table(718) := '665933adaca2aaa63b8b59336ccbc08e2d6f56e40d565b13434e33'||wwv_flow.LF||
'2b7c96ba77536e779beb76fa84a24a80c10bfb39aaee1';
    wwv_flow_api.g_varchar2_table(719) := '50a8241ad9ccca2a618efa76195b3f351bb766c17f8016a57291246d66f6dd5eed8ada811cee960f046'||wwv_flow.LF||
'951fe476a3168696';
    wwv_flow_api.g_varchar2_table(720) := 'dbbe525b5adf9b9b17dbecec05248f1174b96b2a8576255c5b73040dd154f72459da802df252e65b039ebc35273dffcb5ad8';
    wwv_flow_api.g_varchar2_table(721) := '0f868d7058a9'||wwv_flow.LF||
'75c271256806b54a27ec372bfd306cd6c761bd361a345e41619171520fb33bfb095c60d04d7e73afc7f76ee';
    wwv_flow_api.g_varchar2_table(722) := 'f93ed1dcd9d394baa4cdfca5735717d7b5f6f58b7'||wwv_flow.LF||
'f7d94dbc375397f3be4720e97cd96a4cbacdeea055e936fb934a301a74';
    wwv_flow_api.g_varchar2_table(723) := '2add616b5019b586edd164340c3bddc92bdfbbd0e0a0df1c06ad71a7d2aa0f8795a055'||wwv_flow.LF||
'53f43bdd4a3b6834fa41bbdf1907f';
    wwv_flow_api.g_varchar2_table(724) := 'd57791b032bcfd2476e0b30afe675efbf000000ffff0300504b0304140006000800000021000dd1909fb60000001b010000'||wwv_flow.LF||
'';
    wwv_flow_api.g_varchar2_table(725) := '270000007468656d652f7468656d652f5f72656c732f7468656d654d616e616765722e786d6c2e72656c73848f4d0ac23014';
    wwv_flow_api.g_varchar2_table(726) := '84f78277086f6fd3ba109126dd88'||wwv_flow.LF||
'd0add40384e4350d363f2451eced0dae2c082e8761be9969bb979dc9136332de3168aa1';
    wwv_flow_api.g_varchar2_table(727) := 'a083ae995719ac16db8ec8e4052164e89d93b64b060828e6f37ed1567'||wwv_flow.LF||
'914b284d262452282e3198720e274a939cd08a54f9';
    wwv_flow_api.g_varchar2_table(728) := '80ae38a38f56e422a3a641c8bbd048f7757da0f19b017cc524bd62107bd5001996509affb3fd381a89672f'||wwv_flow.LF||
'1f165dfe51417';
    wwv_flow_api.g_varchar2_table(729) := '3d9850528a2c6cce0239baa4c04ca5bbabac4df000000ffff0300504b01022d0014000600080000002100e9de0fbfff00000';
    wwv_flow_api.g_varchar2_table(730) := '01c020000130000'||wwv_flow.LF||
'0000000000000000000000000000005b436f6e74656e745f54797065735d2e786d6c504b01022d001400';
    wwv_flow_api.g_varchar2_table(731) := '0600080000002100a5d6a7e7c0000000360100000b00'||wwv_flow.LF||
'000000000000000000000000300100005f72656c732f2e72656c735';
    wwv_flow_api.g_varchar2_table(732) := '04b01022d00140006000800000021006b799616830000008a0000001c0000000000000000'||wwv_flow.LF||
'0000000000190200007468656d';
    wwv_flow_api.g_varchar2_table(733) := '652f7468656d652f7468656d654d616e616765722e786d6c504b01022d0014000600080000002100a7259ef29c070000cb20';
    wwv_flow_api.g_varchar2_table(734) := '00'||wwv_flow.LF||
'001600000000000000000000000000d60200007468656d652f7468656d652f7468656d65312e786d6c504b01022d00140';
    wwv_flow_api.g_varchar2_table(735) := '006000800000021000dd1909fb60000'||wwv_flow.LF||
'001b0100002700000000000000000000000000a60a00007468656d652f7468656d65';
    wwv_flow_api.g_varchar2_table(736) := '2f5f72656c732f7468656d654d616e616765722e786d6c2e72656c73504b050600000000050005005d010000a10b00000000';
    wwv_flow_api.g_varchar2_table(737) := '}'||wwv_flow.LF||
'{\*\colorschememapping 3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d3822207';
    wwv_flow_api.g_varchar2_table(738) := '374616e64616c6f6e653d22796573223f3e0d0a3c613a636c724d'||wwv_flow.LF||
'617020786d6c6e733a613d22687474703a2f2f73636865';
    wwv_flow_api.g_varchar2_table(739) := '6d61732e6f70656e786d6c666f726d6174732e6f72672f64726177696e676d6c2f323030362f6d6169'||wwv_flow.LF||
'6e22206267313d226';
    wwv_flow_api.g_varchar2_table(740) := 'c743122207478313d22646b3122206267323d226c743222207478323d22646b322220616363656e74313d22616363656e743';
    wwv_flow_api.g_varchar2_table(741) := '12220616363'||wwv_flow.LF||
'656e74323d22616363656e74322220616363656e74333d22616363656e74332220616363656e74343d226163';
    wwv_flow_api.g_varchar2_table(742) := '63656e74342220616363656e74353d22616363656e74352220616363656e74363d22616363656e74362220686c696e6b3d22';
    wwv_flow_api.g_varchar2_table(743) := '686c696e6b2220666f6c486c696e6b3d22666f6c486c696e6b222f3e}'||wwv_flow.LF||
'{\*\latentstyles\lsdstimax376\lsdlockeddef';
    wwv_flow_api.g_varchar2_table(744) := '0\lsdsemihiddendef0\lsdunhideuseddef0\lsdqformatdef0\lsdprioritydef99{\lsdlockedexcept \lsdqformat1 ';
    wwv_flow_api.g_varchar2_table(745) := '\lsdpriority0 \lsdlocked0 Normal;\lsdqformat1 \lsdpriority0 \lsdlocked0 heading 1;'||wwv_flow.LF||
'\lsdsemihidden1 \';
    wwv_flow_api.g_varchar2_table(746) := 'lsdunhideused1 \lsdqformat1 \lsdpriority9 \lsdlocked0 heading 2;\lsdsemihidden1 \lsdunhideused1 \lsd';
    wwv_flow_api.g_varchar2_table(747) := 'qformat1 \lsdpriority9 \lsdlocked0 heading 3;\lsdsemihidden1 \lsdunhideused1 \lsdqformat1 \lsdpriori';
    wwv_flow_api.g_varchar2_table(748) := 'ty9 \lsdlocked0 heading 4;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdqformat1 \lsdpriority9 \lsdlocked0 he';
    wwv_flow_api.g_varchar2_table(749) := 'ading 5;\lsdsemihidden1 \lsdunhideused1 \lsdqformat1 \lsdpriority9 \lsdlocked0 heading 6;\lsdsemihid';
    wwv_flow_api.g_varchar2_table(750) := 'den1 \lsdunhideused1 \lsdqformat1 \lsdpriority9 \lsdlocked0 heading 7;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideuse';
    wwv_flow_api.g_varchar2_table(751) := 'd1 \lsdqformat1 \lsdpriority9 \lsdlocked0 heading 8;\lsdsemihidden1 \lsdunhideused1 \lsdqformat1 \ls';
    wwv_flow_api.g_varchar2_table(752) := 'dpriority9 \lsdlocked0 heading 9;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 index 1;'||wwv_flow.LF||
'\lsdsemihidden';
    wwv_flow_api.g_varchar2_table(753) := '1 \lsdunhideused1 \lsdlocked0 index 2;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 index 3;\lsdsemihi';
    wwv_flow_api.g_varchar2_table(754) := 'dden1 \lsdunhideused1 \lsdlocked0 index 4;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 index 5;'||wwv_flow.LF||
'\lsds';
    wwv_flow_api.g_varchar2_table(755) := 'emihidden1 \lsdunhideused1 \lsdlocked0 index 6;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 index 7;\';
    wwv_flow_api.g_varchar2_table(756) := 'lsdsemihidden1 \lsdunhideused1 \lsdlocked0 index 8;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 index';
    wwv_flow_api.g_varchar2_table(757) := ' 9;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdpriority39 \lsdlocked0 toc 1;\lsdsemihidden1 \lsdunhideused1';
    wwv_flow_api.g_varchar2_table(758) := ' \lsdpriority39 \lsdlocked0 toc 2;\lsdsemihidden1 \lsdunhideused1 \lsdpriority39 \lsdlocked0 toc 3;'||wwv_flow.LF||
'';
    wwv_flow_api.g_varchar2_table(759) := '\lsdsemihidden1 \lsdunhideused1 \lsdpriority39 \lsdlocked0 toc 4;\lsdsemihidden1 \lsdunhideused1 \ls';
    wwv_flow_api.g_varchar2_table(760) := 'dpriority39 \lsdlocked0 toc 5;\lsdsemihidden1 \lsdunhideused1 \lsdpriority39 \lsdlocked0 toc 6;'||wwv_flow.LF||
'\lsd';
    wwv_flow_api.g_varchar2_table(761) := 'semihidden1 \lsdunhideused1 \lsdpriority39 \lsdlocked0 toc 7;\lsdsemihidden1 \lsdunhideused1 \lsdpri';
    wwv_flow_api.g_varchar2_table(762) := 'ority39 \lsdlocked0 toc 8;\lsdsemihidden1 \lsdunhideused1 \lsdpriority39 \lsdlocked0 toc 9;\lsdsemih';
    wwv_flow_api.g_varchar2_table(763) := 'idden1 \lsdunhideused1 \lsdlocked0 Normal Indent;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 footno';
    wwv_flow_api.g_varchar2_table(764) := 'te text;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 annotation text;\lsdsemihidden1 \lsdunhideused1 ';
    wwv_flow_api.g_varchar2_table(765) := '\lsdlocked0 header;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 footer;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideuse';
    wwv_flow_api.g_varchar2_table(766) := 'd1 \lsdlocked0 index heading;\lsdsemihidden1 \lsdunhideused1 \lsdqformat1 \lsdpriority35 \lsdlocked0';
    wwv_flow_api.g_varchar2_table(767) := ' caption;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 table of figures;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideuse';
    wwv_flow_api.g_varchar2_table(768) := 'd1 \lsdlocked0 envelope address;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 envelope return;\lsdsemi';
    wwv_flow_api.g_varchar2_table(769) := 'hidden1 \lsdunhideused1 \lsdlocked0 footnote reference;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 a';
    wwv_flow_api.g_varchar2_table(770) := 'nnotation reference;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 line number;\lsdsemihidden1 \lsdunh';
    wwv_flow_api.g_varchar2_table(771) := 'ideused1 \lsdlocked0 page number;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 endnote reference;\lsds';
    wwv_flow_api.g_varchar2_table(772) := 'emihidden1 \lsdunhideused1 \lsdlocked0 endnote text;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 tab';
    wwv_flow_api.g_varchar2_table(773) := 'le of authorities;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 macro;\lsdsemihidden1 \lsdunhideused1 ';
    wwv_flow_api.g_varchar2_table(774) := '\lsdlocked0 toa heading;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhide';
    wwv_flow_api.g_varchar2_table(775) := 'used1 \lsdlocked0 List Bullet;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Number;\lsdsemihidden';
    wwv_flow_api.g_varchar2_table(776) := '1 \lsdunhideused1 \lsdlocked0 List 2;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List 3;'||wwv_flow.LF||
'\lsdsemihid';
    wwv_flow_api.g_varchar2_table(777) := 'den1 \lsdunhideused1 \lsdlocked0 List 4;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List 5;\lsdsemih';
    wwv_flow_api.g_varchar2_table(778) := 'idden1 \lsdunhideused1 \lsdlocked0 List Bullet 2;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Bu';
    wwv_flow_api.g_varchar2_table(779) := 'llet 3;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Bullet 4;\lsdsemihidden1 \lsdunhideused1 \l';
    wwv_flow_api.g_varchar2_table(780) := 'sdlocked0 List Bullet 5;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Number 2;\lsdsemihidden1 \l';
    wwv_flow_api.g_varchar2_table(781) := 'sdunhideused1 \lsdlocked0 List Number 3;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Number 4;\';
    wwv_flow_api.g_varchar2_table(782) := 'lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Number 5;\lsdqformat1 \lsdpriority10 \lsdlocked0 Tit';
    wwv_flow_api.g_varchar2_table(783) := 'le;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Closing;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 ';
    wwv_flow_api.g_varchar2_table(784) := 'Signature;\lsdsemihidden1 \lsdunhideused1 \lsdpriority1 \lsdlocked0 Default Paragraph Font;\lsdsemih';
    wwv_flow_api.g_varchar2_table(785) := 'idden1 \lsdunhideused1 \lsdlocked0 Body Text;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Body Text I';
    wwv_flow_api.g_varchar2_table(786) := 'ndent;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Continue;\lsdsemihidden1 \lsdunhideused1 \ls';
    wwv_flow_api.g_varchar2_table(787) := 'dlocked0 List Continue 2;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Continue 3;\lsdsemihidden1';
    wwv_flow_api.g_varchar2_table(788) := ' \lsdunhideused1 \lsdlocked0 List Continue 4;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 List Conti';
    wwv_flow_api.g_varchar2_table(789) := 'nue 5;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Message Header;\lsdqformat1 \lsdpriority11 \lsdloc';
    wwv_flow_api.g_varchar2_table(790) := 'ked0 Subtitle;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Salutation;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused';
    wwv_flow_api.g_varchar2_table(791) := '1 \lsdlocked0 Date;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Body Text First Indent;\lsdsemihidden';
    wwv_flow_api.g_varchar2_table(792) := '1 \lsdunhideused1 \lsdlocked0 Body Text First Indent 2;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 N';
    wwv_flow_api.g_varchar2_table(793) := 'ote Heading;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Body Text 2;\lsdsemihidden1 \lsdunhideused1';
    wwv_flow_api.g_varchar2_table(794) := ' \lsdlocked0 Body Text 3;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Body Text Indent 2;\lsdsemihidd';
    wwv_flow_api.g_varchar2_table(795) := 'en1 \lsdunhideused1 \lsdlocked0 Body Text Indent 3;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Bloc';
    wwv_flow_api.g_varchar2_table(796) := 'k Text;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Hyperlink;\lsdsemihidden1 \lsdunhideused1 \lsdloc';
    wwv_flow_api.g_varchar2_table(797) := 'ked0 FollowedHyperlink;\lsdqformat1 \lsdpriority22 \lsdlocked0 Strong;'||wwv_flow.LF||
'\lsdqformat1 \lsdpriority20 \';
    wwv_flow_api.g_varchar2_table(798) := 'lsdlocked0 Emphasis;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Document Map;\lsdsemihidden1 \lsdunh';
    wwv_flow_api.g_varchar2_table(799) := 'ideused1 \lsdlocked0 Plain Text;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 E-mail Signature;'||wwv_flow.LF||
'\lsdse';
    wwv_flow_api.g_varchar2_table(800) := 'mihidden1 \lsdunhideused1 \lsdlocked0 HTML Top of Form;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 H';
    wwv_flow_api.g_varchar2_table(801) := 'TML Bottom of Form;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Normal (Web);\lsdsemihidden1 \lsdunhi';
    wwv_flow_api.g_varchar2_table(802) := 'deused1 \lsdlocked0 HTML Acronym;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 HTML Address;\lsdsemih';
    wwv_flow_api.g_varchar2_table(803) := 'idden1 \lsdunhideused1 \lsdlocked0 HTML Cite;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 HTML Code;\';
    wwv_flow_api.g_varchar2_table(804) := 'lsdsemihidden1 \lsdunhideused1 \lsdlocked0 HTML Definition;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlock';
    wwv_flow_api.g_varchar2_table(805) := 'ed0 HTML Keyboard;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 HTML Preformatted;\lsdsemihidden1 \lsd';
    wwv_flow_api.g_varchar2_table(806) := 'unhideused1 \lsdlocked0 HTML Sample;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 HTML Typewriter;'||wwv_flow.LF||
'\ls';
    wwv_flow_api.g_varchar2_table(807) := 'dsemihidden1 \lsdunhideused1 \lsdlocked0 HTML Variable;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 a';
    wwv_flow_api.g_varchar2_table(808) := 'nnotation subject;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 No List;\lsdsemihidden1 \lsdunhideused';
    wwv_flow_api.g_varchar2_table(809) := '1 \lsdlocked0 Outline List 1;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Outline List 2;\lsdsemihid';
    wwv_flow_api.g_varchar2_table(810) := 'den1 \lsdunhideused1 \lsdlocked0 Outline List 3;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Balloon ';
    wwv_flow_api.g_varchar2_table(811) := 'Text;\lsdpriority39 \lsdlocked0 Table Grid;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdlocked0 Placeholder Text;\lsdqformat';
    wwv_flow_api.g_varchar2_table(812) := '1 \lsdpriority1 \lsdlocked0 No Spacing;\lsdpriority60 \lsdlocked0 Light Shading;\lsdpriority61 \lsdl';
    wwv_flow_api.g_varchar2_table(813) := 'ocked0 Light List;\lsdpriority62 \lsdlocked0 Light Grid;'||wwv_flow.LF||
'\lsdpriority63 \lsdlocked0 Medium Shading 1';
    wwv_flow_api.g_varchar2_table(814) := ';\lsdpriority64 \lsdlocked0 Medium Shading 2;\lsdpriority65 \lsdlocked0 Medium List 1;\lsdpriority66';
    wwv_flow_api.g_varchar2_table(815) := ' \lsdlocked0 Medium List 2;\lsdpriority67 \lsdlocked0 Medium Grid 1;\lsdpriority68 \lsdlocked0 Mediu';
    wwv_flow_api.g_varchar2_table(816) := 'm Grid 2;'||wwv_flow.LF||
'\lsdpriority69 \lsdlocked0 Medium Grid 3;\lsdpriority70 \lsdlocked0 Dark List;\lsdpriority';
    wwv_flow_api.g_varchar2_table(817) := '71 \lsdlocked0 Colorful Shading;\lsdpriority72 \lsdlocked0 Colorful List;\lsdpriority73 \lsdlocked0 ';
    wwv_flow_api.g_varchar2_table(818) := 'Colorful Grid;\lsdpriority60 \lsdlocked0 Light Shading Accent 1;'||wwv_flow.LF||
'\lsdpriority61 \lsdlocked0 Light Li';
    wwv_flow_api.g_varchar2_table(819) := 'st Accent 1;\lsdpriority62 \lsdlocked0 Light Grid Accent 1;\lsdpriority63 \lsdlocked0 Medium Shading';
    wwv_flow_api.g_varchar2_table(820) := ' 1 Accent 1;\lsdpriority64 \lsdlocked0 Medium Shading 2 Accent 1;\lsdpriority65 \lsdlocked0 Medium L';
    wwv_flow_api.g_varchar2_table(821) := 'ist 1 Accent 1;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdlocked0 Revision;\lsdqformat1 \lsdpriority34 \lsdlocked0 List Pa';
    wwv_flow_api.g_varchar2_table(822) := 'ragraph;\lsdqformat1 \lsdpriority29 \lsdlocked0 Quote;\lsdqformat1 \lsdpriority30 \lsdlocked0 Intens';
    wwv_flow_api.g_varchar2_table(823) := 'e Quote;\lsdpriority66 \lsdlocked0 Medium List 2 Accent 1;'||wwv_flow.LF||
'\lsdpriority67 \lsdlocked0 Medium Grid 1 ';
    wwv_flow_api.g_varchar2_table(824) := 'Accent 1;\lsdpriority68 \lsdlocked0 Medium Grid 2 Accent 1;\lsdpriority69 \lsdlocked0 Medium Grid 3 ';
    wwv_flow_api.g_varchar2_table(825) := 'Accent 1;\lsdpriority70 \lsdlocked0 Dark List Accent 1;\lsdpriority71 \lsdlocked0 Colorful Shading A';
    wwv_flow_api.g_varchar2_table(826) := 'ccent 1;'||wwv_flow.LF||
'\lsdpriority72 \lsdlocked0 Colorful List Accent 1;\lsdpriority73 \lsdlocked0 Colorful Grid ';
    wwv_flow_api.g_varchar2_table(827) := 'Accent 1;\lsdpriority60 \lsdlocked0 Light Shading Accent 2;\lsdpriority61 \lsdlocked0 Light List Acc';
    wwv_flow_api.g_varchar2_table(828) := 'ent 2;\lsdpriority62 \lsdlocked0 Light Grid Accent 2;'||wwv_flow.LF||
'\lsdpriority63 \lsdlocked0 Medium Shading 1 Ac';
    wwv_flow_api.g_varchar2_table(829) := 'cent 2;\lsdpriority64 \lsdlocked0 Medium Shading 2 Accent 2;\lsdpriority65 \lsdlocked0 Medium List 1';
    wwv_flow_api.g_varchar2_table(830) := ' Accent 2;\lsdpriority66 \lsdlocked0 Medium List 2 Accent 2;'||wwv_flow.LF||
'\lsdpriority67 \lsdlocked0 Medium Grid ';
    wwv_flow_api.g_varchar2_table(831) := '1 Accent 2;\lsdpriority68 \lsdlocked0 Medium Grid 2 Accent 2;\lsdpriority69 \lsdlocked0 Medium Grid ';
    wwv_flow_api.g_varchar2_table(832) := '3 Accent 2;\lsdpriority70 \lsdlocked0 Dark List Accent 2;\lsdpriority71 \lsdlocked0 Colorful Shading';
    wwv_flow_api.g_varchar2_table(833) := ' Accent 2;'||wwv_flow.LF||
'\lsdpriority72 \lsdlocked0 Colorful List Accent 2;\lsdpriority73 \lsdlocked0 Colorful Gri';
    wwv_flow_api.g_varchar2_table(834) := 'd Accent 2;\lsdpriority60 \lsdlocked0 Light Shading Accent 3;\lsdpriority61 \lsdlocked0 Light List A';
    wwv_flow_api.g_varchar2_table(835) := 'ccent 3;\lsdpriority62 \lsdlocked0 Light Grid Accent 3;'||wwv_flow.LF||
'\lsdpriority63 \lsdlocked0 Medium Shading 1 ';
    wwv_flow_api.g_varchar2_table(836) := 'Accent 3;\lsdpriority64 \lsdlocked0 Medium Shading 2 Accent 3;\lsdpriority65 \lsdlocked0 Medium List';
    wwv_flow_api.g_varchar2_table(837) := ' 1 Accent 3;\lsdpriority66 \lsdlocked0 Medium List 2 Accent 3;'||wwv_flow.LF||
'\lsdpriority67 \lsdlocked0 Medium Gri';
    wwv_flow_api.g_varchar2_table(838) := 'd 1 Accent 3;\lsdpriority68 \lsdlocked0 Medium Grid 2 Accent 3;\lsdpriority69 \lsdlocked0 Medium Gri';
    wwv_flow_api.g_varchar2_table(839) := 'd 3 Accent 3;\lsdpriority70 \lsdlocked0 Dark List Accent 3;\lsdpriority71 \lsdlocked0 Colorful Shadi';
    wwv_flow_api.g_varchar2_table(840) := 'ng Accent 3;'||wwv_flow.LF||
'\lsdpriority72 \lsdlocked0 Colorful List Accent 3;\lsdpriority73 \lsdlocked0 Colorful G';
    wwv_flow_api.g_varchar2_table(841) := 'rid Accent 3;\lsdpriority60 \lsdlocked0 Light Shading Accent 4;\lsdpriority61 \lsdlocked0 Light List';
    wwv_flow_api.g_varchar2_table(842) := ' Accent 4;\lsdpriority62 \lsdlocked0 Light Grid Accent 4;'||wwv_flow.LF||
'\lsdpriority63 \lsdlocked0 Medium Shading ';
    wwv_flow_api.g_varchar2_table(843) := '1 Accent 4;\lsdpriority64 \lsdlocked0 Medium Shading 2 Accent 4;\lsdpriority65 \lsdlocked0 Medium Li';
    wwv_flow_api.g_varchar2_table(844) := 'st 1 Accent 4;\lsdpriority66 \lsdlocked0 Medium List 2 Accent 4;'||wwv_flow.LF||
'\lsdpriority67 \lsdlocked0 Medium G';
    wwv_flow_api.g_varchar2_table(845) := 'rid 1 Accent 4;\lsdpriority68 \lsdlocked0 Medium Grid 2 Accent 4;\lsdpriority69 \lsdlocked0 Medium G';
    wwv_flow_api.g_varchar2_table(846) := 'rid 3 Accent 4;\lsdpriority70 \lsdlocked0 Dark List Accent 4;\lsdpriority71 \lsdlocked0 Colorful Sha';
    wwv_flow_api.g_varchar2_table(847) := 'ding Accent 4;'||wwv_flow.LF||
'\lsdpriority72 \lsdlocked0 Colorful List Accent 4;\lsdpriority73 \lsdlocked0 Colorful';
    wwv_flow_api.g_varchar2_table(848) := ' Grid Accent 4;\lsdpriority60 \lsdlocked0 Light Shading Accent 5;\lsdpriority61 \lsdlocked0 Light Li';
    wwv_flow_api.g_varchar2_table(849) := 'st Accent 5;\lsdpriority62 \lsdlocked0 Light Grid Accent 5;'||wwv_flow.LF||
'\lsdpriority63 \lsdlocked0 Medium Shadin';
    wwv_flow_api.g_varchar2_table(850) := 'g 1 Accent 5;\lsdpriority64 \lsdlocked0 Medium Shading 2 Accent 5;\lsdpriority65 \lsdlocked0 Medium ';
    wwv_flow_api.g_varchar2_table(851) := 'List 1 Accent 5;\lsdpriority66 \lsdlocked0 Medium List 2 Accent 5;'||wwv_flow.LF||
'\lsdpriority67 \lsdlocked0 Medium';
    wwv_flow_api.g_varchar2_table(852) := ' Grid 1 Accent 5;\lsdpriority68 \lsdlocked0 Medium Grid 2 Accent 5;\lsdpriority69 \lsdlocked0 Medium';
    wwv_flow_api.g_varchar2_table(853) := ' Grid 3 Accent 5;\lsdpriority70 \lsdlocked0 Dark List Accent 5;\lsdpriority71 \lsdlocked0 Colorful S';
    wwv_flow_api.g_varchar2_table(854) := 'hading Accent 5;'||wwv_flow.LF||
'\lsdpriority72 \lsdlocked0 Colorful List Accent 5;\lsdpriority73 \lsdlocked0 Colorf';
    wwv_flow_api.g_varchar2_table(855) := 'ul Grid Accent 5;\lsdpriority60 \lsdlocked0 Light Shading Accent 6;\lsdpriority61 \lsdlocked0 Light ';
    wwv_flow_api.g_varchar2_table(856) := 'List Accent 6;\lsdpriority62 \lsdlocked0 Light Grid Accent 6;'||wwv_flow.LF||
'\lsdpriority63 \lsdlocked0 Medium Shad';
    wwv_flow_api.g_varchar2_table(857) := 'ing 1 Accent 6;\lsdpriority64 \lsdlocked0 Medium Shading 2 Accent 6;\lsdpriority65 \lsdlocked0 Mediu';
    wwv_flow_api.g_varchar2_table(858) := 'm List 1 Accent 6;\lsdpriority66 \lsdlocked0 Medium List 2 Accent 6;'||wwv_flow.LF||
'\lsdpriority67 \lsdlocked0 Medi';
    wwv_flow_api.g_varchar2_table(859) := 'um Grid 1 Accent 6;\lsdpriority68 \lsdlocked0 Medium Grid 2 Accent 6;\lsdpriority69 \lsdlocked0 Medi';
    wwv_flow_api.g_varchar2_table(860) := 'um Grid 3 Accent 6;\lsdpriority70 \lsdlocked0 Dark List Accent 6;\lsdpriority71 \lsdlocked0 Colorful';
    wwv_flow_api.g_varchar2_table(861) := ' Shading Accent 6;'||wwv_flow.LF||
'\lsdpriority72 \lsdlocked0 Colorful List Accent 6;\lsdpriority73 \lsdlocked0 Colo';
    wwv_flow_api.g_varchar2_table(862) := 'rful Grid Accent 6;\lsdqformat1 \lsdpriority19 \lsdlocked0 Subtle Emphasis;\lsdqformat1 \lsdpriority';
    wwv_flow_api.g_varchar2_table(863) := '21 \lsdlocked0 Intense Emphasis;'||wwv_flow.LF||
'\lsdqformat1 \lsdpriority31 \lsdlocked0 Subtle Reference;\lsdqforma';
    wwv_flow_api.g_varchar2_table(864) := 't1 \lsdpriority32 \lsdlocked0 Intense Reference;\lsdqformat1 \lsdpriority33 \lsdlocked0 Book Title;\';
    wwv_flow_api.g_varchar2_table(865) := 'lsdsemihidden1 \lsdunhideused1 \lsdpriority37 \lsdlocked0 Bibliography;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideus';
    wwv_flow_api.g_varchar2_table(866) := 'ed1 \lsdqformat1 \lsdpriority39 \lsdlocked0 TOC Heading;\lsdpriority41 \lsdlocked0 Plain Table 1;\ls';
    wwv_flow_api.g_varchar2_table(867) := 'dpriority42 \lsdlocked0 Plain Table 2;\lsdpriority43 \lsdlocked0 Plain Table 3;\lsdpriority44 \lsdlo';
    wwv_flow_api.g_varchar2_table(868) := 'cked0 Plain Table 4;'||wwv_flow.LF||
'\lsdpriority45 \lsdlocked0 Plain Table 5;\lsdpriority40 \lsdlocked0 Grid Table ';
    wwv_flow_api.g_varchar2_table(869) := 'Light;\lsdpriority46 \lsdlocked0 Grid Table 1 Light;\lsdpriority47 \lsdlocked0 Grid Table 2;\lsdprio';
    wwv_flow_api.g_varchar2_table(870) := 'rity48 \lsdlocked0 Grid Table 3;\lsdpriority49 \lsdlocked0 Grid Table 4;'||wwv_flow.LF||
'\lsdpriority50 \lsdlocked0 ';
    wwv_flow_api.g_varchar2_table(871) := 'Grid Table 5 Dark;\lsdpriority51 \lsdlocked0 Grid Table 6 Colorful;\lsdpriority52 \lsdlocked0 Grid T';
    wwv_flow_api.g_varchar2_table(872) := 'able 7 Colorful;\lsdpriority46 \lsdlocked0 Grid Table 1 Light Accent 1;\lsdpriority47 \lsdlocked0 Gr';
    wwv_flow_api.g_varchar2_table(873) := 'id Table 2 Accent 1;'||wwv_flow.LF||
'\lsdpriority48 \lsdlocked0 Grid Table 3 Accent 1;\lsdpriority49 \lsdlocked0 Gri';
    wwv_flow_api.g_varchar2_table(874) := 'd Table 4 Accent 1;\lsdpriority50 \lsdlocked0 Grid Table 5 Dark Accent 1;\lsdpriority51 \lsdlocked0 ';
    wwv_flow_api.g_varchar2_table(875) := 'Grid Table 6 Colorful Accent 1;'||wwv_flow.LF||
'\lsdpriority52 \lsdlocked0 Grid Table 7 Colorful Accent 1;\lsdpriori';
    wwv_flow_api.g_varchar2_table(876) := 'ty46 \lsdlocked0 Grid Table 1 Light Accent 2;\lsdpriority47 \lsdlocked0 Grid Table 2 Accent 2;\lsdpr';
    wwv_flow_api.g_varchar2_table(877) := 'iority48 \lsdlocked0 Grid Table 3 Accent 2;'||wwv_flow.LF||
'\lsdpriority49 \lsdlocked0 Grid Table 4 Accent 2;\lsdpri';
    wwv_flow_api.g_varchar2_table(878) := 'ority50 \lsdlocked0 Grid Table 5 Dark Accent 2;\lsdpriority51 \lsdlocked0 Grid Table 6 Colorful Acce';
    wwv_flow_api.g_varchar2_table(879) := 'nt 2;\lsdpriority52 \lsdlocked0 Grid Table 7 Colorful Accent 2;'||wwv_flow.LF||
'\lsdpriority46 \lsdlocked0 Grid Tabl';
    wwv_flow_api.g_varchar2_table(880) := 'e 1 Light Accent 3;\lsdpriority47 \lsdlocked0 Grid Table 2 Accent 3;\lsdpriority48 \lsdlocked0 Grid ';
    wwv_flow_api.g_varchar2_table(881) := 'Table 3 Accent 3;\lsdpriority49 \lsdlocked0 Grid Table 4 Accent 3;'||wwv_flow.LF||
'\lsdpriority50 \lsdlocked0 Grid T';
    wwv_flow_api.g_varchar2_table(882) := 'able 5 Dark Accent 3;\lsdpriority51 \lsdlocked0 Grid Table 6 Colorful Accent 3;\lsdpriority52 \lsdlo';
    wwv_flow_api.g_varchar2_table(883) := 'cked0 Grid Table 7 Colorful Accent 3;\lsdpriority46 \lsdlocked0 Grid Table 1 Light Accent 4;'||wwv_flow.LF||
'\lsdpri';
    wwv_flow_api.g_varchar2_table(884) := 'ority47 \lsdlocked0 Grid Table 2 Accent 4;\lsdpriority48 \lsdlocked0 Grid Table 3 Accent 4;\lsdprior';
    wwv_flow_api.g_varchar2_table(885) := 'ity49 \lsdlocked0 Grid Table 4 Accent 4;\lsdpriority50 \lsdlocked0 Grid Table 5 Dark Accent 4;'||wwv_flow.LF||
'\lsdp';
    wwv_flow_api.g_varchar2_table(886) := 'riority51 \lsdlocked0 Grid Table 6 Colorful Accent 4;\lsdpriority52 \lsdlocked0 Grid Table 7 Colorfu';
    wwv_flow_api.g_varchar2_table(887) := 'l Accent 4;\lsdpriority46 \lsdlocked0 Grid Table 1 Light Accent 5;\lsdpriority47 \lsdlocked0 Grid Ta';
    wwv_flow_api.g_varchar2_table(888) := 'ble 2 Accent 5;'||wwv_flow.LF||
'\lsdpriority48 \lsdlocked0 Grid Table 3 Accent 5;\lsdpriority49 \lsdlocked0 Grid Tab';
    wwv_flow_api.g_varchar2_table(889) := 'le 4 Accent 5;\lsdpriority50 \lsdlocked0 Grid Table 5 Dark Accent 5;\lsdpriority51 \lsdlocked0 Grid ';
    wwv_flow_api.g_varchar2_table(890) := 'Table 6 Colorful Accent 5;'||wwv_flow.LF||
'\lsdpriority52 \lsdlocked0 Grid Table 7 Colorful Accent 5;\lsdpriority46 ';
    wwv_flow_api.g_varchar2_table(891) := '\lsdlocked0 Grid Table 1 Light Accent 6;\lsdpriority47 \lsdlocked0 Grid Table 2 Accent 6;\lsdpriorit';
    wwv_flow_api.g_varchar2_table(892) := 'y48 \lsdlocked0 Grid Table 3 Accent 6;'||wwv_flow.LF||
'\lsdpriority49 \lsdlocked0 Grid Table 4 Accent 6;\lsdpriority';
    wwv_flow_api.g_varchar2_table(893) := '50 \lsdlocked0 Grid Table 5 Dark Accent 6;\lsdpriority51 \lsdlocked0 Grid Table 6 Colorful Accent 6;';
    wwv_flow_api.g_varchar2_table(894) := '\lsdpriority52 \lsdlocked0 Grid Table 7 Colorful Accent 6;'||wwv_flow.LF||
'\lsdpriority46 \lsdlocked0 List Table 1 L';
    wwv_flow_api.g_varchar2_table(895) := 'ight;\lsdpriority47 \lsdlocked0 List Table 2;\lsdpriority48 \lsdlocked0 List Table 3;\lsdpriority49 ';
    wwv_flow_api.g_varchar2_table(896) := '\lsdlocked0 List Table 4;\lsdpriority50 \lsdlocked0 List Table 5 Dark;'||wwv_flow.LF||
'\lsdpriority51 \lsdlocked0 Li';
    wwv_flow_api.g_varchar2_table(897) := 'st Table 6 Colorful;\lsdpriority52 \lsdlocked0 List Table 7 Colorful;\lsdpriority46 \lsdlocked0 List';
    wwv_flow_api.g_varchar2_table(898) := ' Table 1 Light Accent 1;\lsdpriority47 \lsdlocked0 List Table 2 Accent 1;\lsdpriority48 \lsdlocked0 ';
    wwv_flow_api.g_varchar2_table(899) := 'List Table 3 Accent 1;'||wwv_flow.LF||
'\lsdpriority49 \lsdlocked0 List Table 4 Accent 1;\lsdpriority50 \lsdlocked0 L';
    wwv_flow_api.g_varchar2_table(900) := 'ist Table 5 Dark Accent 1;\lsdpriority51 \lsdlocked0 List Table 6 Colorful Accent 1;\lsdpriority52 \';
    wwv_flow_api.g_varchar2_table(901) := 'lsdlocked0 List Table 7 Colorful Accent 1;'||wwv_flow.LF||
'\lsdpriority46 \lsdlocked0 List Table 1 Light Accent 2;\l';
    wwv_flow_api.g_varchar2_table(902) := 'sdpriority47 \lsdlocked0 List Table 2 Accent 2;\lsdpriority48 \lsdlocked0 List Table 3 Accent 2;\lsd';
    wwv_flow_api.g_varchar2_table(903) := 'priority49 \lsdlocked0 List Table 4 Accent 2;'||wwv_flow.LF||
'\lsdpriority50 \lsdlocked0 List Table 5 Dark Accent 2;';
    wwv_flow_api.g_varchar2_table(904) := '\lsdpriority51 \lsdlocked0 List Table 6 Colorful Accent 2;\lsdpriority52 \lsdlocked0 List Table 7 Co';
    wwv_flow_api.g_varchar2_table(905) := 'lorful Accent 2;\lsdpriority46 \lsdlocked0 List Table 1 Light Accent 3;'||wwv_flow.LF||
'\lsdpriority47 \lsdlocked0 L';
    wwv_flow_api.g_varchar2_table(906) := 'ist Table 2 Accent 3;\lsdpriority48 \lsdlocked0 List Table 3 Accent 3;\lsdpriority49 \lsdlocked0 Lis';
    wwv_flow_api.g_varchar2_table(907) := 't Table 4 Accent 3;\lsdpriority50 \lsdlocked0 List Table 5 Dark Accent 3;'||wwv_flow.LF||
'\lsdpriority51 \lsdlocked0';
    wwv_flow_api.g_varchar2_table(908) := ' List Table 6 Colorful Accent 3;\lsdpriority52 \lsdlocked0 List Table 7 Colorful Accent 3;\lsdpriori';
    wwv_flow_api.g_varchar2_table(909) := 'ty46 \lsdlocked0 List Table 1 Light Accent 4;\lsdpriority47 \lsdlocked0 List Table 2 Accent 4;'||wwv_flow.LF||
'\lsdp';
    wwv_flow_api.g_varchar2_table(910) := 'riority48 \lsdlocked0 List Table 3 Accent 4;\lsdpriority49 \lsdlocked0 List Table 4 Accent 4;\lsdpri';
    wwv_flow_api.g_varchar2_table(911) := 'ority50 \lsdlocked0 List Table 5 Dark Accent 4;\lsdpriority51 \lsdlocked0 List Table 6 Colorful Acce';
    wwv_flow_api.g_varchar2_table(912) := 'nt 4;'||wwv_flow.LF||
'\lsdpriority52 \lsdlocked0 List Table 7 Colorful Accent 4;\lsdpriority46 \lsdlocked0 List Tabl';
    wwv_flow_api.g_varchar2_table(913) := 'e 1 Light Accent 5;\lsdpriority47 \lsdlocked0 List Table 2 Accent 5;\lsdpriority48 \lsdlocked0 List ';
    wwv_flow_api.g_varchar2_table(914) := 'Table 3 Accent 5;'||wwv_flow.LF||
'\lsdpriority49 \lsdlocked0 List Table 4 Accent 5;\lsdpriority50 \lsdlocked0 List T';
    wwv_flow_api.g_varchar2_table(915) := 'able 5 Dark Accent 5;\lsdpriority51 \lsdlocked0 List Table 6 Colorful Accent 5;\lsdpriority52 \lsdlo';
    wwv_flow_api.g_varchar2_table(916) := 'cked0 List Table 7 Colorful Accent 5;'||wwv_flow.LF||
'\lsdpriority46 \lsdlocked0 List Table 1 Light Accent 6;\lsdpri';
    wwv_flow_api.g_varchar2_table(917) := 'ority47 \lsdlocked0 List Table 2 Accent 6;\lsdpriority48 \lsdlocked0 List Table 3 Accent 6;\lsdprior';
    wwv_flow_api.g_varchar2_table(918) := 'ity49 \lsdlocked0 List Table 4 Accent 6;'||wwv_flow.LF||
'\lsdpriority50 \lsdlocked0 List Table 5 Dark Accent 6;\lsdp';
    wwv_flow_api.g_varchar2_table(919) := 'riority51 \lsdlocked0 List Table 6 Colorful Accent 6;\lsdpriority52 \lsdlocked0 List Table 7 Colorfu';
    wwv_flow_api.g_varchar2_table(920) := 'l Accent 6;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Mention;'||wwv_flow.LF||
'\lsdsemihidden1 \lsdunhideused1 \lsd';
    wwv_flow_api.g_varchar2_table(921) := 'locked0 Smart Hyperlink;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Hashtag;\lsdsemihidden1 \lsdunhi';
    wwv_flow_api.g_varchar2_table(922) := 'deused1 \lsdlocked0 Unresolved Mention;\lsdsemihidden1 \lsdunhideused1 \lsdlocked0 Smart Link;}}{\*\';
    wwv_flow_api.g_varchar2_table(923) := 'datastore 01050000'||wwv_flow.LF||
'02000000180000004d73786d6c322e534158584d4c5265616465722e362e300000000000000000000';
    wwv_flow_api.g_varchar2_table(924) := '0060000'||wwv_flow.LF||
'd0cf11e0a1b11ae1000000000000000000000000000000003e000300feff09000600000000000000000000000100';
    wwv_flow_api.g_varchar2_table(925) := '0000010000000000000000100000feffffff00000000feffffff0000000000000000ffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(926) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'fffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(927) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(928) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(929) := 'fffffffffffff'||wwv_flow.LF||
'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(930) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(931) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'fffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(932) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(933) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(934) := 'fffffffffffffffffff'||wwv_flow.LF||
'fffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(935) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(936) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'fffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(937) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(938) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(939) := 'fffffffffffffffffffffffff'||wwv_flow.LF||
'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(940) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(941) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'||wwv_flow.LF||
'fffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(942) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(943) := 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
    wwv_flow_api.g_varchar2_table(944) := 'fffffffffffffffffffffffffffffff'||wwv_flow.LF||
'ffffffffffffffffffffffffffffffff52006f006f007400200045006e0074007200';
    wwv_flow_api.g_varchar2_table(945) := '7900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016000500';
    wwv_flow_api.g_varchar2_table(946) := 'ffffffffffffffffffffffff0c6ad98892f1d411a65f0040963251e50000000000000000000000000032'||wwv_flow.LF||
'86df961ad801fef';
    wwv_flow_api.g_varchar2_table(947) := 'fffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(948) := '000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000';
    wwv_flow_api.g_varchar2_table(949) := '0000000000000000000000000000000000000'||wwv_flow.LF||
'00000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(950) := '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(951) := '00000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000'||wwv_flow.LF||
'000000000';
    wwv_flow_api.g_varchar2_table(952) := '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
    wwv_flow_api.g_varchar2_table(953) := '00000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000';
    wwv_flow_api.g_varchar2_table(954) := '0000000000000000000000000000000000000000000'||wwv_flow.LF||
'00000000000000000000000000000000000000000000000001050000';
    wwv_flow_api.g_varchar2_table(955) := '00000000}}';
null;
end;
/
begin
wwv_flow_api.create_report_layout(
 p_id=>wwv_flow_api.id(91409765722760187)
,p_report_layout_name=>'informe_acuerdo_pago_cuotas_vencidas'
,p_report_layout_type=>'RTF_FILE'
,p_varchar2_table=>wwv_flow_api.g_varchar2_table
);
null;
end;
/
