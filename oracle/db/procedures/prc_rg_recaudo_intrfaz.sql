
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_RG_RECAUDO_INTRFAZ" (p_cdgo_clnte in number,
                                                   p_vgncia     in number) as
  s_vlor              number;
  v_clsfccion         varchar2(30);
  v_id_impsto_sbmpsto number;
  --v_cdgo_cncpto              df_i_conceptos_cnclcion.cdgo_cncpto%type;
  --v_nmbre_cncpto             df_i_conceptos_cnclcion.nmbre_cncpto%type;
  o_cdgo_rspsta              number;
  v_error                    varchar2(2000);
  v_tpo_trnsccion            varchar2(30);
  v_idntfccion_rspnsble      si_i_sujetos_responsable.idntfccion%type;
  v_prmer_nmbre              si_i_sujetos_responsable.prmer_nmbre%type;
  v_sgndo_nmbre              si_i_sujetos_responsable.sgndo_nmbre%type;
  v_prmer_aplldo             si_i_sujetos_responsable.prmer_aplldo%type;
  v_sgndo_aplldo             si_i_sujetos_responsable.sgndo_aplldo%type;
  v_nmbre_prptrio            varchar2(4000);
  v_cdgo_idntfccion_tpo      si_i_sujetos_responsable.cdgo_idntfccion_tpo%type;
  v_dscrpcion_idntfccion_tpo df_s_identificaciones_tipo.dscrpcion_idntfccion_tpo%type;
  v_vlor_cncpto              number;
  v_vlor_prcntaje            number;
begin

  --Cursor de Recaudos
  for c_rcdos in (select distinct a.id_rcdo,
                                  a.idntfccion_sjto,
                                  a.cdgo_rcdo_orgn_tpo,
                                  a.nmro_dcmnto,
                                  e.fcha_cnclcion fcha_rcdo,
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
                                  extract(year from e.fcha_cnclcion) as ano,
                                  to_char(e.fcha_cnclcion, 'MM') as mes,
                                  a.id_sldo_fvor,
                                  a.vlor,
                                  g.nmbre_impsto,
                                  g.cdgo_impsto cdgo_impsto_2,
                                  h.id_impsto,
                                  a.id_sjto_impsto,
                                  h.cdgo_sjto_tpo
                    from v_re_g_recaudos a
                    join v_re_g_recaudos_control d
                      on a.id_rcdo_cntrol = d.id_rcdo_cntrol
                    join v_si_i_sujetos_impuesto h
                      on a.id_sjto_impsto = h.id_sjto_impsto
                    join df_c_impuestos g
                      on h.id_impsto = g.id_impsto
                    join re_g_recaudos_cncpto_cnclcn c
                      on a.id_Rcdo = c.id_rcdo
                    join re_g_recaudos_lte_cnclcion b
                      on b.id_rcdo_lte_cnclcion = c.id_rcdo_lte_cnclcion
                    join re_g_recaudos_archvo_cnclcn e
                      on e.id_rcdo_archvo_cnclcion =
                         b.id_rcdo_archvo_cnclcion
                     and e.estdo_archvo = 'FN'
                   where d.cdgo_clnte = p_cdgo_clnte
                        /* and trunc(e.fcha_cnclcion) between
                          to_date('01/04/2022', 'dd/mm/yyyy') and
                        to_date('30/04/2022', 'dd/mm/yyyy')*/
                        -- and extract(year from a.fcha_rcdo) = p_vgncia
                     and extract(year from e.fcha_cnclcion) = p_vgncia
                     and a.cdgo_rcdo_estdo = 'AP'
                     and a.vlor > 0
                     and a.indcdor_intrfaz = 'N'
                   order by e.fcha_cnclcion, a.id_rcdo) loop

    --Inicializa el Acumulador en 0 de Suma Cuadradas
    s_vlor        := 0;
    o_cdgo_rspsta := 0;

    -- Obtener la Clasificacion
    case
      when c_rcdos.cdgo_impsto_2 = 'IPU' then
        -- Si es un predio
        if (substr(c_rcdos.idntfccion_sjto, 1, 2) = '01') then
          v_clsfccion := 'URBANO';
        else
          v_clsfccion := 'RURAL';
        end if;
      when c_rcdos.cdgo_impsto_2 = 'ICA' then
        -- Si es un establecimiento
        begin
          select upper(d.nmbre_dclrcns_esqma_trfa_tpo)
            into v_clsfccion
            from si_i_personas a
            join si_i_sujetos_impuesto b
              on b.id_sjto_impsto = a.id_sjto_impsto
            join gi_d_dclrcns_esqma_trfa c
              on c.id_dclrcns_esqma_trfa = a.id_actvdad_ecnmca
            join gi_d_dclrcns_esqma_trfa_tpo d
              on d.id_dclrcns_esqma_trfa_tpo = c.id_dclrcns_esqma_trfa_tpo
           where a.id_sjto_impsto = c_rcdos.id_sjto_impsto
             and b.id_impsto = c_rcdos.id_impsto;

          if v_clsfccion not in ('COMERCIAL', 'SERVICIOS', 'INDUSTRIAL') then
            v_clsfccion := 'SERVICIOS';
          end if;

        exception
          when others then
            v_clsfccion := 'SERVICIOS';
        end;

      when c_rcdos.cdgo_impsto_2 = 'ARD' then
        v_clsfccion := 'PLAZA DE MERCADO';

      when c_rcdos.cdgo_impsto_2 = 'REN' then
        -- se busca el id_impsto_sbmpsto
        select min(id_impsto_sbmpsto)
          into v_id_impsto_sbmpsto
          from gi_g_rentas
         where id_sjto_impsto = c_rcdos.id_sjto_impsto
           and id_dcmnto in
               (select id_dcmnto
                  from re_g_documentos
                 where nmro_dcmnto = c_rcdos.nmro_dcmnto);

        if (v_id_impsto_sbmpsto = 2367842) then
          -- ESPECTACULOS PUBLICOS AL DEPORTE
          v_clsfccion := 'ESPECTACULO DEPORTE';
        elsif (v_id_impsto_sbmpsto = 23001148) then
          -- DEGÜELLO DE GANADO MENOR
          v_clsfccion := 'DEGUELLO MENOR';
        elsif (v_id_impsto_sbmpsto = 23001147) then
          -- PUBLICIDAD EXTERIOR VISUAL
          v_clsfccion := 'PUBLICIDAD VISUAL';
        elsif (v_id_impsto_sbmpsto = 23001150) then
          -- ESPECTACULOS PUBLICOS
          v_clsfccion := 'ESPECTACULO PUBLICO';
        elsif (v_id_impsto_sbmpsto = 23001157) then
          -- DELINEACION URBANA
          v_clsfccion := 'DELINEACION';
        elsif (v_id_impsto_sbmpsto = 23001142) then
          -- Estampilla Adulto Mayor
          v_clsfccion := 'ADULTO MAYOR';
        elsif (v_id_impsto_sbmpsto = 23001141) then
          -- Estampilla Pro-Cultura
          v_clsfccion := 'PRO CULTURA';
        else
          v_clsfccion := 'SIN CLASIFICACION';
        end if;
      else
        v_clsfccion := 'SIN CLASIFICACION';
    end case;

    -- Buscar la informacion del responsable dependiendo del cdgo_sjto_tpo
    if (c_rcdos.cdgo_sjto_tpo = 'E') then
      begin
        select c_rcdos.idntfccion_sjto,
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
         where e.id_sjto_impsto = c_rcdos.id_sjto_impsto;
      exception
        when others then
          o_cdgo_rspsta := 1;
          v_error       := 'Tipo: RE' || ' Id_Rcdo: ' || c_rcdos.id_rcdo ||
                           ' - Error en persona- : ' ||
                           c_rcdos.id_sjto_impsto || ' . Error: ' ||
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
         where e.id_sjto_impsto = c_rcdos.id_sjto_impsto
           and e.prncpal_s_n = 'S'
           and rownum = 1;
      exception
        when others then
          v_error := 'Tipo: RE' || ' Id_Rcdo: ' || c_rcdos.id_rcdo ||
                     ' - Error en reponsable principal- : ' ||
                     c_rcdos.id_sjto_impsto || ' . Error: ' || sqlerrm;
          insert into genesys_interfaz.sg_g_log
            (col1, col2)
          values
            (systimestamp, v_error);
          commit;
          continue;
      end;
    end if;

    --Cursor Conceptos Pagados
    for c_cncptos in (select decode(a.vgncia,
                                    c_rcdos.ano,
                                    'VIGENCIA_ACTUAL',
                                    'VIGENCIA_ANTERIOR') || '_' ||
                             decode(a.cdgo_mvmnto_tpo,
                                    'PC',
                                    'CAPITAL',
                                    'PI',
                                    'INTERES') as tpo_trnsccion,
                             b.cdgo_cncpto,
                             --a.id_cncpto_csdo,
                             a.id_cncpto id_cncpto_csdo,
                             sum(a.vlor) as vlor,
                             b.dscrpcion,
                             decode(a.vgncia, c_rcdos.ano, 'S', 'N') as indcdor_vgncia_actual,
                             a.vgncia
                        from (select a.id_orgen,
                                     a.vgncia,
                                     --a.id_cncpto_csdo,
                                     a.id_cncpto,
                                     sum(a.vlor_hber) as vlor,
                                     a.cdgo_mvmnto_tpo
                                from gf_g_movimientos_detalle a
                               where cdgo_mvmnto_orgn = 'RE'
                                 and a.id_orgen = c_rcdos.id_rcdo
                                 and a.vlor_hber > 0
                                 and a.cdgo_mvmnto_tpo in ('PC', 'PI')
                               group by a.id_orgen,
                                        a.vgncia,
                                        -- a.id_cncpto_csdo,
                                        a.id_cncpto,
                                        a.cdgo_mvmnto_tpo) a
                        join df_i_conceptos b
                      -- on a.id_cncpto_csdo = b.id_cncpto
                          on a.id_cncpto = b.id_cncpto
                       group by decode(a.vgncia,
                                       c_rcdos.ano,
                                       'VIGENCIA_ACTUAL',
                                       'VIGENCIA_ANTERIOR') || '_' ||
                                decode(a.cdgo_mvmnto_tpo,
                                       'PC',
                                       'CAPITAL',
                                       'PI',
                                       'INTERES'),
                                b.cdgo_cncpto,
                                --a.id_cncpto_csdo,
                                a.id_cncpto,
                                b.dscrpcion,
                                decode(a.vgncia, c_rcdos.ano, 'S', 'N'),
                                a.vgncia) loop

      -- Si es ICA, la vigencia actual es la vigencia del proceso - 1
      if (c_rcdos.id_impsto = p_cdgo_clnte || 2) then
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

      v_vlor_cncpto := c_cncptos.vlor;
      -- Calcula porcentaje sobretasa
      if (c_rcdos.id_impsto = p_cdgo_clnte || 1) then
        if (c_cncptos.cdgo_cncpto = '1020' and c_cncptos.vgncia >= 2013 and
           c_cncptos.tpo_trnsccion in
           ('VIGENCIA_ACTUAL_CAPITAL', 'VIGENCIA_ANTERIOR_CAPITAL')) then
          v_vlor_cncpto   := round(c_cncptos.vlor * 0.85);
          v_vlor_prcntaje := c_cncptos.vlor - v_vlor_cncpto;
          --Inserta el Movimiento en la Interfaz - porcentaje sobretasa
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
               cdgo_rcdo_orgn_tpo,
               nmro_dcmnto,
               fcha_rcdo,
               cdgo_bnco,
               nmbre_bnco,
               nmro_cta,
               fcha_rgstro,
               indcdor_prcso,
               cdgo_impsto,
               ano,
               mes,
               tpo_trnsccion,
               cdgo_clnte,
               clsfccion)
            values
              ('RE',
               c_rcdos.id_rcdo,
               c_rcdos.idntfccion_sjto,
               v_cdgo_idntfccion_tpo,
               v_dscrpcion_idntfccion_tpo,
               v_idntfccion_rspnsble,
               v_prmer_nmbre,
               v_sgndo_nmbre,
               v_prmer_aplldo,
               v_sgndo_aplldo,
               v_nmbre_prptrio,
               '1013',
               'Porcentaje Ambiental',
               v_vlor_prcntaje, --c_cncptos.vlor,
               c_rcdos.cdgo_rcdo_orgn_tpo,
               c_rcdos.nmro_dcmnto,
               c_rcdos.fcha_rcdo,
               c_rcdos.cdgo_bnco,
               c_rcdos.nmbre_bnco,
               c_rcdos.nmro_cnta,
               sysdate, --to_date('05/05/2022', 'dd/mm/yyyy'),
               'N',
               c_rcdos.cdgo_impsto,
               c_rcdos.ano,
               c_rcdos.mes,
               c_cncptos.tpo_trnsccion,
               p_cdgo_clnte,
               v_clsfccion);

            --Acumula las Sumatoria de los Conceptos
            s_vlor := s_vlor + v_vlor_prcntaje;

          exception
            when others then
              o_cdgo_rspsta := 1;
              rollback;
              v_error := 'Tipo: RE' || ' Id_rcdo: ' || c_rcdos.id_rcdo ||
                         ' - Recaudo Concepto causado- : ' ||
                         c_cncptos.id_cncpto_csdo || ' Error: ' || sqlerrm;
              insert into genesys_interfaz.sg_g_log
                (col1, col2)
              values
                (systimestamp, v_error);
              commit;
              exit;
          end;
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
           cdgo_rcdo_orgn_tpo,
           nmro_dcmnto,
           fcha_rcdo,
           cdgo_bnco,
           nmbre_bnco,
           nmro_cta,
           fcha_rgstro,
           indcdor_prcso,
           cdgo_impsto,
           ano,
           mes,
           tpo_trnsccion,
           cdgo_clnte,
           clsfccion)
        values
          ('RE',
           c_rcdos.id_rcdo,
           c_rcdos.idntfccion_sjto,
           v_cdgo_idntfccion_tpo,
           v_dscrpcion_idntfccion_tpo,
           v_idntfccion_rspnsble,
           v_prmer_nmbre,
           v_sgndo_nmbre,
           v_prmer_aplldo,
           v_sgndo_aplldo,
           v_nmbre_prptrio,
           c_cncptos.cdgo_cncpto,
           c_cncptos.dscrpcion,
           v_vlor_cncpto, --c_cncptos.vlor,
           c_rcdos.cdgo_rcdo_orgn_tpo,
           c_rcdos.nmro_dcmnto,
           c_rcdos.fcha_rcdo,
           c_rcdos.cdgo_bnco,
           c_rcdos.nmbre_bnco,
           c_rcdos.nmro_cnta,
           sysdate, --to_date('05/05/2022', 'dd/mm/yyyy'),
           'N',
           c_rcdos.cdgo_impsto,
           c_rcdos.ano,
           c_rcdos.mes,
           c_cncptos.tpo_trnsccion,
           p_cdgo_clnte,
           v_clsfccion);

        --Acumula las Sumatoria de los Conceptos
        s_vlor := s_vlor + v_vlor_cncpto;

      exception
        when others then
          o_cdgo_rspsta := 1;
          rollback;
          v_error := 'Tipo: RE' || ' Id_rcdo: ' || c_rcdos.id_rcdo ||
                     ' - Recaudo Concepto causado- : ' ||
                     c_cncptos.id_cncpto_csdo || ' Error: ' || sqlerrm;
          insert into genesys_interfaz.sg_g_log
            (col1, col2)
          values
            (systimestamp, v_error);
          commit;
          exit;
      end;
    end loop;

    --Verifica si hay Saldo a Favor
    if (c_rcdos.id_sldo_fvor is not null) then

      --Busca los Datos del Saldo a Favor
      declare
        v_vlor_sldo_fvor gf_g_saldos_favor.vlor_sldo_fvor%type;
      begin
        select vlor_sldo_fvor
          into v_vlor_sldo_fvor
          from gf_g_saldos_favor
         where id_sldo_fvor = c_rcdos.id_sldo_fvor;

        --Inserta el Movimiento en la Interfaz de Saldo a Favor
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
           cdgo_rcdo_orgn_tpo,
           nmro_dcmnto,
           fcha_rcdo,
           cdgo_bnco,
           nmbre_bnco,
           nmro_cta,
           fcha_rgstro,
           indcdor_prcso,
           cdgo_impsto,
           ano,
           mes,
           tpo_trnsccion,
           cdgo_clnte,
           clsfccion)
        values
          ('RE',
           c_rcdos.id_rcdo,
           c_rcdos.idntfccion_sjto,
           v_cdgo_idntfccion_tpo,
           v_dscrpcion_idntfccion_tpo,
           v_idntfccion_rspnsble,
           v_prmer_nmbre,
           v_sgndo_nmbre,
           v_prmer_aplldo,
           v_sgndo_aplldo,
           v_nmbre_prptrio,
           '999',
           'SALDO A FAVOR ' || upper(c_rcdos.nmbre_impsto),
           v_vlor_sldo_fvor,
           c_rcdos.cdgo_rcdo_orgn_tpo,
           c_rcdos.nmro_dcmnto,
           c_rcdos.fcha_rcdo,
           c_rcdos.cdgo_bnco,
           c_rcdos.nmbre_bnco,
           c_rcdos.nmro_cnta,
           sysdate, --to_date('05/05/2022', 'dd/mm/yyyy'),
           'N',
           c_rcdos.cdgo_impsto,
           c_rcdos.ano,
           c_rcdos.mes,
           decode(c_rcdos.ano,
                  extract(year from sysdate),
                  'VIGENCIA_ACTUAL_CAPITAL',
                  'VIGENCIA_ANTERIOR_CAPITAL'),
           p_cdgo_clnte,
           v_clsfccion);

        --Acumula las Sumatoria del Saldo a Favor
        s_vlor := s_vlor + v_vlor_sldo_fvor;

      exception
        when others then
          o_cdgo_rspsta := 1;
          rollback;
          v_error := 'Tipo: RE-SF' || ' Id_rcdo: ' || c_rcdos.id_rcdo ||
                     ' - Recaudo SF Concepto causado- : 999 Error: ' ||
                     sqlerrm;
          insert into genesys_interfaz.sg_g_log
            (col1, col2)
          values
            (systimestamp, v_error);
          commit;
          exit;
      end;
    end if;

    -- Revisa Descuento
    prc_rg_descuento_intrfaz(p_cdgo_clnte  => p_cdgo_clnte,
                             p_vgncia      => p_vgncia,
                             p_id_rcdo     => c_rcdos.id_rcdo,
                             p_clsfccion   => v_clsfccion,
                             o_cdgo_rspsta => o_cdgo_rspsta);

    if (o_cdgo_rspsta = 0) then
      --Verifica si el Recaudo esta Cuadrado
      if (s_vlor = c_rcdos.vlor) then

        --Indicador de Interfaz
        update re_g_recaudos
           set indcdor_intrfaz = 'S'
         where id_rcdo = c_rcdos.id_rcdo;

        --Salva los Cambios
        commit;

        /*insert into genesys_interfaz.sg_g_log  (col1, col2)
        values (systimestamp, c_rcdos.id_rcdo||' - Marca recaudo enviado a la interfaz por el procedimiento');
        commit;*/
      else
        --o_cdgo_rspsta := 1;
        rollback;
        v_error := 'Tipo: RE' || ' Id_rcdo: ' || c_rcdos.id_rcdo ||
                   ' - Recaudo Descuadrado';
        insert into genesys_interfaz.sg_g_log
          (col1, col2)
        values
          (systimestamp, v_error);
        commit;
      end if;
    end if;
  end loop;

exception
  when others then
    --dbms_output.put_line(sqlerrm);
    v_error := 'prc_rg_recaudo_intrfaz. Error: ' || sqlerrm;
    insert into genesys_interfaz.sg_g_log
      (col1, col2)
    values
      (systimestamp, v_error);
    commit;

end prc_rg_recaudo_intrfaz;
/

