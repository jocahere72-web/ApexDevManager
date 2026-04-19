
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_RG_AJUSTE_INTRFAZ" (p_cdgo_clnte in number,
                                                  p_vgncia     in number) as
  s_vlor                     number;
  s_vlor_ac                  number;
  s_vlor_ad                  number;
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
begin

  --Cursor de Ajuste
  for c_ajste in (select a.id_ajste,
                         a.id_impsto,
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
                         a.id_sjto_impsto,
                         a.numro_ajste,
                         a.id_sjto,
                         a.idntfccion_sjto,
                         a.cdgo_tpo_ajste,
                         a.orgen,
                         a.dscrpcion_orgen,
                         a.tpo_ajste,
                         a.vlor,
                         a.fcha_aplccion,
                         extract(year from a.fcha_aplccion) as ano,
                         to_char(a.fcha_aplccion, 'MM') as mes,
                         a.id_ajste_mtvo,
                         a.dscrpcion_motivo,
                         a.obsrvcion,
                         a.cdgo_ajste_estdo,
                         a.indcdor_intrfaz,
                         g.cdgo_impsto cdgo_impsto_2,
                         a.id_impsto_sbmpsto,
                         a.cdgo_clnte,
                         h.cdgo_sjto_tpo
                    from v_gf_g_ajustes a
                    join v_si_i_sujetos_impuesto h
                      on a.id_sjto_impsto = h.id_sjto_impsto
                    join df_c_impuestos g
                      on h.id_impsto = g.id_impsto
                   where a.cdgo_clnte = p_cdgo_clnte
                        /*and trunc(a.fcha_aplccion) between
                        to_date('01/04/2022', 'dd/mm/yyyy') and
                        to_date('30/04/2022', 'dd/mm/yyyy')*/
                     and extract(year from a.fcha_aplccion) = p_vgncia
                     and a.cdgo_ajste_estdo = 'AP'
                     and (a.indcdor_intrfaz = 'N' or
                         a.indcdor_intrfaz is null)
                     and a.vlor > 0
                   order by a.fcha_aplccion, a.id_ajste) loop

    --Inicializa el Acumulador en 0 de Suma por tipos de ajuste cuadradas
    --       s_vlor := 0;
    s_vlor_ac := 0;
    s_vlor_ad := 0;

    -- Obtener la Clasificacion
    case
      when c_ajste.cdgo_impsto_2 = 'IPU' then
        -- Si es un predio
        if (substr(c_ajste.idntfccion_sjto, 1, 2) = '01') then
          v_clsfccion := 'URBANO';
        else
          v_clsfccion := 'RURAL';
        end if;
      when c_ajste.cdgo_impsto_2 = 'ICA' then
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
           where a.id_sjto_impsto = c_ajste.id_sjto_impsto
             and b.id_impsto = c_ajste.id_impsto;

          if v_clsfccion not in ('COMERCIAL', 'SERVICIOS', 'INDUSTRIAL') then
            v_clsfccion := 'SERVICIOS';
          end if;

        exception
          when others then
            v_clsfccion := 'SERVICIOS';
        end;

      when c_ajste.cdgo_impsto_2 = 'ARD' then
        v_clsfccion := 'PLAZA DE MERCADO';

      when c_ajste.cdgo_impsto_2 = 'REN' then

        if (c_ajste.id_impsto_sbmpsto = 2367842) then
          ---
          -- ESPECTACULOS PUBLICOS AL DEPORTE
          v_clsfccion := 'ESPECTACULO DEPORTE';
        elsif (c_ajste.id_impsto_sbmpsto = 23001148) then
          -- DEGÜELLO DE GANADO MENOR
          v_clsfccion := 'DEGUELLO MENOR';
        elsif (c_ajste.id_impsto_sbmpsto = 23001147) then
          -- PUBLICIDAD EXTERIOR VISUAL
          v_clsfccion := 'PUBLICIDAD VISUAL';
        elsif (c_ajste.id_impsto_sbmpsto = 23001150) then
          -- ESPECTACULOS PUBLICOS
          v_clsfccion := 'ESPECTACULO PUBLICO';
        elsif (c_ajste.id_impsto_sbmpsto = 23001157) then
          -- DELINEACION URBANA
          v_clsfccion := 'DELINEACION';
        elsif (c_ajste.id_impsto_sbmpsto = 23001142) then
          -- Estampilla Adulto Mayor
          v_clsfccion := 'ADULTO MAYOR';
        elsif (c_ajste.id_impsto_sbmpsto = 23001141) then
          -- Estampilla Pro-Cultura
          v_clsfccion := 'PRO CULTURA';
        else
          v_clsfccion := 'SIN CLASIFICACION';
        end if;
      else
        v_clsfccion := 'SIN CLASIFICACION';
    end case;

    -- Buscar la informacion del responsable dependiendo del cdgo_sjto_tpo
    if (c_ajste.cdgo_sjto_tpo = 'E') then
      begin
        select c_ajste.idntfccion_sjto,
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
         where e.id_sjto_impsto = c_ajste.id_sjto_impsto;
      exception
        when others then
          o_cdgo_rspsta := 1;
          v_error       := 'Tipo: AJ' || ' Id_Ajuste: ' || c_ajste.id_ajste ||
                           ' - Error en persona- : ' ||
                           c_ajste.id_sjto_impsto || ' . Error: ' ||
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
         where e.id_sjto_impsto = c_ajste.id_sjto_impsto
           and e.prncpal_s_n = 'S'
           and rownum = 1;
      exception
        when others then
          v_error := 'Tipo: AJ' || ' Id_Ajuste: ' || c_ajste.id_ajste ||
                     ' - Error en reponsable principal- : ' ||
                     c_ajste.id_sjto_impsto || ' . Error: ' || sqlerrm;
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
                                    c_ajste.ano,
                                    'VIGENCIA_ACTUAL',
                                    'VIGENCIA_ANTERIOR') || '_' ||
                             decode(a.cdgo_mvmnto_tpo,
                                    'AC',
                                    'CAPITAL',
                                    'AD',
                                    'CAPITAL',
                                    'IT',
                                    'INTERES') as tpo_trnsccion,
                             b.cdgo_cncpto,
                             a.id_cncpto_csdo,
                             sum(a.vlor_ac) as vlor_ac,
                             sum(a.vlor_ad) as vlor_ad,
                             b.dscrpcion,
                             b.id_cncpto,
                             decode(a.vgncia, c_ajste.ano, 'S', 'N') as indcdor_vgncia_actual,
                             a.vgncia
                        from (select a.id_orgen,
                                     a.vgncia,
                                     a.id_cncpto_csdo,
                                     sum(a.vlor_hber) as vlor_ac,
                                     sum(a.vlor_dbe) as vlor_ad,
                                     a.cdgo_mvmnto_tpo
                                from gf_g_movimientos_detalle a
                               where cdgo_mvmnto_orgn = 'AJ'
                                 and a.id_orgen = c_ajste.id_ajste
                                    -- and a.vlor_hber           > 0
                                 and a.cdgo_mvmnto_tpo in ('AC', 'AD', 'IT') -- 'Codigo del tipo de movimiento, Ejemplo: IN:Ingreso, AD:Ajuste Debito, AC:Ajuste Credito, PC:Pago Capital, PI:Pago Interes, DC:Descuento Capital, DI:Decescuento Interes, IT:Interes'
                               group by a.id_orgen,
                                        a.vgncia,
                                        a.id_cncpto_csdo,
                                        a.cdgo_mvmnto_tpo) a
                        join df_i_conceptos b
                          on a.id_cncpto_csdo = b.id_cncpto
                       group by decode(a.vgncia,
                                       c_ajste.ano,
                                       'VIGENCIA_ACTUAL',
                                       'VIGENCIA_ANTERIOR') || '_' ||
                                decode(a.cdgo_mvmnto_tpo,
                                       'AC',
                                       'CAPITAL',
                                       'AD',
                                       'CAPITAL',
                                       'IT',
                                       'INTERES'),
                                b.cdgo_cncpto,
                                a.id_cncpto_csdo,
                                b.dscrpcion,
                                b.id_cncpto,
                                decode(a.vgncia, c_ajste.ano, 'S', 'N'),
                                a.vgncia) loop

      -- Si es ICA, la vigencia actual es la vigencia del proceso - 1
      if (c_ajste.id_impsto = p_cdgo_clnte || 2) then
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
           c_ajste.id_ajste, --id_orgen,
           c_ajste.idntfccion_sjto, --idntfccion,
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
           decode(c_cncptos.vlor_ac,
                  0,
                  c_cncptos.vlor_ad,
                  c_cncptos.vlor_ac), --vlor_cncpto,
           c_cncptos.tpo_trnsccion, --tpo_trnsccion,
           c_ajste.numro_ajste, --nmro_dcmnto,
           c_ajste.fcha_aplccion, --fcha_rcdo,
           c_ajste.cdgo_tpo_ajste, --tpo_ajste,
           c_ajste.id_ajste_mtvo, --mtvo_ajste,
           c_ajste.dscrpcion_motivo, --dscrpcion_motivo obsrvcion_ajste,
           sysdate, --to_date('05/05/2022', 'dd/mm/yyyy'), --fcha_rgstro,
           'N', --indcdor_prcso,
           c_ajste.cdgo_impsto, --cdgo_impsto,
           c_ajste.ano, --ano,
           c_ajste.mes, --mes
           c_ajste.cdgo_clnte,
           v_clsfccion);

        --Acumula los valores por acada ajuste dependiendo de su naturaleza por Conceptos

        s_vlor_ac := s_vlor_ac + c_cncptos.vlor_ac;
        s_vlor_ad := s_vlor_ad + c_cncptos.vlor_ad;

      exception
        when others then
          o_cdgo_rspsta := 1;
          rollback;
          v_error := 'Tipo: AJ' || ' Id_Ajste: ' || c_ajste.id_ajste ||
                     ' - Ajuste Concepto causado- : ' ||
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
      --Verifica si el Ajuste esta Cuadrado
      if (s_vlor_ac = c_ajste.vlor) then
        --Indicador de Interfaz
        update gf_g_ajustes
           set indcdor_intrfaz = 'S'
         where id_ajste = c_ajste.id_ajste;
        --Salva los Cambios
        commit;
      elsif (s_vlor_ad = c_ajste.vlor) then
        --Indicador de Interfaz
        update gf_g_ajustes
           set indcdor_intrfaz = 'S'
         where id_ajste = c_ajste.id_ajste;
        --Salva los Cambios
        commit;
      else
        rollback;
        v_error := 'Tipo: AJ' || ' Id_Ajste: ' || c_ajste.id_ajste ||
                   ' - Ajuste Descuadrado';
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
    v_error := 'prc_rg_ajuste_intrfaz. Error: ' || sqlerrm;
    insert into genesys_interfaz.sg_g_log
      (col1, col2)
    values
      (systimestamp, v_error);
    commit;
end prc_rg_ajuste_intrfaz;
/

