
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_DECLARACION_ACTUALIZA_SUJETO" is

  cursor c1 is
  --email
    select c.id_sjto_impsto,
           c.idntfccion_sjto,
           c.email,
           d.nmbre_rzon_scial,
           c.drccion_ntfccion,
           d.id_actvdad_ecnmca,
           to_char(f.vlor) email_dec
      from gi_g_declaraciones g
      join v_si_i_sujetos_impuesto c
        on c.id_sjto_impsto = g.id_sjto_impsto
       and c.id_sjto_estdo = 1
      join si_i_personas d
        on d.id_sjto_impsto = g.id_sjto_impsto
      join gi_d_dclrcnes_vgncias_frmlr e
        on e.id_dclrcion_vgncia_frmlrio = g.id_dclrcion_vgncia_frmlrio
       and e.id_frmlrio = 764
      join gi_g_declaraciones_detalle f
        on f.id_dclrcion = g.id_dclrcion
       and f.id_frmlrio_rgion_atrbto = 4698
     where trunc(g.fcha_aplccion) = trunc(sysdate)
       and g.cdgo_dclrcion_estdo = 'APL'
       and g.id_impsto = 230012
       and (lower(trim(c.email)) <> lower(trim(to_char(f.vlor))) or
            lower(trim(c.email)) is null)
       and g.id_dclrcion =
           (select max(a.id_dclrcion)
              from gi_g_declaraciones a
             where a.id_sjto_impsto = g.id_sjto_impsto
               and a.id_impsto = g.id_impsto
               and a.cdgo_dclrcion_estdo = 'APL')
     order by g.id_dclrcion;

  cursor c2 is
  --actividad
    select c.id_sjto_impsto,
           c.idntfccion_sjto,
           c.email,
           d.nmbre_rzon_scial,
           c.drccion_ntfccion,
           d.id_actvdad_ecnmca,
           to_char(f.vlor) acti_dec
      from gi_g_declaraciones g
      join v_si_i_sujetos_impuesto c
        on c.id_sjto_impsto = g.id_sjto_impsto
       and c.id_sjto_estdo = 1
      join si_i_personas d
        on d.id_sjto_impsto = g.id_sjto_impsto
      join gi_d_dclrcnes_vgncias_frmlr e
        on e.id_dclrcion_vgncia_frmlrio = g.id_dclrcion_vgncia_frmlrio
       and e.id_frmlrio = 764
      join gi_g_declaraciones_detalle f
        on f.id_dclrcion = g.id_dclrcion
       and f.id_frmlrio_rgion_atrbto = 4712
       and f.fla = 1
     where trunc(g.fcha_aplccion) = trunc(sysdate)
       and g.cdgo_dclrcion_estdo = 'APL'
       and g.id_impsto = 230012
       and (d.id_actvdad_ecnmca <> to_char(f.vlor) or
            d.id_actvdad_ecnmca is null)
       and g.id_dclrcion =
           (select max(a.id_dclrcion)
              from gi_g_declaraciones a
             where a.id_sjto_impsto = g.id_sjto_impsto
               and a.id_impsto = g.id_impsto
               and a.cdgo_dclrcion_estdo = 'APL')
     order by g.id_dclrcion;

  cursor c3 is
  -- direccion
    select c.id_sjto_impsto,
           c.idntfccion_sjto,
           c.email,
           d.nmbre_rzon_scial,
           c.drccion_ntfccion,
           d.id_actvdad_ecnmca,
           to_char(f.vlor) dir_dec
      from gi_g_declaraciones g
      join v_si_i_sujetos_impuesto c
        on c.id_sjto_impsto = g.id_sjto_impsto
       and c.id_sjto_estdo = 1
      join si_i_personas d
        on d.id_sjto_impsto = g.id_sjto_impsto
      join gi_d_dclrcnes_vgncias_frmlr e
        on e.id_dclrcion_vgncia_frmlrio = g.id_dclrcion_vgncia_frmlrio
       and e.id_frmlrio = 764
      join gi_g_declaraciones_detalle f
        on f.id_dclrcion = g.id_dclrcion
       and f.id_frmlrio_rgion_atrbto = 4694
    --   and f.fla = 1
     where trunc(g.fcha_aplccion) = trunc(sysdate)
       and g.cdgo_dclrcion_estdo = 'APL'
       and g.id_impsto = 230012
       and (lower(trim(c.drccion_ntfccion)) <> lower(trim(to_char(f.vlor))) or
            trim(c.drccion_ntfccion) is null)
       and g.id_dclrcion =
           (select max(a.id_dclrcion)
              from gi_g_declaraciones a
             where a.id_sjto_impsto = g.id_sjto_impsto
               and a.id_impsto = g.id_impsto
               and a.cdgo_dclrcion_estdo = 'APL')
     order by g.id_dclrcion;

  cursor c4 is
  --departamento
    select c.id_sjto_impsto,
           c.idntfccion_sjto,
           c.email,
           d.nmbre_rzon_scial,
           c.id_dprtmnto_ntfccion,
           d.id_actvdad_ecnmca,
           to_char(f.vlor) dpto_dec
      from gi_g_declaraciones g
      join v_si_i_sujetos_impuesto c
        on c.id_sjto_impsto = g.id_sjto_impsto
       and c.id_sjto_estdo = 1
      join si_i_personas d
        on d.id_sjto_impsto = g.id_sjto_impsto
      join gi_d_dclrcnes_vgncias_frmlr e
        on e.id_dclrcion_vgncia_frmlrio = g.id_dclrcion_vgncia_frmlrio
       and e.id_frmlrio = 764
      join gi_g_declaraciones_detalle f
        on f.id_dclrcion = g.id_dclrcion
       and f.id_frmlrio_rgion_atrbto = 4695
    --   and f.fla = 1
     where trunc(g.fcha_aplccion) = trunc(sysdate)
       and g.cdgo_dclrcion_estdo = 'APL'
       and g.id_impsto = 230012
       and (c.id_dprtmnto_ntfccion <> to_char(f.vlor) or
            c.id_dprtmnto_ntfccion is null)
       and g.id_dclrcion =
           (select max(a.id_dclrcion)
              from gi_g_declaraciones a
             where a.id_sjto_impsto = g.id_sjto_impsto
               and a.id_impsto = g.id_impsto
               and a.cdgo_dclrcion_estdo = 'APL')
     order by g.id_dclrcion;

  cursor c5 is
  -- municipio
    select c.id_sjto_impsto,
           c.idntfccion_sjto,
           c.email,
           d.nmbre_rzon_scial,
           c.id_mncpio_ntfccion,
           d.id_actvdad_ecnmca,
           to_char(f.vlor) mncpio_dec
      from gi_g_declaraciones g
      join v_si_i_sujetos_impuesto c
        on c.id_sjto_impsto = g.id_sjto_impsto
       and c.id_sjto_estdo = 1
      join si_i_personas d
        on d.id_sjto_impsto = g.id_sjto_impsto
      join gi_d_dclrcnes_vgncias_frmlr e
        on e.id_dclrcion_vgncia_frmlrio = g.id_dclrcion_vgncia_frmlrio
       and e.id_frmlrio = 764
      join gi_g_declaraciones_detalle f
        on f.id_dclrcion = g.id_dclrcion
       and f.id_frmlrio_rgion_atrbto = 4696
    --   and f.fla = 1
     where trunc(g.fcha_aplccion) = trunc(sysdate)
       and g.cdgo_dclrcion_estdo = 'APL'
       and g.id_impsto = 230012
       and (c.id_mncpio_ntfccion <> to_char(f.vlor) or
            c.id_mncpio_ntfccion is null)
       and g.id_dclrcion =
           (select max(a.id_dclrcion)
              from gi_g_declaraciones a
             where a.id_sjto_impsto = g.id_sjto_impsto
               and a.id_impsto = g.id_impsto
               and a.cdgo_dclrcion_estdo = 'APL')
     order by g.id_dclrcion;

  cursor c6 is
    select a.id_instncia_fljo,
           c.id_fljo_trea_orgen,
           a.nmro_rdcdo_dsplay,
           a.fcha_rdcdo
      from pq_g_solicitudes a
      join wf_g_instancias_transicion c
        on c.id_instncia_fljo = a.id_instncia_fljo
       and id_estdo_trnscion in (1, 2)
     where to_char(a.fcha_rdcdo, 'YYYYMM') >= '202408'
       and a.id_instncia_fljo > 1617465
       and not exists (select 1
              from wf_g_instancias_flujo_gnrdo b
             where a.id_instncia_fljo = b.id_instncia_fljo)
       and a.nmro_rdcdo is not null
     order by a.nmro_rdcdo_dsplay;

  -- cursor para determinar si hay embargos asociados a carteras anuladas

  cursor c7 is
    select a.id_sjto_impsto, a.vgncia, a.id_prdo, a.id_embrgos_crtra
      from mc_g_embargos_cartera_detalle a
      join gf_g_movimientos_financiero b
        on b.id_mvmnto_fncro = a.id_mvmnto_fncro
     where a.id_impsto = 230012
       and b.cdgo_mvnt_fncro_estdo = 'AN'
       and b.cdgo_mvmnto_orgn = 'DL'
     group by a.id_sjto_impsto, a.vgncia, a.id_prdo, a.id_embrgos_crtra;

  cursor c8(r_id_sjto_impsto number, r_vgncia number, r_id_prdo number) is
    select a.id_mvmnto_fncro, b.id_dclrcion
      from gf_g_movimientos_financiero a
      join gi_g_declaraciones b
        on b.id_dclrcion = a.id_orgen
     where a.id_sjto_impsto = r_id_sjto_impsto
       and a.vgncia = r_vgncia
       and a.id_prdo = r_id_prdo
       and a.cdgo_mvmnto_orgn = 'DL'
       and a.cdgo_mvnt_fncro_estdo in ('NO', 'CN');

  --Actualiza sujeto tipo
  cursor c9 is
    select c.id_sjto_impsto,
           c.idntfccion_sjto,
           c.email,
           d.nmbre_rzon_scial,
           d.id_sjto_tpo,
           to_char(f.vlor) id_sjto_tpo_dec
      from gi_g_declaraciones g
      join v_si_i_sujetos_impuesto c
        on c.id_sjto_impsto = g.id_sjto_impsto
       and c.id_sjto_estdo = 1
      join si_i_personas d
        on d.id_sjto_impsto = g.id_sjto_impsto
      join gi_d_dclrcnes_vgncias_frmlr e
        on e.id_dclrcion_vgncia_frmlrio = g.id_dclrcion_vgncia_frmlrio
       and e.id_frmlrio = 764
      join gi_g_declaraciones_detalle f
        on f.id_dclrcion = g.id_dclrcion
       and f.id_frmlrio_rgion_atrbto = 4685
    --   and f.fla = 1
     where trunc(g.fcha_aplccion) = trunc(sysdate)
       and g.cdgo_dclrcion_estdo = 'APL'
       and g.id_impsto = 230012
       and (d.id_sjto_tpo <> to_number(f.vlor) or d.id_sjto_tpo is null)
       and d.id_sjto_tpo not in (362, 421)
       and g.id_dclrcion =
           (select max(a.id_dclrcion)
              from gi_g_declaraciones a
             where a.id_sjto_impsto = g.id_sjto_impsto
               and a.id_impsto = g.id_impsto
               and a.cdgo_dclrcion_estdo = 'APL')
     order by g.id_dclrcion;

  v_pqr_no_prtcpnte varchar2(4000);
  v_rcdos_errdos    number;

begin
  --email
  for r1 in c1 loop
    update si_i_sujetos_impuesto a
       set a.email = lower(trim(to_char(r1.email_dec)))
     where a.id_sjto_impsto = r1.id_sjto_impsto;

    dbms_output.put_line('Número de emails actualizados: ' || sql%rowcount);
  end loop;

  commit;

  --actividad
  for r2 in c2 loop
    update si_i_personas a
       set a.id_actvdad_ecnmca = to_char(r2.acti_dec)
     where a.id_sjto_impsto = r2.id_sjto_impsto;

    dbms_output.put_line('Número de actividades actualizadas: ' ||
                         sql%rowcount);
  end loop;

  commit;

  --direccion
  for r3 in c3 loop
    update si_i_sujetos_impuesto a
       set a.drccion_ntfccion = replace(trim(to_char(r3.dir_dec)), '''', '')
     where a.id_sjto_impsto = r3.id_sjto_impsto;
    dbms_output.put_line('Número de direcciones actualizados: ' ||
                         sql%rowcount);
  end loop;

  commit;

  --departamento
  for r4 in c4 loop
    update si_i_sujetos_impuesto a
       set a.id_dprtmnto_ntfccion = to_char(r4.dpto_dec)
     where a.id_sjto_impsto = r4.id_sjto_impsto;
    dbms_output.put_line('Número de departamentos actualizados: ' ||
                         sql%rowcount);
  end loop;

  commit;

  --municipio
  for r5 in c5 loop
    update si_i_sujetos_impuesto a
       set a.id_mncpio_ntfccion = to_char(r5.mncpio_dec)
     where a.id_sjto_impsto = r5.id_sjto_impsto;
    dbms_output.put_line('Número de municipios actualizados: ' ||
                         sql%rowcount);
  end loop;

  commit;

  --sujeto tipo
  for r9 in c9 loop
    update si_i_personas a
       set a.id_sjto_tpo = r9.id_sjto_tpo_dec
     where a.id_sjto_impsto = r9.id_sjto_impsto;
    dbms_output.put_line('Número de c actualizados: ' || sql%rowcount);
  end loop;

  commit;

  v_pqr_no_prtcpnte := null;

  --corrige las radicaciones que no presentan flujo generado
  for r6 in c6 loop
    begin
      pkg_pq_pqr.prc_rg_instancia_flujo(r6.id_instncia_fljo,
                                        r6.id_fljo_trea_orgen);
      commit;
    exception
      when others then
        dbms_output.put_line(r6.nmro_rdcdo_dsplay || ' ' || sqlerrm);
        v_pqr_no_prtcpnte := r6.nmro_rdcdo_dsplay || ',' ||
                             v_pqr_no_prtcpnte;
    end;
  end loop;
  dbms_output.put_line('Radicaciones corregidas');

  if v_pqr_no_prtcpnte is not null then
    temp_enviar_sms(p_tlfno     => '3005020203',
                    p_mnsje     => 'PQR sin participante: ' ||
                                   v_pqr_no_prtcpnte,
                    p_tpo_mnsje => 'AVISO PQR SIN PARTICIPANTE');
    temp_enviar_sms(p_tlfno     => '3107002747',
                    p_mnsje     => 'PQR sin participante: ' ||
                                   v_pqr_no_prtcpnte,
                    p_tpo_mnsje => 'AVISO PQR SIN PARTICIPANTE');
  end if;

  --asigna una fecha de notificacion a los actos que no la tienen
  update gn_g_actos
     set fcha_incio_ntfccion = trunc(fcha)
   where to_char(fcha, 'yyyy') = to_char(sysdate, 'yyyy')
     and fcha_incio_ntfccion is null;
  dbms_output.put_line('Actualizción de fecha de inicio notificacion actos');
  commit;

  -- cierra los pqr que su flujo ha finalizado
  begin
    for r1 in (select a.id_slctud,
                      (select max(b.fcha_fin_real)
                         from wf_g_instancias_transicion b
                        where b.id_instncia_fljo = a.id_instncia_fljo_gnrdo) fcha_real
                 from v_pq_g_solicitudes a
                where a.id_estdo not in (4, 5)
                  and a.estdo_instncia_gnrdo = 'FINALIZADA') loop
      update pq_g_solicitudes a
         set a.id_estdo = 4, a.fcha_real = r1.fcha_real
       where a.id_slctud = r1.id_slctud;
    end loop;
  end;

  dbms_output.put_line('Cierre de los pqr que su flujo ha finalizado');
  commit;

  --actualiza la cartera embargada cuando se encuentra anulada
  begin
    for r7 in c7 loop
      for r8 in c8(r7.id_sjto_impsto, r7.vgncia, r7.id_prdo) loop
        update mc_g_embargos_cartera_detalle c
           set c.id_orgen        = r8.id_dclrcion,
               c.id_mvmnto_fncro = r8.id_mvmnto_fncro
         where c.id_embrgos_crtra = r7.id_embrgos_crtra
           and c.vgncia = r7.vgncia
           and c.id_prdo = r7.id_prdo;
      end loop;
    end loop;
  end;
  dbms_output.put_line('Actualiza la cartera embargada cuando se encuentra anulada');
  commit;

  --Crear los predios faltantes en valorizacion
  INSERT INTO si_i_predios
    (id_sjto_impsto,
     id_prdio_dstno,
     cdgo_estrto,
     cdgo_dstno_igac,
     cdgo_prdio_clsfccion,
     id_prdio_uso_slo,
     avluo_ctstral,
     avluo_cmrcial,
     area_trrno,
     area_cnstrda,
     area_grvble,
     mtrcla_inmblria,
     indcdor_prdio_mncpio,
     id_entdad,
     id_brrio,
     fcha_ultma_actlzcion,
     bse_grvble,
     dstncia,
     lttud,
     lngtud,
     indcdor_mgrdo,
     cdgo_prdio_tpo,
     uso_cnstrccion,
     avluo_trrno,
     avluo_cnstrccion,
     pro_indvso,
     vgncia_actlzda)
    SELECT valor.id_sjto_impsto,
           p.id_prdio_dstno,
           p.cdgo_estrto,
           p.cdgo_dstno_igac,
           p.cdgo_prdio_clsfccion,
           p.id_prdio_uso_slo,
           p.avluo_ctstral,
           p.avluo_cmrcial,
           p.area_trrno,
           p.area_cnstrda,
           p.area_grvble,
           p.mtrcla_inmblria,
           p.indcdor_prdio_mncpio,
           p.id_entdad,
           p.id_brrio,
           p.fcha_ultma_actlzcion,
           p.bse_grvble,
           p.dstncia,
           p.lttud,
           p.lngtud,
           p.indcdor_mgrdo,
           p.cdgo_prdio_tpo,
           p.uso_cnstrccion,
           p.avluo_trrno,
           p.avluo_cnstrccion,
           p.pro_indvso,
           p.vgncia_actlzda
      FROM si_i_sujetos_impuesto valor
      JOIN si_i_sujetos_impuesto predial
        ON predial.id_sjto = valor.id_sjto
       AND predial.id_impsto = 230011
      JOIN si_i_predios p
        ON p.id_sjto_impsto = predial.id_sjto_impsto
     WHERE valor.id_impsto = 2300115
       AND NOT EXISTS
     (SELECT 1
              FROM si_i_predios p2
             WHERE p2.id_sjto_impsto = valor.id_sjto_impsto);

  dbms_output.put_line('Creados los predios faltantes en valorizacion');
  commit;

  --Marca el mandamiento como acto requerido de la citación
  UPDATE cb_g_procesos_jrdco_dcmnto c
     SET c.id_acto_rqrdo =
         (SELECT m.id_acto
            FROM cb_g_procesos_jrdco_dcmnto m
           WHERE m.id_prcsos_jrdco = c.id_prcsos_jrdco
             AND m.id_acto_tpo = 35)
   WHERE c.id_acto_tpo = 26
     and c.id_acto_rqrdo is null
     and c.id_prcsos_jrdco not in (194335, 216412, 215020, 227714, 218741)
     AND EXISTS (SELECT 1
            FROM cb_g_procesos_jrdco_dcmnto t35
           WHERE t35.id_prcsos_jrdco = c.id_prcsos_jrdco
             AND t35.id_acto_tpo = 35
             and t35.id_acto is not null);
  dbms_output.put_line('Marca el mandamiento como acto requerido de la citación: ' ||
                       sql%rowcount);
  commit;

  --Cambia el funcionario de los procesos de cobro
  UPDATE CB_G_PROCESOS_JURIDICO t
     SET T.ID_FNCNRIO = 194 -- Beatriz Berrocal
   where id_fncnrio = 296; -- Javier Lujan
  dbms_output.put_line('Cambia el funcionario de los procesos de cobro: ' ||
                       sql%rowcount);
  commit;

  --Corrige los pagos aplicados duplicados
  jl_prc_pago_duplicado(p_id_rcdo => null);
  dbms_output.put_line('Pagos dobles');

  --Marca como finalizados los convenios sin saldo en cartera
  UPDATE gf_g_convenios c
     SET c.cdgo_cnvnio_estdo = 'FNL', c.fcha_fnlzcion = sysdate
   WHERE c.cdgo_cnvnio_estdo = 'APL'
     AND EXISTS
   (SELECT 1
            FROM (SELECT (SELECT SUM(cc.vlor_sldo_cptal + cc.vlor_intres)
                            FROM gf_g_convenios_cartera d
                            JOIN v_gf_g_cartera_x_concepto cc
                              ON cc.id_sjto_impsto = c.id_sjto_impsto
                             AND cc.vgncia = d.vgncia
                             AND cc.id_prdo = d.id_prdo
                             AND cc.id_cncpto = d.id_cncpto
                             AND cc.cdgo_mvnt_fncro_estdo in ('CN', 'NO')
                           WHERE d.id_cnvnio = c.id_cnvnio) AS ttal_sldo
                    FROM dual) x
           WHERE NVL(x.ttal_sldo, 0) = 0);
  dbms_output.put_line('Marca como finalizados los convenios sin saldo en cartera: ' ||
                       sql%rowcount);
  commit;

  select count(*)
    into v_rcdos_errdos
    from re_g_recaudos a
    join (select x.id_rcdo, sum(x.vlor_ttal) as valor_detalle
            from v_re_g_recaudos_detalle x
           group by x.id_rcdo) b
      on a.id_rcdo = b.id_rcdo
     and a.vlor <> b.valor_detalle
   where cdgo_rcdo_estdo = 'AP'
     and extract(year from fcha_rcdo) = extract(year from sysdate)
     and a.vlor > 0;

  if v_rcdos_errdos > 0 then
    temp_enviar_sms(p_tlfno     => '3005020203',
                    p_mnsje     => 'Existen ' || v_rcdos_errdos ||
                                   ' pagos  errados - Monteria. Por favor revisar',
                    p_tpo_mnsje => 'PAGOS DESCUADRADOS');
    temp_enviar_sms(p_tlfno     => '3107002747',
                    p_mnsje     => 'Existen ' || v_rcdos_errdos ||
                                   ' pagos errados - Monteria. Por favor revisar',
                    p_tpo_mnsje => 'PAGOS DESCUADRADOS');
  end if;

  -- marca como fallidas las declaraciones que no fueron firmadas
  jl_vlda_dlcrcnes_place;
  dbms_output.put_line('Marcada como fallidas las declaraciones PLACE que no fueron firmadas');

  -- aplica las declaraciones firmadas con pago cero que se paso la fecha de vencimiento
  jl_ap_decl_firmadas_sin_pago(p_id_pgdor_dcmnto => null);
  dbms_output.put_line('Aplicadas las declaraciones firmadas con pago cero que se paso la fecha de vencimiento');
end jl_declaracion_actualiza_sujeto;
/

