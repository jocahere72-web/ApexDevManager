
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_IN_01_CRTRA" is

  cursor c1(r_cdgo_clnte number, r_id_impsto number) is
    select b.idntfccion_sjto idntfccion,
           b.idntfccion_antrior,
           d.cdgo_idntfccion_tpo,
           d.idntfccion as idntfccion_prptrio,
           (substr((d.prmer_nmbre || ' ' || d.sgndo_nmbre || ' ' ||
                   d.prmer_aplldo || ' ' || d.sgndo_aplldo),
                   1,
                   100)) as nmbre_prptrio,
           a.vgncia,
           e.dscrpcion as dscrpcion_prdo,
           a.id_cncpto,
           --co.dscrpcion as dscrpcion_cncpto,
           c.dscrpcion_prdio_clsfccion  as prdio_clsfccion,
           c.dscrpcion_prdo_dstno       as dscrpcion_dstncion,
           c.dscrpcion_estrto,
           a.vlor_sldo_cptal,
           a.vlor_intres,
           a.dscrpcion_mvnt_fncro_estdo as dscrpcion_estdo_mvnt_fncro,
           a.id_sjto_impsto
      from v_gf_g_cartera_x_concepto a
      join v_si_i_sujetos_impuesto b
        on b.id_sjto_impsto = a.id_sjto_impsto
      join v_si_i_predios c
        on c.id_sjto_impsto = a.id_sjto_impsto
      join genesys.si_i_sujetos_responsable d
        on d.id_sjto_impsto = a.id_sjto_impsto
       and d.prncpal_s_n = 'S'
      join df_i_periodos e
        on e.id_prdo = a.id_prdo
     where a.cdgo_clnte = r_cdgo_clnte
       and a.id_impsto = r_id_impsto
       and a.vgncia >= 2021
       and b.id_sjto_estdo = 1
       and a.cdgo_mvnt_fncro_estdo in ('NO', 'CN')
       and a.vlor_sldo_cptal > 0;

  cursor c2(r_id_cncpto number) is
    select c.id_cncpto, c.dscrpcion
      from genesys.df_i_conceptos c
     where c.id_cncpto = r_id_cncpto
     group by c.id_cncpto, c.dscrpcion
     order by c.id_cncpto;

  v_cntdor number(10);

  v_clse_prdio varchar2(20);

  v_archvo       varchar2(100);
  v_archvo_cmmit varchar2(100);

  v_fcha_gnrcion date;
  v_clnte        genesys.IN_T_IPU_RCDOS_ORGEN.clnte%type;

  v_tpo_idntfccion     genesys.IN_T_IPU_RCDOS_ORGEN.tpo_idntfccion%type;
  v_idntfccion_prptrio genesys.IN_T_IPU_RCDOS_ORGEN.idntfccion_prptrio%type;
  v_nmbre_prptrio      genesys.IN_T_IPU_RCDOS_ORGEN.nmbre_prptrio%type;

  v_cdgo_clnte number;
  v_id_impsto  number;

  v_vrsion varchar2(50) := 'ver.20241017.lmc.00.00.00';

  -- ver.20241017.lmc.00.00.00: versionamiento del procedimiento

begin

  -- Test statements here
  v_fcha_gnrcion := sysdate;

  v_archvo       := 'PREDIAL_INFO_CRTRA' ||
                    TO_CHAR(v_fcha_gnrcion, 'YYYYMMDD_HH24MISS');
  v_archvo_cmmit := v_archvo || '_cmmit.txt';
  v_archvo       := v_archvo || '.txt';

  /*genesys.sitpr001('Iniciando procedimiento PRC_IN_01_CRTRA. ' || v_vrsion,
                   v_archvo);*/

  v_clnte      := null;
  v_cdgo_clnte := null;

  begin
    select c.cdgo_clnte, substr(m.nmbre_mncpio, 1, 20)
      into v_cdgo_clnte, v_clnte
      from genesys.df_s_clientes c
      left join genesys.df_s_municipios m
        on m.id_mncpio = c.id_mncpio;
  exception
    when others then
      /*genesys.sitpr001('Se presento error en consulta de clientes (GENESYS.DF_S_CLIENTES): ' ||
                       sqlcode || '-' || sqlerrm,
                       v_archvo);*/
      return;
  end;

  v_id_impsto := null;

  begin
    select i.id_impsto
      into v_id_impsto
      from genesys.df_c_impuestos i
     where i.cdgo_clnte = v_cdgo_clnte
       and i.cdgo_impsto = 'IPU';
  exception
    when others then
      /*genesys.sitpr001('Se presento error en consulta de impuesto genesys.(DF_C_IMPUESTOS): ' ||
                       sqlcode || '-' || sqlerrm,
                       v_archvo);*/
      return;
  end;

  begin
    execute immediate 'TRUNCATE TABLE genesys.in_t_ipu_crtra';
  end;

  commit;

  /*genesys.sitpr001('Borrado de tabla informe genesys.IN_T_IPU_RECAUDOS',
                   v_archvo);*/

  v_cntdor := 1;

  for r1 in c1(v_cdgo_clnte, v_id_impsto) loop

    v_clse_prdio := SUBSTR(r1.prdio_clsfccion, 1, 20);

    v_tpo_idntfccion     := nvl(r1.cdgo_idntfccion_tpo, 'XX');
    v_idntfccion_prptrio := nvl(r1.idntfccion_prptrio, '0');
    v_nmbre_prptrio      := nvl(r1.nmbre_prptrio, 'SIN PROPIETARIO');

    for r2 in c2(r1.id_cncpto) loop

      begin
        insert into genesys.in_t_ipu_crtra
          (item,
           cdgo_clnte,
           clnte,
           fcha_gnrcion,
           rfrncia_ctstral,
           tpo_idntfccion,
           idntfccion_prptrio,
           nmbre_prptrio,
           vgncia,
           dscrpcion_prdo,
           dscrpcion_cncpto,
           dscrpcion_clse,
           dscrpcion_dstno,
           dscrpcion_estrto,
           vlor_cptal,
           vlor_intres,
           estdo_mvmnto_fnncro,
           id_sjto_impsto)
        values
          (v_cntdor,
           v_cdgo_clnte,
           v_clnte,
           v_fcha_gnrcion,
           r1.idntfccion,
           r1.cdgo_idntfccion_tpo,
           r1.idntfccion_prptrio,
           r1.nmbre_prptrio,
           r1.vgncia,
           r1.dscrpcion_prdo,
           r2.dscrpcion,
           r1.prdio_clsfccion,
           r1.dscrpcion_dstncion,
           r1.dscrpcion_estrto,
           r1.vlor_sldo_cptal,
           r1.vlor_intres,
           r1.dscrpcion_estdo_mvnt_fncro,
           r1.id_sjto_impsto);
      exception
        when others then
          /*genesys.sitpr001('Se presento error en registro de recaudo temporal (genesys.IN_T_IPU_RCDOS_ORGEN): ' ||
                           sqlcode || '-' || sqlerrm,
                           v_archvo);*/
          null;
          --return;
      end;
    end loop;

    v_cntdor := v_cntdor + 1;

    if mod(v_cntdor, 100) = 0 then

      /*genesys.sitpr001('Se han procesado: ' || v_cntdor || ' registro',
                       v_archvo_cmmit);*/
      commit;
    end if;
  end loop;

  /*genesys.sitpr001('Se procesaron: ' || v_cntdor || ' registro',
                   v_archvo_cmmit);*/
  commit;

  /*genesys.sitpr001('Terminando procedimiento genesys.PRC_IN_01_CRTRA. ' ||
                   v_vrsion,
                   v_archvo);*/

end;
/

