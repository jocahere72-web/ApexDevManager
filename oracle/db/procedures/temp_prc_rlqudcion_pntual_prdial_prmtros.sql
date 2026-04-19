
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_PRC_RLQUDCION_PNTUAL_PRDIAL_PRMTROS" (P_vgncia               in number,
                                                                     P_rfrncia_ctstral_nva  in varchar2,
                                                                     P_avluo_ctstral        in number,
                                                                     P_area_trrno           in number,
                                                                     P_area_cnstrda         in number,
                                                                     P_cdgo_prdio_clsfccion in VARCHAR2,
                                                                     P_id_prdio_dstno       in number,
                                                                     P_dstno_ecnmco         in varchar2,
                                                                     P_cdgo_estrto          in varchar2,
                                                                     P_obsrvcion            in varchar2,
                                                                     P_nmro_dcmto_sprte     in varchar2,
                                                                     P_fcha_dcmnto_sprte    in date,
                                                                     p_cdgo_rspsta          out number,
                                                                     p_mnsje_rspsta         out varchar2) is

  v_id_usrio number := 237467; --usuario de cesar

  v_cdgo_clnte        number := 70001;
  v_id_impsto         number := 700011;
  v_id_impsto_sbmpsto number := 7000111;
  v_id_prdio_uso_slo  number := 1;
  v_id_lqdcion_tpo    number := 18;

  v_id_prdo        number;
  v_id_sjto_impsto number;
  v_id_fljo        number;

  o_indcdor_ajste    varchar2(1);
  o_vlor_sldo_fvor   number;
  o_id_lqdcion       number;
  o_cdgo_rspsta      number;
  o_mnsje_rspsta     varchar2(500);
  v_id_instncia_fljo number;
  v_fljo_trea        number;

  -- datos a enviar
  v_vgncia               number;
  v_rfrncia_ctstral_nva  varchar2(25);
  v_avluo_ctstral        number;
  v_area_trrno           number;
  v_area_cnstrda         number; --
  v_cdgo_prdio_clsfccion VARCHAR2(2);
  v_id_prdio_dstno       number;
  v_dstno_ecnmco         varchar2(3);
  v_cdgo_estrto          varchar2(2);
  v_obsrvcion            varchar2(200);
  v_nmro_dcmto_sprte     varchar2(200);
  v_fcha_dcmnto_sprte    date;

  v_nmbre_up varchar2(100) := 'TEMP_PRC_RLQUDCION_PNTUAL_PRDIAL_PRMTROS';
  v_nivel    number(15);

begin

  --Determinamos el Nivel del Log de la UP
  v_nivel := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte => v_cdgo_clnte,
                                         p_id_impsto  => null,
                                         p_nmbre_up   => v_nmbre_up);

  pkg_sg_log.prc_rg_log(p_cdgo_clnte => v_cdgo_clnte,
                        p_id_impsto  => null,
                        p_nmbre_up   => v_nmbre_up,
                        p_nvel_log   => v_nivel,
                        p_txto_log   => 'Inicio del procedimiento ' ||
                                        v_nmbre_up,
                        p_nvel_txto  => 1);

  v_vgncia := p_vgncia;

  v_rfrncia_ctstral_nva  := p_rfrncia_ctstral_nva;
  v_avluo_ctstral        := p_avluo_ctstral;
  v_area_trrno           := P_area_trrno;
  v_area_cnstrda         := P_area_cnstrda;
  v_cdgo_prdio_clsfccion := P_cdgo_prdio_clsfccion;
  v_id_prdio_dstno       := P_id_prdio_dstno;
  v_dstno_ecnmco         := P_dstno_ecnmco;
  v_cdgo_estrto          := nvl(P_cdgo_estrto, 99);
  v_obsrvcion            := P_obsrvcion;
  v_nmro_dcmto_sprte     := P_nmro_dcmto_sprte;
  v_fcha_dcmnto_sprte    := P_fcha_dcmnto_sprte;

  select d.id_prdo
    into v_id_prdo
    from df_i_periodos d
   where d.cdgo_clnte = v_cdgo_clnte
     and d.id_impsto = v_id_impsto
     and d.id_impsto_sbmpsto = v_id_impsto_sbmpsto
     and d.vgncia = v_vgncia;

  select a.id_sjto_impsto
    into v_id_sjto_impsto
    from v_si_i_sujetos_impuesto a
   where a.cdgo_clnte = v_cdgo_clnte
     and a.id_impsto = v_id_impsto
     and a.idntfccion_sjto = v_rfrncia_ctstral_nva;

  pkg_si_novedades_predio.prc_ge_rlqdcion_pntual_prdial(p_id_usrio             => v_id_usrio,
                                                        p_cdgo_clnte           => v_cdgo_clnte,
                                                        p_id_impsto            => v_id_impsto,
                                                        p_id_impsto_sbmpsto    => v_id_impsto_sbmpsto,
                                                        p_id_prdo              => v_id_prdo,
                                                        p_vgncia               => v_vgncia,
                                                        p_id_sjto_impsto       => v_id_sjto_impsto,
                                                        p_bse                  => v_avluo_ctstral,
                                                        p_area_trrno           => v_area_trrno,
                                                        p_area_cnstrda         => v_area_cnstrda,
                                                        p_cdgo_prdio_clsfccion => v_cdgo_prdio_clsfccion,
                                                        p_cdgo_dstno_igac      => v_dstno_ecnmco,
                                                        p_id_prdio_dstno       => v_id_prdio_dstno,
                                                        p_id_prdio_uso_slo     => v_id_prdio_uso_slo,
                                                        p_cdgo_estrto          => v_cdgo_estrto,
                                                        p_id_lqdcion_tpo       => v_id_lqdcion_tpo,
                                                        p_indicador_crtra      => true,
                                                        o_indcdor_ajste        => o_indcdor_ajste,
                                                        o_vlor_sldo_fvor       => o_vlor_sldo_fvor,
                                                        o_id_lqdcion           => o_id_lqdcion,
                                                        o_cdgo_rspsta          => o_cdgo_rspsta,
                                                        o_mnsje_rspsta         => o_mnsje_rspsta);

  --dbms_output.put_line(o_cdgo_rspsta || '+' || o_mnsje_rspsta);

  if o_cdgo_rspsta = 0 then

    declare
      v_id_instncia_fljo wf_g_instancias_flujo.id_instncia_fljo%type;
      v_fljo_trea        v_wf_d_flujos_transicion.id_fljo_trea%type;
      v_id_ajste         gf_g_ajustes.id_ajste%type;
      v_xml              varchar2(4000);
    begin

      select /*+ RESULT_CACHE */
       id_fljo
        into v_id_fljo
        from wf_d_flujos
       where cdgo_clnte = v_cdgo_clnte
         and cdgo_fljo = 'AJG';

      --Cursor de Tipos de Ajustes
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
                                 (select /*+ RESULT_CACHE */
                                   a.id_lqdcion_mtv_ajst
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

        --Registra la Instancia del Flujo
        pkg_pl_workflow_1_0.prc_rg_instancias_flujo(p_id_fljo          => v_id_fljo,
                                                    p_id_usrio         => v_id_usrio,
                                                    p_id_prtcpte       => null,
                                                    p_obsrvcion        => 'Flujo de Ajuste Automatico ' ||
                                                                          v_obsrvcion,
                                                    o_id_instncia_fljo => v_id_instncia_fljo,
                                                    o_id_fljo_trea     => v_fljo_trea,
                                                    o_mnsje            => o_mnsje_rspsta);

        --Verifica si Creo la Instancia Flujo
        if (v_id_instncia_fljo is null) then
          o_cdgo_rspsta  := 14;
          o_mnsje_rspsta := o_cdgo_rspsta || '. ' || o_mnsje_rspsta;
          dbms_output.put_line(o_cdgo_rspsta || '+' || o_mnsje_rspsta);
          return;
        end if;

        --Json de Ajuste Detalle
        apex_json.initialize_clob_output;
        apex_json.open_array;

        --Cursor de Vigencia del Ajuste
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
                                     (select /*+ RESULT_CACHE */
                                       a.id_lqdcion
                                        from gi_g_liquidaciones_ajuste a
                                       where a.id_lqdcion in
                                             (select regexp_substr(o_id_lqdcion,
                                                                   '[^,]+',
                                                                   1,
                                                                   level)
                                                from dual
                                              connect by level <=
                                                         regexp_count(o_id_lqdcion,
                                                                      ',')))
                                 and a.id_lqdcion_mtv_ajst =
                                     c_tpo_ajste.id_lqdcion_mtv_ajst) loop
          --Json
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

        --Cierra el Array del Json
        apex_json.close_array;

        --Registra el Ajuste Automatico
        begin
          pkg_gf_ajustes.prc_rg_ajustes(p_cdgo_clnte              => v_cdgo_clnte,
                                        p_id_impsto               => v_id_impsto,
                                        p_id_impsto_sbmpsto       => v_id_impsto_sbmpsto,
                                        p_id_sjto_impsto          => v_id_sjto_impsto,
                                        p_orgen                   => c_tpo_ajste.orgen,
                                        p_tpo_ajste               => c_tpo_ajste.tpo_ajste,
                                        p_id_ajste_mtvo           => c_tpo_ajste.id_ajste_mtvo,
                                        p_obsrvcion               => 'Ajuste Automatico ' ||
                                                                     c_tpo_ajste.dscrpcion_tpo_ajste || ' ' ||
                                                                     v_obsrvcion,
                                        p_tpo_dcmnto_sprte        => 0,
                                        p_nmro_dcmto_sprte        => v_nmro_dcmto_sprte,
                                        p_fcha_dcmnto_sprte       => v_fcha_dcmnto_sprte,
                                        p_nmro_slctud             => null,
                                        p_id_usrio                => v_id_usrio,
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

          --Limpia el Json
          apex_json.free_output;

          --Verifica si Hubo Error
          if (o_cdgo_rspsta <> 0) then
            o_cdgo_rspsta  := 15;
            o_mnsje_rspsta := o_cdgo_rspsta || '. ' || o_mnsje_rspsta || '.';
            dbms_output.put_line(o_cdgo_rspsta || '+' || o_mnsje_rspsta);
            return;
          end if;

          --Xml de Ajuste
          v_xml := '<ID_AJSTE>' || v_id_ajste || '</ID_AJSTE>' ||
                   '<ID_SJTO_IMPSTO>' || v_id_sjto_impsto ||
                   '</ID_SJTO_IMPSTO>' || '<TPO_AJSTE>' ||
                   c_tpo_ajste.tpo_ajste || '</TPO_AJSTE>' ||
                   '<CDGO_CLNTE>' || v_cdgo_clnte || '</CDGO_CLNTE>' ||
                   '<ID_USRIO>' || v_id_usrio || '</ID_USRIO>';

          --Up Para Aplicar Ajuste
          pkg_gf_ajustes.prc_ap_ajuste(p_xml          => v_xml,
                                       o_cdgo_rspsta  => o_cdgo_rspsta,
                                       o_mnsje_rspsta => o_mnsje_rspsta);

          --Verifica si Hubo Error
          if (o_cdgo_rspsta <> 0) then
            o_cdgo_rspsta  := 16;
            o_mnsje_rspsta := o_cdgo_rspsta || '. ' || o_mnsje_rspsta || '.';
            dbms_output.put_line(o_cdgo_rspsta || '+' || o_mnsje_rspsta);
            return;
          end if;

          --Actualiza la Instancia Flujo y Ajuste a Liquidacion Ajuste
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
            o_mnsje_rspsta := 'No fue posible registrar el ajuste automatico de resolucion.';
            dbms_output.put_line(o_cdgo_rspsta || '+' || o_mnsje_rspsta);
            return;
        end;

        --Finaliza la Instancia Flujo del Ajuste Generado
        update wf_g_instancias_flujo
           set estdo_instncia = 'FINALIZADA'
         where id_instncia_fljo = v_id_instncia_fljo;

      end loop;
    end;

    pkg_gf_movimientos_financiero.prc_ac_concepto_consolidado(p_cdgo_clnte            => v_cdgo_clnte,
                                                              p_id_sjto_impsto        => v_id_sjto_impsto,
                                                              p_ind_brrdo_sjto_impsto => 'S');
    commit;
  else
    rollback;
    pkg_sg_log.prc_rg_log(p_cdgo_clnte => v_cdgo_clnte,
                          p_id_impsto  => null,
                          p_nmbre_up   => v_nmbre_up,
                          p_nvel_log   => v_nivel,
                          p_txto_log   => o_mnsje_rspsta,
                          p_nvel_txto  => 3);

  end if;
  p_cdgo_rspsta  := o_cdgo_rspsta;
  p_mnsje_rspsta := o_mnsje_rspsta;

end TEMP_PRC_RLQUDCION_PNTUAL_PRDIAL_PRMTROS;
/

