
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_IN_01_CRTRA_DL" is

 v_vrsion             varchar2(50):= 'ver.20241030.lmc.00.00.00';

-- ver.20241028.lmc.00.00.00: versionamiento del procedimiento

cursor c1(r_cdgo_clnte    number,
          r_id_impsto     number) is
  select m.id_impsto, i.nmbre_impsto,
         m.id_impsto_sbmpsto, isi.nmbre_impsto_sbmpsto,
         (case when sp.tpo_prsna = 'J' then 'JURIDICA'
               when sp.tpo_prsna = 'N' then 'NATURAL'
                                       else 'OTRA' end)  as tpo_prsna,
         t.cdgo_sjto_tpo, t.nmbre_sjto_tpo,
         c.idntfccion, sp.nmbre_rzon_scial,
         m.id_cncpto,
         m.vgncia,
         p.cdgo_prdcdad, p.prdo, p.dscrpcion as nmbre_prdo,
         m.vlor_sldo_cptal,
         m.vlor_intres,
         fn.dscrpcion as dscrpcion_estdo_mvnt_fncro,
         m.id_sjto_impsto,
         co.dscrpcion
    from genesys.gf_g_mvmntos_cncpto_cnslddo m
         left join genesys.df_c_impuestos i
                on i.id_impsto = m.id_impsto
         left join genesys.df_i_impuestos_subimpuesto isi
                on isi.id_impsto_sbmpsto = m.id_impsto_sbmpsto
         inner join genesys.si_i_sujetos_impuesto s
                on s.id_sjto_impsto = m.id_sjto_impsto
                   and s.id_impsto  = m.id_impsto
                   and s.id_sjto_estdo = 1
                   and isi.id_impsto     = m.id_impsto
                   --and m.vgncia = 2024
                   and i.id_impsto = r_id_impsto
                   and m.cdgo_mvnt_fncro_estdo in ('CN', 'NO')
        inner join genesys.si_c_sujetos c
                on c.id_sjto = s.id_sjto
         left join genesys.si_i_personas sp
                on sp.id_sjto_impsto = s.id_sjto_impsto
         left join genesys.df_i_periodos p
                on p.id_prdo = m.id_prdo
         left join genesys.df_i_sujetos_tipo t
                on t.id_sjto_tpo = sp.id_sjto_tpo
         left join genesys.df_c_impuestos i
                   on i.id_impsto = m.id_impsto
        inner join genesys.df_i_periodos pe
                   on pe.id_prdo = m.id_prdo
        inner join genesys.gf_d_mvmnto_fncro_estdo fn
                   on fn.cdgo_mvnt_fncro_estdo = m.cdgo_mvnt_fncro_estdo
        left join genesys.df_i_conceptos co
                  on co.id_cncpto = m.id_cncpto
   where m.cdgo_clnte = r_cdgo_clnte
   and m.cdgo_mvnt_fncro_estdo <> 'AN';

/*
cursor c2(r_id_cncpto number) is
  select c.id_cncpto, c.dscrpcion
    from genesys.df_i_conceptos c
   where c.id_cncpto = r_id_cncpto
   group by c.id_cncpto, c.dscrpcion
   order by c.id_cncpto;*/

v_cntdor            number(10);
v_archvo            varchar2(100);
v_archvo_cmmit      varchar2(100);
v_fcha_gnrcion       date;
v_clnte              genesys.in_t_ipu_rcdos_orgen.clnte%type;
v_cdgo_clnte         number;
v_id_impsto          number;

begin

  -- test statements here
  v_fcha_gnrcion := sysdate;

  v_archvo       := 'PREDIAL_INFO_CRTRA_DL'||to_char(v_fcha_gnrcion,'YYYYMMDD_HH24MISS');
  v_archvo_cmmit := v_archvo||'_cmmit.txt';
  v_archvo       := v_archvo||'.txt';

  --genesys.sitpr001('Iniciando procedimiento PRC_IN_01_CRTRA_DL. '||v_vrsion, v_archvo);

  v_clnte        := null;
  v_cdgo_clnte   := null;

  begin
    select c.cdgo_clnte, substr(m.nmbre_mncpio, 1, 20)
      into v_cdgo_clnte, v_clnte
      from genesys.df_s_clientes c
          left join genesys.df_s_municipios m
                 on m.id_mncpio = c.id_mncpio;
  exception
    when others then
      --genesys.sitpr001('Se presento error en consulta de clientes (GENESYS.DF_S_CLIENTES): '||sqlcode||'-'||sqlerrm, v_archvo);
      return;
  end;

  v_id_impsto := null;

  begin
    select i.id_impsto
      into v_id_impsto
      from genesys.df_c_impuestos i
     where i.cdgo_clnte  = v_cdgo_clnte
       and i.cdgo_impsto = 'ICA';
  exception
    when others then
      --genesys.sitpr001('Se presento error en consulta de impuesto genesys.(DF_C_IMPUESTOS): '||sqlcode||'-'||sqlerrm, v_archvo);
      return;
  end;

  begin
  execute immediate 'TRUNCATE TABLE genesys.in_t_ica_crtra';
  end;

  commit;

  --genesys.sitpr001('Borrado de tabla informe genesys.IN_T_IPU_RECAUDOS', v_archvo);

  v_cntdor := 1;

  for r1 in c1(v_cdgo_clnte,
               v_id_impsto) loop


      begin
      insert into genesys.in_t_ica_crtra
        (item, cdgo_clnte, clnte, fcha_gnrcion, tpo_prsna, idntfccion, nmbre_rzon_scial, cdgo_sjto_tpo, nmbre_sjto_tpo,
         impsto, nmbre_impsto, subimpsto, nmbre_subimpsto, vgncia, cdgo_prdcdad, prdo, nmbre_prdo,
         vlor_cptal, vlor_intres, estdo_mvmnto_fnncro, id_sjto_impsto, id_cncpto, dscrpcion)
      values
        (v_cntdor, v_cdgo_clnte, v_clnte, v_fcha_gnrcion, r1.tpo_prsna, r1.idntfccion, r1.nmbre_rzon_scial, r1.cdgo_sjto_tpo, r1.nmbre_sjto_tpo,
         r1.id_impsto, r1.nmbre_impsto, r1.id_impsto_sbmpsto, r1.nmbre_impsto_sbmpsto, r1.vgncia, r1.cdgo_prdcdad, r1.prdo, r1.nmbre_prdo,
         r1.vlor_sldo_cptal, r1.vlor_intres, r1.dscrpcion_estdo_mvnt_fncro, r1.id_sjto_impsto, r1.id_cncpto, r1.dscrpcion);
      exception
        when others then
          --genesys.sitpr001('Se presento error en registro de recaudo temporal (genesys.IN_T_IPU_RCDOS_ORGEN): '||sqlcode||'-'||sqlerrm, v_archvo);
		  null;
          --return;
      end;

    v_cntdor := v_cntdor + 1;

    if mod(v_cntdor, 100) = 0 then

      --genesys.sitpr001('Se han procesado: '||v_cntdor||' registro', v_archvo_cmmit);
      commit;
    end if;
  end loop;

  --genesys.sitpr001('Se procesaron: '||v_cntdor||' registro', v_archvo_cmmit);
  commit;

  --genesys.sitpr001('Terminando procedimiento genesys.PRC_IN_01_CRTRA_DL. '||v_vrsion, v_archvo);

end;
/

