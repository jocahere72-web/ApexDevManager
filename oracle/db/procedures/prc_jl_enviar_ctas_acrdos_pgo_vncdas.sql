
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_JL_ENVIAR_CTAS_ACRDOS_PGO_VNCDAS" (p_cdgo_clnte number) is

  v_id_dcmnto   number;
  v_nmro_dcmnto number;

  v_vlor_sldo_cptal number;

  v_cdgo_rspsta number;
  v_rspsta      varchar2(200);

  v_blob     blob;
  l_blob_len integer;

  l_id NUMBER;

  v_html clob;

  v_email_cntcto varchar2(100);

  r_id_envio        number;
  r_id_envio_mdio   number;
  r_id_envio_adjnto number;
begin

  for r1 in (select a.id_cnvnio,
                    a.id_impsto,
                    a.id_impsto_sbmpsto,
                    a.id_sjto_impsto,
                    a.nmbre_impsto,
                    a.cdgo_clnte,
                    a.nmbre_slctnte,
                    a.drccion_ntfccion,
                    a.cllar,
                    a.nmbre_mncpio_ntfccion,
                    a.email,
                    a.nmro_cnvnio,
                    c.idntfccion_sjto,
                    decode(c.cdgo_sjto_tpo,
                           'P',
                           'Predio: ',
                           'E',
                           'Nit: ',
                           'V',
                           'Placa: ') || c.idntfccion_sjto || ' - ' ||
                    trim(nvl(d.mtrcla_inmblria, e.nmbre_rzon_scial)) txto_ref,
                    c.cdgo_sjto_tpo,
                    decode(c.cdgo_sjto_tpo,
                           'P',
                           'P100_TPO_BSQDA_PRDIO',
                           'E',
                           'P100_TPO_BSQDA_PRSNA',
                           'V',
                           'P100_TPO_BSQDA_VHCLO') tpo_bsqda,
                    REGEXP_REPLACE(to_char(a.fcha_slctud,
                                           'dd "de" month"de" yyyy',
                                           'nls_date_language=spanish'),
                                   '  *',
                                   ' ') fecha_acrdo,
                    max(b.fcha_vncmnto) fcha_cuota,
                    last_day(trunc(sysdate)) fcha_vncmnto,
                    listagg(b.nmro_cta, ':') within group(order by b.nmro_cta) nmro_cta
               from v_gf_g_convenios a
               join gf_g_convenios_extracto b
                 on a.id_cnvnio = b.id_cnvnio
               join v_si_i_sujetos_impuesto c
                 on c.id_sjto_impsto = a.id_sjto_impsto
               left join si_i_predios d
                 on d.id_sjto_impsto = c.id_sjto_impsto
               left join si_i_personas e
                 on e.id_sjto_impsto = c.id_sjto_impsto
              where to_char(a.fcha_slctud, 'yyyy') >= 2021
                   --and trunc(b.fcha_vncmnto) <= trunc(sysdate) + &nmro_dias
                and b.indcdor_cta_pgda = 'N'
                and a.nmro_cnvnio not in (20210000815)
                and a.cdgo_cnvnio_estdo = 'APL'
                and a.id_cnvnio <> 8651
                and a.email is not null
                and not exists
              (select 1
                       from re_g_recaudos d
                      where d.id_sjto_impsto = a.id_sjto_impsto
                        and d.cdgo_rcdo_estdo = 'RG')
              group by a.id_cnvnio,
                       a.id_impsto,
                       a.id_impsto_sbmpsto,
                       a.id_sjto_impsto,
                       a.nmbre_impsto,
                       a.cdgo_clnte,
                       a.nmbre_slctnte,
                       a.drccion_ntfccion,
                       a.cllar,
                       a.nmbre_mncpio_ntfccion,
                       a.email,
                       a.nmro_cnvnio,
                       c.cdgo_sjto_tpo,
                       c.idntfccion_sjto,
                       nvl(d.mtrcla_inmblria, e.nmbre_rzon_scial),
                       to_char(a.fcha_slctud,
                               'dd "de" month"de" yyyy',
                               'nls_date_language=spanish')
             having max(trunc(b.fcha_vncmnto)) <= trunc(sysdate)
              order by a.nmro_cnvnio) loop

    v_email_cntcto := case r1.id_impsto
                        when p_cdgo_clnte || 1 then
                         'predial@alcaldiamonteria.gov.co'
                        when p_cdgo_clnte || 2 then
                         'ica@alcaldiamonteria.gov.co'
                        else
                         'predial@alcaldiamonteria.gov.co'
                      end;

    v_vlor_sldo_cptal := 0;

    for cartera in (select sum(e.vlor_sldo_cptal) vlor_sldo_cptal
                      from v_gf_g_convenios_cartera_actual e
                     where e.id_cnvnio = r1.id_cnvnio) loop
      v_vlor_sldo_cptal := cartera.vlor_sldo_cptal;
    end loop;

    if v_vlor_sldo_cptal = 0 then
      temp_enviar_sms(p_tlfno     => '3107002747',
                      p_mnsje     => 'Cliente: Alcaldia de Monteria - El acuerdo de pago: ' ||
                                     r1.nmro_cnvnio ||
                                     ' presenta cartera en cero, por favor marcar las cuotas como pagadas',
                      p_tpo_mnsje => 'AVISO CONVENIOS EN CERO');
      continue;
    end if;

    v_id_dcmnto   := null;
    v_nmro_dcmnto := null;

    pkg_gf_convenios.prc_gn_recibo_couta_convenio(p_cdgo_clnte     => r1.cdgo_clnte,
                                                  p_id_cnvnio      => r1.id_cnvnio,
                                                  p_cdnas_ctas     => r1.nmro_cta,
                                                  p_fcha_vncmnto   => r1.fcha_vncmnto,
                                                  p_indcdor_entrno => 'PRVDO',
                                                  o_id_dcmnto      => v_id_dcmnto,
                                                  o_nmro_dcmnto    => v_nmro_dcmnto,
                                                  o_cdgo_rspsta    => v_cdgo_rspsta,
                                                  o_mnsje_rspsta   => v_rspsta);

    if v_cdgo_rspsta <> 0 then
      dbms_output.put_line('Error en generar la cuota del convenio: ' ||
                           r1.id_cnvnio);
      continue;
    end if;

    if v('APP_SESSION') is null then

      apex_session.create_session(p_app_id   => 66000,
                                  p_page_id  => 2,
                                  p_username => '1111111112');
    end if;

    apex_session.attach(p_app_id     => 66000,
                        p_page_id    => 2,
                        p_session_id => v('APP_SESSION'));

    --Buscamos el id del documento
    if v_id_dcmnto is null then

      select max(d.id_dcmnto)
        into v_id_dcmnto
        from re_g_documentos d
       where d.cdgo_clnte = r1.cdgo_clnte
         and d.id_cnvnio = r1.id_cnvnio;
    end if;

    apex_util.set_session_state('F_CDGO_CLNTE', p_cdgo_clnte);
    apex_util.set_session_state('F_ID_DCMNTO', v_id_dcmnto);
    apex_util.set_session_state('F_NMBRE_USRIO', 'ADMINISTRADOR');
    apex_util.set_session_state('F_FRMTO_MNDA',
                                'FM$999G999G999G999G999G999G990');

    v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                           p_report_query_name  => 're_c_recibo_cuota_acuerdo',
                                           p_report_layout_name => 're_c_recibo_cuota_acuerdo',
                                           p_report_layout_type => 'rtf',
                                           p_document_format    => 'PDF');

    l_blob_len := dbms_lob.getlength(v_blob);

    if l_blob_len > 0 then

      v_html := '<div style="margin:0;padding:0;width:100%;background-color:#DFE2E7;style=overflow-x:auto;"> <table style="margin:0 auto;max-width:800px" border="0" width="90%" cellspacing="0" cellpadding="0"> <tbody> <tr valign="top"> <td> <table border="0" cellspacing="0" cellpadding="0"> <tbody> <tr> <td> <table style="border-collapse:collapse;border-spacing:0;width:100%;background-position:0% 100%;background-color:#fff;" border="0" cellspacing="0" cellpadding="0"> <tbody> <tr valign="top"> <td> <img src="https://monteria.taxationsmart.co/i/css/infortributos/imagenes/clientes/23001/Nuevo_banner.png" width="100%" alt=""> </td> </tr> <tr> <td style="padding:0;vertical-align:top;padding-left:10%;padding-right:10%;word-break:break-word;word-wrap:break-word"> <p style="text-align:justify"><span style="font-family:''MS Sans Serif'';font-size:small"> <br> Montería, ' ||
                initcap(pkg_gn_generalidades.fnc_date_to_text(sysdate)) ||
                '<br><br> <br> Señor(a):<br><strong>' || r1.nmbre_slctnte ||
                '</strong> <br>' || r1.txto_ref ||
                '<br></span></p> <p align="justify"><span style="font-family:''MS Sans Serif'';font-size:small"> <br> Cordialmente nos permitimos remitir el recibo de pago de la(s) cuota(s) <strong>(' ||
                replace(r1.nmro_cta, ':', ',') ||
                ') que a la fecha presentan mora en el pago desde ' ||
                initcap(pkg_gn_generalidades.fnc_date_to_text(r1.fcha_cuota)) ||
                '</strong> correspondientes al acuerdo de pago suscrito con el Municipio de Montería mediante la <strong>Resolución ' ||
                r1.nmro_cnvnio || '</strong> del ' || r1.fecha_acrdo ||
                '. Este recibo debe imprimirlo en una impresora láser y acudir a las entidades financieras autorizadas para su recaudo, o bien, puede realizar el pago a través del Botón de Pagos PSE, ingresando al <strong>Portal Web de Impuestos </strong> de la página <a href="http://www.monteria.gov.co" target="_blank" data-saferedirecturl="https://www.google.com/url?q=http://www.monteria.gov.co&amp;source=gmail&amp;ust=1659670354143000&amp;usg=AOvVaw0WYeQ3zFZcYHJtQ3nPwtjn">www.monteria.gov.co</a> menú de ' ||
                r1.nmbre_impsto ||
                ' en la opción IMPRIMIR CUOTAS DE ACUERDO DE PAGO o en el siguiente enlace:</span></p> </td> </tr> <tr> <td style="text-align:center"> <a href="https://monteria.taxationsmart.co/ords/f?p=150000:100::::100:F_CDGO_CLNTE,P100_ID_IMPSTO,P100_ID_IMPSTO_SBMPSTO,P100_CDGO_SJTO_TPO_IMPSTO,P100_DFNCION_ISI,P100_PRMTRO,' ||
                r1.tpo_bsqda || ',P100_ID_SJTO_IMPSTO_1,P100_RSPSTA:' ||
                p_cdgo_clnte || ',' || r1.id_impsto || ',' ||
                r1.id_impsto_sbmpsto || ',' || r1.cdgo_sjto_tpo || ',S,' ||
                r1.idntfccion_sjto || ',IDN,' || r1.id_sjto_impsto ||
                ',1" target="_blank"> <img style="max-width:150px" src="https://sincelejo.taxationsmart.co/i/css/infortributos/imagenes/clientes/70001/PSE_PAGUE_CUOTA.png" width="40%" alt=""> </a> </td> </tr> <tr> <td style="padding:0;vertical-align:top;padding-left:10%;padding-right:10%;word-break:break-word;word-wrap:break-word"></span></p> <p style="text-align:justify"><span style="font-family:''MS Sans Serif'';font-size:small">Le recordamos que el incumplimiento en el pago oportuno de sus cuotas, genera el cobro de intereses moratorios y constituye una causal para dejar sin efecto esta facilidad de pago, de conformidad con lo dispuesto en el artículo 814-3 del Estatuto Tributario Nacional, caso en el cual, la Administración Municipal podrá declarar el incumplimiento del acuerdo y dejar sin vigencia el plazo concedido, debiendo dar inicio o reanudación, según el caso, al proceso de cobro coactivo, de conformidad con las normas legales vigentes. </span> </p> <p style="text-align:justify"><span style="font-family:''MS Sans Serif'';font-size:small">Con el pago de sus impuestos contribuye al desarrollo de la ciudad y a la financiación de obras para el bienestar de nuestra gente.<br><br><br>Atentamente,</span><br><br></p> <p style="text-align:justify"><span style="font-family:''MS Sans Serif'';font-size:small"><strong>FREDY ANTONIO ARRIETA RAMOS<br></strong><strong>Coordinador de Gestión de Ingresos<br></strong><strong>Secretaría de Hacienda<br></strong><strong>Alcaldía de Montería</strong></span></p> </td> </tr> <tr style="font-family:''MS Sans Serif'';font-size:small;text-align:center"> <td style="padding-left:10%;padding-right:10%;"> <p>Calle 27 # 3-16, Edificio Antonio de la Torre y Miranda<br>Montería - Cordoba<br>Horario atención: Martes y jueves, 8:00 a.m. a 12:00 m., 2:00 p.m. a 6:00 p.m.</p> <p><strong>Por favor no responder a este correo ya que es un correo automatizado no revisado por ningún funcionario</strong></p> <p>&nbsp;</p> </td> </tr> <tr> <td> <table style="width:80%;margin:0 auto"> <tbody style="text-align-last:center"> <tr> <td style="width:25%"> <a href="https://www.facebook.com/AlcaldiaDeMonteria" target="_blank"> <img alt="Qries" src="https://icon-library.com/images/facebook-icon-ico/facebook-icon-ico-27.jpg" width="30" height="30"> </a> </td> <td style="width:25%"> <a href="https://twitter.com/sechaciendamtr" target="_blank"> <img alt="Qries" src="https://icon-library.com/images/twitter-social-media-icon/twitter-social-media-icon-12.jpg" width="30" height="30"> </a> </td> <td style="width:25%"> <a href="https://www.instagram.com/secretariahaciendamonteria/" target="_blank"> <img alt="Qries" src="https://icon-library.com/images/instagram-icon-size/instagram-icon-size-15.jpg" width="30" height="30" class="CToWUd"> </a> </td> <td style="width:25%"> <a href="mailto:' ||
                v_email_cntcto ||
                '" target="_blank"> <img alt="Qries" src="https://icon-library.com/images/e-mail-icon/e-mail-icon-2.jpg" width="30" height="30" class="CToWUd" data-bit="iit"> </a> </td> </tr> <tr style="font-family:''MS Sans Serif'';font-size:10px"> <td style="width:25%">Facebook</td> <td style="width:25%">Twitter</td> <td style="width:25%">Instagram</td> <td style="width:25%">Correo Electrónico</td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table></div>';

      pkg_ma_envios.prc_rg_envio(p_cdgo_clnte       => p_cdgo_clnte,
                                 p_id_envio_prgrmdo => 561, --CREAR
                                 p_fcha_rgstro      => SYSDATE,
                                 p_fcha_prgrmda     => SYSDATE,
                                 p_id_sjto_impsto   => r1.id_sjto_impsto,
                                 o_id_envio         => r_id_envio,
                                 o_cdgo_rspsta      => v_cdgo_rspsta,
                                 o_mnsje_rspsta     => v_rspsta);
      if v_cdgo_rspsta = 0 then

        pkg_ma_envios.prc_rg_envio_mdio(p_id_envio        => r_id_envio,
                                        p_cdgo_envio_mdio => 'EML',
                                        p_dstno           => r1.email,
                                        p_asnto           => 'RECIBO DE PAGO CUOTA DE ACUERDO ' ||
                                                             r1.nmro_cnvnio ||
                                                             ' - ALCALDIA DE MONTERIA',
                                        p_txto_mnsje      => v_html,
                                        o_id_envio_mdio   => r_id_envio_mdio,
                                        o_cdgo_rspsta     => v_cdgo_rspsta,
                                        o_mnsje_rspsta    => v_rspsta);
        if v_cdgo_rspsta = 0 then
          pkg_ma_envios.prc_rg_envio_adjntos(p_id_envio        => r_id_envio,
                                             p_file_blob       => v_blob,
                                             p_file_name       => 'RECIBO_PAGO_ACUERDO_' ||
                                                                  r1.nmro_cnvnio ||
                                                                  '.pdf',
                                             p_file_mimetype   => 'application/pdf',
                                             o_id_envio_adjnto => r_id_envio_adjnto,
                                             o_cdgo_rspsta     => v_cdgo_rspsta,
                                             o_mnsje_rspsta    => v_rspsta);
          if v_cdgo_rspsta = 0 then
            pkg_ma_envios.prc_rg_envio_estado(p_id_envio_mdio    => r_id_envio_mdio,
                                              p_cdgo_envio_estdo => 'ENC',
                                              o_cdgo_rspsta      => v_cdgo_rspsta,
                                              o_mnsje_rspsta     => v_rspsta);
          end if;
        end if;
      end if;

      commit;

    end if;

    --Enviar mensaje de texto

    if length(r1.cllar) = 10 and r1.cllar like '3%' then

      temp_enviar_sms(p_tlfno     => r1.cllar, --'3005020203', --
                      p_mnsje     => 'La Alcaldia de Monteria le recuerda se encuentra en mora del pago de la(s) cuota(s) ' ||
                                     replace(r1.nmro_cta, ':', ',') ||
                                     ' del acuerdo de pago ' ||
                                     r1.nmro_cnvnio,
                      p_tpo_mnsje => 'CUOTA CONVENIOS VENCIDOS');
    end if;
  end loop;

end PRC_JL_ENVIAR_CTAS_ACRDOS_PGO_VNCDAS;
/

