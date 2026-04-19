prompt --application/shared_components/reports/report_queries/prueba
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(38294147661215191)
,p_name=>'prueba'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''<table style="height: 27px; " border="1" width="659">',
'    <thead>',
'        <tr>',
'            <td style="width: 649px; text-align: center;background-color: #cccccc;" colspan="2">informacion de vaina',
'                viaja</td>',
'        </tr>',
'    </thead>',
'    <tbody>',
'        <tr>',
'            <td style="width: 325px;">1</td>',
'            <td style="width: 340px;">OI</td>',
'        </tr>',
'        <tr>',
'            <td style="width: 325px;">2</td>',
'            <td style="width: 340px;">QK</td>',
'        </tr>',
'        <tr>',
'            <td style="width: 325px;">3</td>',
'            <td style="width: 340px;">IG</td>',
'        </tr>',
'        <tr>',
'            <td style="width: 325px;">4</td>',
'            <td style="width: 340px;">WD</td>',
'        </tr>',
'        <tr>',
'            <td style="width: 325px;">5</td>',
'            <td style="width: 340px;">EW</td>',
'        </tr>',
'        <tr>',
'            <td style="width: 325px;">6</td>',
'            <td style="width: 340px;">YM</td>',
'        </tr>',
'        <tr>',
'            <td style="width: 325px;">7</td>',
'            <td style="width: 340px;">KB</td>',
'        </tr>',
'        <tr>',
'            <td style="width: 325px;">8</td>',
'            <td style="width: 340px;">TK</td>',
'        </tr>',
'        <tr>',
'            <td style="width: 325px;">9</td>',
'            <td style="width: 340px;">TP</td>',
'        </tr>',
'        <tr>',
'            <td style="width: 325px;">10</td>',
'            <td style="width: 340px;">WW</td>',
'        </tr>',
'    </tbody>',
'</table>'' as html from dual '))
,p_report_layout_id=>wwv_flow_api.id(38301399130254377)
,p_format=>'PDF'
,p_output_file_name=>'prueba'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(38320160115454782)
,p_shared_query_id=>wwv_flow_api.id(38294147661215191)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select '' &#9745; jaja &#9744; no &#9744; &#43; notalv <table style="width: 121px;" border="1">',
'<tbody>',
'<tr>',
'<td style="width: 155px; background-color: #cccccc; text-align: center;" colspan="2"><em><strong>asdasdasdasdasd</strong></em></td>',
'</tr>',
'<tr>',
'<td style="width: 72px;">11</td>',
'<td style="width: 83px;">1</td>',
'</tr>',
'</tbody>',
'</table>'' as html from dual '))
);
end;
/
