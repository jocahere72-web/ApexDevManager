
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_ANLSIS_CRTR" (p_cdgo_clnte        in number,
                                            p_id_impsto         in number,
                                            p_id_impsto_sbmpsto in number) as

  cursor c1 is
    select b.idntfccion_sjto,
           b.id_sjto_impsto,
           b.idntfccion_antrior rfrncia_ctstral,
           a.vgncia,
           a.id_mvmnto_fncro,
           a.fcha_vncmnto fcha_vncmnto_fctra,
           sum(a.vlor_sldo_cptal) sldo_cptal,
           sum(a.vlor_intres) sldo_intres
      from genesys.gf_g_mvmntos_cncpto_cnslddo a
      join genesys.v_si_i_sujetos_impuesto b
        on b.id_sjto_impsto = a.id_sjto_impsto
       and b.id_sjto_estdo = 1
       and b.id_impsto = a.id_impsto
     where a.vlor_sldo_cptal > 0
       and a.cdgo_mvnt_fncro_estdo in ('NO', 'CN')
       and a.cdgo_clnte = p_cdgo_clnte
       and a.id_impsto = b.id_impsto
       and a.id_impsto = p_id_impsto
       and a.id_impsto_sbmpsto = p_id_impsto_sbmpsto
       and a.vgncia < extract(year from sysdate) - 5
     group by b.idntfccion_sjto,
              b.id_sjto_impsto,
              b.idntfccion_antrior,
              a.vgncia,
              a.id_mvmnto_fncro,
              a.fcha_vncmnto
     order by b.id_sjto_impsto, a.vgncia desc, a.id_mvmnto_fncro;

  cursor c2(r_id_sjto_impsto  number,
            r_vgncia          number,
            r_id_mvmnto_fncro number) is

    select a.id_cncpto, a.vlor_sldo_cptal, a.vlor_intres
      from gf_g_mvmntos_cncpto_cnslddo a
     where a.id_sjto_impsto = r_id_sjto_impsto
       and a.vgncia = r_vgncia
       and a.id_mvmnto_fncro = r_id_mvmnto_fncro
       and a.cdgo_clnte = p_cdgo_clnte
       and a.id_impsto = p_id_impsto
       and a.id_impsto_sbmpsto = p_id_impsto_sbmpsto;

  v_tpo_acto  varchar2(50);
  v_nmro_acto varchar2(50);
  v_fcha_acto date;
  v_estdo     varchar(50);
  v_anios     number(5, 2);

  v_prdial  number(16, 2);
  v_sob_amb number(16, 2);
  v_sob_bom number(16, 2);
  v_pro_cul number(16, 2);
  v_pro_adu number(16, 2);

  v_im_prdial  number(16, 2);
  v_im_sob_amb number(16, 2);
  v_im_sob_bom number(16, 2);
  v_im_pro_cul number(16, 2);
  v_im_pro_adu number(16, 2);

  v_ttal_cptal   number := 0;
  v_ttal_intrses number := 0;

  v_nl           number;
  v_nmbre_up     varchar2(100) := 'prc_anlsis_crtr';
  o_mnsje_rspsta varchar2(200);
  v_counter      number := 0;

begin

  v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);
  pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                        null,
                        v_nmbre_up,
                        v_nl,
                        'Entrando a ' || v_nmbre_up || ':' || systimestamp,
                        6);

  begin
    delete temp_crtra_prscrta;
    commit;
  end;

  for r1 in c1 loop

    v_tpo_acto  := null;
    v_nmro_acto := null;
    v_fcha_acto := null;
    v_anios     := null;

    prc_ultmo_acto(p_cdgo_clnte        => p_cdgo_clnte,
                   p_id_sjto_impsto    => r1.id_sjto_impsto,
                   p_vgncia            => r1.vgncia,
                   p_id_impsto         => p_id_impsto,
                   p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,
                   p_tpo_acto          => v_tpo_acto,
                   p_nmro_acto         => v_nmro_acto,
                   p_fcha_acto         => v_fcha_acto);

    if (months_between(sysdate, r1.fcha_vncmnto_fctra)) / 12 <= 5 then
      v_estdo := 'VIGENTE';
    else
      if v_tpo_acto is null then
        v_estdo := 'PRESCRITA';
      else
        v_anios := (months_between(sysdate, v_fcha_acto) / 12);
        if v_anios >= 5 then
          v_estdo := 'PRESCRITA';
        else
          v_estdo := 'VIGENTE';
        end if;
      end if;
    end if;

    v_prdial  := 0;
    v_sob_amb := 0;
    v_sob_bom := 0;
    v_pro_cul := 0;
    v_pro_adu := 0;

    v_im_prdial  := 0;
    v_im_sob_amb := 0;
    v_im_sob_bom := 0;
    v_im_pro_cul := 0;
    v_im_pro_adu := 0;

    for r2 in c2(r1.id_sjto_impsto, r1.vgncia, r1.id_mvmnto_fncro) loop
      if r2.id_cncpto in (577, 568, 569) then
        v_prdial    := v_prdial + r2.vlor_sldo_cptal;
        v_im_prdial := v_im_prdial + r2.vlor_intres;
      elsif r2.id_cncpto in (573, 570) then
        v_sob_amb    := v_sob_amb + r2.vlor_sldo_cptal;
        v_im_sob_amb := v_im_sob_amb + r2.vlor_intres;
      elsif r2.id_cncpto = 575 then
        v_sob_bom    := v_sob_bom + r2.vlor_sldo_cptal;
        v_im_sob_bom := v_im_sob_bom + r2.vlor_intres;
      end if;
    end loop;

    v_ttal_cptal   := v_prdial + v_sob_amb + v_sob_bom + v_pro_adu +
                      v_pro_cul;
    v_ttal_intrses := v_im_prdial + v_im_sob_amb + v_im_sob_bom +
                      v_im_pro_adu + v_im_pro_cul;

    v_counter := v_counter + 1;

    DBMS_APPLICATION_INFO.SET_MODULE(module_name => 'Procesamiento Registros',
                                     action_name => 'Procesando registro ' ||
                                                    v_counter);

    begin
      insert into temp_crtra_prscrta
        (rfrcncia_ctstral,
         vgncia,
         ultmo_acto,
         nmro_dcmnto,
         fcha_acto,
         anios_dsde,
         estdo,
         prdial,
         sob_amb,
         sob_bom,
         im_prdial,
         im_sob_amb,
         im_sob_bom,
         intres,
         cptal,
         pro_adu,
         im_pro_adu,
         pro_cul,
         im_pro_cul,
         id_sjto_impsto)
      values
        (r1.idntfccion_sjto,
         r1.vgncia,
         v_tpo_acto,
         v_nmro_acto,
         v_fcha_acto,
         v_anios,
         v_estdo,
         v_prdial,
         v_sob_amb,
         v_sob_bom,
         v_im_prdial,
         v_im_sob_amb,
         v_im_sob_bom,
         v_ttal_intrses,
         v_ttal_cptal,
         v_pro_adu,
         v_im_pro_adu,
         v_pro_cul,
         v_im_pro_cul,
         r1.id_sjto_impsto);
      commit;
    exception
      when others then
        rollback;
        o_mnsje_rspsta := 'Error al Ingresar registro : ' || sqlerrm;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nl,
                              o_mnsje_rspsta,
                              6);

    end;

  end loop;
end;
/

