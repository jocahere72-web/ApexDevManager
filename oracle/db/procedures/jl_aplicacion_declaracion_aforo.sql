
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_APLICACION_DECLARACION_AFORO" (p_cdgo_clnte number,
                                                            p_idntfccion varchar2,
                                                            p_vgncia     number) is
  cursor c1 is
    select a.*, add_months(f.fcha_ntfccion, 2) fcha_ejctria, a.rowid
      from temp_aforo_consolidado a
      join v_gn_g_actos_sujeto_impuesto f
        on f.id_sjto_impsto = a.id_sjto_impsto
       and f.id_acto_tpo = 133
       and exists (select 1
              from gn_g_actos_vigencia v
             where v.id_acto = f.id_acto
               and v.vgncia = a.vgncia)
     where a.vgncia = p_vgncia
       and dclrcion_crgda = 'S'
       and a.dclrcion_aplcda = 'N'
       and a.id_dclrcion is not null
          --and a.ejctria is not null
       and (a.identificacion = p_idntfccion or p_idntfccion is null)
     order by a.liquidacion_de_aforo_reso;

  o_rcdo_cntrol  number;
  o_id_rcdo      number;
  o_cdgo_rspsta  number;
  o_mnsje_rspsta varchar2(500);
  v_fcha_pgos    date;

  v_id_bnco              number := 22;
  v_id_bnco_cnta         number := 109;
  v_id_usrio_aplca_rcdos number := 230017;

begin

  select max(add_months(f.fcha_ntfccion, 2)) fcha_ejctria
    into v_fcha_pgos
    from temp_aforo_consolidado a
    join v_gn_g_actos_sujeto_impuesto f
      on f.id_sjto_impsto = a.id_sjto_impsto
     and f.id_acto_tpo = 133
     and exists (select 1
            from gn_g_actos_vigencia v
           where v.id_acto = f.id_acto
             and v.vgncia = a.vgncia)
   where a.vgncia = p_vgncia
     and dclrcion_crgda = 'S'
     and a.dclrcion_aplcda = 'N'
     and a.id_dclrcion is not null
   order by a.liquidacion_de_aforo_reso;

  pkg_re_recaudos.prc_rg_recaudo_control(p_cdgo_clnte        => p_cdgo_clnte,
                                         p_id_impsto         => p_cdgo_clnte || 2,
                                         p_id_impsto_sbmpsto => p_cdgo_clnte || 22,
                                         p_id_bnco           => v_id_bnco,
                                         p_id_bnco_cnta      => v_id_bnco_cnta,
                                         p_fcha_cntrol       => v_fcha_pgos,
                                         p_obsrvcion         => 'Control de cargue declaraciones de aforo.',
                                         p_cdgo_rcdo_orgen   => 'MN',
                                         p_id_usrio          => v_id_usrio_aplca_rcdos,
                                         o_id_rcdo_cntrol    => o_rcdo_cntrol,
                                         o_cdgo_rspsta       => o_cdgo_rspsta,
                                         o_mnsje_rspsta      => o_mnsje_rspsta);

  for r1 in c1 loop
    o_id_rcdo := null;
    pkg_re_recaudos.prc_rg_recaudo(p_cdgo_clnte         => p_cdgo_clnte,
                                   p_id_rcdo_cntrol     => o_rcdo_cntrol,
                                   p_id_sjto_impsto     => r1.id_sjto_impsto,
                                   p_cdgo_rcdo_orgn_tpo => 'DL',
                                   p_id_orgen           => r1.id_dclrcion,
                                   p_vlor               => 0,
                                   p_obsrvcion          => 'Liquidación Aforo.',
                                   p_cdgo_frma_pgo      => 'TR', -- Transferencia
                                   p_cdgo_rcdo_estdo    => 'RG', -- Se coloca RG para que se pueda aplicar.
                                   p_fcha_ingrso_bnco   => v_fcha_pgos,
                                   o_id_rcdo            => o_id_rcdo,
                                   o_cdgo_rspsta        => o_cdgo_rspsta,
                                   o_mnsje_rspsta       => o_mnsje_rspsta);

    if o_cdgo_rspsta = 0 then

      update gi_g_declaraciones a
         set a.id_rcdo             = o_id_rcdo,
             a.cdgo_dclrcion_estdo = 'PRS',
             a.fcha_autrzcion      = v_fcha_pgos,
             a.id_usrio_aplccion   = v_id_usrio_aplca_rcdos
       where a.id_dclrcion = r1.id_dclrcion;

      pkg_re_recaudos.prc_ap_recaudo(p_id_usrio     => v_id_usrio_aplca_rcdos,
                                     p_cdgo_clnte   => p_cdgo_clnte,
                                     p_id_rcdo      => o_id_rcdo,
                                     o_cdgo_rspsta  => o_cdgo_rspsta,
                                     o_mnsje_rspsta => o_mnsje_rspsta);

      if o_cdgo_rspsta = 0 then
        update temp_aforo_consolidado a
           set a.dclrcion_aplcda = 'S'
         where a.rowid = r1.rowid;
        commit;
      else
        dbms_output.put_line('Error Aplicando Recaudo: ' ||
                             r1.liquidacion_de_aforo_reso || ' ' ||
                             o_mnsje_rspsta);
      end if;
    else
      dbms_output.put_line('Error Registrando Recaudo: ' ||
                           r1.liquidacion_de_aforo_reso || ' ' ||
                           o_mnsje_rspsta);
    end if;
  end loop;

  UPDATE gi_g_liquidaciones c
     SET c.id_lqdcion_tpo = 26
   WHERE c.id_lqdcion_tpo <> 26
     AND EXISTS (SELECT 1
            FROM temp_aforo_consolidado a
            JOIN gi_g_declaraciones b
              ON b.id_dclrcion = a.id_dclrcion
           WHERE a.id_dclrcion IS NOT NULL
             AND b.id_lqdcion = c.id_lqdcion);

  commit;
exception
  when others then
    rollback;
    dbms_output.put_line('Error General: ' || SQLERRM);

end jl_aplicacion_declaracion_aforo;
/

