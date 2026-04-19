
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_IN_03_PRDIOS" is

cursor c1(r_cdgo_clnte    number,
          r_id_impsto     number) is
  select s.idntfccion, s.drccion,
         p.cdgo_prdio_clsfccion,
         pc.dscrpcion_prdio_clsfccion as prdio_clsfccion,
         p.id_prdio_dstno,
         d.dscrpcion                  as dscrpcion_dstncion,
         p.cdgo_estrto,
         e.dscrpcion_estrto,

         nvl(p.id_brrio, '00')              as cdgo_brrio,
         nvl(ba.nmbre_brrio, 'NO DEFINIDO') as nmbre_brrio,

         null                               as cdgo_lcldad,
         null                               as nmbre_lcldad,

         p.area_trrno,
         p.area_cnstrda,
         p.avluo_ctstral,

         r.idntfccion as idntfccion_prptrio,
         (substr((r.prmer_nmbre||' '||r.sgndo_nmbre||' '||r.prmer_aplldo||' '||r.sgndo_aplldo), 1,100)) as nmbre_prptrio
    from genesys.si_i_sujetos_impuesto i
         left join genesys.si_c_sujetos s
                on s.id_sjto = i.id_sjto
         left join genesys.si_i_predios p
                on p.id_sjto_impsto = i.id_sjto_impsto
         left join genesys.DF_S_PREDIOS_CLASIFICACION pc
                on pc.cdgo_prdio_clsfccion = p.cdgo_prdio_clsfccion
         left join genesys.DF_I_PREDIOS_DESTINO d
                on d.id_prdio_dstno = p.id_prdio_dstno
         left join genesys.DF_S_ESTRATOS e
                on e.cdgo_estrto = p.cdgo_estrto
         left join genesys.DF_C_BARRIOS ba
                on ba.cdgo_clnte      = s.cdgo_clnte
                   and ba.id_brrio    = p.id_brrio
         left join genesys.si_i_sujetos_responsable r
                on r.id_sjto_impsto = i.id_sjto_impsto
                   and r.prncpal_s_n = 'S'
   where i.id_impsto          = r_id_impsto
     and s.cdgo_clnte         = r_cdgo_clnte
     and i.id_sjto_estdo      = 1
order by s.idntfccion;



v_cntdor            number(10);

v_clse_prdio        varchar2(20);

v_archvo            varchar2(100);
v_archvo_cmmit      varchar2(100);

v_fcha_gnrcion       date;
v_clnte              genesys.IN_T_IPU_LQDCNES_ORGEN.clnte%type;


--v_tpo_idntfccion     genesys.IN_T_IPU_LQDCNES_ORGEN.tpo_idntfccion%type;
v_idntfccion_prptrio genesys.IN_T_IPU_LQDCNES_ORGEN.idntfccion_prptrio%type;
v_nmbre_prptrio      genesys.IN_T_IPU_LQDCNES_ORGEN.nmbre_prptrio%type;
v_cdgo_brrio         genesys.IN_T_IPU_LQDCNES_ORGEN.cdgo_brrio%type;
v_nmbre_brrio        genesys.IN_T_IPU_LQDCNES_ORGEN.nmbre_brrio%type;
v_cdgo_lcldad        genesys.IN_T_IPU_LQDCNES_ORGEN.cdgo_lcldad%type;
v_nmbre_lcldad       genesys.IN_T_IPU_LQDCNES_ORGEN.nmbre_lcldad%type;

v_cdgo_clnte         number;
v_id_impsto          number;
v_id_impsto_sbmpsto  number;

v_vrsion             varchar2(50):= 'ver.20240717.eud.00.00.00';

-- ver.20240717.eud.00.00.00: versionamiento del procedimiento

begin

  -- Test statements here
  v_fcha_gnrcion := sysdate;

  v_archvo       := 'PREDIAL_INFO_PRDIOS_'||TO_CHAR(v_fcha_gnrcion,'YYYYMMDD_HH24MISS');
  v_archvo_cmmit := v_archvo||'_cmmit.txt';
  v_archvo       := v_archvo||'.txt';

  --genesys.sitpr001('Iniciando procedimiento genesys.PRC_IN_03_PRDIOS. '||v_vrsion, v_archvo);

  v_clnte        := null;
  v_cdgo_clnte   := null;

  begin
    SELECT c.cdgo_clnte, substr(m.nmbre_mncpio, 1, 20)
      into v_cdgo_clnte, v_clnte
      FROM genesys.DF_S_CLIENTES c
          left join genesys.df_s_municipios m
                 on m.id_mncpio = c.id_mncpio;
  exception
    when others then
      --genesys.sitpr001('Se presento error en consulta de clientes (genesys.DF_S_CLIENTES): '||sqlcode||'-'||sqlerrm, v_archvo);
      return;
  end;

  v_id_impsto         := null;
  v_id_impsto_sbmpsto := null;
  begin
    select i.id_impsto, s.id_impsto_sbmpsto
      into v_id_impsto, v_id_impsto_sbmpsto
      from genesys.df_c_impuestos i
           left join genesys.df_i_impuestos_subimpuesto s
                  on s.cdgo_clnte = i.cdgo_clnte
                     and s.id_impsto = i.id_impsto
     where i.cdgo_clnte  = v_cdgo_clnte
       and i.cdgo_impsto         = 'IPU'
       and s.cdgo_impsto_sbmpsto = 'IPU';
  exception
    when others then
      --genesys.sitpr001('Se presento error en consulta de impuesto (genesys.DF_C_IMPUESTOS/genesys.DF_I_IMPUESTOS_SUBIMPUESTOS): '||sqlcode||'-'||sqlerrm, v_archvo);
      return;
  end;


  v_cntdor := 0;

  begin
    select count(*)
      into v_cntdor
      from IN_T_IPU_PREDIOS_ORGEN t;
  end;

  if v_cntdor > 0 then

    begin
      delete from IN_T_IPU_PREDIOS_ORGEN;
    end;

    commit;

    --genesys.sitpr001('Borrado de tabla informe genesys.IN_T_IPU_PREDIOS_ORGEN', v_archvo);
  end if;

  v_cntdor := 1;

  for r1 in c1(v_cdgo_clnte,
               v_id_impsto) loop

    v_clse_prdio         := substr(r1.prdio_clsfccion, 1, 20);


    --v_tpo_idntfccion     := nvl(r1.cdgo_idntfccion_tpo, 'XX');

    v_idntfccion_prptrio := nvl(r1.idntfccion_prptrio,  '0');
    v_nmbre_prptrio      := nvl(r1.nmbre_prptrio,       'SIN PROPIETARIO');

    v_cdgo_brrio         := r1.cdgo_brrio;   -- nvl(r1.cdgo_brrio,  '00');
    v_nmbre_brrio        := r1.nmbre_brrio;  -- nvl(r1.nmbre_brrio,  'NO DEFINIDA');

    v_cdgo_lcldad        := nvl(r1.cdgo_lcldad, '99');
    v_nmbre_lcldad       := nvl(r1.nmbre_lcldad, 'NO DEFINIDA');


    begin
      insert into genesys.IN_T_IPU_PREDIOS_ORGEN
            (item, cdgo_clnte, clnte, fcha_gnrcion, rfrncia_ctstral, drccion_prdio,
             clse_prdio, cdgo_dstno, dscrpcion_dstno, cdgo_estrto, dscrpcion_estrto,
             cdgo_brrio, nmbre_brrio, cdgo_lcldad, nmbre_lcldad,
             area_trrno, area_cnstrda, avluo_ctstral, idntfccion_prptrio, nmbre_prptrio)
      values(v_cntdor, v_cdgo_clnte, v_clnte, v_fcha_gnrcion, r1.idntfccion, r1.drccion,
             v_clse_prdio, r1.id_prdio_dstno, r1.dscrpcion_dstncion, r1.cdgo_estrto, r1.dscrpcion_estrto,
             v_cdgo_brrio, v_nmbre_brrio, v_cdgo_lcldad, v_nmbre_lcldad,
             r1.area_trrno, r1.area_cnstrda, r1.avluo_ctstral, v_idntfccion_prptrio, v_nmbre_prptrio);
    exception
      when others then
        --genesys.sitpr001('Se presento error en registro de recaudo temporal (genesys.IN_T_IPU_PREDIOS_ORGEN): '||sqlcode||'-'||sqlerrm, v_archvo);
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

  --genesys.sitpr001('Terminando procedimiento genesys.PRC_IN_03_PRDIOS. '||v_vrsion, v_archvo);

end;
/

