
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_ACTUALIZAR_INFO_AFOROS" (p_cdgo_clnte number,
                                                      p_vgncia     number) is
  cursor c1 is
    select a.id_sjto_impsto, a.vgncia, a.rowid
      from temp_aforo_consolidado a
     where a.vgncia = p_vgncia
        or p_vgncia is null
     order by a.liquidacion_de_aforo_reso;

  cursor c2(r_id_sjto_impsto number, r_vgncia number, r_id_acto_tpo number) is
    select c.dscrpcion_sjto_estdo,
           f.nmro_acto,
           f.fcha,
           f.fcha_ntfccion,
           f.id_acto
      from v_si_i_sujetos_impuesto c
      left join v_gn_g_actos_sujeto_impuesto f
        on f.id_sjto_impsto = c.id_sjto_impsto
       and f.id_acto_tpo = r_id_acto_tpo -- liquidacion aforo
       and exists (select 1
              from gn_g_actos_vigencia v
             where v.id_acto = f.id_acto
               and v.vgncia = r_vgncia)
     where c.id_impsto = p_cdgo_clnte || 2
       and c.id_sjto_impsto = r_id_sjto_impsto;

  cursor c3(r_id_sjto_impsto number, r_vgncia number) is
    select e.nmro_cnsctvo, e.fcha_prsntcion, e.vlor_ttal, e.vlor_pago
      from gi_g_declaraciones e
      join gi_d_dclrcnes_vgncias_frmlr b
        on b.id_dclrcion_vgncia_frmlrio = e.id_dclrcion_vgncia_frmlrio
       and b.id_frmlrio = 764 -- declaracion anual
     where e.cdgo_clnte = p_cdgo_clnte
       and e.id_impsto = p_cdgo_clnte || 2
       and e.id_sjto_impsto = r_id_sjto_impsto
       and e.vgncia = r_vgncia
       and e.cdgo_dclrcion_estdo = 'APL'
       and (e.indcdor_mgrdo is null or e.indcdor_mgrdo <> 'C')
       and e.id_dclrcion =
           (select max(b.id_dclrcion)
              from gi_g_declaraciones b
             where b.id_impsto = e.id_impsto
               and b.id_sjto_impsto = e.id_sjto_impsto
               and b.id_dclrcion_vgncia_frmlrio =
                   e.id_dclrcion_vgncia_frmlrio
               and b.cdgo_dclrcion_estdo = e.cdgo_dclrcion_estdo
               and (b.indcdor_mgrdo is null or b.indcdor_mgrdo <> 'C'));

  cursor c4(r_id_sjto_impsto number, r_id_acto number) is
    select listagg(distinct i.asnto, ',') within group(order by h.id_envio) asnto,
           listagg(distinct i.dstno, ',') within group(order by h.id_envio) email,
           listagg(distinct i.status, ',') within group(order by h.id_envio) status,
           LISTAGG(DISTINCT CASE
                     WHEN i.status IS NULL THEN
                      'NO NOTIFICADO'
                     WHEN i.status = 'HARDBOUNCED' THEN
                      'NO NOTIFICADO'
                     ELSE
                      'NOTIFICADO'
                   END,
                   ',') WITHIN GROUP(ORDER BY h.id_envio) AS notificado
      from ma_g_envios h
      join v_ma_g_envios_medio i
        on i.id_envio = h.id_envio
     where h.id_sjto_impsto = r_id_sjto_impsto
       and h.id_acto = r_id_acto
     group by h.id_sjto_impsto, h.id_acto;

  cursor c5(r_id_sjto_impsto number, r_fcha_ntfccion date) is
    select replace(listagg(distinct
                           d.nmro_rdcdo_dsplay || ' (' || d.id_mtvo || ' ' ||
                           d.dscrpcion_mtvo || ')',
                           chr(10)) within
                   group(order by d.nmro_rdcdo_dsplay),
                   ' ()',
                   '') pqr
      from v_pq_g_solicitudes d
     where d.id_sjto_impsto = r_id_sjto_impsto
       and d.id_mtvo not in (115, 197, 105)
       and trunc(d.fcha_rdcdo) >= trunc(r_fcha_ntfccion);

  v_liquidacion_de_aforo    temp_aforo_consolidado.liquidacion_de_aforo%type;
  v_fecha_acto              temp_aforo_consolidado.fecha_acto%type;
  v_notificacion            temp_aforo_consolidado.notificacion%type;
  v_estado_rit              temp_aforo_consolidado.estado_rit%type;
  v_presento_declaracion    temp_aforo_consolidado.presento_declaracion%type;
  v_n_declaracion           temp_aforo_consolidado.n_declaracion%type;
  v_fecha_presentacion_decl temp_aforo_consolidado.fecha_presentacion_decl%type;
  v_valor_declarado         temp_aforo_consolidado.valor_declarado%type;
  v_valor_pagado            temp_aforo_consolidado.valor_pagado%type;
  v_tiene_pqr               temp_aforo_consolidado.tiene_pqr%type;
  v_asnto                   temp_aforo_consolidado.asnto%type;
  v_email_envio_loa         temp_aforo_consolidado.email_envio_loa%type;
  v_notificado              temp_aforo_consolidado.notificado%type;
  v_estado_envio_loa        temp_aforo_consolidado.estado_envio_loa%type;
  v_ejctria                 temp_aforo_consolidado.ejctria%type;

  v_id_acto gn_g_actos.id_acto%type;

begin

  for r1 in c1 loop
    v_id_acto                 := null;
    v_liquidacion_de_aforo    := null;
    v_fecha_acto              := null;
    v_notificacion            := null;
    v_estado_rit              := null;
    v_presento_declaracion    := null;
    v_n_declaracion           := null;
    v_fecha_presentacion_decl := null;
    v_valor_declarado         := null;
    v_valor_pagado            := null;
    v_tiene_pqr               := null;
    v_asnto                   := null;
    v_email_envio_loa         := null;
    v_notificado              := null;
    v_estado_envio_loa        := null;
    v_ejctria                 := null;

    --info liquidacion aforo
    for r2 in c2(r1.id_sjto_impsto, r1.vgncia, 133) loop
      v_id_acto              := r2.id_acto;
      v_liquidacion_de_aforo := r2.nmro_acto;
      v_fecha_acto           := r2.fcha;
      v_notificacion         := r2.fcha_ntfccion;
      v_estado_rit           := r2.dscrpcion_sjto_estdo;
    end loop;

    --info ejecutoria
    for r2 in c2(r1.id_sjto_impsto, r1.vgncia, 142) loop
      v_ejctria := r2.nmro_acto;
    end loop;

    v_presento_declaracion := 'N';
    for r3 in c3(r1.id_sjto_impsto, r1.vgncia) loop
      v_presento_declaracion    := 'S';
      v_n_declaracion           := r3.nmro_cnsctvo;
      v_fecha_presentacion_decl := r3.fcha_prsntcion;
      v_valor_declarado         := r3.vlor_ttal;
      v_valor_pagado            := r3.vlor_pago;
    end loop;

    if v_id_acto is not null then

      for r4 in c4(r1.id_sjto_impsto, v_id_acto) loop
        v_asnto            := r4.asnto;
        v_email_envio_loa  := r4.email;
        v_notificado       := r4.notificado;
        v_estado_envio_loa := r4.status;
      end loop;

    end if;

    if v_notificacion is not null then

      for r5 in c5(r1.id_sjto_impsto, v_notificacion) loop
        v_tiene_pqr := r5.pqr;
      end loop;

    end if;

    update temp_aforo_consolidado a
       set liquidacion_de_aforo      = v_liquidacion_de_aforo,
           a.fecha_acto              = v_fecha_acto,
           a.notificacion            = v_notificacion,
           a.estado_rit              = v_estado_rit,
           a.presento_declaracion    = v_presento_declaracion,
           a.n_declaracion           = v_n_declaracion,
           a.fecha_presentacion_decl = v_fecha_presentacion_decl,
           a.valor_declarado         = v_valor_declarado,
           a.valor_pagado            = v_valor_pagado,
           a.tiene_pqr               = v_tiene_pqr,
           a.asnto                   = v_asnto,
           a.email_envio_loa         = v_email_envio_loa,
           a.notificado              = v_notificado,
           a.estado_envio_loa        = v_estado_envio_loa,
           a.ejctria                 = v_ejctria
     where a.rowid = r1.rowid;
  end loop;

  commit;
end jl_actualizar_info_aforos;
/

