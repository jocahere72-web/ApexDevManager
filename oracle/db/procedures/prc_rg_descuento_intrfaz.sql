
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_RG_DESCUENTO_INTRFAZ" (p_cdgo_clnte  in number,
                                                     p_vgncia      in number,
                                                     p_id_rcdo     in number,
                                                     p_clsfccion   in varchar2,
                                                     o_cdgo_rspsta out number) as
  s_vlor                     number;
  v_clsfccion                varchar2(30);
  v_id_impsto_sbmpsto        number;
  v_error                    varchar2(2000);
  v_idntfccion_rspnsble      si_i_sujetos_responsable.idntfccion%type;
  v_prmer_nmbre              si_i_sujetos_responsable.prmer_nmbre%type;
  v_sgndo_nmbre              si_i_sujetos_responsable.sgndo_nmbre%type;
  v_prmer_aplldo             si_i_sujetos_responsable.prmer_aplldo%type;
  v_sgndo_aplldo             si_i_sujetos_responsable.sgndo_aplldo%type;
  v_nmbre_prptrio            varchar2(4000);
  v_cdgo_idntfccion_tpo      si_i_sujetos_responsable.cdgo_idntfccion_tpo%type;
  v_dscrpcion_idntfccion_tpo df_s_identificaciones_tipo.dscrpcion_idntfccion_tpo%type;
begin

  --Cursor de Descuentos - recaudos
  for c_dscntos in (select a.id_rcdo,
                           a.idntfccion_sjto,
                           a.cdgo_rcdo_orgn_tpo,
                           a.nmro_dcmnto,
                           a.fcha_rcdo,
                           d.cdgo_bnco,
                           d.nmbre_bnco,
                           d.nmro_cnta,
                           decode(g.cdgo_impsto,
                                  'IPU',
                                  'P',
                                  'REN',
                                  'R',
                                  'ICA',
                                  'I',
                                  'VHL',
                                  'C',
                                  'VAL',
                                  'V',
                                  'PLU',
                                  'L',
                                  'O') as cdgo_impsto,
                           extract(year from a.fcha_rcdo) as ano,
                           to_char(a.fcha_rcdo, 'MM') as mes,
                           a.id_sldo_fvor,
                           a.vlor,
                           g.nmbre_impsto,
                           g.cdgo_impsto cdgo_impsto_2,
                           h.id_impsto,
                           a.id_sjto_impsto,
                           h.cdgo_sjto_tpo,
                           d.cdgo_clnte
                      from v_re_g_recaudos a
                      join v_re_g_recaudos_control d
                        on a.id_rcdo_cntrol = d.id_rcdo_cntrol
                      join v_si_i_sujetos_impuesto h
                        on a.id_sjto_impsto = h.id_sjto_impsto
                      join df_c_impuestos g
                        on h.id_impsto = g.id_impsto
                     where d.cdgo_clnte = p_cdgo_clnte
                       and a.id_rcdo = p_id_rcdo
                       and a.cdgo_rcdo_estdo = 'AP'
                       and a.vlor > 0
                       and a.indcdor_intrfaz = 'N') loop

    --Inicializa el Acumulador en 0 de Suma Cuadradas
    s_vlor        := 0;
    o_cdgo_rspsta := 0;

    -- Buscar la información del responsable dependiendo del cdgo_sjto_tpo
    if (c_dscntos.cdgo_sjto_tpo = 'E') then
      begin
        select c_dscntos.idntfccion_sjto,
               null,
               null,
               null,
               e.nmbre_rzon_scial,
               null,
               null
          into v_idntfccion_rspnsble,
               v_prmer_nmbre,
               v_sgndo_nmbre,
               v_prmer_aplldo,
               v_nmbre_prptrio,
               v_cdgo_idntfccion_tpo,
               v_dscrpcion_idntfccion_tpo
          from si_i_personas e
         where e.id_sjto_impsto = c_dscntos.id_sjto_impsto;
      exception
        when others then
          o_cdgo_rspsta := 1;
          v_error       := 'Tipo: RE' || ' Id_Rcdo: ' || c_dscntos.id_rcdo ||
                           ' - Error en persona- : ' ||
                           c_dscntos.id_sjto_impsto || ' . Error: ' ||
                           sqlerrm;
          insert into genesys_interfaz.sg_g_log
            (col1, col2)
          values
            (systimestamp, v_error);
          commit;
          continue;
      end;
    else
      begin
        select nvl(substr(e.idntfccion, 1, instr(e.idntfccion, '-') - 1),
                   e.idntfccion),
               e.prmer_nmbre,
               e.sgndo_nmbre,
               e.prmer_aplldo,
               e.sgndo_aplldo,
               e.prmer_nmbre || ' ' || e.sgndo_nmbre || ' ' ||
               replace(e.prmer_aplldo, '.') || ' ' || e.sgndo_aplldo,
               e.cdgo_idntfccion_tpo,
               f.dscrpcion_idntfccion_tpo
          into v_idntfccion_rspnsble,
               v_prmer_nmbre,
               v_sgndo_nmbre,
               v_prmer_aplldo,
               v_sgndo_aplldo,
               v_nmbre_prptrio,
               v_cdgo_idntfccion_tpo,
               v_dscrpcion_idntfccion_tpo
          from si_i_sujetos_responsable e
          join df_s_identificaciones_tipo f
            on e.cdgo_idntfccion_tpo = f.cdgo_idntfccion_tpo
         where e.id_sjto_impsto = c_dscntos.id_sjto_impsto
           and e.prncpal_s_n = 'S'
           and rownum = 1;
      exception
        when others then
          v_error := 'Tipo: RE' || ' Id_Rcdo: ' || c_dscntos.id_rcdo ||
                     ' - Error en reponsable principal- : ' ||
                     c_dscntos.id_sjto_impsto || ' . Error: ' || sqlerrm;
          insert into genesys_interfaz.sg_g_log
            (col1, col2)
          values
            (systimestamp, v_error);
          commit;
          continue;
      end;
    end if;

    o_cdgo_rspsta := 0;
    --Cursor Conceptos Pagados
    for c_cncptos in (select decode(a.vgncia,
                                    c_dscntos.ano,
                                    'VIGENCIA_ACTUAL',
                                    'VIGENCIA_ANTERIOR') || '_' ||
                             decode(a.cdgo_mvmnto_tpo,
                                    'DC',
                                    'CAPITAL',
                                    'DI',
                                    'INTERES') as tpo_trnsccion,
                             b.cdgo_cncpto,
                             a.id_cncpto --_csdo
                            ,
                             sum(a.vlor) as vlor,
                             b.dscrpcion,
                             decode(a.vgncia, c_dscntos.ano, 'S', 'N') as indcdor_vgncia_actual,
                             a.vgncia
                        from (select a.id_orgen,
                                     a.vgncia,
                                     a.id_cncpto --_csdo
                                    ,
                                     sum(a.vlor_hber) as vlor,
                                     a.cdgo_mvmnto_tpo
                                from gf_g_movimientos_detalle a
                               where cdgo_mvmnto_orgn = 'RE'
                                 and a.id_orgen = c_dscntos.id_rcdo
                                 and a.vlor_hber > 0
                                 and a.cdgo_mvmnto_tpo in ('DC', 'DI')
                               group by a.id_orgen,
                                        a.vgncia,
                                        a.id_cncpto --_csdo
                                       ,
                                        a.cdgo_mvmnto_tpo) a
                        join df_i_conceptos b
                          on a.id_cncpto = b.id_cncpto
                       group by decode(a.vgncia,
                                       c_dscntos.ano,
                                       'VIGENCIA_ACTUAL',
                                       'VIGENCIA_ANTERIOR') || '_' ||
                                decode(a.cdgo_mvmnto_tpo,
                                       'DC',
                                       'CAPITAL',
                                       'DI',
                                       'INTERES'),
                                b.cdgo_cncpto,
                                a.id_cncpto --_csdo
                               ,
                                b.dscrpcion,
                                decode(a.vgncia, c_dscntos.ano, 'S', 'N'),
                                a.vgncia) loop

      -- Si es ICA, la vigencia actual es la vigencia del proceso - 1
      if (c_dscntos.id_impsto = p_cdgo_clnte || 2) then
        if (c_cncptos.vgncia >= p_vgncia - 1) then
          c_cncptos.tpo_trnsccion         := 'VIGENCIA_ACTUAL' ||
                                             SUBSTR(c_cncptos.tpo_trnsccion,
                                                    INSTR(c_cncptos.tpo_trnsccion,
                                                          '_',
                                                          1,
                                                          2));
          c_cncptos.indcdor_vgncia_actual := 'S';
        else
          c_cncptos.tpo_trnsccion         := 'VIGENCIA_ANTERIOR' ||
                                             SUBSTR(c_cncptos.tpo_trnsccion,
                                                    INSTR(c_cncptos.tpo_trnsccion,
                                                          '_',
                                                          1,
                                                          2));
          c_cncptos.indcdor_vgncia_actual := 'N';
        end if;
      end if;

      --Inserta el Movimiento en la Interfaz
      begin

        insert into genesys_interfaz.in_movimiento_contables
          (tpo_mvmnto,
           id_orgen,
           idntfccion,
           cdgo_idntfccion_tpo,
           dscrpcion_idntfccion,
           idntfccion_rspnsble,
           prmer_nmbre,
           sgndo_nmbre,
           prmer_aplldo,
           sgndo_aplldo,
           nmbre_prptrio,
           cdgo_cncpto,
           dscrpcion_cncpto,
           vlor_cncpto,
           tpo_trnsccion,
           nmro_dcmnto,
           fcha_rcdo,
           tpo_ajste,
           mtvo_ajste,
           obsrvcion_ajste,
           fcha_rgstro,
           indcdor_prcso,
           cdgo_impsto,
           ano,
           mes,
           cdgo_clnte,
           clsfccion)
        values
          ('AJ', --tpo_mvmnto,
           c_dscntos.id_rcdo, --id_orgen,
           c_dscntos.idntfccion_sjto, --idntfccion,
           v_cdgo_idntfccion_tpo, --cdgo_idntfccion_tpo,
           v_dscrpcion_idntfccion_tpo, --dscrpcion_idntfccion,
           v_idntfccion_rspnsble, --idntfccion_rspnsble,
           v_prmer_nmbre, --prmer_nmbre,
           v_sgndo_nmbre, --sgndo_nmbre,
           v_prmer_aplldo, --prmer_aplldo,
           v_sgndo_aplldo, --sgndo_aplldo,
           v_nmbre_prptrio, --nmbre_prptrio,
           c_cncptos.cdgo_cncpto, --cdgo_cncpto,
           c_cncptos.dscrpcion, --dscrpcion_cncpto,
           c_cncptos.vlor, --vlor_cncpto,
           c_cncptos.tpo_trnsccion, --tpo_trnsccion,
           c_dscntos.nmro_dcmnto, --nmro_dcmnto,
           c_dscntos.fcha_rcdo, --fcha_rcdo,
           'CR', --cdgo_tpo_ajste
           999, --id_ajste_mtvo,
           'Descuentos', --dscrpcion_motivo
           sysdate, --fcha_rgstro,
           'N', --indcdor_prcso,
           c_dscntos.cdgo_impsto, --cdgo_impsto,
           c_dscntos.ano, --ano,
           c_dscntos.mes, --mes
           c_dscntos.cdgo_clnte,
           p_clsfccion);
      exception
        when others then
          o_cdgo_rspsta := 1;
          rollback;
          v_error := 'Tipo: AJ' || ' Id_rcdo: ' || c_dscntos.id_rcdo ||
                     ' - Descuento Concepto causado- : ' ||
                     c_cncptos.id_cncpto || ' Error: ' || sqlerrm;
          insert into genesys_interfaz.sg_g_log
            (col1, col2)
          values
            (systimestamp, v_error);
          commit;
          exit;
      end;
    end loop;
  end loop;

exception
  when others then
    dbms_output.put_line(sqlerrm);
end prc_rg_descuento_intrfaz;
/

