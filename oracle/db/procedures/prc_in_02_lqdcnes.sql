
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_IN_02_LQDCNES" (p_vgncia in number
                                              --p_fcha_dsde  in date,
                                              --p_fcha_hsta  in date
                                              ) is

  cursor c1(r_cdgo_clnte   number,
            r_vgncia       number,
            r_id_impsto    number,
            r_id_subimpsto number) is
    select l.vgncia,
           s.idntfccion,
           s.drccion,
           p.mtrcla_inmblria,
           a.cdgo_prdio_clsfccion,
           pc.dscrpcion_prdio_clsfccion as prdio_clsfccion,
           a.id_prdio_dstno,
           d.dscrpcion                  as dscrpcion_dstncion,
           a.cdgo_estrto,

           nvl(p.id_brrio, '00') as cdgo_brrio,
           nvl(ba.nmbre_brrio, 'NO DEFINIDO') as nmbre_brrio,

           null as cdgo_lcldad,
           null as nmbre_lcldad,

           r.idntfccion as idntfccion_prptrio,
           (substr((r.prmer_nmbre || ' ' || r.sgndo_nmbre || ' ' ||
                   r.prmer_aplldo || ' ' || r.sgndo_aplldo),
                   1,
                   100)) as nmbre_prptrio,
           a.area_trrno,
           a.area_cnsctrda,
           l.bse_grvble,
           c.trfa,
           c.vlor_clcldo,
           c.vlor_lqddo,
           ac.id_cncpto,
           k.dscrpcion as dscrpcion_cncpto

      from genesys.gi_g_liquidaciones l
      left join genesys.si_i_sujetos_impuesto i
        on i.id_sjto_impsto = l.id_sjto_impsto
       and i.id_impsto = l.id_impsto
      left join genesys.si_c_sujetos s
        on s.id_sjto = i.id_sjto
      left join genesys.gi_g_liquidaciones_ad_predio a
        on a.id_lqdcion = l.id_lqdcion
      left join genesys.gi_g_liquidaciones_concepto c
        on c.id_lqdcion = l.id_lqdcion
      left join genesys.df_i_impuestos_acto_concepto ac
        on ac.id_impsto_acto_cncpto = c.id_impsto_acto_cncpto
      left join genesys.df_i_conceptos k
        on k.cdgo_clnte = l.cdgo_clnte
       and k.id_impsto = l.id_impsto
       and k.id_cncpto = ac.id_cncpto
      left join genesys.DF_S_PREDIOS_CLASIFICACION pc
        on pc.cdgo_prdio_clsfccion = a.cdgo_prdio_clsfccion
      left join genesys.DF_I_PREDIOS_DESTINO d
        on d.id_prdio_dstno = a.id_prdio_dstno
      left join genesys.si_i_predios p
        on p.id_sjto_impsto = l.id_sjto_impsto
      left join genesys.DF_C_BARRIOS ba
        on ba.cdgo_clnte = l.cdgo_clnte
       and ba.id_brrio = p.id_brrio
      left join genesys.si_i_sujetos_responsable r
        on r.id_sjto_impsto = l.id_sjto_impsto
       and r.prncpal_s_n = 'S'
     where l.cdgo_clnte = r_cdgo_clnte
       and l.vgncia = r_vgncia
       and l.cdgo_lqdcion_estdo = 'L'
       and l.id_impsto = r_id_impsto
       --and l.id_impsto_sbmpsto = r_id_subimpsto
       and i.id_sjto_estdo = 1;
       --and k.cdgo_cncpto = '001'; --Ajuste 26.07.2024
  /*
    select c.idntfccion, c.idntfccion_antrior,
           c.drccion          ,
           sr.cdgo_idntfccion_tpo,
           sr.idntfccion as idntfccion_prptrio,
           (substr((sr.prmer_nmbre||' '||sr.sgndo_nmbre||' '||sr.prmer_aplldo||' '||sr.sgndo_aplldo), 1,100)) as nmbre_prptrio,
           pc.dscrpcion_prdio_clsfccion as prdio_clsfccion, --p.cdgo_prdio_clsfccion
           p.id_prdio_dstno,                                -- descripcion
           pd.dscrpcion as dscrpcion_dstncion,
           p.cdgo_estrto,
           p.avluo_ctstral,
           nvl(p.id_brrio, '00')              as cdgo_brrio,
           nvl(ba.nmbre_brrio, 'NO DEFINIDO') as nmbre_brrio,

           null as cdgo_lcldad,
           null as nmbre_lcldad,

           r.nmro_dcmnto,

           rc.id_bnco, b.nmbre_bnco,
           r.fcha_rcdo, r.vlor,

           r.id_sjto_impsto, r.id_rcdo

      from re_g_recaudos r
           left join re_g_recaudos_control rc
                  on rc.id_rcdo_cntrol = r.id_rcdo_cntrol
           left join df_c_bancos b
                  on b.id_bnco = rc.id_bnco
           left join si_i_sujetos_impuesto s
                  on s.id_sjto_impsto = r.id_sjto_impsto
                     and s.id_impsto  = rc.id_impsto
           left join si_c_sujetos c
                  on c.id_sjto        = s.id_sjto
           left join si_i_predios p
                  on p.id_sjto_impsto = s.id_sjto_impsto
           left join df_i_predios_destino pd
                  on pd.cdgo_clnte        = c.cdgo_clnte
                    and pd.id_impsto      = s.id_impsto
                    and pd.id_prdio_dstno = p.id_prdio_dstno
           left join DF_S_PREDIOS_CLASIFICACION pc
                  on pc.cdgo_prdio_clsfccion = p.cdgo_prdio_clsfccion
           left join DF_C_BARRIOS ba
                  on ba.cdgo_clnte      = c.cdgo_clnte
                     and ba.id_brrio    = p.id_brrio
           left join si_i_sujetos_responsable sr
                  on sr.id_sjto_impsto  = s.id_sjto_impsto
                     and sr.prncpal_s_n = 'S'
    where rc.cdgo_clnte = r_cdgo_clnte
      and rc.id_impsto  = r_id_impsto
      and r.fcha_rcdo   >= r_fcha_dsde
      and r.fcha_rcdo   <= r_fcha_hsta;
  */

  v_vgncia_actual number;

  v_cntdor number(10);

  v_clse_prdio varchar2(20);

  v_archvo       varchar2(100);
  v_archvo_cmmit varchar2(100);

  v_fcha_gnrcion date;
  v_clnte        genesys.IN_T_IPU_LQDCNES_ORGEN.clnte%type;

  --v_tpo_idntfccion     genesys.IN_T_IPU_LQDCNES_ORGEN.tpo_idntfccion%type;
  v_idntfccion_prptrio genesys.IN_T_IPU_LQDCNES_ORGEN.idntfccion_prptrio%type;
  v_nmbre_prptrio      genesys.IN_T_IPU_LQDCNES_ORGEN.nmbre_prptrio%type;
  v_cdgo_brrio         genesys.IN_T_IPU_LQDCNES_ORGEN.cdgo_brrio%type;
  v_nmbre_brrio        genesys.IN_T_IPU_LQDCNES_ORGEN.nmbre_brrio%type;
  v_cdgo_lcldad        genesys.IN_T_IPU_LQDCNES_ORGEN.cdgo_lcldad%type;
  v_nmbre_lcldad       genesys.IN_T_IPU_LQDCNES_ORGEN.nmbre_lcldad%type;

  v_cdgo_clnte        number;
  v_id_impsto         number;
  v_id_impsto_sbmpsto number;

  v_vrsion varchar2(50) := 'ver.20240717.eud.00.00.00';

  -- ver.20240717.eud.00.00.00: versionamiento del procedimiento

begin

  -- Test statements here
  v_fcha_gnrcion := sysdate;

  v_archvo       := 'PREDIAL_INFO_LQDNES_' ||
                    TO_CHAR(v_fcha_gnrcion, 'YYYYMMDD_HH24MISS');
  v_archvo_cmmit := v_archvo || '_cmmit.txt';
  v_archvo       := v_archvo || '.txt';

  /*genesys.sitpr001('Iniciando procedimiento genesys.PRC_IN_02_LQDCNES. ' ||
           v_vrsion,
           v_archvo);*/

  v_clnte      := null;
  v_cdgo_clnte := null;

  begin
    SELECT c.cdgo_clnte, substr(m.nmbre_mncpio, 1, 20)
      into v_cdgo_clnte, v_clnte
      FROM genesys.DF_S_CLIENTES c
      left join genesys.df_s_municipios m
        on m.id_mncpio = c.id_mncpio;
  exception
    when others then
      /*genesys.sitpr001('Se presento error en consulta de clientes (genesys.DF_S_CLIENTES): ' ||
               sqlcode || '-' || sqlerrm,
               v_archvo);*/
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
     where i.cdgo_clnte = v_cdgo_clnte
       and i.cdgo_impsto = 'IPU'
       and s.cdgo_impsto_sbmpsto = 'IPU';
  exception
    when others then
      /*genesys.sitpr001('Se presento error en consulta de impuesto (genesys.DF_C_IMPUESTOS/genesys.DF_I_IMPUESTOS_SUBIMPUESTOS): ' ||
               sqlcode || '-' || sqlerrm,
               v_archvo);*/
      return;
  end;

  v_vgncia_actual := p_vgncia;

  if v_vgncia_actual is null then

    begin
      select to_number(d.vlor)
        into v_vgncia_actual
        from genesys.df_c_definiciones_cliente d
       where d.cdgo_clnte = v_cdgo_clnte
            --and d.id_dfncion_clnte_ctgria = 6
         and d.cdgo_dfncion_clnte = 'VAC';
    exception
      when others then
        /*genesys.sitpr001('Se presento error en consulta de definiciones cliente (genesys.DF_C_DEFINICIONES_CLIENTE): ' ||
                 sqlcode || '-' || sqlerrm,
                 v_archvo);*/
        return;
    end;
  end if;

  /*genesys.sitpr001('Iniciando generacion de informacion: ' || v_vgncia_actual,
           v_archvo_cmmit);*/

  v_cntdor := 0;

  begin
    select count(*)
      into v_cntdor
      from genesys.IN_T_IPU_LQDCNES_ORGEN t
     where t.vgncia = v_vgncia_actual;
  end;

  if v_cntdor > 0 then

    begin
      --Ajuste 30.07.2024
      --delete from genesys.IN_T_IPU_LQDCNES_ORGEN t where t.vgncia = v_vgncia_actual;
      delete from genesys.IN_T_IPU_LQDCNES_ORGEN t
       where t.vgncia =
             (SELECT TO_CHAR(sysdate, 'YYYY') AS avgnte FROM dual);
    end;

    commit;

    /*genesys.sitpr001('Borrado de tabla informe genesys.IN_T_IPU_LQDCNES_ORGEN',
             v_archvo);*/
  end if;

  v_cntdor := 1;

  for r1 in c1(v_cdgo_clnte,
               v_vgncia_actual,
               v_id_impsto,
               v_id_impsto_sbmpsto) loop

    v_clse_prdio := substr(r1.prdio_clsfccion, 1, 20);

    --v_tpo_idntfccion     := nvl(r1.cdgo_idntfccion_tpo, 'XX');

    v_idntfccion_prptrio := nvl(r1.idntfccion_prptrio, '0');
    v_nmbre_prptrio      := nvl(r1.nmbre_prptrio, 'SIN PROPIETARIO');

    v_cdgo_brrio  := r1.cdgo_brrio; -- nvl(r1.cdgo_brrio,  '00');
    v_nmbre_brrio := r1.nmbre_brrio; -- nvl(r1.nmbre_brrio,  'NO DEFINIDA');

    v_cdgo_lcldad  := nvl(r1.cdgo_lcldad, '99');
    v_nmbre_lcldad := nvl(r1.nmbre_lcldad, 'NO DEFINIDA');

    begin
      insert into genesys.IN_T_IPU_LQDCNES_ORGEN
        (item,
         cdgo_clnte,
         clnte,
         fcha_gnrcion,
         vgncia,
         rfrncia_ctstral,
         drccion_prdio,
         mtrcla_inmblria,
         clse_prdio,
         cdgo_dstno,
         dscrpcion_dstno,
         cdgo_estrto,
         idntfccion_prptrio,
         nmbre_prptrio,
         cdgo_brrio,
         nmbre_brrio,
         cdgo_lcldad,
         nmbre_lcldad,
         area_trrno,
         area_cnstrda,
         avluo_ctstral,
         vlor_trfa,
         vlor_clcldo,
         vlor_lqddo,
         id_cncpto,
         nmbre_cncpto)
      values
        (v_cntdor,
         v_cdgo_clnte,
         v_clnte,
         v_fcha_gnrcion,
         v_vgncia_actual,
         r1.idntfccion,
         r1.drccion,
         r1.mtrcla_inmblria,
         v_clse_prdio,
         r1.id_prdio_dstno,
         r1.dscrpcion_dstncion,
         r1.cdgo_estrto,
         v_idntfccion_prptrio,
         v_nmbre_prptrio,
         v_cdgo_brrio,
         v_nmbre_brrio,
         v_cdgo_lcldad,
         v_nmbre_lcldad,
         r1.area_trrno,
         r1.area_cnsctrda,
         r1.bse_grvble,
         r1.trfa,
         r1.vlor_clcldo,
         r1.vlor_lqddo,
         r1.id_cncpto,
         r1.dscrpcion_cncpto);
    exception
      when others then
        /*genesys.sitpr001('Se presento error en registro de recaudo temporal (genesys.IN_T_IPU_LQDCNES_ORGEN): ' ||
                 sqlcode || '-' || sqlerrm,
                 v_archvo);*/
        null;
        --return;
    end;

    v_cntdor := v_cntdor + 1;

    if mod(v_cntdor, 100) = 0 then

      /*genesys.sitpr001('Se han procesado: ' || v_cntdor || ' registro',
               v_archvo_cmmit);*/
      commit;
    end if;
  end loop;

  --genesys.sitpr001('Se procesaron: ' || v_cntdor || ' registro', v_archvo_cmmit);
  commit;

  /*genesys.sitpr001('Terminando procedimiento genesys.PRC_IN_02_LQDCNES. ' ||
           v_vrsion,
           v_archvo);*/

end;
/

