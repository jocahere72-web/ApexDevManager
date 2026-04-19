
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_RG_LIQUIDACION_INTRFAZ" (p_cdgo_clnte in number,
                                                       p_vgncia     in number) as
  s_vlor                     number;
  v_clsfccion                varchar2(30);
  v_cdgo_cncpto              df_i_conceptos_cnclcion.cdgo_cncpto%type;
  v_nmbre_cncpto             df_i_conceptos_cnclcion.nmbre_cncpto%type;
  o_cdgo_rspsta              number;
  v_error                    varchar2(2000);
  v_idntfccion_rspnsble      si_i_sujetos_responsable.idntfccion%type;
  v_prmer_nmbre              si_i_sujetos_responsable.prmer_nmbre%type;
  v_sgndo_nmbre              si_i_sujetos_responsable.sgndo_nmbre%type;
  v_prmer_aplldo             si_i_sujetos_responsable.prmer_aplldo%type;
  v_sgndo_aplldo             si_i_sujetos_responsable.sgndo_aplldo%type;
  v_nmbre_prptrio            varchar2(4000);
  v_cdgo_idntfccion_tpo      si_i_sujetos_responsable.cdgo_idntfccion_tpo%type;
  v_dscrpcion_idntfccion_tpo df_s_identificaciones_tipo.dscrpcion_idntfccion_tpo%type;
  v_vlor_cncpto              number;
  v_vlor_prcntje             number;
begin

  --Cursor de Liquidaciones
  for c_lqdciones in (select a.id_lqdcion,
                             h.idntfccion_sjto,
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
                             extract(year from a.fcha_lqdcion) as ano,
                             to_char(a.fcha_lqdcion, 'MM') as mes,
                             a.vlor_ttal,
                             g.nmbre_impsto,
                             g.cdgo_impsto cdgo_impsto_2,
                             h.id_impsto,
                             a.id_impsto_sbmpsto,
                             a.id_sjto_impsto,
                             h.cdgo_sjto_tpo,
                             a.fcha_lqdcion
                        from gi_g_liquidaciones a
                        join v_si_i_sujetos_impuesto h
                          on a.id_sjto_impsto = h.id_sjto_impsto
                        join df_c_impuestos g
                          on h.id_impsto = g.id_impsto
                       where a.cdgo_clnte = p_cdgo_clnte
                            /*and trunc(a.fcha_lqdcion) between
                            to_date('01/04/2022', 'dd/mm/yyyy') and
                            to_date('30/04/2022', 'dd/mm/yyyy')*/
                         and extract(year from a.fcha_lqdcion) = p_vgncia
                         and a.cdgo_lqdcion_estdo = 'L'
                         and a.vlor_ttal > 0
                         and a.indcdor_mgrdo is null
                         and a.indcdor_intrfaz = 'N'
                         and not exists
                       (select 1
                                from gf_g_movimientos_financiero
                               where id_orgen = id_lqdcion
                                 and cdgo_mvmnto_orgn = 'LQ'
                                 and cdgo_mvnt_fncro_estdo = 'AN')
                       order by a.fcha_lqdcion, a.id_lqdcion) loop

    --Inicializa el Acumulador en 0 de Suma Cuadradas
    s_vlor        := 0;
    o_cdgo_rspsta := 0;

    -- Obtener la Clasificacion
    case
      when c_lqdciones.cdgo_impsto_2 = 'IPU' then
        -- Si es un predio
        if (substr(c_lqdciones.idntfccion_sjto, 1, 2) = '01') then
          v_clsfccion := 'URBANO';
        else
          v_clsfccion := 'RURAL';
        end if;
      when c_lqdciones.cdgo_impsto_2 = 'ICA' then
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
           where a.id_sjto_impsto = c_lqdciones.id_sjto_impsto
             and b.id_impsto = c_lqdciones.id_impsto;

          if v_clsfccion not in ('COMERCIAL', 'SERVICIOS', 'INDUSTRIAL') then
            v_clsfccion := 'SERVICIOS';
          end if;

        exception
          when others then
            v_clsfccion := 'SERVICIOS';
        end;

      when c_lqdciones.cdgo_impsto_2 = 'ARD' then
        v_clsfccion := 'PLAZA DE MERCADO';

      when c_lqdciones.cdgo_impsto_2 = 'REN' then

        if (c_lqdciones.id_impsto_sbmpsto = 2367842) then
          ---
          -- ESPECTACULOS PUBLICOS AL DEPORTE
          v_clsfccion := 'ESPECTACULO DEPORTE';
        elsif (c_lqdciones.id_impsto_sbmpsto = 23001148) then
          -- DEGÜELLO DE GANADO MENOR
          v_clsfccion := 'DEGUELLO MENOR';
        elsif (c_lqdciones.id_impsto_sbmpsto = 23001147) then
          -- PUBLICIDAD EXTERIOR VISUAL
          v_clsfccion := 'PUBLICIDAD VISUAL';
        elsif (c_lqdciones.id_impsto_sbmpsto = 23001150) then
          -- ESPECTACULOS PUBLICOS
          v_clsfccion := 'ESPECTACULO PUBLICO';
        elsif (c_lqdciones.id_impsto_sbmpsto = 23001157) then
          -- DELINEACION URBANA
          v_clsfccion := 'DELINEACION';
        elsif (c_lqdciones.id_impsto_sbmpsto = 23001142) then
          -- Estampilla Adulto Mayor
          v_clsfccion := 'ADULTO MAYOR';
        elsif (c_lqdciones.id_impsto_sbmpsto = 23001141) then
          -- Estampilla Pro-Cultura
          v_clsfccion := 'PRO CULTURA';
        else
          v_clsfccion := 'SIN CLASIFICACION';
        end if;
      else
        v_clsfccion := 'SIN CLASIFICACION';
    end case;

    -- Si es ICA, la vigencia actual es la vigencia del proceso - 1
    if (c_lqdciones.id_impsto = p_cdgo_clnte || 2) then
      begin
        select d.fcha_prsntcion,
               extract(year from d.fcha_prsntcion) as ano,
               to_char(d.fcha_prsntcion, 'MM') as mes
          into c_lqdciones.fcha_lqdcion, c_lqdciones.ano, c_lqdciones.mes
          from gi_g_declaraciones d
         where d.id_lqdcion = c_lqdciones.id_lqdcion;
      exception
        when others then
          o_cdgo_rspsta := 1;
          v_error       := 'Tipo: LQ' || ' Id_lqdcion: ' ||
                           c_lqdciones.id_lqdcion ||
                           ' - Error en declaracion- : ' ||
                           c_lqdciones.id_sjto_impsto || ' . Error: ' ||
                           sqlerrm;
          insert into genesys_interfaz.sg_g_log
            (col1, col2)
          values
            (systimestamp, v_error);
          commit;
          continue;
      end;
    end if;

    -- Buscar la informacion del responsable dependiendo del cdgo_sjto_tpo
    if (c_lqdciones.cdgo_sjto_tpo = 'E') then
      begin
        select c_lqdciones.idntfccion_sjto,
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
         where e.id_sjto_impsto = c_lqdciones.id_sjto_impsto;
      exception
        when others then
          o_cdgo_rspsta := 1;
          v_error       := 'Tipo: LQ' || ' Id_lqdcion: ' ||
                           c_lqdciones.id_lqdcion ||
                           ' - Error en persona- : ' ||
                           c_lqdciones.id_sjto_impsto || ' . Error: ' ||
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
         where e.id_sjto_impsto = c_lqdciones.id_sjto_impsto
           and e.prncpal_s_n = 'S'
           and rownum = 1;
      exception
        when others then
          v_error := 'Tipo: LQ' || ' Id_lqdcion: ' ||
                     c_lqdciones.id_lqdcion ||
                     ' - Error en reponsable principal- : ' ||
                     c_lqdciones.id_sjto_impsto || ' . Error: ' || sqlerrm;
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
                                    c_lqdciones.ano,
                                    'VIGENCIA_ACTUAL_CAPITAL',
                                    'VIGENCIA_ANTERIOR_CAPITAL') as tpo_trnsccion,
                             b.cdgo_cncpto,
                             a.id_cncpto_csdo,
                             sum(a.vlor) as vlor,
                             b.dscrpcion,
                             b.id_cncpto,
                             decode(a.vgncia, c_lqdciones.ano, 'S', 'N') as indcdor_vgncia_actual,
                             a.vgncia
                        from (select a.id_orgen,
                                     a.vgncia,
                                     a.id_cncpto_csdo,
                                     sum(a.vlor_dbe) as vlor,
                                     a.cdgo_mvmnto_tpo
                                from gf_g_movimientos_detalle a
                                join gf_g_movimientos_financiero b
                                  on a.id_mvmnto_fncro = b.id_mvmnto_fncro
                               where a.cdgo_mvmnto_orgn = 'LQ'
                                 and a.id_orgen = c_lqdciones.id_lqdcion
                                 and a.vlor_dbe > 0
                                 and a.cdgo_mvmnto_tpo in ('IN')
                                 and b.cdgo_mvnt_fncro_estdo != 'AN'
                               group by a.id_orgen,
                                        a.vgncia,
                                        a.id_cncpto_csdo,
                                        a.cdgo_mvmnto_tpo) a
                        join df_i_conceptos b
                          on a.id_cncpto_csdo = b.id_cncpto
                       group by decode(a.vgncia,
                                       c_lqdciones.ano,
                                       'VIGENCIA_ACTUAL_CAPITAL',
                                       'VIGENCIA_ANTERIOR_CAPITAL'),
                                b.cdgo_cncpto,
                                a.id_cncpto_csdo,
                                b.dscrpcion,
                                b.id_cncpto,
                                decode(a.vgncia, c_lqdciones.ano, 'S', 'N'),
                                a.vgncia) loop
      -- Si es ICA, la vigencia actual es la vigencia del proceso - 1
      if (c_lqdciones.id_impsto = p_cdgo_clnte || 2) then
        if (c_cncptos.vgncia >= p_vgncia - 1) then
          c_cncptos.tpo_trnsccion         := 'VIGENCIA_ACTUAL_CAPITAL';
          c_cncptos.indcdor_vgncia_actual := 'S';
        else
          c_cncptos.tpo_trnsccion         := 'VIGENCIA_ANTERIOR_CAPITAL';
          c_cncptos.indcdor_vgncia_actual := 'N';
        end if;
      end if;

      v_vlor_cncpto := c_cncptos.vlor;
      -- Calcula porcentaje sobretasa
      if (c_cncptos.cdgo_cncpto = '1020' and c_cncptos.vgncia >= 2013) then
        v_vlor_cncpto  := round(v_vlor_cncpto * 0.85);
        v_vlor_prcntje := c_cncptos.vlor - v_vlor_cncpto;
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
             nmro_dcmnto,
             fcha_rcdo,
             fcha_rgstro,
             indcdor_prcso,
             cdgo_impsto,
             ano,
             mes,
             tpo_trnsccion,
             cdgo_clnte,
             clsfccion)
          values
            ('LQ',
             c_lqdciones.id_lqdcion,
             c_lqdciones.idntfccion_sjto,
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
             v_vlor_prcntje,
             c_lqdciones.id_lqdcion,
             c_lqdciones.fcha_lqdcion,
             sysdate, --to_date('05/05/2022', 'dd/mm/yyyy'),
             'N',
             c_lqdciones.cdgo_impsto,
             c_lqdciones.ano,
             c_lqdciones.mes,
             c_cncptos.tpo_trnsccion,
             p_cdgo_clnte,
             v_clsfccion);

          --Acumula las Sumatoria de los Conceptos
          s_vlor := s_vlor + v_vlor_prcntje;

        exception
          when others then
            o_cdgo_rspsta := 1;
            rollback;
            v_error := 'Tipo: LQ' || ' Id_lqdcion: ' ||
                       c_lqdciones.id_lqdcion ||
                       ' - Liquidacion Concepto causado- : ' ||
                       c_cncptos.id_cncpto_csdo || ' Error: ' || sqlerrm;
            insert into genesys_interfaz.sg_g_log
              (col1, col2)
            values
              (systimestamp, v_error);
            commit;
            exit;
        end;
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
           nmro_dcmnto,
           fcha_rcdo,
           fcha_rgstro,
           indcdor_prcso,
           cdgo_impsto,
           ano,
           mes,
           tpo_trnsccion,
           cdgo_clnte,
           clsfccion)
        values
          ('LQ',
           c_lqdciones.id_lqdcion,
           c_lqdciones.idntfccion_sjto,
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
           v_vlor_cncpto,
           c_lqdciones.id_lqdcion,
           c_lqdciones.fcha_lqdcion,
           sysdate, --to_date('05/05/2022', 'dd/mm/yyyy'),
           'N',
           c_lqdciones.cdgo_impsto,
           c_lqdciones.ano,
           c_lqdciones.mes,
           c_cncptos.tpo_trnsccion,
           p_cdgo_clnte,
           v_clsfccion);

        --Acumula las Sumatoria de los Conceptos
        s_vlor := s_vlor + v_vlor_cncpto; --c_cncptos.vlor;

      exception
        when others then
          o_cdgo_rspsta := 1;
          rollback;
          v_error := 'Tipo: LQ' || ' Id_lqdcion: ' ||
                     c_lqdciones.id_lqdcion ||
                     ' - Liquidacion Concepto causado- : ' ||
                     c_cncptos.id_cncpto_csdo || ' Error: ' || sqlerrm;
          insert into genesys_interfaz.sg_g_log
            (col1, col2)
          values
            (systimestamp, v_error);
          commit;
          exit;
      end;
    end loop;

    if (o_cdgo_rspsta = 0) then
      --Verifica si la liquidacion esta Cuadrada
      if (s_vlor = c_lqdciones.vlor_ttal) then

        --Indicador de Interfaz
        update gi_g_liquidaciones
           set indcdor_intrfaz = 'S'
         where id_lqdcion = c_lqdciones.id_lqdcion;

        --Salva los Cambios
        commit;
      else
        rollback;
        v_error := 'Descuadre id_lqdcion:' || c_lqdciones.id_lqdcion ||
                   ' - sujeto:' || c_lqdciones.id_sjto_impsto ||
                   ' - impuesto:' || c_lqdciones.id_impsto || ' - s_vlor: ' ||
                   s_vlor || ' - c_lqdciones.vlor_ttal: ' ||
                   c_lqdciones.vlor_ttal;
        /*insert into genesys_interfaz.sg_g_log (col1, col2)
        values (systimestamp, v_error);
        commit;*/
        continue;
      end if;
    end if;

  end loop;

exception
  when others then
    --dbms_output.put_line(sqlerrm);
    v_error := 'prc_rg_liquidacion_intrfaz. Error: ' || sqlerrm;
    insert into genesys_interfaz.sg_g_log
      (col1, col2)
    values
      (systimestamp, v_error);
    commit;
end prc_rg_liquidacion_intrfaz;
/

