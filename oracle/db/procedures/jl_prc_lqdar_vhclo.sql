
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_PRC_LQDAR_VHCLO" (p_plca      varchar2,
                                               p_vgncia    number,
                                               p_avluo     number,
                                               p_id_usrio  number,
                                               p_nmro_mses number default 12) is

  v_cdgo_clnte  number := 23001;
  v_id_impsto   number := 230017;
  v_cdgo_cncpto varchar2(10) := '8001';
  v_trfa        number := 2;

  v_id_impsto_sbmpsto     number;
  v_id_sjto_impsto        number;
  v_id_prdo               number;
  v_id_impsto_acto_cncpto number;
  v_fcha_vncmnto          date;
  v_id_lqdcion_tpo        number;
  v_id_lqdcion            number;
  v_vlor_mnmo             number;

  v_vlor_lqddo  number;
  v_vlor_clcldo number;

  o_cdgo_rspsta  number;
  o_mnsje_rspsta varchar2(4000);
begin

  if p_vgncia >= 2016 then
    dbms_output.put_line('Esta vigencia debe liquidarse por la opción de novedades del aplicativo');
    return;
  end if;

  begin
    select a.id_sjto_impsto
      into v_id_sjto_impsto
      from v_si_i_sujetos_impuesto a
     where a.idntfccion_sjto = p_plca
       and a.id_impsto = v_id_impsto;
  exception
    when no_data_found then
      dbms_output.put_line('No existe el sujeto con placa: ' || p_plca);
      return;
  end;
  for r1 in (select 1
               from gi_g_liquidaciones a
              where a.id_sjto_impsto = v_id_sjto_impsto
                and a.vgncia = p_vgncia
                and a.cdgo_lqdcion_estdo = 'L') loop
    dbms_output.put_line('El vehículo ya cuenta con liquidación para la vigencia: ' ||
                         p_vgncia);
    return;
  end loop;

  select id_impsto_acto_cncpto,
         fcha_vncmnto,
         b.id_impsto_sbmpsto,
         a.id_prdo
    into v_id_impsto_acto_cncpto,
         v_fcha_vncmnto,
         v_id_impsto_sbmpsto,
         v_id_prdo
    from df_i_impuestos_acto b
    join v_df_i_impuestos_acto_concepto a
      on a.id_impsto_acto = b.id_impsto_acto
   where b.id_impsto = v_id_impsto
     and a.vgncia = p_vgncia
     and a.actvo = 'S'
     and a.cdgo_cncpto = v_cdgo_cncpto;

  select id_lqdcion_tpo
    into v_id_lqdcion_tpo
    from genesys.df_i_liquidaciones_tipo
   where cdgo_clnte = v_cdgo_clnte
     and id_impsto = v_id_impsto
     and cdgo_lqdcion_tpo = 'MG';

  -- creando la liquidacion
  v_vlor_clcldo := round(p_avluo * v_trfa / 1000);
  v_vlor_lqddo  := round(v_vlor_clcldo / 12 * p_nmro_mses);

  begin
    -- se busca el smldv
    select trunc(vlor * 4)
      into v_vlor_mnmo
      from df_s_indicadores_economico
     where cdgo_indcdor_tpo = 'SMLDV'
       and to_date(p_vgncia || '0102', 'YYYYMMDD') between fcha_dsde and
           fcha_hsta;
  exception
    when no_data_found then
      dbms_output.put_line('No hay salrio minimo diario para la vigencia: ' ||
                           p_vgncia);
      return;
  end;

  if v_vlor_lqddo < v_vlor_mnmo then
    v_vlor_lqddo := v_vlor_mnmo;
  end if;

  insert into gi_g_liquidaciones
    (cdgo_clnte,
     id_impsto,
     id_impsto_sbmpsto,
     vgncia,
     id_prdo,
     id_sjto_impsto,
     fcha_lqdcion,
     cdgo_lqdcion_estdo,
     bse_grvble,
     vlor_ttal,
     nmro_dcmnto_sprte,
     id_dcmnto_tpo_sprte,
     fcha_dcmnto_sprte,
     id_lqdcion_tpo,
     id_ttlo_ejctvo,
     cdgo_prdcdad,
     id_prcso_crga,
     id_lqdcion_antrior,
     id_usrio,
     nmro_mses,
     indcdor_mgrdo,
     indcdor_intrfaz,
     id_sjto_scrsal)
  values
    (v_cdgo_clnte,
     v_id_impsto,
     v_id_impsto_sbmpsto,
     p_vgncia,
     v_id_prdo,
     v_id_sjto_impsto,
     sysdate,
     'L',
     p_avluo,
     v_vlor_lqddo,
     'LIQ-DB: ' || user,
     null,
     null,
     v_id_lqdcion_tpo,
     '0',
     'ANU',
     null,
     null,
     nvl(p_id_usrio, 1),
     null,
     'V',
     'N',
     null)
  returning id_lqdcion into v_id_lqdcion;

  --creando el concepto
  insert into gi_g_liquidaciones_concepto
    (id_lqdcion,
     id_impsto_acto_cncpto,
     vlor_lqddo,
     vlor_clcldo,
     trfa,
     bse_cncpto,
     txto_trfa,
     vlor_intres,
     indcdor_lmta_impsto,
     fcha_vncmnto,
     prcntje_lmte_impsto,
     indcdor_mgrdo)

  values
    (v_id_lqdcion,
     v_id_impsto_acto_cncpto,
     v_vlor_lqddo,
     v_vlor_clcldo,
     v_trfa,
     p_avluo,
     v_trfa || '/1000',
     0,
     'N',
     v_fcha_vncmnto,
     null,
     null);

  /*
    for r1 in (select *
                 from v_si_i_vehiculos a
                where a.id_sjto_impsto = v_id_sjto_impsto) loop
      --insertamos en liquidaciones vehiculo
      insert into gi_g_liquidaciones_ad_vehclo
        (id_lqdcion,
         cdgo_vhclo_clse,
         cdgo_vhclo_mrca,
         id_vhclo_lnea,
         cdgo_vhclo_srvcio,
         clndrje,
         cpcdad_crga,
         cpcdad_psjro,
         mdlo,
         cdgo_vhclo_crrcria,
         cdgo_vhclo_blndje,
         cdgo_vhclo_oprcion,
         frccion
         --         id_vhclo_grpo,
         )
      values
        (v_id_lqdcion,
         r1.cdgo_vhclo_clse,
         r1.cdgo_vhclo_mrca,
         r1.id_vhclo_lnea,
         r1.cdgo_vhclo_srvcio,
         r1.clndrje,
         r1.cpcdad_crga,
         r1.cpcdad_psjro,
         r1.mdlo,
         r1.cdgo_vhclo_crrcria,
         r1.cdgo_vhclo_blndje,
         r1.cdgo_vhclo_oprcion,
         p_nmro_mses);
    end loop;
  */

  --paso a movimiento financiero

  pkg_gf_movimientos_financiero.prc_gn_paso_liquidacion_mvmnto(p_cdgo_clnte        => v_cdgo_clnte,
                                                               p_id_lqdcion        => v_id_lqdcion,
                                                               p_cdgo_orgen_mvmnto => 'LQ',
                                                               p_id_orgen_mvmnto   => v_id_lqdcion,
                                                               o_cdgo_rspsta       => o_cdgo_rspsta,
                                                               o_mnsje_rspsta      => o_mnsje_rspsta);

  if (o_cdgo_rspsta <> 0) then
    rollback;
    dbms_output.put_line('Error en el paso a movimiento financiero');
    return;
  end if;
  dbms_output.put_line('Exitoso');
  commit;
end jl_prc_lqdar_vhclo;
/

