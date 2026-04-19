
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_ENVIA_EMAIL_INCUMPLIMIENTO" (p_fcha date default null) is

  cursor c1 is
    select b.nmro_acto,
           b.id_acto,
           e.id_cnvnio,
           e.nmro_cnvnio,
           e.nmbre_impsto,
           d.dscrpcion tpo_acto,
           e.cdgo_clnte,
           e.id_impsto,
           e.id_sjto_impsto,
           e.idntfccion_sjto,
           e.nmbre_slctnte,
           e.email,
           g.id_ntfccion,
           a.id_usrio
      from v_gf_g_convenios e
      join gf_g_convenios_revocatoria a
        on a.id_cnvnio = e.id_cnvnio
      join gn_g_actos b
        on b.id_acto = a.id_acto
      join gd_g_documentos c
        on c.id_dcmnto = b.id_dcmnto
      join gn_d_actos_tipo d
        on d.id_acto_tpo = b.id_acto_tpo
      join v_si_i_sujetos_impuesto f
        on f.id_impsto = e.id_impsto
       and f.id_sjto_impsto = e.id_sjto_impsto
      left join nt_g_notificaciones g
        on g.id_acto = b.id_acto
     where a.cdgo_cnvnio_rvctria_estdo = 'RGS'
       and (trunc(a.fcha_rgstro) = trunc(p_fcha) or p_fcha is null)
     order by a.id_cnvnio_rvctria;

  v_id_ntfccion       number;
  v_valid_email       boolean;
  v_json_responsables clob;
  v_id_fncnrio        number;

  v_cdgo_rspsta      number;
  v_cdgo_rspsta_char varchar2(500);
  v_mnsje_rspsta     varchar2(500);

  v_json_parametros clob;

begin

  for r1 in c1 loop

    if v_valid_email then

      select json_object(key 'p_id_cnvnio' is r1.id_cnvnio,
                         key 'p_id_acto' is r1.id_acto)
        into v_json_parametros
        from dual;

      pkg_ma_envios.prc_co_envio_programado(p_cdgo_clnte     => r1.cdgo_clnte,
                                            p_idntfcdor      => 'IncumplimientoAcuerdoPago',
                                            p_json_prmtros   => v_json_parametros,
                                            p_id_sjto_impsto => r1.id_sjto_impsto,
                                            p_id_acto        => r1.id_acto);

      select d.id_fncnrio
        into v_id_fncnrio
        from v_sg_g_usuarios d
       where d.id_usrio = r1.id_usrio;

      if r1.id_ntfccion is null then
        --enviar a notificar
        pkg_nt_notificacion.prc_rg_notificaciones(p_id_ntfccion    => v_id_ntfccion,
                                                  p_id_acto        => r1.id_acto,
                                                  p_cdgo_estdo     => 'NGN',
                                                  p_indcdor_ntfcdo => 'N',
                                                  p_id_fncnrio     => v_id_fncnrio,
                                                  p_cdgo_clnte     => r1.cdgo_clnte,
                                                  o_mnsje_tpo      => v_cdgo_rspsta_char,
                                                  o_mnsje          => v_mnsje_rspsta);
      else
        v_id_ntfccion := r1.id_ntfccion;
      end if;

      if v_cdgo_rspsta_char is null then

        select json_arrayagg(json_object('ID_ACTO_RSPNSBLE' value
                                         trim(r.id_acto_rspnsble))) as json_responsables
          into v_json_responsables
          from gn_g_actos_responsable r
         where r.id_acto = r1.id_acto;

        --notificar por email
        pkg_nt_notificacion.prc_rg_notificacion_puntual(p_cdgo_clnte          => r1.cdgo_clnte,
                                                        p_id_acto             => r1.id_acto,
                                                        p_id_ntfccion         => v_id_ntfccion,
                                                        p_fcha_prsntccion     => sysdate,
                                                        p_json_rspnsbles      => v_json_responsables,
                                                        p_id_fncnrio          => v_id_fncnrio,
                                                        p_file_evdncia        => 'no_data.pdf',
                                                        p_cdgo_mdio           => 'CEL',
                                                        p_indcdor_envia_email => 'N',
                                                        o_cdgo_rspsta         => v_cdgo_rspsta,
                                                        o_mnsje_rspsta        => v_mnsje_rspsta);

        if v_cdgo_rspsta = 0 then

          pkg_gf_convenios.prc_ap_revocatoria_acrdo_pgo(p_cdgo_clnte   => r1.cdgo_clnte,
                                                        p_id_cnvnio    => r1.id_cnvnio,
                                                        p_id_usrio     => r1.id_usrio,
                                                        o_cdgo_rspsta  => v_cdgo_rspsta,
                                                        o_mnsje_rspsta => v_mnsje_rspsta);
        end if;

      end if;

      commit;
    end if;
  end loop;

end jl_envia_email_incumplimiento;
/

