
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_ENVIA_EMAIL_ACTOS_FISCA" (p_id_acto_tpo               number,
                                                       p_id_fsclzcion_lte          number default null,
                                                       p_id_fsclzcion_expdnte_acto number,
                                                       p_ntfccion_atmtca           varchar2 default 'S') is

  cursor c1 is
    select b.cdgo_clnte,
           f.nmro_acto,
           e.id_sjto_impsto,
           d.id_fsclzcion_expdnte_acto,
           lower(trim(e.email)) email, --'jlujan@infortributos.com' email, --
           dbms_lob.getlength(g.file_blob) tamanio_blob,
           f.id_acto,
           f.id_usrio,
           i.id_fncnrio,
           h.id_ntfccion,
           f.indcdor_ntfccion,
           j.dscrpcion dscrpcion_acto_tpo
      from fi_g_fiscalizacion_lote a
      join fi_g_candidatos b
        on b.id_fsclzcion_lte = a.id_fsclzcion_lte
       and b.id_prgrma = a.id_prgrma
       and b.id_sbprgrma = b.id_sbprgrma
      join fi_g_fiscalizacion_expdnte c
        on c.id_cnddto = b.id_cnddto
      join v_si_i_sujetos_impuesto e
        on e.id_impsto = b.id_impsto
       and e.id_sjto_impsto = b.id_sjto_impsto
      join fi_g_fsclzcion_expdnte_acto d
        on d.id_fsclzcion_expdnte = c.id_fsclzcion_expdnte
      join gn_g_actos f
        on f.id_acto = d.id_acto
      join gn_d_actos_tipo j
        on j.id_acto_tpo = f.id_acto_tpo
      join gd_g_documentos g
        on g.id_dcmnto = f.id_dcmnto
      left join nt_g_notificaciones h
        on h.id_acto = f.id_acto
      left join v_sg_g_usuarios i
        on i.id_usrio = f.id_usrio
     where d.id_acto_tpo = p_id_acto_tpo
       and (a.id_fsclzcion_lte = p_id_fsclzcion_lte or
           p_id_fsclzcion_lte is null)
       and (d.id_fsclzcion_expdnte_acto = p_id_fsclzcion_expdnte_acto or
           p_id_fsclzcion_expdnte_acto is null)
     order by f.nmro_acto;

  v_json_parametros  clob;
  v_valid_email      boolean;
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
        select json_object(key 'p_id_fsclzcion_expdnte_acto' is
                           r1.id_fsclzcion_expdnte_acto)
          into v_json_parametros
          from dual;

        pkg_ma_envios.prc_co_envio_programado(p_cdgo_clnte     => r1.cdgo_clnte,
                                              p_idntfcdor      => 'NotificacionActoFisca',
                                              p_json_prmtros   => v_json_parametros,
                                              p_id_sjto_impsto => r1.id_sjto_impsto,
                                              p_id_acto        => r1.id_acto);

        if p_ntfccion_atmtca = 'S' and r1.indcdor_ntfccion = 'N' then
          jl_registrar_notificacion(p_id_acto          => r1.id_acto,
                                    p_cdgo_clnte       => r1.cdgo_clnte,
                                    p_id_ntfccion      => r1.id_ntfccion,
                                    p_id_fncnrio       => r1.id_fncnrio,
                                    p_id_usrio         => r1.id_usrio,
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

end jl_envia_email_actos_fisca;
/

