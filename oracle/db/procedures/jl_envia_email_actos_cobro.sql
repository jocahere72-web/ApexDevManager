
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_ENVIA_EMAIL_ACTOS_COBRO" (p_id_acto_tpo            number,
                                                       p_id_prcso_jrdco_lte     number default null,
                                                       p_id_prcsos_jrdco_dcmnto number,
                                                       p_indcdor_ntfccion       varchar2 default 'N',
                                                       p_vlda_crtra             varchar2 default 'N',
                                                       p_ntfccion_atmtca        varchar2 default 'S') is

  cursor c1 is
    select f.id_acto,
           f.nmro_acto,
           f.indcdor_ntfccion,
           i.dscrpcion tpo_acto,
           b.cdgo_clnte,
           d.id_impsto,
           d.id_sjto_impsto,
           e.idntfccion_sjto,
           h.nmbre_rzon_scial,
           e.email,
           a.id_prcsos_jrdco_dcmnto,
           j.id_ntfccion,
           dbms_lob.getlength(g.file_blob) tamanio_blob
      from cb_g_procesos_jrdco_dcmnto a
      join cb_g_procesos_juridico b
        on b.id_prcsos_jrdco = a.id_prcsos_jrdco
      join (select c.id_prcsos_jrdco, c.id_impsto, c.id_sjto_impsto
              from cb_g_procesos_jrdco_mvmnto c
             group by c.id_prcsos_jrdco, c.id_impsto, c.id_sjto_impsto) d
        on d.id_prcsos_jrdco = b.id_prcsos_jrdco
      join v_si_i_sujetos_impuesto e
        on e.id_impsto = d.id_impsto
       and e.id_sjto_impsto = d.id_sjto_impsto
      join gn_g_actos f
        on f.id_acto = a.id_acto
      join gd_g_documentos g
        on g.id_dcmnto = f.id_dcmnto
      join si_i_personas h
        on h.id_sjto_impsto = d.id_sjto_impsto
      join gn_d_actos_tipo i
        on i.id_acto_tpo = f.id_acto_tpo
      left join nt_g_notificaciones j
        on j.id_acto = f.id_acto
     where (b.id_prcso_jrdco_lte = p_id_prcso_jrdco_lte or
           p_id_prcso_jrdco_lte is null)
       and (a.id_prcsos_jrdco_dcmnto = p_id_prcsos_jrdco_dcmnto or
           p_id_prcsos_jrdco_dcmnto is null)
       and a.id_acto_tpo = p_id_acto_tpo
       and f.indcdor_ntfccion = p_indcdor_ntfccion
          --  and b.id_prcsos_jrdco = 302020
       and ((p_vlda_crtra = 'S' and
           (select c.vlor_sldo_ttal
                from v_gn_g_actos_cartera c
               where c.cdgo_clnte = e.cdgo_clnte
                 and c.id_acto = a.id_acto
                 and c.cdgo_mvnt_fncro_estdo like '%NO%') > 0) or
           p_vlda_crtra = 'N')
     order by a.nmro_acto;

  v_valid_email     boolean;
  v_json_parametros clob;

  v_id_ntfccion      number;
  v_cdgo_rspsta_char varchar2(500);
  v_mnsje_rspsta     varchar2(500);
  v_cdgo_rspsta      number;

begin

  for r1 in c1 loop
    if r1.tamanio_blob > 0 then
      v_valid_email := regexp_like(r1.email,
                                   '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

      if v_valid_email and r1.email is not null then

        select json_object(key 'p_id_prcsos_jrdco_dcmnto' is
                           r1.id_prcsos_jrdco_dcmnto)
          into v_json_parametros
          from dual;

        pkg_ma_envios.prc_co_envio_programado(p_cdgo_clnte     => r1.cdgo_clnte,
                                              p_idntfcdor      => 'NotificacionActoCobro',
                                              p_json_prmtros   => v_json_parametros,
                                              p_id_sjto_impsto => r1.id_sjto_impsto,
                                              p_id_acto        => r1.id_acto);

        if p_ntfccion_atmtca = 'S' and r1.indcdor_ntfccion = 'N' then
          jl_registrar_notificacion(p_id_acto          => r1.id_acto,
                                    p_cdgo_clnte       => r1.cdgo_clnte,
                                    p_id_ntfccion      => r1.id_ntfccion,
                                    p_id_fncnrio       => 296,
                                    p_id_usrio         => 230017,
                                    o_id_ntfccion      => v_id_ntfccion,
                                    o_cdgo_rspsta_char => v_cdgo_rspsta_char,
                                    o_mnsje_rspsta     => v_mnsje_rspsta,
                                    o_cdgo_rspsta      => v_cdgo_rspsta);

          dbms_output.put_line('v_id_ntfccion : ' || v_id_ntfccion ||
                               ' - v_cdgo_rspsta_char:' ||
                               v_cdgo_rspsta_char || ' - v_mnsje_rspsta:' ||
                               v_mnsje_rspsta || ' - o_cdgo_rspsta: ' ||
                               v_cdgo_rspsta);

        end if;
      else
        dbms_output.put_line('id_sjto_impsto : ' || r1.id_sjto_impsto ||
                             ' - nmro_acto:' || r1.nmro_acto ||
                             ' - Email inválido: ' || r1.email);
      end if;
    else
      dbms_output.put_line('id_sjto_impsto : ' || r1.id_sjto_impsto ||
                           ' - nmro_acto:' || r1.nmro_acto ||
                           ' - error blob');
    end if;
  end loop;

end jl_envia_email_actos_cobro;
/

