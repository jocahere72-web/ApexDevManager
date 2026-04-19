
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_PRC_ESTDO_PRCSOS_JRDCOS_ICA" is

  cursor c1 is
    select a.id_prcsos_jrdco,
           a.nmro_prcso_jrdco,
           a.fcha,
           c.idntfccion_sjto,
           c.idntfccion_antrior,
           c.id_sjto,
           c.id_sjto_impsto,
           e.idntfccion idntfccion_rspnsble,
           e.prmer_nmbre,
           f.nombre_etpa,
           f.fncnrio_rspnsble,
           a.vlor_ttal_dda
      from cb_g_procesos_juridico a
      join v_cb_g_procesos_jrdco_dcmnto f
        on a.id_prcsos_jrdco = f.id_prcsos_jrdco
       and f.id_acto_tpo = 35
      join v_si_i_sujetos_impuesto c
        on f.idntfccion = c.idntfccion_sjto
       and c.id_impsto = 230012
      join cb_g_procesos_jrdco_rspnsble e
        on a.id_prcsos_jrdco = e.id_prcsos_jrdco
     where fnc_prcso_jrdco_impsto(a.id_prcsos_jrdco) = 230012
     group by a.id_prcsos_jrdco,
              a.nmro_prcso_jrdco,
              a.fcha,
              c.idntfccion_sjto,
              c.idntfccion_antrior,
              c.id_sjto,
              c.id_sjto_impsto,
              e.idntfccion,
              e.prmer_nmbre,
              f.nombre_etpa,
              f.fncnrio_rspnsble,
              a.vlor_ttal_dda
     order by a.id_prcsos_jrdco desc;

  cursor c2(r_id_prcsos_jrdco number) is
    select id_prcsos_jrdco,
           LISTAGG(vgncia || '-' || prdo, ', ') WITHIN GROUP(ORDER BY vgncia) vgncia,
           cdgo_mvnt_fncro_estdo,
           sum(vlor_cptal) vlor_cptal,
           sum(vlor_intres) vlor_intres
      from (select c.prdo,
                   b.vgncia,
                   a.id_prcsos_jrdco,
                   c.cdgo_mvnt_fncro_estdo,
                   sum(c.vlor_sldo_cptal) vlor_cptal,
                   sum(c.vlor_intres) vlor_intres
              from cb_g_procesos_jrdco_dcmnto a
              join cb_g_prcsos_jrdc_dcmnt_mvnt b
                on b.id_prcsos_jrdco_dcmnto = a.id_prcsos_jrdco_dcmnto
              join v_gf_g_cartera_x_concepto c
                on c.cdgo_clnte = 23001
               and c.id_impsto = b.id_impsto
               and c.id_impsto_sbmpsto = b.id_impsto_sbmpsto
               and c.vgncia = b.vgncia
               and c.id_prdo = b.id_prdo
               and c.id_cncpto = b.id_cncpto
               and c.id_sjto_impsto = b.id_sjto_impsto
               and c.cdgo_mvnt_fncro_estdo in ('CN', 'NO')
             where a.id_prcsos_jrdco = r_id_prcsos_jrdco
               and a.id_acto_tpo = 35
             group by a.id_prcsos_jrdco,
                      c.prdo,
                      b.vgncia,
                      c.cdgo_mvnt_fncro_estdo)
     group by id_prcsos_jrdco, cdgo_mvnt_fncro_estdo;

  /* cursor c3(r_id_sjto varchar2, r_vgncia number) is
  select v.vlor_sldo_cptal       sldo_cptal,
         v.vlor_intres           sldo_intres,
         v.cdgo_mvnt_fncro_estdo estdo_fctra
    from v_gf_g_cartera_x_vigencia v
    join v_si_i_sujetos_impuesto i
      on i.cdgo_clnte = v.cdgo_clnte
     and i.id_impsto = v.id_impsto
     and i.id_sjto_impsto = v.id_sjto_impsto
   where v.cdgo_clnte = 23001
     and v.id_impsto = 230011
     and v.id_impsto_sbmpsto = 2300111
     and i.id_sjto = r_id_sjto
     and v.vgncia = r_vgncia
     and v.cdgo_mvnt_fncro_estdo in ('NO', 'CN');*/

  cursor c4(r_id_prcsos_jrdco number) is
    select a.nmro_acto              as rslcion_embrgo,
           a.fcha_acto              as fcha_embrgo,
           a.dscrpcion_tipo_embargo as tpo_embrgo,
           g.vlor_mdda_ctlar,
           e.nmro_acto              as rslcion_dsmbrgo,
           e.fcha_acto              as fcha_dsmbrgo
      from v_mc_g_embargos_resolucion a
      join mc_g_embargos_cartera g
        on g.id_embrgos_crtra = a.id_embrgos_crtra
      join mc_g_embrgos_crt_prc_jrd b
        on a.id_embrgos_crtra = b.id_embrgos_crtra
       and b.id_prcsos_jrdco = r_id_prcsos_jrdco
      left join mc_g_desembargos_cartera d
        on d.id_embrgos_crtra = b.id_embrgos_crtra
      left join v_mc_g_desembargos_resolucion e
        on e.id_dsmbrgos_rslcion = d.id_dsmbrgos_rslcion;

  /*cursor c5(r_id_sjto varchar2) is
  select a.id_sjto_impsto, b.mtrcla_inmblria
    from v_si_i_sujetos_impuesto a
    join si_i_predios b
      on b.id_sjto_impsto = a.id_sjto_impsto
   where a.id_impsto = 230011
     and a.id_sjto = r_id_sjto;*/

  cursor c6(r_id_prcsos_jrdco number, r_id_acto_tpo number) is
    select b.nmro_acto     as nmro_dcmnto,
           b.fcha          as fcha_dcmnto,
           b.fcha_ntfccion
      from v_cb_g_procesos_jrdco_dcmnto a
      join gn_g_actos b
        on b.id_acto = a.id_acto
     where a.id_prcsos_jrdco = r_id_prcsos_jrdco
       and a.id_acto_tpo = r_id_acto_tpo;

  cursor c7(r_fcha_dsde date, r_rfrncia_ctstral varchar2, r_vgncia number) is
    select sum(d.vlor_ttal) vlor_pgdo
      from v_re_g_recaudos_detalle d
      join re_g_recaudos m
        on m.id_rcdo = d.id_rcdo
      join v_si_i_sujetos_impuesto i
        on i.cdgo_clnte = 23001
       and i.id_impsto = 230012
       and i.idntfccion_antrior = r_rfrncia_ctstral
     where trunc(m.fcha_rcdo) >= trunc(r_fcha_dsde)
       and m.cdgo_rcdo_estdo = 'AP'
       and d.vgncia = r_vgncia;

  v_sldo_cptal  number;
  v_sldo_intres number;
  v_vlor_pgdo   number;

  v_cptal_cnvnio  number;
  v_intres_cnvnio number;

  v_vgncias_dda    varchar2(500);
  v_vgncias_cnvnio varchar2(500);
  v_estdo_fctra    varchar2(2);

  v_rslcion_embrgo number;
  v_fcha_embrgo    date;

  v_rslcion_dsmbrgo number;
  v_fcha_dsmbrgo    date;

  v_tpo_embrgo varchar2(50);

  v_mtrcla varchar2(30);

  v_ctcion               number;
  v_fcha_ctcion          date;
  v_fcha_ntfccion_ctcion date;
  v_csal_ctcion          varchar2(50);

  v_mndmnto               number;
  v_fcha_mndmnto          date;
  v_fcha_ntfccion_mndmnto date;
  v_csal_mndmnto          varchar2(50);

  v_vlor_embrgo number;

  v_pndnte number;

  v_abnos_embrgo number;

  v_csal_no_embrgo varchar2(200);

  v_recaudo        number;
  v_id_sjto_impsto number;

begin
  -- sitpr001('entrando a estdo_prcsos_jrdcos', p_archvo);
  delete from temp_estdo_prcsos_jrdcos where id_impsto = 230012;
  commit;

  for r1 in c1 loop

    --sitpr001('proceso: ' || r1.nmro_prcso_jrdco, p_archvo);

    v_sldo_cptal  := 0;
    v_sldo_intres := 0;
    v_vlor_pgdo   := 0;

    v_cptal_cnvnio  := 0;
    v_intres_cnvnio := 0;

    v_vlor_embrgo := 0;

    v_vgncias_dda     := null;
    v_vgncias_cnvnio  := null;
    v_mtrcla          := null;
    v_rslcion_embrgo  := null;
    v_fcha_embrgo     := null;
    v_rslcion_dsmbrgo := null;
    v_fcha_dsmbrgo    := null;
    v_tpo_embrgo      := null;

    v_pndnte := 0;

    v_abnos_embrgo := 0;

    --sitpr001('Antes de buscar la info del embargo y desembargo: ' || r1.nmro_prcso_jrdco, p_archvo);
    for r4 in c4(r1.id_prcsos_jrdco) loop

      v_rslcion_embrgo := r4.rslcion_embrgo;
      v_fcha_embrgo    := r4.fcha_embrgo;

      v_rslcion_dsmbrgo := r4.rslcion_dsmbrgo;
      v_fcha_dsmbrgo    := r4.fcha_dsmbrgo;

      v_tpo_embrgo := r4.tpo_embrgo;

      v_vlor_embrgo := r4.vlor_mdda_ctlar;
      exit;
    end loop;

    --sitpr001('Antes de buscar la info de la cartera: ' || r1.nmro_prcso_jrdco, p_archvo);
    for r2 in c2(r1.id_prcsos_jrdco) loop

      if v_vgncias_dda is null then
        v_vgncias_dda := r2.vgncia;
      else
        v_vgncias_dda := v_vgncias_dda || ', ' || r2.vgncia;
      end if;

      v_estdo_fctra := r2.cdgo_mvnt_fncro_estdo;

      if v_estdo_fctra = 'NO' then
        v_sldo_cptal  := r2.vlor_cptal;
        v_sldo_intres := r2.vlor_intres;
      elsif v_estdo_fctra = 'CN' then
        v_cptal_cnvnio   := r2.vlor_cptal;
        v_intres_cnvnio  := r2.vlor_intres;
        v_vgncias_cnvnio := r2.vgncia;
      end if;

    end loop;

    --sitpr001('Antes de buscar la info de la matricula: ' || r1.nmro_prcso_jrdco, p_archvo);
    /*  for r5 in c5(r1.id_sjto) loop
        v_mtrcla         := r5.mtrcla_inmblria;
        v_id_sjto_impsto := r5.id_sjto_impsto;
      end loop;
    */

    for r6 in c6(r1.id_prcsos_jrdco, 26) loop

      v_ctcion               := r6.nmro_dcmnto;
      v_fcha_ctcion          := r6.fcha_dcmnto;
      v_fcha_ntfccion_ctcion := r6.fcha_ntfccion;
      --      v_csal_ctcion          := r6.csal;
    end loop;
    for r7 in c6(r1.id_prcsos_jrdco, 35) loop

      v_mndmnto               := r7.nmro_dcmnto;
      v_fcha_mndmnto          := r7.fcha_dcmnto;
      v_fcha_ntfccion_mndmnto := r7.fcha_ntfccion;
      --     v_csal_mndmnto          := r7.csal;
    end loop;

    if v_rslcion_embrgo is not null and v_vlor_embrgo = 0 then
      v_vlor_embrgo := (r1.vlor_ttal_dda * 2) - (r1.vlor_ttal_dda * 0.1);
    end if;

    /*
      if v_rslcion_embrgo is null and r1.estdo_prcso is null then
        if v_sldo_cptal + v_sldo_intres > 0 then
          if v_cptal_cnvnio + v_intres_cnvnio = 0 then
            v_pndnte := 1;
          end if;
        end if;
      end if;
    */

    v_vlor_pgdo := temp_mnto_rcdo(p_nmro_prcso_jrdco => r1.nmro_prcso_jrdco,
                                  p_fcha_dsde        => v_fcha_mndmnto);

    insert into temp_estdo_prcsos_jrdcos

      (nmro_prcso,
       fcha_ingrso_flio,
       idntfccion_sjto,
       rfrncia_ctstral,
       vlor_prcso_jrdco,
       idntfccion_prcsdo,
       nmbre_prcsdo,
       abgdo,
       vgncias,
       sldo_cptal,
       sldo_intres,
       vgncias_cnvnio,
       nmro_embrgo,
       fcha_embrgo,
       nmro_dsmbrgo,
       fcha_dsmbrgo,
       tpo_embrgo,
       mtrcla,
       ctcion,
       fcha_ctcion,
       fcha_ntfccion_ctcion,
       csal_ctcion,
       mndmnto,
       fcha_mndmnto,
       fcha_ntfccion_mndmnto,
       csal_mndmnto,
       vlor_pgdo,
       cptal_cnvnio,
       intres_cnvnio,
       vlor_embrgo,
       etpa_actual,
       csal_no_embrgo,
       pndnte,
       vlor_abno,
       id_sjto_impsto,
       id_impsto)
    values
      (r1.nmro_prcso_jrdco,
       r1.fcha,
       r1.idntfccion_sjto,
       nvl(r1.idntfccion_antrior, r1.idntfccion_sjto),
       r1.vlor_ttal_dda,
       r1.idntfccion_rspnsble,
       r1.prmer_nmbre,
       r1.fncnrio_rspnsble,
       v_vgncias_dda,
       v_sldo_cptal,
       v_sldo_intres,
       v_vgncias_cnvnio,
       v_rslcion_embrgo,
       v_fcha_embrgo,
       v_rslcion_dsmbrgo,
       v_fcha_dsmbrgo,
       v_tpo_embrgo,
       v_mtrcla,
       v_ctcion,
       v_fcha_ctcion,
       v_fcha_ntfccion_ctcion,
       v_csal_ctcion,
       v_mndmnto,
       v_fcha_mndmnto,
       v_fcha_ntfccion_mndmnto,
       v_csal_mndmnto,
       v_vlor_pgdo,
       v_cptal_cnvnio,
       v_intres_cnvnio,
       v_vlor_embrgo,
       null, --r1.etpa_actual,
       v_csal_no_embrgo, --r1.estdo_prcso,
       v_pndnte,
       v_abnos_embrgo,
       r1.id_sjto_impsto,
       230012);
    commit;
    --sitpr001('Luego del commit: ' || r1.nmro_prcso_jrdco, p_archvo);
  end loop;

end temp_prc_estdo_prcsos_jrdcos_ica;
/

