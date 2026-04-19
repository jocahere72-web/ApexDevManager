
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_CRGUE_RSLCION_AFORO" (p_fcha_acto date) is

  cursor c1 is
    select t.*, 2300122 id_impsto_sbmpsto, t.rowid
      from TEMP_CARGUE_AFOROS t
     where t.acto_gnrdo = 'N'
       and t.prsnto_dlcrcion = 'N'
     order by t.nmro_rslcion;

  cursor c2 is
    select t.idntfccion,
           'NOTIFICACION LIQUIDACION OFICIAL DE AFORO ' || t.nmro_rslcion ASNTO,
           t.email,
           t.email_sstma,
           642 id_envio,
           t.nmbre,
           t.nmro_rslcion || '.pdf' file_name,
           t.id_sjto_impsto,
           t.id_acto,
           t.rowid
      from TEMP_CARGUE_AFOROS t
     where t.acto_gnrdo = 'S'
       and t.envdo = 'N'
       and t.prsnto_dlcrcion = 'N'
     order by t.nmro_rslcion;

  v_id_acto_tpo         number := 133;
  v_cdgo_clnte          number := 23001;
  o_id_acto             number;
  v_id_fncnrio_frma     number := 142; -- Lupita Bello
  v_id_fncnrio_ntfccion number := 5; -- admin
  v_id_usrio            number := 230017; -- admin
  v_fecha               varchar2(50);

  v_id_prdo number;

  v_id_ntfccion      number;
  v_cdgo_rspsta_char varchar2(500);
  v_mnsje_rspsta     varchar2(500);
  v_cdgo_rspsta      number;

  v_html clob := '<table style="border-collapse:collapse;width:100%;background-color:#fff" cellspacing="0" cellpadding="0"><tbody><tr valign="top"><td><img alt="logo_monteria" src="https://monteria.taxationsmart.co/i/css/infortributos/imagenes/clientes/23001/Nuevo_banner.png" width="100%" alt=""></td></tr><tr><td style="padding:10%;text-align:justify;font-family:sans-serif;font-size:small"><p><br>Montería, #FECHA#<br><br>Señor(a):<br><strong>#NOMBRE#</strong><br><strong>#NIT#</strong><br>Montería<br><br></p><p>Le notificamos que se le ha emitido una <strong>RESOLUCIÓN POR MEDIO DE LA CUAL SE IMPONE SANCIÓN POR NO DECLARAR Y SE PROFIERE LIQUIDACIÓN OFICIAL DE AFORO DEL IMPUESTO DE INDUSTRIA Y COMERCIO</strong>, la cual se encuentra adjunto a este correo. En dicho documento se detalla la información necesaria y los pasos a seguir para cumplir con su obligación. Le solicitamos revisar el documento y proceder con la mayor brevedad posible. Para cualquier duda o asistencia, puede contactarnos a través de los medios indicados. Agradecemos su atención.<br><br>Cordialmente,<br><br><br></p><table style="border-collapse: collapse; width: 100%; height: 52px;" border="0"><tbody><tr style="height: 18px;"><td style="width: 50%; height: 18px;font-family:sans-serif"><strong>LUPITA BELLO TOUS</strong></td></tr><tr style="height: 18px;"><td style="width: 50%; height: 18px;font-family:sans-serif">Secretaria de Hacienda</td></tr><tr style="height: 16px;"><td style="width: 50%; height: 16px;font-family:sans-serif">Alcaldía de Montería</td></tr></tbody></table><br><br><p style="text-align:center">Calle 27 # 3-16, Edificio Antonio de la Torre y Miranda<br>Montería - Córdoba<br>Horario de atención: Martes y jueves, 8:00 a.m. a 12:00 m., 2:00 p.m. a 6:00 p.m.</p><p style="text-align:center"><strong>Por favor no responda a este correo ya que es un mensaje automatizado no revisado por ningún funcionario.</strong></p></td></tr><tr><td><table style="width:80%;margin:auto;text-align:center;font-family:sans-serif"><tbody><tr><td style="width:25%"><a href="https://www.facebook.com/AlcaldiaDeMonteria" target="_blank"><img src="https://monteria.taxationsmart.co/i/css/infortributos/imagenes/clientes/23001/facebook.png" width="30" height="30" alt="Facebook"></a></td><td style="width:25%"><a href="https://twitter.com/sechaciendamtr" target="_blank"><img src="https://monteria.taxationsmart.co/i/css/infortributos/imagenes/clientes/23001/X.png" width="30" height="30" alt="Twitter"></a></td><td style="width:25%"><a href="https://www.instagram.com/secretariahaciendamonteria/" target="_blank"><img src="https://monteria.taxationsmart.co/i/css/infortributos/imagenes/clientes/23001/instagram.png" width="30" height="30" alt="Instagram"></a></td><td style="width:25%"><a href="mailto:ica@alcaldiademonteria.gov.co" target="_blank"><img src="https://monteria.taxationsmart.co/i/css/infortributos/imagenes/clientes/23001/send_email.png" width="30" height="30" alt="Correo Electrónico"></a></td></tr><tr style="font-size:10px"><td>Facebook</td><td>X</td><td>Instagram</td><td>Correo Electrónico</td></tr></tbody></table></td></tr></tbody></table>';

begin

  SELECT TO_CHAR(SYSDATE,
                 'DD "de" Month "de" YYYY',
                 'NLS_DATE_LANGUAGE = SPANISH')
    INTO v_fecha
    FROM DUAL;

  -- Reemplazar #FECHA# por la fecha formateada
  v_html := REPLACE(v_html, '#FECHA#', v_fecha);

  for r1 in c1 loop

    begin
      insert into gn_g_actos
        (cdgo_clnte,
         cdgo_acto_orgen,
         id_orgen,
         id_undad_prdctra,
         id_acto_tpo,
         nmro_acto,
         anio,
         nmro_acto_dsplay,
         fcha,
         id_usrio,
         id_fncnrio_frma,
         id_acto_rqrdo_ntfccion,
         fcha_incio_ntfccion,
         vlor)
      values
        (v_cdgo_clnte,
         'FISCA',
         r1.id_sjto_impsto,
         r1.id_sjto_impsto,
         v_id_acto_tpo,
         r1.nmro_rslcion,
         extract(year from p_fcha_acto),
         r1.nmro_rslcion,
         p_fcha_acto,
         v_id_usrio,
         v_id_fncnrio_frma,
         null,
         p_fcha_acto,
         0)
      returning id_acto into o_id_acto;
    exception
      when others then
        raise_application_error(-20001,
                                'Ocurrió un error al registrar el gn_g_actos: ' ||
                                r1.nmro_rslcion || SQLERRM);
    end;
    --gn_g_actos_sujeto_impuesto
    begin

      insert into gn_g_actos_sujeto_impuesto
        (id_acto, id_impsto_sbmpsto, id_sjto_impsto)
      values
        (o_id_acto, r1.id_impsto_sbmpsto, r1.id_sjto_impsto);
    exception
      when others then
        raise_application_error(-20001,
                                'Ocurrió un error al registrar el gn_g_actos_sujeto_impuesto: ' ||
                                r1.nmro_rslcion || SQLERRM);
    end;

    for c_sjtos_rspnsble in (select *
                               from si_i_personas a
                               join v_si_i_sujetos_impuesto b
                                 on a.id_sjto_impsto = b.id_sjto_impsto
                              where a.id_sjto_impsto = r1.id_sjto_impsto) loop

      --gn_g_actos_responsable
      begin
        insert into gn_g_actos_responsable
          (id_acto,
           cdgo_idntfccion_tpo,
           idntfccion,
           prmer_nmbre,
           sgndo_nmbre,
           prmer_aplldo,
           sgndo_aplldo,
           drccion_ntfccion,
           id_pais_ntfccion,
           id_dprtmnto_ntfccion,
           id_mncpio_ntfccion,
           email,
           tlfno)
        values
          (o_id_acto,
           c_sjtos_rspnsble.cdgo_idntfccion_tpo,
           c_sjtos_rspnsble.idntfccion_sjto,
           c_sjtos_rspnsble.nmbre_rzon_scial,
           '',
           '.',
           '',
           c_sjtos_rspnsble.drccion_ntfccion,
           c_sjtos_rspnsble.id_pais_ntfccion,
           c_sjtos_rspnsble.id_dprtmnto_ntfccion,
           c_sjtos_rspnsble.id_mncpio_ntfccion,
           c_sjtos_rspnsble.email,
           c_sjtos_rspnsble.tlfno);
      exception
        when others then
          raise_application_error(-20001,
                                  'Ocurrió un error al registrar el responsable: ' ||
                                  r1.nmro_rslcion);
      end;
    end loop;

    begin
      select a.id_prdo
        into v_id_prdo
        from df_i_periodos a
       where a.id_impsto = v_cdgo_clnte || 2
         and a.vgncia = r1.vgncia
         and a.cdgo_prdcdad = 'ANU';

      insert into gn_g_actos_vigencia
        (ID_ACTO, ID_SJTO_IMPSTO, VGNCIA, ID_PRDO, VLOR_CPTAL, VLOR_INTRES)
      values
        (o_id_acto, r1.id_sjto_impsto, r1.vgncia, v_id_prdo, 0, 0);
    exception
      when others then
        raise_application_error(-20001,
                                'Ocurrió un error al registrar acto vigencia: ' ||
                                r1.nmro_rslcion);
    end;

    begin
      jl_cargar_blob_acto(p_id_acto => o_id_acto,
                          p_fle_nme => r1.nmro_rslcion || '.pdf',
                          p_drctrio => 'LOGS');
    exception
      when others then
        raise_application_error(-20001,
                                'Ocurrió un error al registrar el BLOB del acto: ' ||
                                r1.nmro_rslcion);
    end;

    update TEMP_CARGUE_AFOROS t
       set t.acto_gnrdo = 'S', T.ID_ACTO = o_id_acto
     where t.rowid = r1.rowid;
    commit;
  end loop;

  --borrado y cargue tabla persuasivos
  delete from temp_enviar_email_persuasivo a;

  for r2 in c2 loop
    insert into temp_enviar_email_persuasivo a
      (a.idntfccion,
       a.asnto,
       a.email,
       a.html,
       a.id_envio_prgrmdo,
       a.nmbre,
       a.file_name,
       a.id_sjto_impsto,
       a.id_acto)
    values
      (r2.idntfccion,
       r2.asnto,
       r2.email, --'jlujan@infortributos.com',
       v_html,
       r2.id_envio,
       r2.nmbre,
       r2.file_name,
       r2.id_sjto_impsto,
       r2.id_acto);

    if r2.email_sstma is not null then
      insert into temp_enviar_email_persuasivo a
        (a.idntfccion,
         a.asnto,
         a.email,
         a.html,
         a.id_envio_prgrmdo,
         a.nmbre,
         a.file_name,
         a.id_sjto_impsto,
         a.id_acto)
      values
        (r2.idntfccion,
         r2.asnto,
         r2.email_sstma, --'jlujan@infortributos.com',
         v_html,
         r2.id_envio,
         r2.nmbre,
         r2.file_name,
         r2.id_sjto_impsto,
         r2.id_acto);
    end if;

    jl_registrar_notificacion(p_id_acto          => r2.id_acto,
                              p_cdgo_clnte       => v_cdgo_clnte,
                              p_id_ntfccion      => null,
                              p_id_fncnrio       => v_id_fncnrio_ntfccion,
                              p_id_usrio         => v_id_usrio,
                              o_id_ntfccion      => v_id_ntfccion,
                              o_cdgo_rspsta_char => v_cdgo_rspsta_char,
                              o_mnsje_rspsta     => v_mnsje_rspsta,
                              o_cdgo_rspsta      => v_cdgo_rspsta);

    update TEMP_CARGUE_AFOROS t set t.envdo = 'S' where t.rowid = r2.rowid;

  end loop;
  commit;

  jl_enviar_email_persuasivo(p_cdgo_clnte => 23001);

end jl_crgue_rslcion_aforo;
/

