
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_IN_04_RCDOS_DL" (p_cdgo_impsto in varchar2,
                                               p_vgncia      in number,
                                               p_fcha_dsde   in date,
                                               p_fcha_hsta   in date) is

  cursor c1(r_cdgo_clnte number,
            r_id_impsto  number,
            r_vgncia     number,
            r_fcha_dsde  date,
            r_fcha_hsta  date) is
    select c.id_bnco,
           b.nmbre_bnco, --R.ID_RCDO, r.id_rcdo_cntrol,
           d.id_impsto,
           i.nmbre_impsto,
           d.id_impsto_sbmpsto,
           isi.nmbre_impsto_sbmpsto,

           --r.id_sjto_impsto,

           (case
             when sp.tpo_prsna = 'J' then
              'JURIDICA'
             when sp.tpo_prsna = 'N' then
              'NATURAL'
             else
              'OTRA'
           end) as tpo_prsna,
           su.idntfccion,
           sp.nmbre_rzon_scial,
           nvl(s_i.drccion_ntfccion, su.drccion) as drccion,
           r.nmro_dcmnto, --r.id_orgen,
           r.fcha_rcdo,
           r.vlor,
           d.vgncia, --d.id_prdo,
           --f.dscrpcion as nmbre_frmlrio,
           REPLACE(REPLACE(f.dscrpcion, CHR(10), ''), CHR(13), ' ') as nmbre_frmlrio,
           p.cdgo_prdcdad,
           p.prdo,
           p.dscrpcion as nmbre_prdo,
           d.bse_grvble,
           d.vlor_ttal,
           d.vlor_pago,
           d.cdgo_dclrcion_estdo,
           d.id_dclrcion,
           r.id_rcdo
      from genesys.re_g_recaudos r
      left join genesys.re_g_recaudos_control c
        on c.id_rcdo_cntrol = r.id_rcdo_cntrol
      left join genesys.gi_g_declaraciones d
        on d.id_dclrcion = r.id_orgen
      left join genesys.df_i_periodos p
        on p.id_prdo = d.id_prdo
      LEFT JOIN genesys.GI_D_DCLRCNES_VGNCIAS_FRMLR v
        on v.id_dclrcion_vgncia_frmlrio = d.id_dclrcion_vgncia_frmlrio
      left join genesys.GI_D_FORMULARIOS f
        on f.id_frmlrio = v.id_frmlrio
      left join genesys.df_c_impuestos i
        on i.id_impsto = d.id_impsto
      left join genesys.df_i_impuestos_subimpuesto isi
        on isi.id_impsto_sbmpsto = d.id_impsto_sbmpsto
       and isi.id_impsto = d.id_impsto
      left join genesys.si_i_sujetos_impuesto s_i
        on s_i.id_sjto_impsto = r.id_sjto_impsto
      left join genesys.si_c_sujetos su
        on su.id_sjto = s_i.id_sjto
      left join genesys.si_i_personas sp
        on sp.id_sjto_impsto = s_i.id_sjto_impsto
      left join genesys.df_c_bancos b
        on b.id_bnco = c.id_bnco
      left join genesys.GI_D_DECLARACIONES_USO u
        on u.id_dclrcion_uso = d.id_dclrcion_uso
     where c.cdgo_clnte = r_cdgo_clnte
       and c.id_impsto = r_id_impsto
       and r.fcha_rcdo between r_fcha_dsde and r_fcha_hsta
       and r.cdgo_rcdo_orgn_tpo = 'DL'
       and (d.vgncia = r_vgncia or r_vgncia is null)
       and u.cdgo_dclrcion_uso in ('DIN', 'DCO')
       and s_i.id_sjto_estdo = 1;
  -- and d.id_dclrcion = 952504;

  cursor c2(r_id_dclrcion number, r_fla number) is
    select dd.fla,
           fra.dscrpcion,
           dd.vlor,
           dd.vlor_dsplay,
           length(dd.vlor) as lrgo_1, --, TO_CHAR(dbms_lob.substr(dd.vlor, length(dd.vlor), 1 )) as vlor
           length(dd.vlor_dsplay) as lrgo_2
    --r.dscrpcion as region,
    --fra.dscrpcion as item
      from genesys.gi_g_declaraciones_detalle dd
      left join genesys.Gi_d_Formularios_Region r
        on r.id_frmlrio_rgion = dd.id_frmlrio_rgion
      left join genesys.gi_d_frmlrios_rgion_atrbto fra
        on fra.id_frmlrio_rgion_atrbto = dd.id_frmlrio_rgion_atrbto
     where dd.id_dclrcion = r_id_dclrcion --952504
       and r.cdgo_rgion_tpo = 'CIN'
       and dd.fla = r_fla
     order by dd.fla;

  cursor c3(r_id_rcdo number) is
    select md.id_orgen,
           sum(case
                 when md.cdgo_mvmnto_tpo = 'PC' then
                  md.vlor_hber
                 else
                  0
               end) as vlor_cptal,
           sum(case
                 when md.cdgo_mvmnto_tpo = 'PI' then
                  md.vlor_hber
                 else
                  0
               end) as vlor_intres
      from genesys.gf_g_movimientos_detalle md
     where md.cdgo_mvmnto_orgn = 'RE'
       and md.id_orgen = r_id_rcdo
     group by md.id_orgen;

  v_vgncia_actual number;
  v_fcha_Dsde     date;
  v_fcha_hsta     date;

  v_cntdor number(10);

  v_archvo       varchar2(100);
  v_archvo_cmmit varchar2(100);

  v_fcha_gnrcion date;
  v_clnte        IN_T_IPU_RCDOS_ORGEN.clnte%type;

  v_cdgo_clnte number;
  v_id_impsto  number;
  --v_id_impsto_sbmpsto  number;
  v_error boolean;

  v_fla_mxma   number;
  v_nmro_fla   number;
  v_actvdad    varchar2(200);
  v_bse_grvble number;
  v_impsto     number;

  v_vrsion varchar2(50) := 'ver.20240729.eud.01.00.01';

  -- ver.20240729.eud.01.00.01: calculo y registro de actividades comerciales, bases, valor impuesto
  -- ver.20240718.eud.00.00.00: versionamiento del procedimiento

begin

  -- Test statements here
  v_fcha_gnrcion := sysdate;

  v_archvo       := NVL(p_cdgo_impsto, 'XXX') || '_INFO_RCDOS_DL_' ||
                    TO_CHAR(v_fcha_gnrcion, 'YYYYMMDD_HH24MISS');
  v_archvo_cmmit := v_archvo || '_cmmit.txt';
  v_archvo       := v_archvo || '.txt';

  /*genesys.sitpr001('Iniciando procedimiento PRC_IN_04_RCDOS_DL. ' ||
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
      /*genesys.sitpr001('Se presento error en consulta de clientes (DF_S_CLIENTES): ' ||
                       sqlcode || '-' || sqlerrm,
                       v_archvo);*/
      return;
  end;

  v_id_impsto := null;
  --v_id_impsto_sbmpsto := null;

  begin
    select i.id_impsto --, s.id_impsto_sbmpsto
      into v_id_impsto --, v_id_impsto_sbmpsto
      from genesys.df_c_impuestos i
    --left join df_i_impuestos_subimpuesto s
    --       on s.cdgo_clnte = i.cdgo_clnte
    --          and s.id_impsto = i.id_impsto
     where i.cdgo_clnte = v_cdgo_clnte
       and i.cdgo_impsto = p_cdgo_impsto;
    --and s.cdgo_impsto_sbmpsto = 'ICA';
  exception
    when others then
      --genesys.sitpr001('Se presento error en consulta de impuesto (DF_C_IMPUESTOS/DF_I_IMPUESTOS_SUBIMPUESTOS): '||sqlcode||'-'||sqlerrm, v_archvo);
      /*genesys.sitpr001('Se presento error en consulta de impuesto (DF_C_IMPUESTOS): ' ||
                       sqlcode || '-' || sqlerrm,
                       v_archvo);*/ --En uso
      return;
  end;

  v_vgncia_actual := p_vgncia;

  v_fcha_dsde := p_fcha_dsde;
  v_fcha_hsta := p_fcha_hsta;

  if p_fcha_dsde is null then

    v_fcha_dsde := to_date('20000101', 'yyyymmdd');
  end if;

  if p_fcha_hsta is null then

    v_fcha_hsta := trunc(sysdate);
  end if;

  /*genesys.sitpr001('Iniciando generacion de informacion: ' ||
                   v_vgncia_actual || ': ' || v_fcha_dsde || '-' ||
                   v_fcha_hsta,
                   v_archvo_cmmit);*/

  v_cntdor := 0;

  begin
    select count(*)
      into v_cntdor
      from genesys.IN_T_ICA_RCDOS_DL_ORGEN t
     where t.fcha_pgo between v_fcha_Dsde and v_fcha_hsta
       and (t.vgncia = v_vgncia_actual or v_vgncia_actual is null);
  end;

  if v_cntdor > 0 then

    begin
      delete from genesys.IN_T_ICA_RCDOS_ACT_ORGEN d
       where exists
       (select 1
                from genesys.IN_T_ICA_RCDOS_DL_ORGEN t
               where t.item = d.item
                 and t.fcha_pgo between v_fcha_Dsde and v_fcha_hsta
                 and (t.vgncia = v_vgncia_actual or v_vgncia_actual is null));
    end;

    begin
      delete from IN_T_ICA_RCDOS_DL_ORGEN t
       where t.fcha_pgo between v_fcha_Dsde and v_fcha_hsta
         and (t.vgncia = v_vgncia_actual or v_vgncia_actual is null);
    end;

    commit;

    /*genesys.sitpr001('Borrado de tabla informe IN_T_ICA_RCDOS_DL_ORGEN',
                     v_archvo);*/
  end if;

  v_cntdor := 1;

  for r1 in c1(v_cdgo_clnte,
               v_id_impsto,
               v_vgncia_actual,
               v_fcha_dsde,
               v_fcha_hsta) loop

    v_error    := false;
    v_fla_mxma := 0;

    for r3 in c3(r1.id_rcdo) loop
      begin
        insert into genesys.IN_T_ICA_RCDOS_DL_ORGEN
          (item,
           cdgo_clnte,
           clnte,
           fcha_gnrcion,
           tpo_prsna,
           idntfccion,
           nmbre_rzon_scial,
           drccion,
           entdad,
           nmbre_entdad,
           impsto,
           nmbre_impsto,
           subimpsto,
           nmbre_subimpsto,
           nmro_dcmnto,
           fcha_pgo,
           vlor_pgo,
           vgncia,
           nmbre_frmlrio,
           cdgo_prdcdad,
           prdo,
           nmbre_prdo,
           bse_grvble,
           vlor_ttal,
           vlor_pago,
           dclrcion_estdo,
           vlor_intres)
        values
          (v_cntdor,
           v_cdgo_clnte,
           v_clnte,
           v_fcha_gnrcion,
           r1.tpo_prsna,
           r1.idntfccion,
           r1.nmbre_rzon_scial,
           r1.drccion,
           r1.id_bnco,
           r1.nmbre_bnco,
           r1.id_impsto,
           r1.nmbre_impsto,
           r1.id_impsto_sbmpsto,
           r1.nmbre_impsto_sbmpsto,
           r1.nmro_dcmnto,
           r1.fcha_rcdo,
           r1.vlor,
           r1.vgncia,
           r1.nmbre_frmlrio,
           r1.cdgo_prdcdad,
           r1.prdo,
           r1.nmbre_prdo,
           r1.bse_grvble,
           r1.vlor_ttal,
           r1.vlor_pago,
           r1.cdgo_dclrcion_estdo,
           r3.vlor_intres);
      exception
        when others then
          /*genesys.sitpr001('Se presento error en registro de recaudo temporal (IN_T_ICA_RCDOS_DL_ORGEN): ' ||
                           sqlcode || '-' || sqlerrm,
                           v_archvo);*/
          v_error := true;
          --return;
      end;

      if not v_error then

        begin
          select max(dd.fla)
            into v_fla_mxma
            from gi_g_declaraciones_detalle dd
            left join Gi_d_Formularios_Region r
              on r.id_frmlrio_rgion = dd.id_frmlrio_rgion
           where dd.id_dclrcion = r1.id_dclrcion --952504
             and r.cdgo_rgion_tpo = 'CIN';
        end;

        v_nmro_fla := 1;

        while v_nmro_fla <= v_fla_mxma loop

          v_actvdad    := null;
          v_bse_grvble := 0;
          v_impsto     := 0;

          for r2 in c2(r1.id_dclrcion, v_nmro_fla) loop

            if r2.dscrpcion = 'ACTIVIDADES GRAVADAS' then
              v_actvdad := TO_CHAR(dbms_lob.substr(r2.vlor_dsplay,
                                                   r2.lrgo_2,
                                                   100));

            elsif r2.dscrpcion = 'INGRESOS GRAVADOS' then
              v_bse_grvble := to_number(dbms_lob.substr(r2.vlor,
                                                        r2.lrgo_1,
                                                        1));
            elsif r2.dscrpcion = 'IMPUESTO' then
              v_impsto := to_number(dbms_lob.substr(r2.vlor, r2.lrgo_1, 1));
            end if;
          end loop;

          -- dbms_output.put_line(v_nmro_fla||': '||v_actvdad||'-'||v_bse_grvble||'-'||v_impsto);

          if v_actvdad is not null then

            begin
              insert into IN_T_ICA_RCDOS_ACT_ORGEN
                (item,
                 cdgo_clnte,
                 clnte,
                 nmro_dcmnto,
                 item_actvdad,
                 dscrpcion_actvdad,
                 bse_grvable,
                 vlor_impsto)
              values
                (v_cntdor,
                 v_cdgo_clnte,
                 v_clnte,
                 r1.nmro_dcmnto,
                 v_nmro_fla,
                 v_actvdad,
                 v_bse_grvble,
                 v_impsto);
            exception
              when others then
                /*genesys.sitpr001('Se presento error en registro de recaudo temporal (IN_T_ICA_RCDOS_ACT_ORGEN): ' ||
                                 sqlcode || '-' || sqlerrm,
                                 v_archvo);*/
                null;
            end;
          end if;

          v_nmro_fla := v_nmro_fla + 1;
        end loop;

      end if;
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

  /*genesys.sitpr001('Terminando procedimiento PRC_IN_04_RCDOS_DL. ' ||
                   v_vrsion,
                   v_archvo);*/

end;
/

