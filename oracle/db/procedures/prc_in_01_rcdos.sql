
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_IN_01_RCDOS" (p_vgncia     in number
                                                    --p_fcha_dsde  in date,
                                                    --p_fcha_hsta  in date
                                                    ) is

cursor c1(r_cdgo_clnte    number,
          r_id_impsto     number,
          r_fcha_dsde     date,
          r_fcha_hsta     date) is
  select c.idntfccion, c.idntfccion_antrior,
         c.drccion          ,
         sr.cdgo_idntfccion_tpo,
         sr.idntfccion as idntfccion_prptrio,
         (substr((sr.prmer_nmbre||' '||sr.sgndo_nmbre||' '||sr.prmer_aplldo||' '||sr.sgndo_aplldo), 1,100)) as nmbre_prptrio,
         pc.dscrpcion_prdio_clsfccion as prdio_clsfccion, --p.cdgo_prdio_clsfccion
         p.id_prdio_dstno,                                -- descripcion
         pd.dscrpcion as dscrpcion_dstncion,
         p.cdgo_estrto,
         nvl(p.id_brrio, '00')              as cdgo_brrio,
         nvl(ba.nmbre_brrio, 'NO DEFINIDO') as nmbre_brrio,

         r.nmro_dcmnto as nmro_dcmnto_rcdo,
         d.nmro_dcmnto,

         rc.id_bnco, b.nmbre_bnco,
         r.fcha_rcdo, r.vlor,

         r.id_sjto_impsto, r.id_rcdo

    from genesys.re_g_recaudos r
         left join genesys.re_g_recaudos_control rc
                on rc.id_rcdo_cntrol = r.id_rcdo_cntrol
         left join genesys.df_c_bancos b
                on b.id_bnco = rc.id_bnco
         left join genesys.si_i_sujetos_impuesto s
                on s.id_sjto_impsto = r.id_sjto_impsto
                   and s.id_impsto  = rc.id_impsto
         left join genesys.si_c_sujetos c
                on c.id_sjto        = s.id_sjto
         left join genesys.si_i_predios p
                on p.id_sjto_impsto = s.id_sjto_impsto
         left join genesys.df_i_predios_destino pd
                on pd.cdgo_clnte        = c.cdgo_clnte
                  and pd.id_impsto      = s.id_impsto
                  and pd.id_prdio_dstno = p.id_prdio_dstno
         left join genesys.DF_S_PREDIOS_CLASIFICACION pc
                on pc.cdgo_prdio_clsfccion = p.cdgo_prdio_clsfccion
         left join genesys.DF_C_BARRIOS ba
                on ba.cdgo_clnte      = c.cdgo_clnte
                   and ba.id_brrio    = p.id_brrio
         left join genesys.si_i_sujetos_responsable sr
                on sr.id_sjto_impsto  = s.id_sjto_impsto
                   and sr.prncpal_s_n = 'S'

         left join genesys.re_g_documentos d
                on d.id_dcmnto = r.id_orgen
                   and r.cdgo_rcdo_orgn_tpo = 'DC'

  where rc.cdgo_clnte = r_cdgo_clnte
    and rc.id_impsto  = r_id_impsto
    and r.fcha_rcdo   >= r_fcha_dsde
    and r.fcha_rcdo   <= r_fcha_hsta
    --and r.id_rcdo     = 573488
    ;


cursor c2(r_cdgo_mvmnto_orgen varchar2,
          r_id_orgen          number) is
  select d.id_cncpto, c.dscrpcion
    from genesys.gf_g_movimientos_detalle d
         left join genesys.df_i_conceptos c on c.id_cncpto = d.id_cncpto
   where d.CDGO_MVMNTO_ORGN = r_cdgo_mvmnto_orgen
     and d.id_orgen         = r_id_orgen
   group by d.id_cncpto, c.dscrpcion
   order by d.id_cncpto;

cursor c3(r_cdgo_mvmnto_orgen varchar2,
          r_id_orgen          number,
          r_id_cncpto         number) is
  select d.vgncia, d.id_prdo, d.cdgo_prdcdad,
         d.cdgo_mvmnto_tpo, d.vlor_hber
    from genesys.gf_g_movimientos_detalle d
   where d.CDGO_MVMNTO_ORGN = r_cdgo_mvmnto_orgen -- 'RE'
     and d.id_orgen         = r_id_orgen          -- 2737410
     and d.id_cncpto        = r_id_cncpto;


v_vgncia_actual     number;
v_fcha_Dsde         date;
v_fcha_hsta         date;

v_cntdor            number(10);

v_tpo_cnvnio        varchar2(20);

v_clse_prdio        varchar2(20);

v_dscnto_k_crtra    number(16,2);
v_dscnto_Im_crtra   number(16,2);
v_dscnto_K_actual   number(16,2);
v_dscnto_Im_actual  number(16,2);


v_rcdo_vgncia       number(16, 2);
v_rcdo_crtra        number(16, 2);
v_rcdo_saf          number(16, 2);

v_archvo            varchar2(100);
v_archvo_cmmit      varchar2(100);

v_fcha_gnrcion       date;
v_clnte              genesys.IN_T_IPU_RCDOS_ORGEN.clnte%type;


v_tpo_idntfccion     genesys.IN_T_IPU_RCDOS_ORGEN.tpo_idntfccion%type;
v_idntfccion_prptrio genesys.IN_T_IPU_RCDOS_ORGEN.idntfccion_prptrio%type;
v_nmbre_prptrio      genesys.IN_T_IPU_RCDOS_ORGEN.nmbre_prptrio%type;
v_cdgo_brrio         genesys.IN_T_IPU_RCDOS_ORGEN.cdgo_brrio%type;
v_nmbre_brrio        genesys.IN_T_IPU_RCDOS_ORGEN.nmbre_brrio%type;
v_cdgo_lcldad        genesys.IN_T_IPU_RCDOS_ORGEN.cdgo_lcldad%type;
v_nmbre_lcldad       genesys.IN_T_IPU_RCDOS_ORGEN.nmbre_lcldad%type;
v_vlor               genesys.IN_T_IPU_RCDOS_ORGEN.vlor_pgo%type;
v_nmro_dcmnto        genesys.re_g_recaudos.nmro_dcmnto%type;

v_cdgo_clnte         number;
v_id_impsto          number;

v_vrsion             varchar2(50):= 'ver.20240904.eud.01.00.01';


-- ver.20240904.eud.01.00.01: modificación de estrucutra origen para gestión de conceptos
-- ver.20240710.eud.00.00.00: versionamiento del procedimiento


begin

  -- Test statements here
  v_fcha_gnrcion := sysdate;

  v_archvo       := 'PREDIAL_INFO_'||TO_CHAR(v_fcha_gnrcion,'YYYYMMDD_HH24MISS');
  v_archvo_cmmit := v_archvo||'_cmmit.txt';
  v_archvo       := v_archvo||'.txt';

  --genesys.sitpr001('Iniciando procedimiento PRC_IN_01_RCDOS. '||v_vrsion, v_archvo);

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

  v_id_impsto := null;

  begin
    select i.id_impsto
      into v_id_impsto
      from genesys.df_c_impuestos i
     where i.cdgo_clnte  = v_cdgo_clnte
       and i.cdgo_impsto = 'IPU';
  exception
    when others then
      --genesys.sitpr001('Se presento error en consulta de impuesto genesys.(DF_C_IMPUESTOS): '||sqlcode||'-'||sqlerrm, v_archvo);
      return;
  end;

  v_vgncia_actual := p_vgncia;

  if v_vgncia_actual is null then

    begin
      select to_number(d.vlor)
        into v_vgncia_actual
        from genesys.df_c_definiciones_cliente d
       where d.cdgo_clnte              = v_cdgo_clnte
         --and d.id_dfncion_clnte_ctgria = 6
         and d.cdgo_dfncion_clnte      = 'VAC';
    exception
      when others then
        --genesys.sitpr001('Se presento error en consulta de definiciones cliente (genesys.DF_C_DEFINICIONES_CLIENTE): '||sqlcode||'-'||sqlerrm, v_archvo);
        return;
    end;
  end if;



  v_fcha_dsde    := to_date(v_vgncia_actual||'0101', 'yyyymmdd');
  v_fcha_hsta    := to_date(v_vgncia_actual||'1231', 'yyyymmdd');

  --genesys.sitpr001('Iniciando generacion de informacion: '||v_vgncia_actual||': '||v_fcha_dsde||'-'||v_fcha_hsta, v_archvo_cmmit);


  /*
  begin --Ajuste 30.07.2024
    delete from genesys.IN_T_IPU_RCDOS_ORGEN where vgncia = (SELECT TO_CHAR(sysdate, 'YYYY') AS avgnte FROM dual);
  end;
  */

  -- Modificación 04/09/2024 borrado de los registos de la vigencia solicitada
  begin
    delete from genesys.IN_T_IPU_RCDOS_ORGEN where vgncia = v_vgncia_actual;
  end;

  commit;

  --genesys.sitpr001('Borrado de tabla informe genesys.IN_T_IPU_RECAUDOS', v_archvo);

  v_cntdor := 1;

  for r1 in c1(v_cdgo_clnte,
               v_id_impsto,
               v_fcha_dsde,
               v_fcha_hsta) loop

    v_clse_prdio := SUBSTR(r1.prdio_clsfccion, 1, 20);
    v_tpo_cnvnio := 'NORMAL';

    --v_idntfccion_prdio   := nvl(r1.idntfccion, r1.idntfccion_antrior);

    v_tpo_idntfccion     := nvl(r1.cdgo_idntfccion_tpo, 'XX');
    v_idntfccion_prptrio := nvl(r1.idntfccion_prptrio, '0');
    v_nmbre_prptrio      := nvl(r1.nmbre_prptrio, 'SIN PROPIETARIO');

    v_cdgo_brrio         := r1.cdgo_brrio;   -- nvl(r1.cdgo_brrio,  '00');
    v_nmbre_brrio        := r1.nmbre_brrio;  -- nvl(r1.nmbre_brrio,  'NO DEFINIDA');

    v_cdgo_lcldad        := null;            -- nvl(r1.cdgo_lcldad, '09');
    v_nmbre_lcldad       := null;            -- nvl(r1.nmbre_lcldad, 'NO DEFINIDA');

    v_nmro_dcmnto        := r1.nmro_dcmnto_rcdo;

    if nvl(v_nmro_dcmnto, 0) = 0 then

      v_nmro_dcmnto        := r1.nmro_dcmnto;
    end if;

    for r2 in c2('RE',
                 r1.id_rcdo) loop

      v_vlor              := 0;
      v_rcdo_vgncia       := 0;
      v_rcdo_crtra        := 0;
      v_rcdo_saf          := 0;

      v_dscnto_k_crtra    := 0;
      v_dscnto_Im_crtra   := 0;
      v_dscnto_K_actual   := 0;
      v_dscnto_Im_actual  := 0;

      for r3 in c3('RE',
                   r1.id_rcdo,
                   r2.id_cncpto) loop

        if r3.vgncia = v_vgncia_actual then

          if r3.cdgo_mvmnto_tpo in ('PC', 'PI') then

            v_rcdo_vgncia := v_rcdo_vgncia + (r3.vlor_hber);
            v_vlor        := v_vlor + r3.vlor_hber;

          elsif r3.cdgo_mvmnto_tpo = 'DC' then

            v_dscnto_K_actual   := v_dscnto_K_actual + (r3.vlor_hber);

          elsif r3.cdgo_mvmnto_tpo = 'DI' then

            v_dscnto_Im_actual  := v_dscnto_Im_actual + (r3.vlor_hber);
          end if;

        elsif r3.vgncia <= (v_vgncia_actual - 1) then

          if r3.cdgo_mvmnto_tpo in ('PC', 'PI') then

            v_rcdo_crtra   := v_rcdo_crtra + (r3.vlor_hber);
            v_vlor         := v_vlor + r3.vlor_hber;

          elsif r3.cdgo_mvmnto_tpo = 'DC' then

            v_dscnto_k_crtra   := v_dscnto_k_crtra + (r3.vlor_hber);

          elsif r3.cdgo_mvmnto_tpo = 'DI' then

            v_dscnto_Im_crtra  := v_dscnto_Im_crtra + (r3.vlor_hber);
          end if;

        end if;
      end loop;

      begin
        insert into genesys.IN_T_IPU_RCDOS_ORGEN
              (item, cdgo_clnte, clnte, fcha_gnrcion, rfrncia_ctstral, drccion_prdio,
               tpo_idntfccion, idntfccion_prptrio, nmbre_prptrio,
               clse_prdio, cdgo_dstno, dscrpcion_dstno, cdgo_estrto, cdgo_brrio, nmbre_brrio, cdgo_lcldad, nmbre_lcldad,
               nmro_dcmnto,
               tpo_pgo, entdad, nmbre_entdad, fcha_pgo, vlor_pgo,
               rcdo_actual, rcdo_crtra, vlor_saf,
               dscnto_cptal_crtra, dscnto_mta_crtra, dscnto_cptal_actual, dscnto_mra_actual, vgncia,
               nmbre_cncpto, id_rcdo)
        values(v_cntdor, v_cdgo_clnte, v_clnte, v_fcha_gnrcion, r1.idntfccion, r1.drccion,
               v_tpo_idntfccion, v_idntfccion_prptrio, v_nmbre_prptrio,
               v_clse_prdio, r1.id_prdio_dstno, r1.dscrpcion_dstncion, r1.cdgo_estrto,
               v_cdgo_brrio, v_nmbre_brrio, v_cdgo_lcldad, v_nmbre_lcldad,
               v_nmro_dcmnto, --r1.nmro_dcmnto,
               v_tpo_cnvnio, r1.id_bnco, r1.nmbre_bnco, r1.fcha_rcdo, v_vlor, --r1.vlor,
               v_rcdo_vgncia, v_rcdo_crtra, v_rcdo_saf,
               v_dscnto_k_crtra, v_dscnto_Im_crtra, v_dscnto_K_actual, v_dscnto_Im_actual, v_vgncia_actual,
               r2.dscrpcion, r1.id_rcdo );
      exception
        when others then
          --genesys.sitpr001('Se presento error en registro de recaudo temporal (genesys.IN_T_IPU_RCDOS_ORGEN): '||sqlcode||'-'||sqlerrm, v_archvo);
		  null;
          --return;
      end;
    end loop;

    v_cntdor := v_cntdor + 1;

    if mod(v_cntdor, 100) = 0 then

      --genesys.sitpr001('Se han procesado: '||v_cntdor||' registro', v_archvo_cmmit);
      commit;
    end if;
  end loop;

  --genesys.sitpr001('Se procesaron: '||v_cntdor||' registro', v_archvo_cmmit);
  commit;

  --genesys.sitpr001('Terminando procedimiento genesys.PRC_IN_01_RCDOS. '||v_vrsion, v_archvo);

end;
/

