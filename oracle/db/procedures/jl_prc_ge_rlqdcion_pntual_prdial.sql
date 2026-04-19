
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_PRC_GE_RLQDCION_PNTUAL_PRDIAL" (p_id_usrio             in number default 230017,
                                                             p_cdgo_clnte           in number default 23001,
                                                             p_id_impsto            in number default 230011,
                                                             p_id_impsto_sbmpsto    in number default 2300111,
                                                             p_id_prdio_uso_slo     in number default 1,
                                                             p_id_lqdcion_tpo       in number default 46,
                                                             p_vgncia               in number,
                                                             p_rfrncia_ctstral_nva  in varchar2,
                                                             p_avluo_ctstral        in number,
                                                             p_area_trrno           in number,
                                                             p_area_cnstrda         in number,
                                                             p_cdgo_prdio_clsfccion in varchar2, -- 01  RURAL, 02 URBANO, 03  CORREGIMIENTO
                                                             p_id_prdio_dstno       in number, -- tabla DF_I_PREDIOS_DESTINO
                                                             p_dstno_ecnmco         in varchar2, --Letra destino IGAC DF_S_DESTINOS_IGAC
                                                             p_cdgo_estrto          in varchar2,
                                                             p_obsrvcion            in varchar2,
                                                             p_nmro_dcmto_sprte     in varchar2,
                                                             p_fcha_dcmnto_sprte    in date) is
  v_id_prdo          number;
  v_id_sjto_impsto   number;
  v_id_fljo          number;
  o_indcdor_ajste    varchar2(1);
  o_vlor_sldo_fvor   number;
  o_id_lqdcion       number;
  o_cdgo_rspsta      number;
  o_mnsje_rspsta     varchar2(500);
  v_id_instncia_fljo number;
  v_fljo_trea        number;
  v_id_ajste         number;
  v_xml              varchar2(4000);
begin
  -- Obtener periodo
  select d.id_prdo
    into v_id_prdo
    from df_i_periodos d
   where d.cdgo_clnte = p_cdgo_clnte
     and d.id_impsto = p_id_impsto
     and d.id_impsto_sbmpsto = p_id_impsto_sbmpsto
     and d.vgncia = p_vgncia;

  -- Obtener sujeto
  select a.id_sjto_impsto
    into v_id_sjto_impsto
    from v_si_i_sujetos_impuesto a
   where a.cdgo_clnte = p_cdgo_clnte
     and a.id_impsto = p_id_impsto
     and a.idntfccion_sjto = p_rfrncia_ctstral_nva;

  -- Llamar generación de liquidación
  pkg_si_novedades_predio.prc_ge_rlqdcion_pntual_prdial(p_id_usrio             => p_id_usrio,
                                                        p_cdgo_clnte           => p_cdgo_clnte,
                                                        p_id_impsto            => p_id_impsto,
                                                        p_id_impsto_sbmpsto    => p_id_impsto_sbmpsto,
                                                        p_id_prdo              => v_id_prdo,
                                                        p_vgncia               => p_vgncia,
                                                        p_id_sjto_impsto       => v_id_sjto_impsto,
                                                        p_bse                  => p_avluo_ctstral,
                                                        p_area_trrno           => p_area_trrno,
                                                        p_area_cnstrda         => p_area_cnstrda,
                                                        p_cdgo_prdio_clsfccion => p_cdgo_prdio_clsfccion,
                                                        p_cdgo_dstno_igac      => p_dstno_ecnmco,
                                                        p_id_prdio_dstno       => p_id_prdio_dstno,
                                                        p_id_prdio_uso_slo     => p_id_prdio_uso_slo,
                                                        p_cdgo_estrto          => p_cdgo_estrto,
                                                        p_id_lqdcion_tpo       => p_id_lqdcion_tpo,
                                                        p_indicador_crtra      => true,
                                                        o_indcdor_ajste        => o_indcdor_ajste,
                                                        o_vlor_sldo_fvor       => o_vlor_sldo_fvor,
                                                        o_id_lqdcion           => o_id_lqdcion,
                                                        o_cdgo_rspsta          => o_cdgo_rspsta,
                                                        o_mnsje_rspsta         => o_mnsje_rspsta);

  dbms_output.put_line(o_cdgo_rspsta || '+' || o_mnsje_rspsta || '. ' ||
                       o_id_lqdcion);

  if o_cdgo_rspsta = 0 then
    -- Flujo de ajustes automáticos
    begin
      select /*+ RESULT_CACHE */
       id_fljo
        into v_id_fljo
        from wf_d_flujos
       where cdgo_clnte = p_cdgo_clnte
         and cdgo_fljo = 'AJG';

      for c_tpo_ajste in (select a.cdgo_clnte,
                                 a.id_impsto,
                                 a.id_impsto_sbmpsto,
                                 b.orgen,
                                 b.tpo_ajste,
                                 b.id_ajste_mtvo,
                                 decode(b.tpo_ajste,
                                        'CR',
                                        'Credito',
                                        'Debito') as dscrpcion_tpo_ajste,
                                 a.id_lqdcion_mtv_ajst
                            from gi_d_liquidaciones_mtv_ajst a
                            join gf_d_ajuste_motivo b
                              on a.id_ajste_mtvo = b.id_ajste_mtvo
                           where a.id_lqdcion_mtv_ajst in
                                 (select a.id_lqdcion_mtv_ajst
                                    from gi_g_liquidaciones_ajuste a
                                   where a.id_lqdcion in
                                         (select regexp_substr(o_id_lqdcion,
                                                               '[^,]+',
                                                               1,
                                                               level)
                                            from dual
                                          connect by level <=
                                                     regexp_count(o_id_lqdcion,
                                                                  ','))
                                   group by a.id_lqdcion_mtv_ajst)) loop

        -- Registra instancia del flujo
        pkg_pl_workflow_1_0.prc_rg_instancias_flujo(p_id_fljo          => v_id_fljo,
                                                    p_id_usrio         => p_id_usrio,
                                                    p_id_prtcpte       => null,
                                                    p_obsrvcion        => 'Flujo de Ajuste Automatico ' ||
                                                                          p_obsrvcion,
                                                    o_id_instncia_fljo => v_id_instncia_fljo,
                                                    o_id_fljo_trea     => v_fljo_trea,
                                                    o_mnsje            => o_mnsje_rspsta);

        if v_id_instncia_fljo is null then
          o_cdgo_rspsta  := 14;
          o_mnsje_rspsta := o_cdgo_rspsta || '. ' || o_mnsje_rspsta;
          dbms_output.put_line(o_cdgo_rspsta || '+' || o_mnsje_rspsta);
          return;
        end if;

        apex_json.initialize_clob_output;
        apex_json.open_array;

        for c_ajste_dtlle in (select b.vgncia,
                                     b.id_prdo,
                                     a.id_cncpto,
                                     a.vlor_ajste,
                                     a.vlor_sldo_cptal,
                                     a.vlor_intres
                                from gi_g_liquidaciones_ajuste a
                                join gi_g_liquidaciones b
                                  on a.id_lqdcion = b.id_lqdcion
                               where a.id_lqdcion in
                                     (select regexp_substr(o_id_lqdcion,
                                                           '[^,]+',
                                                           1,
                                                           level)
                                        from dual
                                      connect by level <=
                                                 regexp_count(o_id_lqdcion,
                                                              ','))
                                 and a.id_lqdcion_mtv_ajst =
                                     c_tpo_ajste.id_lqdcion_mtv_ajst) loop
          apex_json.open_object;
          apex_json.write('VGNCIA', c_ajste_dtlle.vgncia);
          apex_json.write('ID_PRDO', c_ajste_dtlle.id_prdo);
          apex_json.write('ID_CNCPTO', c_ajste_dtlle.id_cncpto);
          apex_json.write('VLOR_AJSTE', c_ajste_dtlle.vlor_ajste);
          apex_json.write('VLOR_SLDO_CPTAL', c_ajste_dtlle.vlor_sldo_cptal);
          apex_json.write('VLOR_INTRES', c_ajste_dtlle.vlor_intres);
          apex_json.write('AJSTE_DTLLE_TPO', 'C');
          apex_json.close_object;
        end loop;

        apex_json.close_array;

        begin
          pkg_gf_ajustes.prc_rg_ajustes(p_cdgo_clnte              => p_cdgo_clnte,
                                        p_id_impsto               => p_id_impsto,
                                        p_id_impsto_sbmpsto       => p_id_impsto_sbmpsto,
                                        p_id_sjto_impsto          => v_id_sjto_impsto,
                                        p_orgen                   => c_tpo_ajste.orgen,
                                        p_tpo_ajste               => c_tpo_ajste.tpo_ajste,
                                        p_id_ajste_mtvo           => c_tpo_ajste.id_ajste_mtvo,
                                        p_obsrvcion               => 'Ajuste Automatico ' ||
                                                                     c_tpo_ajste.dscrpcion_tpo_ajste || ' ' ||
                                                                     p_obsrvcion,
                                        p_tpo_dcmnto_sprte        => 0,
                                        p_nmro_dcmto_sprte        => p_nmro_dcmto_sprte,
                                        p_fcha_dcmnto_sprte       => p_fcha_dcmnto_sprte,
                                        p_nmro_slctud             => null,
                                        p_id_usrio                => p_id_usrio,
                                        p_id_instncia_fljo        => v_id_instncia_fljo,
                                        p_id_fljo_trea            => v_fljo_trea,
                                        p_id_instncia_fljo_pdre   => null,
                                        p_json                    => apex_json.get_clob_output,
                                        p_adjnto                  => null,
                                        p_nmro_dcmto_sprte_adjnto => null,
                                        p_ind_ajste_prcso         => null,
                                        p_fcha_pryccion_intrs     => null,
                                        p_id_ajste                => v_id_ajste,
                                        o_cdgo_rspsta             => o_cdgo_rspsta,
                                        o_mnsje_rspsta            => o_mnsje_rspsta);

          apex_json.free_output;

          if o_cdgo_rspsta <> 0 then
            o_cdgo_rspsta  := 15;
            o_mnsje_rspsta := o_cdgo_rspsta || '. ' || o_mnsje_rspsta;
            dbms_output.put_line(o_cdgo_rspsta || '+' || o_mnsje_rspsta);
            return;
          end if;

          v_xml := '<ID_AJSTE>' || v_id_ajste || '</ID_AJSTE>' ||
                   '<ID_SJTO_IMPSTO>' || v_id_sjto_impsto ||
                   '</ID_SJTO_IMPSTO>' || '<TPO_AJSTE>' ||
                   c_tpo_ajste.tpo_ajste || '</TPO_AJSTE>' ||
                   '<CDGO_CLNTE>' || p_cdgo_clnte || '</CDGO_CLNTE>' ||
                   '<ID_USRIO>' || p_id_usrio || '</ID_USRIO>';

          pkg_gf_ajustes.prc_ap_ajuste(p_xml          => v_xml,
                                       o_cdgo_rspsta  => o_cdgo_rspsta,
                                       o_mnsje_rspsta => o_mnsje_rspsta);

          if o_cdgo_rspsta <> 0 then
            o_cdgo_rspsta  := 16;
            o_mnsje_rspsta := o_cdgo_rspsta || '. ' || o_mnsje_rspsta;
            dbms_output.put_line(o_cdgo_rspsta || '+' || o_mnsje_rspsta);
            return;
          end if;

          update gi_g_liquidaciones_ajuste a
             set id_ajste         = v_id_ajste,
                 id_instncia_fljo = v_id_instncia_fljo
           where a.id_lqdcion in
                 (select regexp_substr(o_id_lqdcion, '[^,]+', 1, level)
                    from dual
                  connect by level <= regexp_count(o_id_lqdcion, ','));

        exception
          when others then
            o_cdgo_rspsta  := 17;
            o_mnsje_rspsta := 'No fue posible registrar el ajuste automático de resolución.';
            dbms_output.put_line(o_cdgo_rspsta || '+' || o_mnsje_rspsta);
            return;
        end;

        update wf_g_instancias_flujo
           set estdo_instncia = 'FINALIZADA'
         where id_instncia_fljo = v_id_instncia_fljo;

      end loop;
    end;

    pkg_gf_movimientos_financiero.prc_ac_concepto_consolidado(p_cdgo_clnte            => p_cdgo_clnte,
                                                              p_id_sjto_impsto        => v_id_sjto_impsto,
                                                              p_ind_brrdo_sjto_impsto => 'S');
    commit;
  else
    rollback;
  end if;
end jl_prc_ge_rlqdcion_pntual_prdial;
/

