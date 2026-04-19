prompt --application/pages/page_00034
begin
wwv_flow_api.create_page(
 p_id=>34
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Preguntas Frecuentes'
,p_page_mode=>'MODAL'
,p_step_title=>'Preguntas Frecuentes'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20251112095457'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5115041098571234)
,p_plug_name=>'<b>Preguntas Frecuentes</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ol>',
'    <li>',
unistr('        <a href="#">\00BFQu\00E9 es Placetopay?</a>'),
'        <ul>',
unistr('            <li><b>Placetopay</b> es la plataforma de pagos electr\00F3nicos que usa <b>ALCALD\00CDA DE MONTER\00CDA</b> para procesar en l\00EDnea las transacciones generadas en la tienda virtual con las formas de pago habilitadas para tal fin.  </li>'),
'        </ul>',
'    </li>',
'    <li>',
unistr('        <a href="#">\00BFC\00F3mo puedo pagar?</a>'),
'        <ul>',
unistr('            <li>En la tienda virtual de <b>ALCALD\00CDA DE MONTER\00CDA</b> usted podr\00E1 realizar su pago con los medios habilitados para tal fin. Usted, de acuerdo a las opciones de pago escogidas por el comercio, podr\00E1 pagar a trav\00E9s <b>de tarjetas de cr\00E9di')
||unistr('to Visa, MasterCard, Cuentas d\00E9bito ahorro y corriente PSE.</b></li>'),
'        </ul>',
'    </li>',
'    <li>',
unistr('        <a href="#">\00BFEs seguro ingresar mis datos bancarios en este sitio web?</a>'),
'        <ul>',
unistr('            <li>Para proteger tus datos <b>ALCALD\00CDA DE MONTER\00CDA</b> delega en <b>Placetopay</b> la captura de la informaci\00F3n sensible. Nuestra plataforma de pagos cumple con los m\00E1s altos est\00E1ndares exigidos por la norma internacional PCI DSS de segu')
||unistr('ridad en transacciones con tarjeta de cr\00E9dito. Adem\00E1s tiene certificado de seguridad SSL expedido por GeoTrust una compa\00F1\00EDa Verisign, el cual garantiza comunicaciones seguras mediante la encriptaci\00F3n de todos los datos hacia y desde el sitio; de esta')
||unistr(' manera te podr\00E1s sentir seguro a la hora de ingresar la informaci\00F3n de su tarjeta. </li>'),
unistr('            <li>Durante el proceso de pago, en el navegador se muestra el nombre de la organizaci\00F3n autenticada, la autoridad que lo certifica y la barra de direcci\00F3n cambia a color verde. Estas caracter\00EDsticas son visibles de inmediato y dan garant\00ED')
||unistr('a y confianza para completar la transacci\00F3n en <b>Placetopay.</b></li>'),
unistr('            <li><b>Placetopay</b> tambi\00E9n cuenta con el monitoreo constante de McAfee Secure y la firma de mensajes electr\00F3nicos con Certic\00E1mara.</li>'),
'        </ul>',
'    </li>',
'    <li>',
unistr('        <a href="#">\00BFPuedo realizar el pago cualquier d\00EDa y a cualquier hora?</a>'),
'        <ul>',
unistr('            <li>S\00ED, en <b>ALCALD\00CDA DE MONTER\00CDA</b> podr\00E1s realizar tus compras en l\00EDnea los 7 d\00EDas de la semana, las 24 horas del d\00EDa a s\00F3lo un clic de distancia. </li>'),
'        </ul>',
'    </li>',
'    <li>',
unistr('        <a href="#">\00BFPuedo cambiar la forma de pago?</a>'),
'        <ul>',
unistr('            <li>Si a\00FAn no has finalizado tu pago, podr\00E1s volver al paso inicial y elegir la forma de pago que prefieras. Una vez finalizada la compra no es posible cambiar la forma de pago. </li>        <li><b><i>ESTABLECIMIENTO DE COMERCIO: el punto')
||unistr(' anterior aplica a la forma de pago, pero deber\00E1n mencionar las pol\00EDticas de devoluci\00F3n que tenga la tienda para dar cumplimiento al art\00EDculo 51 de la Ley del Estatuto del Consumidor.</i></b></li>'),
'        </ul>',
'    </li>',
'    <li>',
unistr('        <a href="#">\00BFPagar electr\00F3nicamente tiene alg\00FAn valor para m\00ED como comprador?</a>'),
'        <ul>',
unistr('            <li>No, los pagos electr\00F3nicos realizados a trav\00E9s de Placetopay no generan costos adicionales para el comprador.</li>'),
'        </ul>',
'    </li>',
'    <li>',
unistr('        <a href="#">\00BFQu\00E9 debo hacer si mi transacci\00F3n no concluy\00F3?</a>'),
'        <ul>',
unistr('            <li>En primera instancia, revisar si lleg\00F3 un email de confirmaci\00F3n de la transacci\00F3n a la cuenta de correo electr\00F3nico inscrita en el momento de realizar el pago, en caso de no haberlo recibido, deber\00E1s enviar un correo a <b>rentasmonter')
||unistr('ia@monteria.gov.co</b> para confirmar el estado de la transacci\00F3n.</li>'),
'        </ul>',
'    </li>',
'    <li>',
unistr('        <a href="#">\00BFQu\00E9 debo hacer si no recib\00ED el comprobante de pago?</a>'),
'        <ul>',
unistr('            <li>Por cada transacci\00F3n aprobada a trav\00E9s de <b>Placetopay</b>, recibir\00E1s un comprobante del pago con la referencia de compra en la direcci\00F3n de correo electr\00F3nico que indicaste al momento de pagar. </li>'),
unistr('            <li>Si no lo recibes, podr\00E1s llamar al n\00FAmero movil <b>314 595 4962</b> o al correo electr\00F3nico <b>rentasmonteria@monteria.gov.co</b>, para solicitar el reenv\00EDo del comprobante a la misma direcci\00F3n de correo electr\00F3nico registrada al mome')
||'nto de pagar. </li>',
'        </ul>',
'    </li>',
'  <li>',
unistr('        <a href="#">Lo invitamos a leer nuestras pol\00EDticas de protecci\00F3n, seguridad y privacidad de la informaci\00F3n</a>'),
'        <ul>',
unistr('            <li><a href="https://www.monteria.gov.co/publicaciones/2/ley-de-proteccion-de-datos/" target="_blank">Ley de protecci\00F3n de datos</a> </li>'),
unistr('          <li><a href="https://www.monteria.gov.co/publicaciones/2573/plan-de-seguridad-y-privacidad-de-la-informacion/" target="_blank">Plan De Seguridad Y Privacidad De La Informaci\00F3n</a> </li>'),
unistr('          <li><a href="https://www.monteria.gov.co/publicaciones/2572/plan-tratamiento-de-riesgos-de-seguridad-y-privacidad-de-la-informacion/" target="_blank">Plan Tratamiento De Riesgos De Seguridad Y Privacidad De La Informaci\00F3n</a> </li>'),
'        </ul>',
'    </li>',
'</ol>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'not ((:P34_CDGO_IMPSTO = ''ICA'' or :P34_CDGO_IMPSTO_SBMPSTO = ''RTI'' or',
'          :P34_CDGO_IMPSTO_SBMPSTO = ''PEV'' or :P34_CDGO_IMPSTO_SBMPSTO = ''JAZ'' or',
'          :P34_CDGO_IMPSTO_SBMPSTO = ''PUB'' or :P34_CDGO_IMPSTO_SBMPSTO = ''DSA'' or',
'          :P34_CDGO_IMPSTO_SBMPSTO = ''DSH'' or :P34_CDGO_IMPSTO_SBMPSTO = ''SSP'' or',
'          :P34_CDGO_IMPSTO_SBMPSTO = ''TDT'' or :P34_CDGO_IMPSTO_SBMPSTO = ''DSE'') and',
'          :P34_CDGO_ORGN_TPO  = ''DC'')'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(163685854538149502)
,p_plug_name=>'<b>Preguntas Frecuentes</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ol>',
'    <li>',
unistr('        <a href="#">\00BFQu\00E9 es Avalpaycenter?</a>'),
'        <ul>',
unistr('            <li><b>Avalpaycenter</b> es la plataforma de pagos electr\00F3nicos que usa <b>ALCALD\00CDA DE MONTER\00CDA</b> para procesar en l\00EDnea las transacciones generadas en la tienda virtual con las formas de pago habilitadas para tal fin.  </li>'),
'        </ul>',
'    </li>',
'    <li>',
unistr('        <a href="#">\00BFC\00F3mo puedo pagar?</a>'),
'        <ul>',
unistr('            <li>En la tienda virtual de <b>ALCALD\00CDA DE MONTER\00CDA</b> usted podr\00E1 realizar su pago con los medios habilitados para tal fin. Usted, de acuerdo a las opciones de pago escogidas por el comercio, podr\00E1 pagar a trav\00E9s <b>de tarjetas de cr\00E9di')
||unistr('to Visa, MasterCard, Cuentas d\00E9bito ahorro y corriente PSE.</b></li>'),
'        </ul>',
'    </li>',
'    <li>',
unistr('        <a href="#">\00BFEs seguro ingresar mis datos bancarios en este sitio web?</a>'),
'        <ul>',
unistr('            <li>Para proteger tus datos <b>ALCALD\00CDA DE MONTER\00CDA</b> delega en <b>Avalpaycenter</b> la captura de la informaci\00F3n sensible. Nuestra plataforma de pagos cumple con los m\00E1s altos est\00E1ndares exigidos por la norma internacional PCI DSS de s')
||unistr('eguridad en transacciones con tarjeta de cr\00E9dito. Adem\00E1s tiene certificado de seguridad SSL expedido por GeoTrust una compa\00F1\00EDa Verisign, el cual garantiza comunicaciones seguras mediante la encriptaci\00F3n de todos los datos hacia y desde el sitio; de e')
||unistr('sta manera te podr\00E1s sentir seguro a la hora de ingresar la informaci\00F3n de su tarjeta. </li>'),
unistr('            <li>Durante el proceso de pago, en el navegador se muestra el nombre de la organizaci\00F3n autenticada, la autoridad que lo certifica y la barra de direcci\00F3n cambia a color verde. Estas caracter\00EDsticas son visibles de inmediato y dan garant\00ED')
||unistr('a y confianza para completar la transacci\00F3n en <b>Avalpaycenter.</b></li>'),
unistr('            <li><b>Avalpaycenter</b> tambi\00E9n cuenta con el monitoreo constante de McAfee Secure y la firma de mensajes electr\00F3nicos con Certic\00E1mara.</li>'),
'        </ul>',
'    </li>',
'    <li>',
unistr('        <a href="#">\00BFPuedo realizar el pago cualquier d\00EDa y a cualquier hora?</a>'),
'        <ul>',
unistr('            <li>S\00ED, en <b>ALCALD\00CDA DE MONTER\00CDA</b> podr\00E1s realizar tus compras en l\00EDnea los 7 d\00EDas de la semana, las 24 horas del d\00EDa a s\00F3lo un clic de distancia. </li>'),
'        </ul>',
'    </li>',
'    <li>',
unistr('        <a href="#">\00BFPuedo cambiar la forma de pago?</a>'),
'        <ul>',
unistr('            <li>Si a\00FAn no has finalizado tu pago, podr\00E1s volver al paso inicial y elegir la forma de pago que prefieras. Una vez finalizada la compra no es posible cambiar la forma de pago. </li>        <li><b><i>ESTABLECIMIENTO DE COMERCIO: el punto')
||unistr(' anterior aplica a la forma de pago, pero deber\00E1n mencionar las pol\00EDticas de devoluci\00F3n que tenga la tienda para dar cumplimiento al art\00EDculo 51 de la Ley del Estatuto del Consumidor.</i></b></li>'),
'        </ul>',
'    </li>',
'    <li>',
unistr('        <a href="#">\00BFPagar electr\00F3nicamente tiene alg\00FAn valor para m\00ED como comprador?</a>'),
'        <ul>',
unistr('            <li>No, los pagos electr\00F3nicos realizados a trav\00E9s de Avalpaycenter no generan costos adicionales para el comprador.</li>'),
'        </ul>',
'    </li>',
'    <li>',
unistr('        <a href="#">\00BFQu\00E9 debo hacer si mi transacci\00F3n no concluy\00F3?</a>'),
'        <ul>',
unistr('            <li>En primera instancia, revisar si lleg\00F3 un email de confirmaci\00F3n de la transacci\00F3n a la cuenta de correo electr\00F3nico inscrita en el momento de realizar el pago, en caso de no haberlo recibido, deber\00E1s enviar un correo a <b>rentasmonter')
||unistr('ia@monteria.gov.co</b> para confirmar el estado de la transacci\00F3n.</li>'),
'        </ul>',
'    </li>',
'    <li>',
unistr('        <a href="#">\00BFQu\00E9 debo hacer si no recib\00ED el comprobante de pago?</a>'),
'        <ul>',
unistr('            <li>Por cada transacci\00F3n aprobada a trav\00E9s de <b>Avalpaycenter</b>, recibir\00E1s un comprobante del pago con la referencia de compra en la direcci\00F3n de correo electr\00F3nico que indicaste al momento de pagar. </li>'),
unistr('            <li>Si no lo recibes, podr\00E1s llamar al n\00FAmero movil <b>314 595 4962</b> o al correo electr\00F3nico <b>rentasmonteria@monteria.gov.co</b>, para solicitar el reenv\00EDo del comprobante a la misma direcci\00F3n de correo electr\00F3nico registrada al mome')
||'nto de pagar. </li>',
'        </ul>',
'    </li>',
'  <li>',
unistr('        <a href="#">Lo invitamos a leer nuestras pol\00EDticas de protecci\00F3n, seguridad y privacidad de la informaci\00F3n</a>'),
'        <ul>',
unistr('            <li><a href="https://www.monteria.gov.co/publicaciones/2/ley-de-proteccion-de-datos/" target="_blank">Ley de protecci\00F3n de datos</a> </li>'),
unistr('          <li><a href="https://www.monteria.gov.co/publicaciones/2573/plan-de-seguridad-y-privacidad-de-la-informacion/" target="_blank">Plan De Seguridad Y Privacidad De La Informaci\00F3n</a> </li>'),
unistr('          <li><a href="https://www.monteria.gov.co/publicaciones/2572/plan-tratamiento-de-riesgos-de-seguridad-y-privacidad-de-la-informacion/" target="_blank">Plan Tratamiento De Riesgos De Seguridad Y Privacidad De La Informaci\00F3n</a> </li>'),
'        </ul>',
'    </li>',
'</ol>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(:P34_CDGO_IMPSTO = ''ICA'' or :P34_CDGO_IMPSTO_SBMPSTO = ''RTI'' or',
'          :P34_CDGO_IMPSTO_SBMPSTO = ''PEV'' or :P34_CDGO_IMPSTO_SBMPSTO = ''JAZ'' or',
'          :P34_CDGO_IMPSTO_SBMPSTO = ''PUB'' or :P34_CDGO_IMPSTO_SBMPSTO = ''DSA'' or',
'          :P34_CDGO_IMPSTO_SBMPSTO = ''DSH'' or :P34_CDGO_IMPSTO_SBMPSTO = ''SSP'' or',
'          :P34_CDGO_IMPSTO_SBMPSTO = ''TDT'' or :P34_CDGO_IMPSTO_SBMPSTO = ''DSE'') and',
'          :P34_CDGO_ORGN_TPO  = ''DC'''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10741404958845301)
,p_name=>'P34_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(5115041098571234)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10741606768845303)
,p_name=>'P34_CDGO_IMPSTO_SBMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(5115041098571234)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(163685936755149503)
,p_name=>'P34_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5115041098571234)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(163686000505149504)
,p_name=>'P34_CDGO_ORGN_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5115041098571234)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(163686136305149505)
,p_name=>'P34_CDGO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5115041098571234)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(163686240543149506)
,p_computation_sequence=>10
,p_computation_item=>'P34_CDGO_IMPSTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_impsto',
'from df_c_impuestos',
'where id_impsto = :P34_ID_IMPSTO;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(10741781618845304)
,p_computation_sequence=>20
,p_computation_item=>'P34_CDGO_IMPSTO_SBMPSTO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_impsto_sbmpsto from df_i_impuestos_subimpuesto t',
'where t.id_impsto_sbmpsto = :P34_ID_IMPSTO_SBMPSTO;'))
);
end;
/
