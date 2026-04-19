
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_JL_ENVIAR_EMAIL_ADJUNTO" (p_cdgo_clnte number,
                                                        p_tpo_dcmnto varchar2,
                                                        p_prfjo      varchar2,
                                                        p_error      out varchar2) is

  cursor c1 is
  select T.NMRO_DCMNTO,T.FILE_BLOB from gd_g_documentos t WHERE T.ID_DCMNTO = 491911;
    /*select w.id_sjto_impsto,
           w.id_fsclzcion_expdnte,
           w.Nmbre_Rzon_Scial rzon_scial,
           d.nmro_acto,
           (select f.file_blob
              from gd_g_documentos f
             where f.id_dcmnto = g.id_dcmnto) file_blob,
           LISTAGG(w.email, ',') WITHIN GROUP(ORDER BY w.email) email
      from (select t.id_sjto_impsto,
                   t.id_fsclzcion_expdnte,
                   t.Nmbre_Rzon_Scial,
                   replace(lower(t.email_smart), ';', ',') email
              from TEMP_ANALISIS_EMPLAZAMIENTOS t
             where t.estdo = 'ACTIVA'
               and t.email_smart is not null
               and t.envdo = 'N'
            union
            select t.id_sjto_impsto,
                   t.id_fsclzcion_expdnte,
                   t.Nmbre_Rzon_Scial,
                   replace(lower(t.email_jdcial), ';', ',')
              from TEMP_ANALISIS_EMPLAZAMIENTOS t
             where t.estdo = 'ACTIVA'
               and t.email_jdcial is not null
               and t.envdo = 'N'
            union
            select t.id_sjto_impsto,
                   t.id_fsclzcion_expdnte,
                   t.Nmbre_Rzon_Scial,
                   replace(lower(t.email_cmrcial), ';', ',')
              from TEMP_ANALISIS_EMPLAZAMIENTOS t
             where t.estdo = 'ACTIVA'
               and t.email_cmrcial is not null
               and t.envdo = 'N') w
      join fi_g_fiscalizacion_expdnte a
        on a.id_fsclzcion_expdnte = w.id_fsclzcion_expdnte
      join fi_g_fsclzcion_expdnte_acto b
        on b.id_fsclzcion_expdnte = a.id_fsclzcion_expdnte
      join gn_g_actos d
        on d.id_acto = b.id_acto
      join gd_g_documentos g
        on g.id_dcmnto = d.id_dcmnto
     where b.id_acto_tpo = 123
       and W.ID_SJTO_IMPSTO IN (2934644)
     group by id_sjto_impsto,
              w.id_fsclzcion_expdnte,
              Nmbre_Rzon_Scial,
              d.nmro_acto,
              g.id_dcmnto
     order by d.nmro_acto;*/

  --v_blob blob;

  l_id NUMBER;

  v_html clob;

  v_email_cntcto varchar2(100);

begin

  if v('APP_SESSION') is null then

    apex_session.create_session(p_app_id   => 66000,
                                p_page_id  => 2,
                                p_username => '1111111112');
  end if;

  apex_session.attach(p_app_id     => 66000,
                      p_page_id    => 2,
                      p_session_id => v('APP_SESSION'));

  for r1 in c1 loop

    v_email_cntcto := 'ica@alcaldiamonteria.gov.co';

    apex_util.set_session_state('F_CDGO_CLNTE', p_cdgo_clnte);
    apex_util.set_session_state('F_NMBRE_USRIO', 'ADMINISTRADOR');
    apex_util.set_session_state('F_FRMTO_MNDA',
                                'FM$999G999G999G999G999G999G990');

    v_html := '<tbody>
   <tr valign="top">
      <td>
         <table border="0" cellspacing="0" cellpadding="0">
            <tbody>
               <tr>
                  <td>
                     <table style="border-collapse:collapse;border-spacing:0;width:100%;background-position:0% 100%;background-color:#fff" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                           <tr valign="top">
                              <td>
                                 <img src="https://ci3.googleusercontent.com/proxy/7PI9Gz7-H9IGL1M41W9OaXhJYYSF0KnvmsH0TR8pr-icGJfRYbJ3Mz4D6fWKa1XeJy4L8ngajuhA4DMyTASV-eTiyQZGx-gWgkBsXJAxsHm3TPVG4T9DoDxBETvdejr1fBEfXRasd-LQPRdbjR3i=s0-d-e1-ft#https://taxation-monteria.gobiernoit.com/i/css/infortributos/imagenes/clientes/23001/ESL.jpg" width="100%" alt="" class="CToWUd" data-bit="iit">
                              </td>
                           </tr>
                           <tr>
                              <td style="padding:0;vertical-align:top;padding-left:10%;padding-right:10%;word-break:break-word;word-wrap:break-word">
                                 <p style="text-align:justify"><span style="font-family:''MS Sans Serif'';font-size:small"> <br> Montería, Marzo 28 de 2023<br><br>
                                    <br>  Señor Contribuyente <br><strong>IMPUESTO DE INDUSTRIA Y COMERCIO</strong>
                                    <br>Municipio de Montería
                                    </span>
                                 </p>
                                 <br>
                                 <p align="justify">
                                    <span style="font-family:''MS Sans Serif'';font-size:small"><strong> Ref: CONTINGENCIA DE LOS SERVICIOS INFORMÁTICOS Y RESTABLECIMIENTO
                                    DEL SISTEMA PARA EL DILIGENCIMIENTO, PRESENTACIÓN Y PAGO DE LAS
                                    DECLARACIONES DEL IMPUESTO DE INDUSTRIA Y COMERCIO</strong> <br><br>  La Secretaría de Hacienda de Montería se permite informar:
                                    <br><br>
                                    <strong>1.</strong> Que debido a las fallas experimentadas en la plataforma
                                    tecnológica de impuestos, por la alta demanda y uso de la
                                    plataforma, se declaró la <strong>contingencia en los Servicios
                                    Informáticos Electrónicos el día 27 de marzo de 2023</strong>, de
                                    conformidad con la certificación emitida por el equipo técnico de la
                                    administración municipal.<br><br>
                                    <span align="justify">
                                    <span style="font-family:''MS Sans Serif'';font-size:small">
                                    <strong>2.</strong> Los servicios Informáticos han sido restablecidos el día de hoy,gracias al trabajo articulado de los equipos técnicos, lo que ha permitido normalizar el cumplimiento de las obligaciones tributarias de declaración y pago del Impuesto de Industria y comercio mediante los medios electrónicos dispuestos.
                                    <br><br></span>
                                    <strong>3.</strong> Debido a la situación presentada, se autorizó la ampliación del plazo límite para la presentación y pago de la declaración del Impuesto de Industria y comercio y su complementario de avisos y tableros correspondiente al período gravable 2022,<strong><u> para aquellos sujetos pasivos o responsables cuyo último digito de la cédula o NIT, antes del dígito de verificación, finalice en 1 o 2, quienes podrán cumplir con el deber de declarar y pagar hasta el día 3 de abril de 2023, sin que se generen recargos por sanciones ni intereses de mora.</u></strong><br>
                                 <p style="text-align:justify"><span style="font-family:''MS Sans Serif'';font-size:small">Desde el <strong><i>Gobierno de la Gente</i></strong> continuaremos trabajando y
                                    monitoreando el desempeño de los servicios de información para
                                    evitar inconvenientes y garantizar el adecuado cumplimiento de las
                                    obligaciones tributarias por parte de nuestros contribuyentes.</span><br>
                                 <p style="text-align:justify"><span style="font-family:''MS Sans Serif'';font-size:small">Finalmente recuerde que la Administración Tributaria Municipal  a dispuesto los siguientes canales para la atención de sus inquietudes.</span><br><br>
                                 <center>
                                 <table class="table" border="1">
                                    <thead>
                                       <tr>
                                          <th scope="col">
                                             Líneas telefónicas ICA:
                                          </th>
                                          <th scope="col">  3137720585 -3137724415 -3145967268</th>
                                       </tr>
                                    </thead>
                                    <thead>
                                       <tr>
                                          <th scope="col">
                                             Correo electrónico:
                                          </th>
                                          <th scope="col">ica@alcaldiamonteria.gov.co</th>
                                       </tr>
                                    </thead>
                                 </table>
                                 <br>
                                 <p style="text-align:justify"><span style="font-family:''MS Sans Serif'';font-size:small">     Atentamente, </p>
                                 <p style="text-align:justify"><span style="font-family:''MS Sans Serif'';font-size:small"><strong>LUPITA BELLO TOUS<br></strong><strong>Directora de Gestión de Ingresos<br></strong><strong>Secretaría de Hacienda<br></strong><strong>Alcaldía de Montería</strong></span></p>
                              </td>
                           </tr>
                           <tr style="font-family:''MS Sans Serif'';font-size:small;text-align:center">
                              <td style="padding-left:10%;padding-right:10%">
                                 <p>Calle 27 # 3-16, Edificio Antonio de la
                                    Torre y Miranda<br>Montería - Cordoba<br>Horario atención: Martes y jueves, 8:00 a.m. a 12:00 m., 2:00 p.m. a 6:00 p.m.
                                 </p>
                                 <p><strong>Por favor no responder a este correo ya que es un correo automatizado no revisado por ningún funcionario</strong></p>
                                 <p>&nbsp;</p>
                              </td>
                           </tr>
                           <tr>
                              <td>
                                 <table style="width:80%;margin:0 auto">
                                    <tbody style="text-align-last:center">
                                       <tr>
                                          <td style="width:25%"> <a href="https://www.facebook.com/AlcaldiaDeMonteria" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://www.facebook.com/AlcaldiaDeMonteria&amp;source=gmail&amp;ust=1668201375015000&amp;usg=AOvVaw3JRsHVVVvevIaIcGicmTMW">
                                             <img alt="Qries" src="https://ci6.googleusercontent.com/proxy/00d5mF2jJdMJnDvBGwMDBJ7LaTPL7DeX5eBH6EvKeXMP-meEqqeD_fkvUTWNpn0axZnGXR7HfCB37V7T2ixq9QYjD-dQP-wiUN1aAuvGPNLsAlk_bv3JNzyUBjI0=s0-d-e1-ft#https://icon-library.com/images/facebook-icon-ico/facebook-icon-ico-27.jpg" width="30" height="30" class="CToWUd" data-bit="iit">
                                             </a>
                                          </td>
                                          <td style="width:25%"> <a href="https://twitter.com/sechaciendamtr" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://twitter.com/sechaciendamtr&amp;source=gmail&amp;ust=1668201375015000&amp;usg=AOvVaw1d33Mz8ILl5ZyXNbcbuDUr">
                                             <img alt="Qries" src="https://ci4.googleusercontent.com/proxy/lqqOl_0pYkWGTjoFJlEP1VnywYq8rEtP0TrFNTfvX64kGr3iAB4o_xwgU2tDsL_bh2JMnpNj_RfVjXyg4WxS2vFNV9kCJXMs8VhMZ9kaB0aYQeBgcw2rfzwgHRsscs0YW_EudXfiPljPt6B7yg=s0-d-e1-ft#https://icon-library.com/images/twitter-social-media-icon/twitter-social-media-icon-12.jpg" width="30" height="30" class="CToWUd" data-bit="iit">
                                             </a>
                                          </td>
                                          <td style="width:25%"> <a href="https://www.instagram.com/secretariahaciendamonteria/" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://www.instagram.com/secretariahaciendamonteria/&amp;source=gmail&amp;ust=1668201375015000&amp;usg=AOvVaw1NxFMCOOk04BesfD12xS1P">
                                             <img alt="Qries" src="https://ci5.googleusercontent.com/proxy/xzCXEN6X5ZvQBDFqxn0w2KzsuQ3KgSVvHfxaoI3fbRfE2OXEclRHo_7CHZRzMBMA7RyhPX5meU1bAdu_x5_hzV9RqDw4vqDhVK2L5ZNGcMPLHZ-uTBMvPNBQz9l5iEVAZA=s0-d-e1-ft#https://icon-library.com/images/instagram-icon-size/instagram-icon-size-15.jpg" width="30" height="30" class="CToWUd" data-bit="iit">
                                             </a>
                                          </td>
                                          <td style="width:25%"> <a href="mailto:ica@alcaldiamonteria.gov.co" target="_blank">
                                             <img alt="Qries" src="https://ci3.googleusercontent.com/proxy/PjUqOnJtcEJAVHlJ6x-keLaIKBmG87glOiQJ5ZWoBooqRxZfPThCzJTa-KhtRHldbeVSp4TLtpE_03WFNA6BeC0M2rSGHcMRbFfHam-EipU=s0-d-e1-ft#https://icon-library.com/images/e-mail-icon/e-mail-icon-2.jpg" width="30" height="30" class="CToWUd" data-bit="iit">
                                             </a>
                                          </td>
                                       </tr>
                                       <tr style="font-family:''MS Sans Serif'';font-size:10px">
                                          <td style="width:25%">Facebook</td>
                                          <td style="width:25%">Twitter</td>
                                          <td style="width:25%">Instagram</td>
                                          <td style="width:25%">Correo Electrónico</td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </td>
               </tr>
            </tbody>
         </table>
      </td>
   </tr>
</tbody>
</table>';

    begin

      -- PREPARO EL ENVIO
      l_id := apex_mail.send(p_to        => 'jgonzalez@infortributos.com, jvargas@infortributos.com, coordinadoringresos@alcaldiamonteria.gov.co, shacienda@monteria.gov.co', --r1.email, --'jgonzalez@infortributos.com, jvergara@infortributos.com, jvargas@infortributos.com',
                             p_from      => 'notificacionesrentas@alcaldiamonteria.gov.co',
                             p_subj      => 'CORREO PRUEBA MASIVO AMPLIACION',
                             p_body      => v_html,
                             p_body_html => v_html);

      --ADJUNTO EL ARCHIVO
   /*   APEX_MAIL.ADD_ATTACHMENT(p_mail_id    => l_id,
                               p_attachment => r1.file_blob,
                               p_filename   => p_prfjo || '.pdf',
                               p_mime_type  => 'application/pdf');--'application/pdf'--image/jpeg)*/

      --ENVIO
      APEX_MAIL.PUSH_QUEUE;
      /*
      update temp_analisis_emplazamientos a
         set a.envdo = 'S', a.fcha_envio = trunc(sysdate)
       where a.id_sjto_impsto = r1.id_sjto_impsto;
      commit;*/

    exception
      when others then

        p_error := r1.NMRO_DCMNTO || ' ' || sqlerrm;
        raise;
    end;

  end loop;

end PRC_JL_ENVIAR_EMAIL_ADJUNTO;
/

