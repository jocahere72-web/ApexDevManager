
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_CRRGIR_PLAN_PAGOS" is
  v_cdgo_rspsta  number;
  v_mnsje_rspsta varchar2(400);
  v_vgncia_prdo  clob;

  v_vlor_intres_ttal number;

  v_vlor_intres_ttal_nvo number;
  v_nmro_ctas            number;
  v_vlor_intres_cta      number;
  v_vlor_dfncia          number;

begin
  for r1 in (select a.id_cnvnio,
                    b.id_acto,
                    c.id_dcmnto,
                    a.nmro_cnvnio,
                    a.id_sjto_impsto,
                    a.id_cnvnio_tpo,
                    a.nmro_cta,
                    a.fcha_prmra_cta,
                    a.cdgo_prdcdad_cta,
                    d.vlor_ttal,
                    a.fcha_slctud
               from gf_g_convenios a
               join gn_g_actos b
                 on b.id_acto = a.id_acto
               join gd_g_documentos c
                 on c.id_dcmnto = b.id_dcmnto
               join re_g_documentos d
                 on d.id_dcmnto = a.id_dcmnto_cta_incial
              where a.id_cnvnio_tpo in (4, 5)
                and a.nmro_cnvnio IN (20210000803)
                   -- and to_char(a.fcha_slctud, 'YYYYMMDD') >= '202112277'
                   -- a.id_cnvnio = 7022
                and a.cdgo_cnvnio_estdo = 'APL') loop

    --se obtienen las vigencias seleccionadas en el acuerdo

    select LISTAGG(VGNCIA_PRDO, ':') WITHIN GROUP(ORDER BY VGNCIA_PRDO) || ':'
      into v_vgncia_prdo
      from (

            select vgncia || prdo || cdgo_mvmnto_orgen || id_orgen VGNCIA_PRDO
              from v_GF_G_CONVENIOS_CARTERA t
             where t.id_cnvnio = r1.id_cnvnio
             group by t.vgncia, t.prdo, t.cdgo_mvmnto_orgen, t.id_orgen);

    delete from gn_g_temporal g where g.id_ssion = r1.id_cnvnio;
    commit;

    --Se llena la tabla gn_g_temporal

    pkg_gf_convenios.prc_gn_convenio_extracto(p_cdgo_clnte       => 23001,
                                              p_id_ssion         => r1.id_cnvnio,
                                              p_id_sjto_impsto   => r1.id_sjto_impsto,
                                              p_id_cnvnio_tpo    => r1.id_cnvnio_tpo,
                                              p_nmro_ctas        => r1.nmro_cta,
                                              p_fcha_prmra_cta   => r1.fcha_prmra_cta,
                                              p_cdgo_prdcdad_cta => r1.cdgo_prdcdad_cta,
                                              p_vlor_cta_incial  => r1.vlor_ttal,
                                              p_cdna_vgncia_prdo => v_vgncia_prdo,
                                              p_cdgo_rspsta      => v_cdgo_rspsta,
                                              p_fcha_slctud      => r1.fcha_slctud,
                                              p_mnsje_rspsta     => v_mnsje_rspsta);
    if v_cdgo_rspsta != 0 then
      dbms_output.put_line('id_cnvnio: ' || r1.id_cnvnio || ' ' ||
                           v_mnsje_rspsta);
      continue;
    else
      commit;
    end if;

    for r2 in (select n001 nmro_cta,
                      d001 fcha_cta,
                      n004 vlor_cptal,
                      n005 vlor_intres,
                      n003 vlor_fnccion,
                      n002 vlor_cta
                 from gn_g_temporal
                where id_ssion = r1.id_cnvnio
                order by n001) loop

      update gf_g_convenios_extracto e
         set e.vlor_cptal    = r2.vlor_cptal,
             e.vlor_intres   = r2.vlor_intres,
             e.vlor_fncncion = r2.vlor_fnccion,
             e.vlor_ttal     = r2.vlor_cta
       where e.id_cnvnio = r1.id_cnvnio
         and e.nmro_cta = r2.nmro_cta;
    end loop;

    commit;
    /*
      --Se distribuyen los intereses

      select sum(e.vlor_intres), count(*)
        into v_vlor_intres_ttal, v_nmro_ctas
        from gf_g_convenios_extracto e
       where e.id_cnvnio = r1.id_cnvnio;

      v_vlor_intres_cta := round(v_vlor_intres_ttal / v_nmro_ctas);

      update gf_g_convenios_extracto e
         set e.vlor_intres = v_vlor_intres_cta
       where e.id_cnvnio = r1.id_cnvnio;

      select sum(e.vlor_intres)
        into v_vlor_intres_ttal_nvo
        from gf_g_convenios_extracto e
       where e.id_cnvnio = r1.id_cnvnio;

      if v_vlor_intres_ttal_nvo <> v_vlor_intres_ttal then

        v_vlor_dfncia := v_vlor_intres_ttal_nvo - v_vlor_intres_ttal;

        update gf_g_convenios_extracto e
           set e.vlor_intres = e.vlor_intres - v_vlor_dfncia
         where e.id_cnvnio = r1.id_cnvnio
           and e.nmro_cta = v_nmro_ctas;
      end if;

      update gf_g_convenios_extracto e
         set e.vlor_ttal = e.vlor_cptal + e.vlor_intres + e.vlor_fncncion
       where e.id_cnvnio = r1.id_cnvnio;

      commit;

    for r3 in (select a.*,
                      b.vlor_fncncion vlor_fncncion_extrcto,
                      b.vlor_ttal     vlor_cta_extrcto
                 from (select row_number() over(partition by decode(a.estdo_cta, 'PAGADA', 0, 1) order by a.nmro_cta) row_num,
                              a.id_cnvnio_extrcto,
                              a.id_cnvnio,
                              a.nmro_cta,
                              a.fcha_vncmnto,
                              a.estdo_cta,
                              round(sum(a.vlor_cncpto_fnccion)) vlor_fnccion_rcbo,
                              --    :P140_FCHA_VNCMNTO,
                              round(sum(a.vlor_cncpto_ttal)) vlor_cta_rcbo
                         from table(pkg_gf_convenios.fnc_cl_convenios_cuota_cncpto(23001,
                                                                                   r1.id_cnvnio,
                                                                                   r1.fcha_prmra_cta)) a
                       --where a.estdo_cta != 'PAGADA'
                        group by a.id_cnvnio_extrcto,
                                 a.id_cnvnio,
                                 a.nmro_cta,
                                 a.fcha_vncmnto,
                                 --     :P140_FCHA_VNCMNTO,
                                 a.estdo_cta) a
                 join gf_g_convenios_extracto b
                   on b.id_cnvnio_extrcto = a.id_cnvnio_extrcto
                order by b.nmro_cta) loop

      if r3.vlor_cta_rcbo <> r3.vlor_cta_extrcto then
        update gf_g_convenios_extracto t
           set t.vlor_fncncion =
               (r3.vlor_cta_rcbo - r3.vlor_cta_extrcto) +
               r3.vlor_fncncion_extrcto,
               t.vlor_ttal     = r3.vlor_cta_rcbo
         where t.id_cnvnio_extrcto = r3.id_cnvnio_extrcto;
      end if;
    end loop;

    commit;*/
  end loop;
end TEMP_CRRGIR_PLAN_PAGOS;
/

