
  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PKG_GI_DECLARACIONES_UTLDDES" as

  /*
  * @Descripci?n  : Generar Liquidaci?n Puntual (Declaraci?n)
  * @Creaci?n     : 27/11/2019
  * @Modificaci?n : 27/11/2019
  * @Modificación : 07/11/2024
  */

  procedure prc_ge_lqdcion_pntual_dclrcion(p_cdgo_clnte   in df_s_clientes.cdgo_clnte%type,
                                           p_id_usrio     in sg_g_usuarios.id_usrio%type,
                                           p_id_dclrcion  in gi_g_declaraciones.id_dclrcion%type,
                                           o_id_lqdcion   out gi_g_liquidaciones.id_lqdcion%type,
                                           o_cdgo_rspsta  out number,
                                           o_mnsje_rspsta out varchar2) as
    v_nvel                     number;
    v_nmbre_up                 sg_d_configuraciones_log.nmbre_up%type := 'pkg_gi_declaraciones_utlddes.prc_ge_lqdcion_pntual_dclrcion';
    v_gi_g_declaraciones       gi_g_declaraciones%rowtype;
    v_cdgo_prdcdad             df_i_periodos.cdgo_prdcdad%type;
    v_id_lqdcion_antrior       gi_g_liquidaciones.id_lqdcion_antrior%type;
    v_id_lqdcion_tpo           df_i_liquidaciones_tipo.id_lqdcion_tpo%type;
    v_fcha_vncmnto             date;
    v_indcdor_dlneacion        varchar2(2) := 'N';
    v_fcha_vncmiento_dlneacion varchar2(100);
    v_indcdor_dclrcion_fnal    varchar2(1);
    v_id_dclrcion_crrcion      varchar2(100);
    v_id_lqdcion_ant           number;

    type t_cncptos is record(
      id_cncpto             df_i_conceptos.id_cncpto%type,
      id_impsto_acto_cncpto df_i_impuestos_acto_concepto.id_impsto_acto_cncpto%type,
      dscrpcion_cncpto      v_df_i_impuestos_acto_concepto.dscrpcion_cncpto%type);

    type r_cncptos is table of t_cncptos;
    v_cncptos r_cncptos;
  begin

    --Respuesta Exitosa
    o_cdgo_rspsta := 0;

    --Determinamos el Nivel del Log de la UP
    v_nvel := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte => p_cdgo_clnte,
                                          p_id_impsto  => null,
                                          p_nmbre_up   => v_nmbre_up);

    o_mnsje_rspsta := 'Inicio del procedimiento ' || v_nmbre_up;
    pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                          p_id_impsto  => null,
                          p_nmbre_up   => v_nmbre_up,
                          p_nvel_log   => v_nvel,
                          p_txto_log   => o_mnsje_rspsta,
                          p_nvel_txto  => 1);

    --Verifica si la Declaracion Existe
    begin
      select /*+ RESULT_CACHE */
       a.*
        into v_gi_g_declaraciones
        from gi_g_declaraciones a
       where a.id_dclrcion = p_id_dclrcion;
    exception
      when no_data_found then
        o_cdgo_rspsta  := 1;
        o_mnsje_rspsta := o_cdgo_rspsta || '. La declaración #[' ||
                          p_id_dclrcion || '], no existe en el sistema.';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        return;
    end;
    begin
      select a.indcdor_dclrcion_fnal
        into v_indcdor_dclrcion_fnal
        from gi_d_declaraciones_tipo a
        join gi_d_dclrcnes_tpos_vgncias b
          on a.id_dclrcn_tpo = b.id_dclrcn_tpo
        join gi_d_dclrcnes_vgncias_frmlr c
          on b.id_dclrcion_tpo_vgncia = c.id_dclrcion_tpo_vgncia
       where c.id_dclrcion_vgncia_frmlrio =
             v_gi_g_declaraciones.id_dclrcion_vgncia_frmlrio; -- 13507
    exception
      /*when no_data_found then
      o_cdgo_rspsta  := 1;
      o_mnsje_rspsta := o_cdgo_rspsta || '';
      pkg_sg_log.prc_rg_log( p_cdgo_clnte => p_cdgo_clnte , p_id_impsto => null , p_nmbre_up => v_nmbre_up
             , p_nvel_log => v_nvel , p_txto_log => o_mnsje_rspsta , p_nvel_txto => 3 );
      return;*/
      when others then
        o_cdgo_rspsta  := 15;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '. Erro al consultar el indicador Declaración Final.';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        return;
    end;

    --Verifica si la Declaración no se Encuentra Liquidada
    if (v_gi_g_declaraciones.id_lqdcion is not null) then
      o_cdgo_rspsta  := 2;
      o_mnsje_rspsta := o_cdgo_rspsta || '. La declaración #' ||
                        v_gi_g_declaraciones.nmro_cnsctvo ||
                        ', ya se encuentra liquidada.';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => o_mnsje_rspsta,
                            p_nvel_txto  => 3);
      return;
    end if;

    --Busca el Código de Periodicidad del Período
    begin
      select cdgo_prdcdad
        into v_cdgo_prdcdad
        from df_i_periodos
       where id_prdo = v_gi_g_declaraciones.id_prdo;
    exception
      when no_data_found then
        o_cdgo_rspsta  := 3;
        o_mnsje_rspsta := o_cdgo_rspsta || '. El período #[' ||
                          v_gi_g_declaraciones.id_prdo ||
                          '], no existe en el sistema.';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        return;
    end;

    --Busca el Tipo de Liquidación
    begin
      select id_lqdcion_tpo
        into v_id_lqdcion_tpo
        from df_i_liquidaciones_tipo
       where cdgo_clnte = p_cdgo_clnte
         and id_impsto = v_gi_g_declaraciones.id_impsto
         and cdgo_lqdcion_tpo = 'DLC';
    exception
      when no_data_found then
        o_cdgo_rspsta  := 4;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '. El tipo de liquidación [DLC], no existe en el sistema.';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        return;
    end;

    pkg_gi_declaraciones.prc_co_homologacion(p_cdgo_clnte    => p_cdgo_clnte,
                                             p_cdgo_hmlgcion => 'PRD',
                                             p_cdgo_prpdad   => 'NMC',
                                             p_id_dclrcion   => p_id_dclrcion,
                                             o_vlor          => v_id_dclrcion_crrcion,
                                             o_cdgo_rspsta   => o_cdgo_rspsta,
                                             o_mnsje_rspsta  => o_mnsje_rspsta);

    if (o_cdgo_rspsta <> 0) then
      rollback;
      o_cdgo_rspsta  := 14;
      o_mnsje_rspsta := '<details>' ||
                        '<summary>No se pudo consultar el número consecutivo de la declaración, validar la homologación de objetos el codigo NMC' ||
                        ' por favor intente nuevamente.' || o_mnsje_rspsta ||
                        '</summary>' || '<p>' ||
                        'Para mas informacion consultar el codigo -' ||
                        o_cdgo_rspsta || '.</p>' || '</details>';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nvel,
                            o_mnsje_rspsta,
                            2);
      /* pkg_sg_log.prc_rg_log(p_cdgo_clnte,
      null,
      v_prcdmnto,
      v_nl,
      sqlerrm,
      2);*/
      return;
    end if;

    begin
      select a.id_lqdcion
        into v_id_lqdcion_ant
        from gi_g_declaraciones a
       where a.id_dclrcion = to_number(v_id_dclrcion_crrcion);
    exception
      when no_data_found then
        null;
      when others then
        o_cdgo_rspsta  := 5;
        o_mnsje_rspsta := o_cdgo_rspsta || '. Para la declaración #' ||
                          v_gi_g_declaraciones.nmro_cnsctvo ||
                          ', no fue posible encontrar la última liquidación ya que existe mas de un registro con estado [L].';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => (o_mnsje_rspsta || ' Error: ' ||
                                              sqlerrm),
                              p_nvel_txto  => 3);
        return;
    end;
    --Busca si Existe Liquidación Actual
    begin
      select id_lqdcion
        into v_id_lqdcion_antrior
        from gi_g_liquidaciones
       where cdgo_clnte = p_cdgo_clnte
         and id_impsto = v_gi_g_declaraciones.id_impsto
         and id_impsto_sbmpsto = v_gi_g_declaraciones.id_impsto_sbmpsto
         and id_prdo = v_gi_g_declaraciones.id_prdo
         and id_sjto_impsto = v_gi_g_declaraciones.id_sjto_impsto
         and cdgo_lqdcion_estdo = 'L'
         and id_lqdcion_tpo = v_id_lqdcion_tpo
         and id_lqdcion = v_id_lqdcion_ant
      --and v_indcdor_dclrcion_fnal = 'S'
      ;
    exception
      when no_data_found then
        null;
      when too_many_rows then
        o_cdgo_rspsta  := 5;
        o_mnsje_rspsta := o_cdgo_rspsta || '. Para la declaración #' ||
                          v_gi_g_declaraciones.nmro_cnsctvo ||
                          ', no fue posible encontrar la última liquidación ya que existe mas de un registro con estado [L].';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => (o_mnsje_rspsta || ' Error: ' ||
                                              sqlerrm),
                              p_nvel_txto  => 3);
        return;
    end;

    --Inserta el Registro de Liquidación
    begin
      insert into gi_g_liquidaciones
        (cdgo_clnte,
         id_impsto,
         id_impsto_sbmpsto,
         vgncia,
         id_prdo,
         id_sjto_impsto,
         fcha_lqdcion,
         cdgo_lqdcion_estdo,
         bse_grvble,
         vlor_ttal,
         id_lqdcion_tpo,
         cdgo_prdcdad,
         id_lqdcion_antrior,
         id_usrio)
      values
        (p_cdgo_clnte,
         v_gi_g_declaraciones.id_impsto,
         v_gi_g_declaraciones.id_impsto_sbmpsto,
         v_gi_g_declaraciones.vgncia,
         v_gi_g_declaraciones.id_prdo,
         v_gi_g_declaraciones.id_sjto_impsto,
         systimestamp,
         'L',
         0,
         0,
         v_id_lqdcion_tpo,
         v_cdgo_prdcdad,
         v_id_lqdcion_antrior,
         p_id_usrio)
      returning id_lqdcion into o_id_lqdcion;
    exception
      when others then
        o_cdgo_rspsta  := 6;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '. No fue posible crear el registro de liquidación.';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => (o_mnsje_rspsta || ' Error: ' ||
                                              sqlerrm),
                              p_nvel_txto  => 3);
        return;
    end;

    --Busca los Conceptos de la Liquidación
    select i.id_cncpto, i.id_impsto_acto_cncpto, i.dscrpcion_cncpto --
      bulk collect
      into v_cncptos
      from v_df_i_impuestos_acto_concepto i
     where i.id_impsto_acto =
           (select c.id_impsto_acto
              from gi_d_dclrcnes_vgncias_frmlr a
              join gi_d_dclrcnes_tpos_vgncias b
                on a.id_dclrcion_tpo_vgncia = b.id_dclrcion_tpo_vgncia
              join gi_d_declaraciones_tipo c
                on b.id_dclrcn_tpo = c.id_dclrcn_tpo
             where a.id_dclrcion_vgncia_frmlrio =
                   v_gi_g_declaraciones.id_dclrcion_vgncia_frmlrio)
       and i.vgncia = v_gi_g_declaraciones.vgncia
       and i.id_prdo = v_gi_g_declaraciones.id_prdo
       and i.actvo = 'S'
     order by i.orden;

    --Verifica si Existen Conceptos por Liquidar
    if (v_cncptos.count = 0) then
      o_cdgo_rspsta  := 7;
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        '. No se encuentra parametrizado los actos conceptos en el sistema.';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => o_mnsje_rspsta,
                            p_nvel_txto  => 3);
      return;
    end if;

    declare
      v_idntfccion si_c_sujetos.idntfccion%type;
      v_vlor       clob;
    begin

      --Busca la Identificación del Sujeto Impuesto
      select a.idntfccion
        into v_idntfccion
        from si_c_sujetos a
       where a.id_sjto =
             (select b.id_sjto
                from si_i_sujetos_impuesto b
               where b.id_sjto_impsto = v_gi_g_declaraciones.id_sjto_impsto);

      --Busca la Homologación del Tipo de Sujeto
      pkg_gi_declaraciones.prc_co_homologacion(p_cdgo_clnte    => p_cdgo_clnte,
                                               p_cdgo_hmlgcion => 'PRD',
                                               p_cdgo_prpdad   => 'TST',
                                               p_id_dclrcion   => v_gi_g_declaraciones.id_dclrcion,
                                               o_vlor          => v_vlor,
                                               o_cdgo_rspsta   => o_cdgo_rspsta,
                                               o_mnsje_rspsta  => o_mnsje_rspsta);

      --Verifica si Hubo Error
      if (o_cdgo_rspsta <> 0) then
        o_cdgo_rspsta  := 8;
        o_mnsje_rspsta := o_cdgo_rspsta || '. Para la declaración #[' ||
                          v_gi_g_declaraciones.id_dclrcion ||
                          '], no fue posible encontrar la homologación del tipo de sujeto.';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        return;
      end if;

      --Busca la Fecha de Vencimiento de la Declaración
      begin
        select a.indcdor_dlneacion
          into v_indcdor_dlneacion
          from gi_d_dclrcnes_vgncias_frmlr a
         where a.id_dclrcion_vgncia_frmlrio =
               v_gi_g_declaraciones.id_dclrcion_vgncia_frmlrio;
      exception
        when too_many_rows then
          o_cdgo_rspsta  := 14;
          o_mnsje_rspsta := o_cdgo_rspsta ||
                            '. Error al consultar el indicado de delineación Urbana, existe más de un registro asociado a la vigencia. Validar la parametrica de Formularios por periodo';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 3);
          return;
        when no_data_found then
          o_cdgo_rspsta  := 15;
          o_mnsje_rspsta := o_cdgo_rspsta ||
                            '. Error al consultar el indicado de delineación Urbana, no existe registro asociado a la vigencia.  Validar la parametrica de Formularios por periodo';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 3);
          --return;
        when others then
          o_cdgo_rspsta  := 16;
          o_mnsje_rspsta := o_cdgo_rspsta ||
                            '.222 Error al consultar el indicado de delineación Urbana.';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 3);
          return;
      end;
      o_mnsje_rspsta := o_cdgo_rspsta || 'v_indcdor_dlneacion => ' ||
                        v_indcdor_dlneacion;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => o_mnsje_rspsta,
                            p_nvel_txto  => 3);

      if (v_indcdor_dlneacion = 'N') then
        v_fcha_vncmnto := pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => v_gi_g_declaraciones.id_dclrcion_vgncia_frmlrio,
                                                                         p_idntfccion                 => v_idntfccion,
                                                                         p_id_sjto_tpo                => to_char(v_vlor));

        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => 'v_fcha_vncmnto => ' ||
                                              v_fcha_vncmnto,
                              p_nvel_txto  => 3);
        -- DBMS_OUTPUT.PUT_LINE('v_fcha_fnal: '||v_fcha_fnal) ;

      else
        --v_fcha_fnal :=  to_timestamp(p_fcha_expdcion, 'dd/mm/yyyy') ;
        --Busca la Homologación del Tipo de Sujeto
        pkg_gi_declaraciones.prc_co_homologacion(p_cdgo_clnte    => p_cdgo_clnte,
                                                 p_cdgo_hmlgcion => 'PRD',
                                                 p_cdgo_prpdad   => 'FEX',
                                                 p_id_dclrcion   => v_gi_g_declaraciones.id_dclrcion,
                                                 o_vlor          => v_fcha_vncmiento_dlneacion,
                                                 o_cdgo_rspsta   => o_cdgo_rspsta,
                                                 o_mnsje_rspsta  => o_mnsje_rspsta);

        v_fcha_vncmnto := pkg_gi_declaraciones_funciones.fnc_ca_fecha_limite(p_cdgo_clnte                 => p_cdgo_clnte,
                                                                             p_id_dclrcion_vgncia_frmlrio => v_gi_g_declaraciones.id_dclrcion_vgncia_frmlrio,
                                                                             p_fcha_expdcion              => v_fcha_vncmiento_dlneacion);
        --v_fcha_vncmnto := v_fcha_vncmiento_dlneacion;
        o_mnsje_rspsta := 'v_fcha_vncmiento_dlneacion' ||
                          v_fcha_vncmiento_dlneacion;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
      end if;

      --Verifica si la Fecha de Vencimiento no es Nula
      if (v_fcha_vncmnto is null) then
        o_cdgo_rspsta  := 9;
        o_mnsje_rspsta := o_cdgo_rspsta || '. Para la identificación #' ||
                          v_idntfccion ||
                          ', no fue posible encontrar la fecha de vencimiento. ' ||
                          v_vlor || '-formulario- ' ||
                          v_gi_g_declaraciones.id_dclrcion_vgncia_frmlrio;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        return;
      end if;
    end;

    --Recorre la Colección de Conceptos
    for i in 1 .. v_cncptos.count loop
      declare
        v_vlor_clcldo gi_g_liquidaciones_concepto.vlor_clcldo%type;
        v_vlor_lqddo  gi_g_liquidaciones_concepto.vlor_lqddo%type;
        v_trfa        number;
      begin
        --Verifica si Existe el Concepto en Declaración
        begin
          select a.bse, nvl(a.bse, 0), a.trfa
            into v_vlor_clcldo, v_vlor_lqddo, v_trfa
            from table(pkg_gi_declaraciones_utlddes.fnc_co_lqdcion_acto_cncpto(p_id_dclrcion => p_id_dclrcion)) a
           where a.id_impsto_acto_cncpto = v_cncptos(i).id_impsto_acto_cncpto;
        exception
          when others then
            o_cdgo_rspsta  := 10;
            o_mnsje_rspsta := o_cdgo_rspsta ||
                              '. Error al intentar consultar la homologación de conceptos en impuestos acto. ' || v_cncptos(i).dscrpcion_cncpto; -- p_id_dclrcion;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => (o_mnsje_rspsta ||
                                                  ' Error: ' || sqlerrm),
                                  p_nvel_txto  => 3);
            return;
        end;

        --Inserta el Registro de Liquidación Concepto
        begin
          insert into gi_g_liquidaciones_concepto
            (id_lqdcion,
             id_impsto_acto_cncpto,
             vlor_lqddo,
             vlor_clcldo,
             trfa,
             bse_cncpto,
             txto_trfa,
             vlor_intres,
             indcdor_lmta_impsto,
             fcha_vncmnto)
          values
            (o_id_lqdcion,
             v_cncptos(i).id_impsto_acto_cncpto,
             v_vlor_lqddo,
             v_vlor_clcldo,
             v_trfa,
             v_vlor_lqddo,
             (v_trfa || '/' || g_divisor),
             0,
             'N',
             v_fcha_vncmnto);
        exception
          when others then
            o_cdgo_rspsta  := 11;
            o_mnsje_rspsta := sqlerrm; --o_cdgo_rspsta || '. No fue posible crear el registro de liquidación concepto.';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => (o_mnsje_rspsta ||
                                                  ' Error: ' || sqlerrm),
                                  p_nvel_txto  => 3);
            return;
        end;

        --Actualiza el Valor Total de la Liquidación
        update gi_g_liquidaciones
           set vlor_ttal = nvl(vlor_ttal, 0) + v_vlor_lqddo
         where id_lqdcion = o_id_lqdcion;

      exception
        when no_data_found then
          o_cdgo_rspsta  := 12;
          o_mnsje_rspsta := o_cdgo_rspsta || '. Para la declaración #' ||
                            v_gi_g_declaraciones.nmro_cnsctvo ||
                            ', no se encuentra el acto concepto homologado id#[' || v_cncptos(i).id_impsto_acto_cncpto || '].';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 3);
          return;
        when too_many_rows then
          o_cdgo_rspsta  := 13;
          o_mnsje_rspsta := o_cdgo_rspsta || '. Para la declaración #' ||
                            v_gi_g_declaraciones.nmro_cnsctvo ||
                            ', existe mas de un concepto acto homologado id#[' || v_cncptos(i).id_impsto_acto_cncpto || '].';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => (o_mnsje_rspsta ||
                                                ' Error: ' || sqlerrm),
                                p_nvel_txto  => 3);
          return;
        when others then
          o_cdgo_rspsta  := 13;
          o_mnsje_rspsta := 'Error: ' || sqlerrm; --o_cdgo_rspsta || '. Para la declaración #' || v_gi_g_declaraciones.nmro_cnsctvo || ', existe mas de un concepto acto homologado id#[' || v_cncptos(i).id_impsto_acto_cncpto || '].';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => (o_mnsje_rspsta ||
                                                ' Error: ' || sqlerrm),
                                p_nvel_txto  => 3);
          return;
      end;
    end loop;

    --Inactiva la Liquidación Anterior
    update gi_g_liquidaciones
       set cdgo_lqdcion_estdo = 'I'
     where id_lqdcion = v_id_lqdcion_antrior;

    --Actualiza la Liquidación a Declaración
    update gi_g_declaraciones
       set id_lqdcion = o_id_lqdcion
     where id_dclrcion = p_id_dclrcion;

    o_mnsje_rspsta := 'Fin del procedimiento ' || v_nmbre_up;
    pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                          p_id_impsto  => null,
                          p_nmbre_up   => v_nmbre_up,
                          p_nvel_log   => v_nvel,
                          p_txto_log   => o_mnsje_rspsta,
                          p_nvel_txto  => 1);

    o_mnsje_rspsta := 'Liquidación creada con éxito #' || o_id_lqdcion || '.';

  exception
    when others then
      o_cdgo_rspsta  := 99;
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        '. No fue posible liquidar la declaración #[' ||
                        p_id_dclrcion || '], inténtelo más tarde.';
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => (o_mnsje_rspsta || ' Error: ' ||
                                            sqlerrm),
                            p_nvel_txto  => 3);
  end prc_ge_lqdcion_pntual_dclrcion;

  /*
  * @Descripci?n  : Consulta los Conceptos de la Liquidaci?n de Declaraci?n
  * @Creaci?n     : 27/11/2019
  * @Modificaci?n : 27/11/2019
  */

  function fnc_co_lqdcion_acto_cncpto(p_id_dclrcion in gi_g_declaraciones.id_dclrcion%type)
    return g_acto_cncpto
    pipelined is
  begin
    for c_acto_cncpto in (select b.id_impsto_acto_cncpto,
                                 d.id_cncpto,
                                 e.cdgo_cncpto,
                                 e.dscrpcion,
                                 to_number(regexp_substr(c.vlor,
                                                         '^[0-9]+',
                                                         1,
                                                         1)) as bse,
                                 1000 as trfa
                            from gi_g_declaraciones a
                            join gi_d_dclrcnes_acto_cncpto b
                              on a.id_dclrcion_vgncia_frmlrio =
                                 b.id_dclrcion_vgncia_frmlrio
                            join gi_g_declaraciones_detalle c
                              on a.id_dclrcion = c.id_dclrcion
                             and b.id_frmlrio_rgion_atrbto =
                                 c.id_frmlrio_rgion_atrbto
                             and b.fla = c.fla
                            join df_i_impuestos_acto_concepto d
                              on b.id_impsto_acto_cncpto =
                                 d.id_impsto_acto_cncpto
                            join df_i_conceptos e
                              on d.id_cncpto = e.id_cncpto
                           where a.id_dclrcion = p_id_dclrcion) loop
      pipe row(c_acto_cncpto);
    end loop;
  end fnc_co_lqdcion_acto_cncpto;

  /*
  * @Descripción  : Aplicación de Declaración
  * @Creación     : 27/11/2019
  * @Modificación : 27/11/2019
  * modificación  : 01/08/2024
  * Luis Ariza
  */
  procedure prc_ap_declaracion(p_cdgo_clnte     in df_s_clientes.cdgo_clnte%type,
                               p_id_usrio       in sg_g_usuarios.id_usrio%type,
                               p_id_dclrcion    in gi_g_declaraciones.id_dclrcion%type,
                               o_vlor_sldo_fvor out number --Variable que contiene el saldo a favor generado por la aplicación de una corrección de declaración por menor valor.
                              ,
                               o_cdgo_rspsta    out number,
                               o_mnsje_rspsta   out varchar2) as
    v_nvel                  number;
    v_nmbre_up              sg_d_configuraciones_log.nmbre_up%type := 'pkg_gi_declaraciones_utlddes.prc_ap_declaracion';
    v_gi_g_declaraciones    gi_g_declaraciones%rowtype;
    v_id_lqdcion            gi_g_liquidaciones.id_lqdcion%type;
    v_cdgo_mvmnto_orgn      gf_g_movimientos_financiero.cdgo_mvmnto_orgn%type := 'DL';
    v_vlor_sldo_cptal       number;
    v_vlor_dscnto_sncion    number;
    v_indcdor_dclrcion_fnal varchar2(1);
    v_id_hmlgcion           number;
    v_hmlgcion_prpdad       pkg_gi_declaraciones.t_hmlgcion_prpdad := pkg_gi_declaraciones.t_hmlgcion_prpdad();
    v_prpddes_items         pkg_gi_declaraciones.t_prpddes_items := pkg_gi_declaraciones.t_prpddes_items(); --Nuevo
    v_id_frmlrio            number;

    v_vlor_interes         number := 0;
    v_vlor_interes_aux     number := 0;
    v_id_cncpto_interes    number;
    v_vlor_dscnto_int      number := 0;
    v_id_cncpto_dscnto     number;
    v_indcdor_clcla_intres varchar2(1) := 'N';
    v_vlor_ttal_sldo_crgo  varchar2(100);

  begin

    --Respuesta Exitosa
    o_cdgo_rspsta := 0;

    --Determinamos el Nivel del Log de la UP
    v_nvel := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte => p_cdgo_clnte,
                                          p_id_impsto  => null,
                                          p_nmbre_up   => v_nmbre_up);

    o_mnsje_rspsta   := 'Inicio del procedimiento ' || v_nmbre_up;
    o_vlor_sldo_fvor := 0;
    --Verifica si la Declaracion Existe
    pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                          p_id_impsto  => null,
                          p_nmbre_up   => v_nmbre_up,
                          p_nvel_log   => v_nvel,
                          p_txto_log   => o_mnsje_rspsta,
                          p_nvel_txto  => 1);
    o_vlor_sldo_fvor := 0;
    --Verifica si la Declaracion Existe
    begin
      select /*+ RESULT_CACHE */
       a.*
        into v_gi_g_declaraciones
        from gi_g_declaraciones a
       where a.id_dclrcion = p_id_dclrcion
         and a.cdgo_dclrcion_estdo in ('PRS', 'RLA');
    exception
      when no_data_found then
        o_cdgo_rspsta  := 1;
        o_mnsje_rspsta := o_cdgo_rspsta || '. La declaracion id[' ||
                          p_id_dclrcion ||
                          '], no existe en el sistema o no se encuentra presentada.';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        return;
    end;
    begin
      select a.indcdor_dclrcion_fnal, c.id_frmlrio
        into v_indcdor_dclrcion_fnal, v_id_frmlrio
        from gi_d_declaraciones_tipo a
        join gi_d_dclrcnes_tpos_vgncias b
          on a.id_dclrcn_tpo = b.id_dclrcn_tpo
        join gi_d_dclrcnes_vgncias_frmlr c
          on b.id_dclrcion_tpo_vgncia = c.id_dclrcion_tpo_vgncia
       where c.id_dclrcion_vgncia_frmlrio =
             v_gi_g_declaraciones.id_dclrcion_vgncia_frmlrio; -- 13507
    exception
      /*when no_data_found then
      o_cdgo_rspsta  := 1;
      o_mnsje_rspsta := o_cdgo_rspsta || '';
      pkg_sg_log.prc_rg_log( p_cdgo_clnte => p_cdgo_clnte , p_id_impsto => null , p_nmbre_up => v_nmbre_up
               , p_nvel_log => v_nvel , p_txto_log => o_mnsje_rspsta , p_nvel_txto => 3 );
      return;*/
      when others then
        o_cdgo_rspsta  := 15;
        o_mnsje_rspsta := o_cdgo_rspsta ||
                          '. Erro al consultar el indicador Declaración Final.';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        return;
    end;

    --Up Para Generar Liquidacion de Declaracion
    pkg_gi_declaraciones_utlddes.prc_ge_lqdcion_pntual_dclrcion(p_cdgo_clnte   => p_cdgo_clnte,
                                                                p_id_usrio     => p_id_usrio,
                                                                p_id_dclrcion  => p_id_dclrcion,
                                                                o_id_lqdcion   => v_id_lqdcion,
                                                                o_cdgo_rspsta  => o_cdgo_rspsta,
                                                                o_mnsje_rspsta => o_mnsje_rspsta);

    --pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up , v_nvel , 'Liq. creada: '||v_id_lqdcion , 1 );

    --Verifica si Hubo Error
    if (o_cdgo_rspsta <> 0) then
      o_cdgo_rspsta  := 2;
      o_mnsje_rspsta := o_cdgo_rspsta || '. ' || o_mnsje_rspsta;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => o_mnsje_rspsta,
                            p_nvel_txto  => 3);
      return;
    end if;

    --Up para Generar los Movimientos Financieros de Declaracion
    pkg_gf_movimientos_financiero.prc_gn_paso_liquidacion_mvmnto(p_cdgo_clnte        => p_cdgo_clnte,
                                                                 p_id_lqdcion        => v_id_lqdcion,
                                                                 p_cdgo_orgen_mvmnto => v_cdgo_mvmnto_orgn,
                                                                 p_id_orgen_mvmnto   => p_id_dclrcion,
                                                                 o_cdgo_rspsta       => o_cdgo_rspsta,
                                                                 o_mnsje_rspsta      => o_mnsje_rspsta);

    --pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up , v_nvel , 'Paso a cartera OK' , 1 );

    --Verifica si Hubo Error
    if (o_cdgo_rspsta <> 0) then
      o_cdgo_rspsta  := 3;
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        '. No fue posible generar el paso a movimientos financiero, ' ||
                        o_mnsje_rspsta;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => o_mnsje_rspsta,
                            p_nvel_txto  => 3);
      return;
    end if;

    --Cursor de los Movimientos Financieros Generado
    for c_mvmntos_fnncro in (select a.id_mvmnto_dtlle,
                                    a.id_impsto_acto_cncpto
                               from gf_g_movimientos_detalle a
                              where exists
                              (select 1
                                       from gf_g_movimientos_financiero b
                                      where b.cdgo_clnte = p_cdgo_clnte
                                        and b.id_impsto =
                                            v_gi_g_declaraciones.id_impsto
                                        and b.id_impsto_sbmpsto =
                                            v_gi_g_declaraciones.id_impsto_sbmpsto
                                        and b.id_sjto_impsto =
                                            v_gi_g_declaraciones.id_sjto_impsto
                                        and b.vgncia =
                                            v_gi_g_declaraciones.vgncia
                                        and b.id_prdo =
                                            v_gi_g_declaraciones.id_prdo
                                        and b.cdgo_mvmnto_orgn =
                                            v_cdgo_mvmnto_orgn
                                        and b.id_orgen = p_id_dclrcion
                                        and b.id_mvmnto_fncro =
                                            a.id_mvmnto_fncro)) loop

      --Actualiza los Movimientos Financieros a Declaracion MF
      update gi_g_dclrcnes_mvmnto_fnncro
         set id_mvmnto_dtlle = c_mvmntos_fnncro.id_mvmnto_dtlle
       where id_dclrcion = p_id_dclrcion
         and id_impsto_acto_cncpto = c_mvmntos_fnncro.id_impsto_acto_cncpto;

      o_mnsje_rspsta := 'id_impsto_acto_cncpto => ' ||
                        c_mvmntos_fnncro.id_impsto_acto_cncpto ||
                        '- id_mvmnto_dtlle => ' ||
                        c_mvmntos_fnncro.id_mvmnto_dtlle;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => o_mnsje_rspsta,
                            p_nvel_txto  => 6);
    end loop;

    --pkg_sg_log.prc_rg_log( p_cdgo_clnte , null , v_nmbre_up , v_nvel , 'Saliendo del for update gi_g_dclrcnes_mvmnto_fnncro' , 1 );

    --Determina que la Declaracion es por Correccion
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nvel,
                          'Antes de if   v_gi_g_declaraciones.id_dclrcion_crrccion is not null' ||
                          v_gi_g_declaraciones.id_dclrcion_crrccion,
                          1);
    --Condicional que determinar la aplicación de los anticipos registrados en una declaración
    --de PAGO FINAL - DELINEACIÓN URBANA
    if v_indcdor_dclrcion_fnal = 'N' or
       v_gi_g_declaraciones.id_dclrcion_crrccion is null then
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nvel,
                            '2 Antes de actualizar los anticipos p_id_dclrcion=>  ' ||
                            p_id_dclrcion,
                            1);

      begin
        update gi_g_declaraciones_anticipo a
           set aplcdo = 'S'
         where a.id_dclrcion = p_id_dclrcion;
      exception
        when no_data_found then
          null;
        when others then

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nvel,
                                'Error al intentar actualizar los anticipos',
                                1);
      end;

      o_mnsje_rspsta := 'Entro en proceso registrar anticipos ';

      begin
        select id_hmlgcion
          into v_id_hmlgcion
          from gi_d_homologaciones
         where cdgo_hmlgcion = 'PRD';
      exception
        when others then
          o_cdgo_rspsta := 10;

          return;
      end;

      v_hmlgcion_prpdad := pkg_gi_declaraciones.fnc_co_id_hmlgcion_prpdad(p_id_hmlgcion => v_id_hmlgcion,
                                                                          p_cdgo_prpdad => 'ANC');

      v_prpddes_items := pkg_gi_declaraciones.fnc_co_hmlgcnes_prpddes_items(p_id_hmlgcion_prpdad => v_hmlgcion_prpdad.id_hmlgcion_prpdad,
                                                                            p_id_frmlrio         => v_id_frmlrio);

      pkg_gi_declaraciones.prc_ap_declaracion_anticipo_crrcion(p_cdgo_clnte         => p_cdgo_clnte,
                                                               p_id_dclrcion        => p_id_dclrcion,
                                                               p_id_dclrcion_atrbto => v_prpddes_items.id_frmlrio_rgion_atrbto,
                                                               o_cdgo_rspsta        => o_cdgo_rspsta,
                                                               o_mnsje_rspsta       => o_mnsje_rspsta);
    end if;

    if (v_gi_g_declaraciones.id_dclrcion_crrccion is not null) then

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nvel,
                            'id_dclrcion_crrccion: ' ||
                            v_gi_g_declaraciones.id_dclrcion_crrccion,
                            1);

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nvel,
                            'v_indcdor_dclrcion_fnal: ' ||
                            v_indcdor_dclrcion_fnal,
                            1);

      --Anula la Cartera Anterior
      if v_indcdor_dclrcion_fnal = 'S' or
         v_gi_g_declaraciones.id_dclrcion_crrccion is not null then
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nvel,
                              'Entro a anaular el movimiento financiero anterior: v_cdgo_mvmnto_orgn =>  ' ||
                              v_cdgo_mvmnto_orgn,
                              1);
        update gf_g_movimientos_financiero
           set cdgo_mvnt_fncro_estdo = 'AN'
         where cdgo_mvmnto_orgn = v_cdgo_mvmnto_orgn
           and id_orgen = v_gi_g_declaraciones.id_dclrcion_crrccion;
      end if;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_nmbre_up,
                            v_nvel,
                            '2 Antes de p_id_dclrcion =>  ' ||
                            p_id_dclrcion,
                            1);

      --Busca los Datos de la Declaracion Anterior
      declare
        v_vlor_pago                 gi_g_declaraciones.vlor_pago%type := 0;
        v_json_crtra                clob;
        v_vlor_sldo_fvor            gf_g_saldos_favor.vlor_sldo_fvor%type := 0;
        v_vlor_sldo_fvor_sn         gf_g_saldos_favor.vlor_sldo_fvor%type := 0;
        v_cdgo_mvmnto_orgn_crrccion varchar2(2) := 'DC'; --Declaracion por Correccion
        v_fcha_vncmnto              date;
        v_json_dclrcion             clob;
        v_vlor_rcdo                 gi_g_declaraciones.vlor_pago%type;
        v_vlor_sldo_fvor_ant        number := 0;
        v_ttal_vlor_sldo_fvor_ant   number := 0;
        v_json_dscnto               clob;
        v_json_indcdor_clcla_intres clob;
        v_json_object               json_object_t;
        v_json                      clob;
      begin

        --Verifica si la Declaracion Existe
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nvel,
                              'Antes consultar si tiene pagos anteriores ' ||
                              v_gi_g_declaraciones.id_dclrcion_crrccion,
                              1);
        begin
          --> Req. 0024594. Se consultan todos los pagos realizados a la vigencia-periodo
          v_fcha_vncmnto := null;
          for c_pgos in (WITH Correcciones(id_dclrcion,
                           id_dclrcion_crrccion,
                           id_rcdo,
                           vlor_pago,
                           fcha_vncmnto) AS
                            (SELECT id_dclrcion,
                                   id_dclrcion_crrccion,
                                   id_rcdo,
                                   vlor_pago,
                                   (case
                                     when trunc(fcha_prsntcion) >
                                          trunc(fcha_prsntcion_pryctda) then
                                      trunc(fcha_prsntcion)
                                     else
                                      trunc(fcha_prsntcion_pryctda)
                                   end) fcha_vncmnto
                              FROM gi_g_declaraciones
                             WHERE id_dclrcion =
                                   v_gi_g_declaraciones.id_dclrcion_crrccion -- El ID de la declaración que quieres buscar

                            UNION ALL

                            SELECT d.id_dclrcion,
                                   d.id_dclrcion_crrccion,
                                   d.id_rcdo,
                                   d.vlor_pago,
                                   (case
                                     when trunc(fcha_prsntcion) >
                                          trunc(fcha_prsntcion_pryctda) then
                                      trunc(fcha_prsntcion)
                                     else
                                      trunc(fcha_prsntcion_pryctda)
                                   end) fcha_vncmnto
                              FROM gi_g_declaraciones d
                             INNER JOIN Correcciones c
                                ON d.id_dclrcion = c.id_dclrcion_crrccion
                            -- and d.cdgo_dclrcion_estdo in ( 'APL', 'RLA')
                            )
                           SELECT * FROM Correcciones order by id_dclrcion) loop
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nvel,
                                  'c_pgos.id_dclrcion: ' ||
                                  c_pgos.id_dclrcion,
                                  1);
            select sum(nvl(vlor_hber, 0))
              into v_vlor_rcdo
              from v_gf_g_movimientos_detalle a
              join df_i_conceptos b
                on a.id_cncpto = b.id_cncpto
               and b.sncion = 'N'
             where id_orgen = c_pgos.id_dclrcion
               and cdgo_mvmnto_orgn_dtlle = 'RE'
               and cdgo_mvmnto_tpo in ('PC', 'PI' /*,'DI'*/);

            begin
              select /*+ RESULT_CACHE */
               nvl(b.vlor_sldo_fvor, 0)
                into v_vlor_sldo_fvor_ant
                from re_g_recaudos a
                join gf_g_saldos_favor b
                  on a.id_sldo_fvor = b.id_sldo_fvor
               where a.id_orgen = c_pgos.id_dclrcion
                 and a.cdgo_rcdo_estdo = 'AP'
                    --and b.indcdor_rcncdo     = 'N'
                 and a.cdgo_rcdo_orgn_tpo = 'DL';
            exception
              when no_data_found then
                v_vlor_sldo_fvor_ant := 0;
              when others then
                o_cdgo_rspsta  := 4;
                o_mnsje_rspsta := o_cdgo_rspsta ||
                                  'Error al consultar el SAF de la declaracion id[' ||
                                  v_gi_g_declaraciones.id_dclrcion_crrccion || ']';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                      p_id_impsto  => null,
                                      p_nmbre_up   => v_nmbre_up,
                                      p_nvel_log   => v_nvel,
                                      p_txto_log   => o_mnsje_rspsta,
                                      p_nvel_txto  => 3);
                return;
            end;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nvel,
                                  'c_pgos.id_dclrcion: ' ||
                                  c_pgos.id_dclrcion || '- v_vlor_rcdo: ' ||
                                  v_vlor_rcdo,
                                  1);
            v_ttal_vlor_sldo_fvor_ant := v_ttal_vlor_sldo_fvor_ant +
                                         nvl(v_vlor_sldo_fvor_ant, 0);
            v_vlor_pago               := v_vlor_pago + nvl(v_vlor_rcdo, 0);
            if (v_vlor_rcdo > 0 and v_fcha_vncmnto is null) then
              v_fcha_vncmnto := c_pgos.fcha_vncmnto;
            end if;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nvel,
                                  'v_vlor_pago: ' || v_vlor_pago,
                                  1);
          end loop; -- FIN cursor c_pgos
          ---------------------------------------------------------------------------
          v_vlor_pago := v_vlor_pago - v_ttal_vlor_sldo_fvor_ant;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nvel,
                                'Antes de if  v_ttal_vlor_sldo_fvor_ant => ' ||
                                v_ttal_vlor_sldo_fvor_ant,
                                1);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nvel,
                                'Antes de if  v_fcha_vncmnto is null ' ||
                                v_fcha_vncmnto,
                                1);
          if v_fcha_vncmnto is null then
            begin
              select (case
                       when trunc(a.fcha_prsntcion) >
                            trunc(a.fcha_prsntcion_pryctda) then
                        trunc(a.fcha_prsntcion)
                       else
                        trunc(a.fcha_prsntcion_pryctda)
                     end)
                into v_fcha_vncmnto
                from gi_g_declaraciones a
               where a.id_dclrcion =
                     v_gi_g_declaraciones.id_dclrcion_crrccion;
            exception
              when no_data_found then
                o_cdgo_rspsta  := 4;
                o_mnsje_rspsta := o_cdgo_rspsta || '. La declaracion id[' ||
                                  v_gi_g_declaraciones.id_dclrcion_crrccion ||
                                  '],no existe en el sistema.';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                      p_id_impsto  => null,
                                      p_nmbre_up   => v_nmbre_up,
                                      p_nvel_log   => v_nvel,
                                      p_txto_log   => o_mnsje_rspsta,
                                      p_nvel_txto  => 3);
                return;
            end;
          end if;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nvel,
                                'v_vlor_pago: ' || v_vlor_pago ||
                                ' - v_fcha_vncmnto: ' || v_fcha_vncmnto,
                                1);

        exception
          when no_data_found then
            o_cdgo_rspsta  := 4;
            o_mnsje_rspsta := o_cdgo_rspsta || '. La declaracion id[' ||
                              v_gi_g_declaraciones.id_dclrcion_crrccion ||
                              '], no existe en el sistema.';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => o_mnsje_rspsta,
                                  p_nvel_txto  => 3);
            return;
        end;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => 'prc_ap_recaudo_prprcnal desde declaraciones prc_ap_declaracion: ' ||
                                              v_vlor_pago,
                              p_nvel_txto  => 1);

        pkg_gi_declaraciones.prc_co_homologacion(p_cdgo_clnte    => p_cdgo_clnte,
                                                 p_cdgo_hmlgcion => 'FSN',
                                                 p_cdgo_prpdad   => 'CIC',
                                                 p_id_dclrcion   => p_id_dclrcion,
                                                 o_vlor          => v_vlor_ttal_sldo_crgo,
                                                 o_cdgo_rspsta   => o_cdgo_rspsta,
                                                 o_mnsje_rspsta  => o_mnsje_rspsta);

        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => 'v_vlor_ttal_sldo_crgo: ' ||
                                              v_vlor_ttal_sldo_crgo,
                              p_nvel_txto  => 1);

        if (o_cdgo_rspsta <> 0) then
          o_cdgo_rspsta  := 1;
          o_mnsje_rspsta := 'Error al consultar el total saldo a cargo ' ||
                            o_cdgo_rspsta;
          return;
        end if;
        /*
             Se actualizan los valores de interes y descuento de interes para los conceptos capital diferente de sanción.
             con el fin de consultar los interes netos del capital que se registro en gi_g_dclrcnes_mvmnto_fnncr y su descuento
             de interes neto.
        */
        begin
          o_mnsje_rspsta := 'Antes de entrar al nuevo proceso';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 6);

          for c_dclrcnes_mvmnto_fnncr in (select a.*
                                            from gi_g_dclrcnes_mvmnto_fnncro a
                                            join df_i_conceptos b
                                              on a.id_cncpto = b.id_cncpto
                                           where a.id_dclrcion =
                                                 v_gi_g_declaraciones.id_dclrcion
                                             and a.vlor_dbe > 0
                                             and a.cdgo_cncpto_tpo <> 'I'
                                             and b.sncion <> 'S'
                                           order by 1 asc) loop
            o_mnsje_rspsta := 'Entro al nuevo proceso c_dclrcnes_mvmnto_fnncr.id_cncpto => ' ||
                              c_dclrcnes_mvmnto_fnncr.id_cncpto;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => o_mnsje_rspsta,
                                  p_nvel_txto  => 6);
            begin

              select pkg_gf_movimientos_financiero.fnc_cl_interes_mora(p_cdgo_clnte        => p_cdgo_clnte,
                                                                       p_id_impsto         => v_gi_g_declaraciones.id_impsto,
                                                                       p_id_impsto_sbmpsto => v_gi_g_declaraciones.id_impsto_sbmpsto,
                                                                       p_vgncia            => v_gi_g_declaraciones.vgncia,
                                                                       p_id_prdo           => v_gi_g_declaraciones.id_prdo,
                                                                       p_id_cncpto         => c_dclrcnes_mvmnto_fnncr.id_cncpto, --v_id_cncpto_cptal
                                                                       p_vlor_cptal        => c_dclrcnes_mvmnto_fnncr.vlor_dbe,
                                                                       p_indcdor_clclo     => 'CLD',
                                                                       p_cdgo_mvmnto_orgn  => 'DL',
                                                                       p_id_orgen          => p_id_dclrcion,
                                                                       p_fcha_pryccion     => v_fcha_vncmnto) as interes
                into v_vlor_interes
                from dual;
              o_mnsje_rspsta := 'id_cncpto => ' ||
                                c_dclrcnes_mvmnto_fnncr.id_cncpto ||
                                ' v_vlor_interes => ' || v_vlor_interes;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => o_mnsje_rspsta,
                                    p_nvel_txto  => 6);

              /*
                  Esta función simula el calculo que hace el formulario de declaración, confirmando sí debe o no calcular intereses en la corrección
                  De esta forma podemos consulta si el valor  de v_vlor_interes_aux  es igual a cero 0, indica que no se debe tiene derecho a interes
                  Sí es mayor que cero si se debe calcular los intereses.
              */
              /* select pkg_gi_declaraciones_funciones.fnc_co_cncpto_intrs_vlddo_2(  p_cdgo_clnte                    => p_cdgo_clnte,
                                                                                   p_id_dclrcion_vgncia_frmlrio    => v_gi_g_declaraciones.id_dclrcion_vgncia_frmlrio,
                                                                                   p_id_cncpto                     => c_dclrcnes_mvmnto_fnncr.id_cncpto, --v_id_cncpto_cptal
                                                                                   p_vlor_cncpto                   => c_dclrcnes_mvmnto_fnncr.vlor_dbe,
                                                                                   p_id_dclrcion               => p_id_dclrcion,
                                                                                   p_id_dclrcion_antrior     => v_gi_g_declaraciones.id_dclrcion_crrccion,
                                                                                   p_fcha_vncmnto                  => v_fcha_vncmnto,
                                                                                   p_vlor_ttal                     =>to_number(v_vlor_ttal_sldo_crgo))  as interes
               into    v_vlor_interes_aux
               from dual;


              /*
               Condición que valida sí para una corrección se debe calcular o no intereses.
                   Ejemplo: Declaración inicial Dentro de la fecha limiete, y su corrección fue presentada por igual valor pero fuera
                   de la fecha limiete, es decir que no debe calcular intereses

                   la variable v_indcdor_clcla_intres se añade al json_crtra que se envía a pkg_re_recaudos.prc_ap_recaudo_prprcnal
                   y sí la variable  v_indcdor_clcla_intres es igual a 'S' calcula interes de lo contrario no calcula intereses.


              if v_vlor_interes_aux > 0 then
                   v_indcdor_clcla_intres := 'S';
              else
                   v_indcdor_clcla_intres := 'N';
              end if;*/

              o_mnsje_rspsta := 'v_indcdor_clcla_intres => ' ||
                                v_indcdor_clcla_intres;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => o_mnsje_rspsta,
                                    p_nvel_txto  => 6);
            exception
              when others then
                o_mnsje_rspsta := 'Error al calcular interes del id_concepto [' ||
                                  c_dclrcnes_mvmnto_fnncr.id_cncpto || ']';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                      p_id_impsto  => null,
                                      p_nmbre_up   => v_nmbre_up,
                                      p_nvel_log   => v_nvel,
                                      p_txto_log   => o_mnsje_rspsta,
                                      p_nvel_txto  => 6);
                continue;
            end;

            o_mnsje_rspsta := 'Calculo interes v_vlor_interes => ' ||
                              v_vlor_interes;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => o_mnsje_rspsta,
                                  p_nvel_txto  => 6);

            --Se consulta el concepto de interes relacional de los conceptos capital
            begin
              select a.id_cncpto
                into v_id_cncpto_interes
                from gi_g_dclrcnes_mvmnto_fnncro a
               where a.id_dclrcion = p_id_dclrcion
                 and a.id_cncpto_rlcnal = c_dclrcnes_mvmnto_fnncr.id_cncpto
                 and a.cdgo_cncpto_tpo = 'I';
            exception
              when no_data_found then
                o_mnsje_rspsta := 'No sé encontró el concepto de interes para el id_concepto  [' ||
                                  c_dclrcnes_mvmnto_fnncr.id_cncpto || ']';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                      p_id_impsto  => null,
                                      p_nmbre_up   => v_nmbre_up,
                                      p_nvel_log   => v_nvel,
                                      p_txto_log   => o_mnsje_rspsta,
                                      p_nvel_txto  => 6);
                continue;
              when others then
                o_mnsje_rspsta := 'Error al calcular interes del id_concepto [' ||
                                  c_dclrcnes_mvmnto_fnncr.id_cncpto || ']';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                      p_id_impsto  => null,
                                      p_nmbre_up   => v_nmbre_up,
                                      p_nvel_log   => v_nvel,
                                      p_txto_log   => o_mnsje_rspsta,
                                      p_nvel_txto  => 6);
                continue;
            end;
            o_mnsje_rspsta := 'Antes de actualizar intereses v_id_cncpto_interes => ' ||
                              v_id_cncpto_interes;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => o_mnsje_rspsta,
                                  p_nvel_txto  => 6);

            begin
              update gi_g_dclrcnes_mvmnto_fnncro a
                 set a.vlor_dbe = v_vlor_interes
               where a.id_dclrcion = p_id_dclrcion
                 and a.id_cncpto = v_id_cncpto_interes
                 and a.cdgo_cncpto_tpo = 'I';
            exception

              when others then
                o_mnsje_rspsta := 'Error al actualizar interes del id_concepto [' ||
                                  v_id_cncpto_interes || ']';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                      p_id_impsto  => null,
                                      p_nmbre_up   => v_nmbre_up,
                                      p_nvel_log   => v_nvel,
                                      p_txto_log   => o_mnsje_rspsta,
                                      p_nvel_txto  => 6);
                continue;
            end;
            o_mnsje_rspsta := 'Intereses actualizados   v_id_cncpto_interes => ' ||
                              v_id_cncpto_interes;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => o_mnsje_rspsta,
                                  p_nvel_txto  => 6);
            --Se calcula el nuevo descuento del interes neto
            begin
              select vlor_dscnto
                into v_vlor_dscnto_int
                from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo(p_cdgo_clnte           => p_cdgo_clnte,
                                                                            p_id_impsto            => v_gi_g_declaraciones.id_impsto,
                                                                            p_id_impsto_sbmpsto    => v_gi_g_declaraciones.id_impsto_sbmpsto,
                                                                            p_vgncia               => v_gi_g_declaraciones.vgncia,
                                                                            p_id_prdo              => v_gi_g_declaraciones.id_prdo,
                                                                            p_id_cncpto            => v_id_cncpto_interes,
                                                                            p_id_sjto_impsto       => v_gi_g_declaraciones.id_sjto_impsto,
                                                                            p_fcha_pryccion        => to_date(v_fcha_vncmnto,
                                                                                                              'dd/mm/yyyy'),
                                                                            p_vlor                 => v_vlor_interes,
                                                                            p_cdna_vgncia_prdo_pgo => '{}',
                                                                            p_cdgo_orgen           => 'DCL')) a;

              o_mnsje_rspsta := 'v_id_cncpto_interes => ' ||
                                v_id_cncpto_interes ||
                                ' v_vlor_dscnto_int => ' ||
                                v_vlor_dscnto_int;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => o_mnsje_rspsta,
                                    p_nvel_txto  => 6);

            exception
              when others then
                o_mnsje_rspsta := 'Error al calcular descuento de interes del id_concepto [' ||
                                  v_id_cncpto_interes || ']';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                      p_id_impsto  => null,
                                      p_nmbre_up   => v_nmbre_up,
                                      p_nvel_log   => v_nvel,
                                      p_txto_log   => o_mnsje_rspsta,
                                      p_nvel_txto  => 6);
                continue;
            end;
            o_mnsje_rspsta := 'Calculo descuentos v_vlor_dscnto_int => ' ||
                              v_vlor_dscnto_int;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => o_mnsje_rspsta,
                                  p_nvel_txto  => 6);

            begin
              select a.id_cncpto
                into v_id_cncpto_dscnto
                from gi_g_dclrcnes_mvmnto_fnncro a
               where a.id_dclrcion = p_id_dclrcion
                 and a.id_cncpto_rlcnal = v_id_cncpto_interes
                 and a.cdgo_cncpto_tpo = 'D';
            exception
              when no_data_found then
                o_mnsje_rspsta := 'No sé encontró el concepto de descuento para el id_concepto  [' ||
                                  v_id_cncpto_interes || ']';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                      p_id_impsto  => null,
                                      p_nmbre_up   => v_nmbre_up,
                                      p_nvel_log   => v_nvel,
                                      p_txto_log   => o_mnsje_rspsta,
                                      p_nvel_txto  => 6);
                continue;
              when others then
                o_mnsje_rspsta := 'Error al consultar el concepto de descuento para el id_concepto [' ||
                                  v_id_cncpto_interes || ']';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                      p_id_impsto  => null,
                                      p_nmbre_up   => v_nmbre_up,
                                      p_nvel_log   => v_nvel,
                                      p_txto_log   => o_mnsje_rspsta,
                                      p_nvel_txto  => 6);
                continue;
            end;
            o_mnsje_rspsta := 'Antes de actualizar descuentos v_id_cncpto_dscnto => ' ||
                              v_id_cncpto_dscnto;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => o_mnsje_rspsta,
                                  p_nvel_txto  => 6);
            begin
              update gi_g_dclrcnes_mvmnto_fnncro a
                 set a.vlor_hber = v_vlor_dscnto_int
               where a.id_dclrcion = p_id_dclrcion
                 and a.id_cncpto = v_id_cncpto_dscnto
                 and a.cdgo_cncpto_tpo = 'D';
            exception
              when others then
                o_mnsje_rspsta := 'Error al actualizar descuento de interes  del id_concepto [' ||
                                  v_id_cncpto_dscnto || ']';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                      p_id_impsto  => null,
                                      p_nmbre_up   => v_nmbre_up,
                                      p_nvel_log   => v_nvel,
                                      p_txto_log   => o_mnsje_rspsta,
                                      p_nvel_txto  => 6);
                continue;
            end;
            o_mnsje_rspsta := 'Descuento actualizados   v_id_cncpto_dscnto => ' ||
                              v_id_cncpto_dscnto;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => o_mnsje_rspsta,
                                  p_nvel_txto  => 6);
          end loop;
        exception
          when others then
            o_cdgo_rspsta  := 4;
            o_mnsje_rspsta := o_cdgo_rspsta ||
                              '.Error a intentar actualizar los movimientos financieros registrados de la declaracion id[' ||
                              v_gi_g_declaraciones.id_dclrcion_crrccion || ']';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => o_mnsje_rspsta,
                                  p_nvel_txto  => 3);
            return;
        end;
        o_mnsje_rspsta := 'Salio del nuevo proceso ';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 6);

        --Json de Cartera de la Declaracion por Correccion (Sin Sancion)
        select json_object('carteras' value
                           json_arrayagg(json_object('vgncia' value
                                                     a.vgncia,
                                                     'prdo' value a.prdo,
                                                     'id_prdo' value
                                                     a.id_prdo,
                                                     'cdgo_prdcdad' value
                                                     a.cdgo_prdcdad,
                                                     'id_cncpto' value
                                                     a.id_cncpto,
                                                     'cdgo_cncpto' value
                                                     a.cdgo_cncpto,
                                                     'id_mvmnto_fncro' value
                                                     a.id_mvmnto_fncro,
                                                     'vlor_sldo_cptal' value
                                                     a.vlor_sldo_cptal /*- (select d.vlor_dbe
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                from gi_g_dclrcnes_mvmnto_fnncro d
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                where d.id_dclrcion = v_gi_g_declaraciones.id_dclrcion_crrccion--1547793
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                and d.id_cncpto = a.id_cncpto ) )*/,
                                                     'id_impsto_acto_cncpto'
                                                     value
                                                     a.id_impsto_acto_cncpto,
                                                     'fcha_vncmnto' value
                                                     a.fcha_vncmnto,
                                                     'cdgo_mvmnto_orgn'
                                                     value
                                                     a.cdgo_mvmnto_orgn,
                                                     'id_orgen' value
                                                     a.id_orgen) returning clob)
                           absent on null returning clob) as json
          into v_json_crtra
          from v_gf_g_cartera_x_concepto a
          join df_i_conceptos b
            on a.id_cncpto = b.id_cncpto
         where a.cdgo_clnte = p_cdgo_clnte
           and a.id_impsto = v_gi_g_declaraciones.id_impsto
           and a.id_impsto_sbmpsto = v_gi_g_declaraciones.id_impsto_sbmpsto
           and a.id_sjto_impsto = v_gi_g_declaraciones.id_sjto_impsto
           and a.id_mvmnto_fncro in
               (select c.id_mvmnto_fncro
                  from gi_g_dclrcnes_mvmnto_fnncro b
                  join gf_g_movimientos_detalle c
                    on b.id_mvmnto_dtlle = c.id_mvmnto_dtlle
                 where b.id_dclrcion = v_gi_g_declaraciones.id_dclrcion
                   and b.id_mvmnto_dtlle is not null
                 group by c.id_mvmnto_fncro)
           and a.vlor_sldo_cptal > 0
           and b.sncion <> 'S';

        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => 'v_json_crtra b.sncion  <> S id_dclrcion => ' ||
                                              v_json_crtra,
                              p_nvel_txto  => 6);

        begin
          select case
                   when sum(a.vlor_dbe) > 0 then
                    'S'
                   else
                    'N'
                 end as aplca_intres
            into v_indcdor_clcla_intres
            from gi_g_dclrcnes_mvmnto_fnncro a
           where a.id_dclrcion = v_gi_g_declaraciones.id_dclrcion_crrccion
             and a.cdgo_cncpto_tpo = 'I';
        exception
          when others then
            o_cdgo_rspsta  := 4;
            o_mnsje_rspsta := o_cdgo_rspsta ||
                              '.Error a intentar consultar los movimientos financieros de interes registrados de la declaracion id[' ||
                              v_gi_g_declaraciones.id_dclrcion_crrccion || ']';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => o_mnsje_rspsta,
                                  p_nvel_txto  => 3);
            return;
        end;

        o_mnsje_rspsta := o_cdgo_rspsta || 'v_indcdor_clcla_intres [ ' ||
                          v_indcdor_clcla_intres || ' ]';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 3);
        --Json de indicador calcula interes: Según la validación de la función X devuelve si debe calcular o no intereses y se envía
        --en el json para determinar si debe calcular intereses o no.
        select json_object('indcdor_clcla_intres' value
                           v_indcdor_clcla_intres absent on null returning clob) as json
          into v_json_indcdor_clcla_intres
          from dual a;

        --Json de Descuentos de la Declaracion
        select json_object('descuentos' value
                           json_arrayagg(json_object('id_mvmnto_fncro'
                                                     value
                                                     a.id_mvmnto_fncro,
                                                     'id_impsto_acto_cncpto'
                                                     value
                                                     a.id_impsto_acto_cncpto,
                                                     'id_cncpto' value
                                                     a.id_cncpto,
                                                     'id_cncpto_rlcnal'
                                                     value
                                                     a.id_cncpto_rlcnal,
                                                     'vlor_dscnto' value
                                                     a.vlor_dscnto)
                                         returning clob) absent on null
                           returning clob) as json
          into v_json_dscnto
          from (select b.id_mvmnto_fncro,
                       b.id_impsto_acto_cncpto,
                       max(a.id_cncpto) as id_cncpto,
                       a.id_cncpto_rlcnal,
                       sum(a.vlor_hber) as vlor_dscnto
                  from gi_g_dclrcnes_mvmnto_fnncro a
                  join gf_g_movimientos_detalle b
                    on a.id_mvmnto_dtlle = b.id_mvmnto_dtlle
                 where a.vlor_hber > 0
                   and a.id_dclrcion = v_gi_g_declaraciones.id_dclrcion
                 group by b.id_mvmnto_fncro,
                          b.id_impsto_acto_cncpto,
                          a.id_cncpto_rlcnal) a;

        --  v_json_crtra := '{}';
        --Asigna el Json al Objeto
        v_json_object := json_object_t(v_json_crtra);
        --Merge de Json de Cartera Documento y Descuentos
        -- v_json_dscnto := '{}';
        v_json_object.mergepatch(json_object_t(v_json_dscnto));

        --v_json_indcdor_clcla_intres
        v_json_object.mergepatch(json_object_t(v_json_indcdor_clcla_intres));
        --Json de Aplicador
        v_json := v_json_object.to_clob();

        pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => 'v_json  => ' || v_json,
                              p_nvel_txto  => 6);
        --Cursor de Cartera Aplicada (Sin Sancion)
        for c_crtra in (select a.*
                          from table(pkg_re_recaudos.prc_ap_recaudo_prprcnal(p_cdgo_clnte => p_cdgo_clnte
                                                                             -- from table ( pkg_re_recaudos.prc_ap_recaudo_prprcnal_correccion2( p_cdgo_clnte        => p_cdgo_clnte
                                                                            ,
                                                                             p_id_impsto         => v_gi_g_declaraciones.id_impsto,
                                                                             p_id_impsto_sbmpsto => v_gi_g_declaraciones.id_impsto_sbmpsto,
                                                                             p_fcha_vncmnto      => v_fcha_vncmnto,
                                                                             p_vlor_rcdo         => v_vlor_pago,
                                                                             p_json_crtra        => v_json --v_json_crtra
                                                                             )) a
                         where a.cdgo_mvmnto_tpo in
                               ('SF', 'PC', 'PI', 'IT', 'DI')) loop
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => 'v_cdgo_mvmnto_orgn_crrccion: ' ||
                                                v_cdgo_mvmnto_orgn_crrccion ||
                                                ' c_crtra.cdgo_mvmnto_tpo: ' ||
                                                c_crtra.cdgo_mvmnto_tpo ||
                                                ' c_crtra.id_cncpto: ' ||
                                                c_crtra.id_cncpto ||
                                                ' c_crtra.vlor_dbe: ' ||
                                                c_crtra.vlor_dbe ||
                                                ' c_crtra.vlor_hber: ' ||
                                                c_crtra.vlor_hber,
                                p_nvel_txto  => 1);

          --Indicador de Saldo a Favor
          if (c_crtra.cdgo_mvmnto_tpo = 'SF') then
            v_vlor_sldo_fvor := v_vlor_sldo_fvor + c_crtra.vlor_sldo_fvor;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nvel,
                                  'c_crtra.vlor_sldo_fvor: ' ||
                                  c_crtra.vlor_sldo_fvor,
                                  1);
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nvel,
                                  'v_vlor_sldo_fvor: ' || v_vlor_sldo_fvor,
                                  1);
            continue;
          end if;

          --Tipo de Movimiento
          c_crtra.cdgo_mvmnto_tpo := (case
                                       when c_crtra.cdgo_mvmnto_tpo = 'IT' then
                                        'AD'
                                       else
                                        'AC'
                                     end);
          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nvel,
                                'c_crtra.cdgo_mvmnto_tpo: ' ||
                                c_crtra.cdgo_mvmnto_tpo,
                                1);

          o_mnsje_rspsta := 'Antes de insertar gf_g_movimientos_detalle v_vlor_pago => ' ||
                            v_vlor_pago || ' - concepto: ' ||
                            c_crtra.id_cncpto;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 6);

          o_mnsje_rspsta := 'Antes de insertar gf_g_movimientos_detalle c_crtra.vlor_dbe: ' ||
                            c_crtra.vlor_dbe;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 6);

          --Inserta los Movimientos Financiero
          -- se quita del comentario
          begin
            insert into gf_g_movimientos_detalle
              (id_mvmnto_fncro,
               cdgo_mvmnto_orgn,
               id_orgen,
               cdgo_mvmnto_tpo,
               vgncia,
               id_prdo,
               cdgo_prdcdad,
               fcha_mvmnto,
               id_cncpto,
               id_cncpto_csdo,
               vlor_dbe,
               vlor_hber,
               actvo,
               gnra_intres_mra,
               fcha_vncmnto,
               id_impsto_acto_cncpto)
            values
              (c_crtra.id_mvmnto_fncro,
               v_cdgo_mvmnto_orgn_crrccion,
               v_gi_g_declaraciones.id_dclrcion_crrccion,
               c_crtra.cdgo_mvmnto_tpo,
               c_crtra.vgncia,
               c_crtra.id_prdo,
               c_crtra.cdgo_prdcdad,
               systimestamp,
               c_crtra.id_cncpto,
               c_crtra.id_cncpto_csdo,
               c_crtra.vlor_dbe,
               c_crtra.vlor_hber,
               'S',
               c_crtra.gnra_intres_mra,
               c_crtra.fcha_vncmnto,
               c_crtra.id_impsto_acto_cncpto);
          exception
            when others then
              o_cdgo_rspsta  := 5;
              o_mnsje_rspsta := o_cdgo_rspsta ||
                                '. No fue posible crear el movimiento financiero para la declaracion por correccion.';
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => (o_mnsje_rspsta ||
                                                    ' Error: ' || sqlerrm),
                                    p_nvel_txto  => 3);
              return;
          end;
          ---*/
        end loop; -- FIN Cursor de Cartera Aplicada (Sin Sancion)

        begin
          select sum(a.vlor_hber) as vlor_dscnto
            into v_vlor_dscnto_sncion
            from gi_g_dclrcnes_mvmnto_fnncro a
            join gf_g_movimientos_detalle b
              on a.id_mvmnto_dtlle = b.id_mvmnto_dtlle
            join df_i_conceptos c
              on a.id_cncpto_rlcnal = c.id_cncpto
           where a.vlor_hber > 0
             and a.id_dclrcion = v_gi_g_declaraciones.id_dclrcion
             and a.cdgo_cncpto_tpo = 'D'
             and c.sncion = 'S'
           group by b.id_mvmnto_fncro,
                    b.id_impsto_acto_cncpto,
                    a.id_cncpto_rlcnal;
        exception
          when no_data_found then
            o_cdgo_rspsta  := 10;
            o_mnsje_rspsta := o_cdgo_rspsta ||
                              '. No se encontró valor descuento sanción.';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => (o_mnsje_rspsta ||
                                                  ' Error: ' || sqlerrm),
                                  p_nvel_txto  => 3);

          when others then
            o_cdgo_rspsta  := 11;
            o_mnsje_rspsta := o_cdgo_rspsta ||
                              '. Error al consultar el valor descuento sanción';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => (o_mnsje_rspsta ||
                                                  ' Error: ' || sqlerrm),
                                  p_nvel_txto  => 3);
            return;
        end;

        --Verifica si hay Saldo a Favor por Aplicar
        -- v_vlor_sldo_fvor := v_vlor_sldo_fvor + v_vlor_dscnto_sncion;
        if (v_vlor_sldo_fvor > 0 or v_vlor_dscnto_sncion > 0) then
          o_mnsje_rspsta := 'Entro if  if( v_vlor_sldo_fvor > 0 ) => ' ||
                            v_vlor_sldo_fvor;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 6);

          --Json de Cartera de la Declaracion por Correccion (Sancion)
          select json_object('carteras' value
                             json_arrayagg(json_object('vgncia' value
                                                       a.vgncia,
                                                       'prdo' value a.prdo,
                                                       'id_prdo' value
                                                       a.id_prdo,
                                                       'cdgo_prdcdad' value
                                                       a.cdgo_prdcdad,
                                                       'id_cncpto' value
                                                       a.id_cncpto,
                                                       'cdgo_cncpto' value
                                                       a.cdgo_cncpto,
                                                       'id_mvmnto_fncro'
                                                       value
                                                       a.id_mvmnto_fncro,
                                                       'vlor_sldo_cptal'
                                                       value
                                                       a.vlor_sldo_cptal,
                                                       'id_impsto_acto_cncpto'
                                                       value
                                                       a.id_impsto_acto_cncpto,
                                                       'fcha_vncmnto' value
                                                       a.fcha_vncmnto,
                                                       'cdgo_mvmnto_orgn'
                                                       value
                                                       a.cdgo_mvmnto_orgn,
                                                       'id_orgen' value
                                                       a.id_orgen)
                                           returning clob) absent on null
                             returning clob) as json
            into v_json_crtra
            from v_gf_g_cartera_x_concepto a
            join df_i_conceptos b
              on a.id_cncpto = b.id_cncpto
           where a.cdgo_clnte = p_cdgo_clnte
             and a.id_impsto = v_gi_g_declaraciones.id_impsto
             and a.id_impsto_sbmpsto =
                 v_gi_g_declaraciones.id_impsto_sbmpsto
             and a.id_sjto_impsto = v_gi_g_declaraciones.id_sjto_impsto
             and a.id_mvmnto_fncro in
                 (select c.id_mvmnto_fncro
                    from gi_g_dclrcnes_mvmnto_fnncro b
                    join gf_g_movimientos_detalle c
                      on b.id_mvmnto_dtlle = c.id_mvmnto_dtlle
                   where b.id_dclrcion = v_gi_g_declaraciones.id_dclrcion
                     and b.id_mvmnto_dtlle is not null
                   group by c.id_mvmnto_fncro)
             and a.vlor_sldo_cptal > 0
             and b.sncion = 'S';
          o_mnsje_rspsta := 'v_json_crtra = S id_dclrcion => ' ||
                            v_json_crtra;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 6);

          select json_object('descuentos' value
                             json_arrayagg(json_object('id_mvmnto_fncro'
                                                       value
                                                       a.id_mvmnto_fncro,
                                                       'id_impsto_acto_cncpto'
                                                       value
                                                       a.id_impsto_acto_cncpto,
                                                       'id_cncpto' value
                                                       a.id_cncpto,
                                                       'id_cncpto_rlcnal'
                                                       value
                                                       a.id_cncpto_rlcnal,
                                                       'vlor_dscnto' value
                                                       a.vlor_dscnto)
                                           returning clob) absent on null
                             returning clob) as json
            into v_json_dscnto
            from (select b.id_mvmnto_fncro,
                         b.id_impsto_acto_cncpto,
                         max(a.id_cncpto) as id_cncpto,
                         a.id_cncpto_rlcnal,
                         sum(a.vlor_hber) as vlor_dscnto
                    from gi_g_dclrcnes_mvmnto_fnncro a
                    join gf_g_movimientos_detalle b
                      on a.id_mvmnto_dtlle = b.id_mvmnto_dtlle
                    join df_i_conceptos b
                      on a.id_cncpto_rlcnal = b.id_cncpto
                   where a.vlor_hber > 0
                     and a.id_dclrcion = v_gi_g_declaraciones.id_dclrcion
                     and a.cdgo_cncpto_tpo = 'D'
                     and b.sncion = 'S'
                   group by b.id_mvmnto_fncro,
                            b.id_impsto_acto_cncpto,
                            a.id_cncpto_rlcnal) a;

          --Asigna el Json al Objeto
          v_json_object := json_object_t(v_json_crtra);
          --Merge de Json de Cartera Documento y Descuentos
          -- v_json_dscnto := '{}';
          v_json_object.mergepatch(json_object_t(v_json_dscnto));
          --Json de Aplicador
          v_json         := v_json_object.to_clob();
          o_mnsje_rspsta := 'v_json_crtra = S id_dclrcion => ' ||
                            v_json_crtra;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 6);

          --Cursor de Cartera Aplicada (Sancion)
          for c_crtra in (select a.*
                            from table(pkg_re_recaudos.prc_ap_recaudo_prprcnal(p_cdgo_clnte        => p_cdgo_clnte,
                                                                               p_id_impsto         => v_gi_g_declaraciones.id_impsto,
                                                                               p_id_impsto_sbmpsto => v_gi_g_declaraciones.id_impsto_sbmpsto,
                                                                               p_fcha_vncmnto      => v_fcha_vncmnto,
                                                                               p_vlor_rcdo         => v_vlor_sldo_fvor,
                                                                               p_json_crtra        => v_json)) a
                           where a.cdgo_mvmnto_tpo in
                                 ('SF', 'PC', 'PI', 'IT', 'DC', 'DI')) loop

            --Indicador de Saldo a Favor
            o_mnsje_rspsta := 'PROPORCIONALIDAD SANCION c_crtra.vlor_sldo_fvor => ' ||
                              c_crtra.vlor_sldo_fvor;
            pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => o_mnsje_rspsta,
                                  p_nvel_txto  => 6);

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nvel,
                                  ' c_crtra.cdgo_mvmnto_tpo: ' ||
                                  c_crtra.cdgo_mvmnto_tpo,
                                  1);

            /*
               Condicional que que valida si el cursor c_crtra que contiene los conceptos de tipo sanción, genero un saldo a favor.
               Sí contiene un codgo movimiento tipo = SF realiza el acumulado del valor de saldo a favor y retorna o_vlor_sldo_fvor
               para que se procese en el procedimiento de aplicador de aplicaciones del paquete de recaudo.
            */
            if (c_crtra.cdgo_mvmnto_tpo = 'SF') then

              v_vlor_sldo_fvor_sn := v_vlor_sldo_fvor_sn +
                                     c_crtra.vlor_sldo_fvor;
              --o_vlor_sldo_fvor := v_vlor_sldo_fvor_sn;
              o_vlor_sldo_fvor := 0;
              o_mnsje_rspsta   := 'v_vlor_sldo_fvor_sn => ' ||
                                  v_vlor_sldo_fvor_sn;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => o_mnsje_rspsta,
                                    p_nvel_txto  => 6);
              continue;
            end if;

            --Tipo de Movimiento
            c_crtra.cdgo_mvmnto_tpo := (case
                                         when c_crtra.cdgo_mvmnto_tpo = 'IT' then
                                          'AD'
                                         else
                                          'AC'
                                       end);

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nvel,
                                  'SANCION c_crtra.cdgo_mvmnto_tpo: ' ||
                                  c_crtra.cdgo_mvmnto_tpo,
                                  1);

            --Inserta los Movimientos Financiero
            begin
              insert into gf_g_movimientos_detalle
                (id_mvmnto_fncro,
                 cdgo_mvmnto_orgn,
                 id_orgen,
                 cdgo_mvmnto_tpo,
                 vgncia,
                 id_prdo,
                 cdgo_prdcdad,
                 fcha_mvmnto,
                 id_cncpto,
                 id_cncpto_csdo,
                 vlor_dbe,
                 vlor_hber,
                 actvo,
                 gnra_intres_mra,
                 fcha_vncmnto,
                 id_impsto_acto_cncpto)
              values
                (c_crtra.id_mvmnto_fncro,
                 v_cdgo_mvmnto_orgn_crrccion,
                 v_gi_g_declaraciones.id_dclrcion_crrccion,
                 c_crtra.cdgo_mvmnto_tpo,
                 c_crtra.vgncia,
                 c_crtra.id_prdo,
                 c_crtra.cdgo_prdcdad,
                 systimestamp,
                 c_crtra.id_cncpto,
                 c_crtra.id_cncpto_csdo,
                 c_crtra.vlor_dbe,
                 c_crtra.vlor_hber,
                 'S',
                 c_crtra.gnra_intres_mra,
                 c_crtra.fcha_vncmnto,
                 c_crtra.id_impsto_acto_cncpto);
            exception
              when others then
                o_cdgo_rspsta  := 6;
                o_mnsje_rspsta := o_cdgo_rspsta ||
                                  '. No fue posible crear el movimiento financiero para la declaracion por correccion.';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                      p_id_impsto  => null,
                                      p_nmbre_up   => v_nmbre_up,
                                      p_nvel_log   => v_nvel,
                                      p_txto_log   => (o_mnsje_rspsta ||
                                                      ' Error: ' || sqlerrm),
                                      p_nvel_txto  => 3);
                return;
            end;
          end loop;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nvel,
                                'FUERA EL FOR DE SANCION',
                                1);
        end if;
      end;

      --Actualiza el Consolidado de la Cartera
      begin
        pkg_gf_movimientos_financiero.prc_ac_concepto_consolidado(p_cdgo_clnte     => p_cdgo_clnte,
                                                                  p_id_sjto_impsto => v_gi_g_declaraciones.id_sjto_impsto);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nvel,
                              'FUERA DEL CONSOLIDADO',
                              1);
      exception
        when others then
          o_cdgo_rspsta := 7;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => (o_mnsje_rspsta || '.' ||
                                                sqlerrm),
                                p_nvel_txto  => 3);
          o_mnsje_rspsta := 'No fue posible actualizar el consolidado del sujeto impuesto.';
          return;
      end;
    end if;

    --Up Para Actualizar el Estado de la Declaracion - Aplicada
    pkg_gi_declaraciones.prc_ac_declaracion_estado(p_cdgo_clnte          => p_cdgo_clnte,
                                                   p_id_dclrcion         => p_id_dclrcion,
                                                   p_cdgo_dclrcion_estdo => 'APL',
                                                   p_fcha                => systimestamp,
                                                   p_id_usrio_aplccion   => p_id_usrio,
                                                   o_cdgo_rspsta         => o_cdgo_rspsta,
                                                   o_mnsje_rspsta        => o_mnsje_rspsta);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nvel,
                          'MARCA p_cdgo_dclrcion_estdo => APL',
                          1);
    --Verifica si Hubo Error
    if (o_cdgo_rspsta <> 0) then
      o_cdgo_rspsta  := 8;
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        '. No fue posible actualizar el estado de la declaracion, ' ||
                        o_mnsje_rspsta;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => o_mnsje_rspsta,
                            p_nvel_txto  => 3);
      return;
    end if;

    o_mnsje_rspsta := 'Fin del procedimiento ' || v_nmbre_up;
    pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                          p_id_impsto  => null,
                          p_nmbre_up   => v_nmbre_up,
                          p_nvel_log   => v_nvel,
                          p_txto_log   => o_mnsje_rspsta,
                          p_nvel_txto  => 1);

    o_mnsje_rspsta := 'Declaracion aplicada con exito.';

  exception
    when others then
      o_cdgo_rspsta  := 9;
      o_mnsje_rspsta := o_cdgo_rspsta ||
                        '. No fue posible aplicar la declaracion #[' ||
                        p_id_dclrcion || '], intentelo mas tarde. ' ||
                        SQLERRM || ' TRACE: ' ||
                        DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;

      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => (o_mnsje_rspsta || ' Error: ' ||
                                            sqlerrm),
                            p_nvel_txto  => 3);
  end prc_ap_declaracion;

  procedure prc_rg_declaracion_externa(p_cdgo_clnte                 in number,
                                       p_id_impsto                  in number,
                                       p_id_impsto_sbmpsto          in number,
                                       p_id_usrio                   in number,
                                       p_id_dcl_crga                in number,
                                       p_id_prcso_crga              in number,
                                       p_id_frmlrio                 in number,
                                       p_prdcdd                     in varchar2,
                                       p_id_dclrcion_vgncia_frmlrio in number default null,
                                       p_id_bnco                    in number,
                                       p_id_bnco_cnta               in number,
                                       p_indcdor_prcsdo             in varchar2,
                                       p_id_vld_dplcdo              in varchar2 default 'N',
                                       o_cdgo_rspsta                out number,
                                       o_mnsje_rspsta               out varchar2) as
    v_nvel         number;
    v_nmbre_up     varchar2(200) := 'pkg_gi_declaraciones_utlddes.prc_rg_declaracion_externa';
    v_mnsje_rspsta varchar2(4000);

    v_id_sjto_impsto   si_i_sujetos_impuesto.id_sjto_impsto%type;
    v_json             clob;
    v_resultado        clob;
    v_colmna           clob;
    v_id_intrmdia_dian number;

    v_json_tmpral clob;
    v_json_final  clob;
    v_id_dclrcion number;
    v_id_lqdcion  number;

    v_rcdo_cntrol                number;
    v_fcha_cntrol                date;
    v_id_rcdo                    number;
    v_prdo                       number;
    v_id_prdo                    number;
    v_dcl_vgc_tpo                number;
    v_id_dcl_tpo                 number;
    v_prcsdos                    number;
    v_vgn_frm                    number;
    v_id_cncpto                  number;
    v_frmlrio                    number;
    v_rgn                        number;
    v_atrbto                     number;
    v_vlor                       clob;
    v_vlor_gnrco                 clob;
    v_id_dclrcion_vgncia_frmlrio number;
    v_exste_incial               number;
    v_cdgo_prdcdad               varchar2(5);

    v_vlor_sldo_fvor number := 0; --19/03/2025 mejora de Declaraciones V2
  begin

    --Determinamos el nivel del Log de la UP
    v_nvel := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_nmbre_up);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nvel,
                          'Proceso iniciado',
                          1);

    o_cdgo_rspsta := 0;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nvel,
                          'parametros: p_id_impsto=>' || p_id_impsto ||
                          ' - p_id_impsto_sbmpsto=>' || p_id_impsto_sbmpsto ||
                          ' - p_id_usrio=>' || p_id_usrio ||
                          ' - p_id_dcl_crga=>' || p_id_dcl_crga

                          || ' - p_indcdor_prcsdo=>' || p_indcdor_prcsdo ||
                          ' - p_id_prcso_crga=>' || p_id_prcso_crga ||
                          ' - p_id_dclrcion_vgncia_frmlrio=>' ||
                          p_id_dclrcion_vgncia_frmlrio || ' - p_id_bnco=>' ||
                          p_id_bnco || ' - p_id_bnco_cnta=>' ||
                          p_id_bnco_cnta,
                          1);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nvel,
                          'Antes del c_dclrcion' || p_indcdor_prcsdo,
                          6);
    for c_dclrcion in (select a.*
                         from gi_g_intermedia_dian a
                        where id_prcso_crga = p_id_prcso_crga
                          and indcdor_prcsdo = p_indcdor_prcsdo --E
                       ) loop
      begin
        --insert into muerto (n_001,v_001,t_001) values(555,'dentro del for c_dclrcion in',systimestamp );commit;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nvel,
                              'dentro del c_dclrcion: ' ||
                              c_dclrcion.idntfccion,
                              6);

        begin
          select id_sjto_impsto
            into v_id_sjto_impsto
            from v_si_i_sujetos_impuesto
           where cdgo_clnte = p_cdgo_clnte
             and id_impsto = p_id_impsto
                --and     id_impsto_sbmpsto = p_id_impsto_sbmpsto
             and idntfccion_sjto = TO_CHAR(c_dclrcion.idntfccion)
             and id_sjto_estdo in (1, 3);

          --insert into muerto (n_001,v_001,t_001) values(555,'v_id_sjto_impsto=>'||v_id_sjto_impsto,systimestamp );commit;
          --pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_nmbre_up,  v_nvel, 'dentro del bloque sujeto-impuesto', 6);

        exception
          when no_data_found then
            rollback;
            v_mnsje_rspsta := 'La identificaci?n no existe en el sistema.';
            update gi_g_intermedia_dian
               set mnsje_prcsdo = v_mnsje_rspsta, indcdor_prcsdo = 'E'
             where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
            commit;
            continue;

          when others then
            rollback;
            v_mnsje_rspsta := 'Error al buscar sujeto impuesto - ' ||
                              sqlerrm;
            update gi_g_intermedia_dian
               set mnsje_prcsdo = v_mnsje_rspsta, indcdor_prcsdo = 'E'
             where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
            commit;
            continue;
        end;

        --------quedamos hasta aqu?----------
        -- Se consulta tipo de declaraci?n y tipo formulario de la carga
        begin
          select id_dclrcn_tpo, id_frmlrio, cdgo_prdcdad
            into v_id_dcl_tpo, v_frmlrio, v_cdgo_prdcdad
            from gi_g_dclrcnes_crga
           where id_dclrcnes_crga = p_id_dcl_crga;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nvel,
                                'v_id_dcl_tpo->' || v_id_dcl_tpo ||
                                'v_frmlrio->' || v_frmlrio ||
                                'v_cdgo_prdcdad->' || v_cdgo_prdcdad,
                                6);

        exception
          when no_data_found then
            rollback;
            v_mnsje_rspsta := 'No se encontraron el id declaracion tipo ni el id formulario.';
            update gi_g_intermedia_dian
               set mnsje_prcsdo = v_mnsje_rspsta, indcdor_prcsdo = 'E'
             where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
            commit;
            continue;

          when others then
            rollback;
            v_mnsje_rspsta := 'Error al buscar el id declaracion tipo ni el id formulario. - ' ||
                              sqlerrm;
            update gi_g_intermedia_dian
               set mnsje_prcsdo = v_mnsje_rspsta, indcdor_prcsdo = 'E'
             where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
            commit;
            continue;
        end;

        -- Se consulta el id_prdo de la vigencia
        begin
          select id_prdo
            into v_id_prdo
            from df_i_periodos
           where vgncia = c_dclrcion.vgncia_grvble
             and prdo = c_dclrcion.prdo_grvble
             and cdgo_prdcdad = p_prdcdd
             and id_impsto = p_id_impsto
             and id_impsto_sbmpsto = p_id_impsto_sbmpsto;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nvel,
                                'v_id_prdo->' || v_id_prdo,
                                6);

        exception
          when no_data_found then
            rollback;
            v_mnsje_rspsta := 'No se encontr? el id Periodo';
            update gi_g_intermedia_dian
               set mnsje_prcsdo = v_mnsje_rspsta, indcdor_prcsdo = 'E'
             where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
            commit;
            continue;

          when others then
            rollback;
            v_mnsje_rspsta := 'Error al buscar el id Periodo - ' || sqlerrm;
            update gi_g_intermedia_dian
               set mnsje_prcsdo = v_mnsje_rspsta, indcdor_prcsdo = 'E'
             where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
            commit;
            continue;
        end;

        -- Se consulta el tipo vigencia del tipo de declaraci?n
        begin
          select id_dclrcion_tpo_vgncia
            into v_dcl_vgc_tpo
            from gi_d_dclrcnes_tpos_vgncias
           where id_dclrcn_tpo = v_id_dcl_tpo
             and vgncia = c_dclrcion.vgncia_grvble
             and id_prdo = v_id_prdo;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nvel,
                                'v_dcl_vgc_tpo->' || v_dcl_vgc_tpo,
                                6);

        exception
          when no_data_found then
            rollback;
            v_mnsje_rspsta := 'No se encontr? el id declaracion tipo vigencia.';
            update gi_g_intermedia_dian
               set mnsje_prcsdo = v_mnsje_rspsta, indcdor_prcsdo = 'E'
             where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
            commit;
            continue;

          when others then
            rollback;
            v_mnsje_rspsta := 'Error al buscar el id declaracion tipo vigencia. - ' ||
                              sqlerrm;
            update gi_g_intermedia_dian
               set mnsje_prcsdo = v_mnsje_rspsta, indcdor_prcsdo = 'E'
             where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
            commit;
            continue;
        end;

        -- Se consulta el id de la declaraci?n vigencia formulario
        begin
          select id_dclrcion_vgncia_frmlrio
            into v_vgn_frm
            from gi_d_dclrcnes_vgncias_frmlr
           where id_dclrcion_tpo_vgncia = v_dcl_vgc_tpo
                --and id_dclrcn_tpo= v_id_dcl_tpo
             and id_frmlrio = v_frmlrio;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                null,
                                v_nmbre_up,
                                v_nvel,
                                'v_vgn_frm-->' || v_vgn_frm,
                                6);
        exception
          when no_data_found then
            rollback;
            v_mnsje_rspsta := 'No se encontr? el id declaracion vigencia formulario.';
            update gi_g_intermedia_dian
               set mnsje_prcsdo = v_mnsje_rspsta, indcdor_prcsdo = 'E'
             where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
            commit;
            continue;

          when others then
            rollback;
            v_mnsje_rspsta := 'Error al buscar el id declaracion vigencia formulario - ' ||
                              sqlerrm;
            update gi_g_intermedia_dian
               set mnsje_prcsdo = v_mnsje_rspsta, indcdor_prcsdo = 'E'
             where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
            commit;
            continue;
        end;
        -----------------------------
        begin

          --pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_nmbre_up,  v_nvel, 'Entrando bloque intermedia_dia', 6);
          --insert into muerto (n_001,v_001,t_001) values(555,'Entrando bloque intermedia_dia',systimestamp );commit;

          for c_clmnas in (select c.nmbre_clmna,
                                  d.nmbre_clmna_dstno,
                                  b.id_frmlrio_rgion,
                                  b.id_frmlrio_rgion_atrbto,
                                  a.id_dclrcnes_crga,
                                  b.vlor_gnrco
                             from gi_g_dclrcnes_crga a
                             join gi_g_dclrcnes_carga_detalle b
                               on a.id_dclrcnes_crga = b.id_dclrcnes_crga
                             left join et_d_reglas_intermedia c
                               on b.id_rgla_intrmdia = c.id_rgla_intrmdia
                             left join v_et_g_reglas_gestion d
                               on a.id_crga = d.id_crga
                              and c.nmbre_clmna = d.clmna_orgen
                            where a.id_dclrcnes_crga = p_id_dcl_crga) loop

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nvel,
                                  'Entrando c_clmnas: ' ||
                                  c_clmnas.nmbre_clmna_dstno,
                                  6);
            --insert into muerto (n_001,v_001,t_001) values(555,'Entrando for c_clmnas in',systimestamp );commit;

            v_resultado := nvl(c_clmnas.nmbre_clmna_dstno, 'N');
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_nmbre_up,
                                  v_nvel,
                                  'v_resultado =>' || v_resultado,
                                  6);

            for c_vlr in (SELECT columna, valor
                            FROM (select TO_CHAR(ID_INTRMDIA_DIAN) as ID_INTRMDIA_DIAN,
                                         TO_CHAR(VGNCIA_GRVBLE) as VGNCIA_GRVBLE,
                                         TO_CHAR(PRDO_GRVBLE) as PRDO_GRVBLE,
                                         TO_CHAR(TPO_IDNTFCCION) as TPO_IDNTFCCION,
                                         TO_CHAR(IDNTFCCION) as IDNTFCCION,
                                         TO_CHAR(RZON_SCIAL) as RZON_SCIAL,
                                         TO_CHAR(DRCCION_SCCNAL) as DRCCION_SCCNAL,
                                         TO_CHAR(CNSCTVO_DCLRCION) as CNSCTVO_DCLRCION,
                                         TO_CHAR(FCHA_RCDO) as FCHA_RCDO,
                                         TO_CHAR(PGO_TTAL_ICAC) as PGO_TTAL_ICAC,
                                         TO_CHAR(INTRSES_ICAC) as INTRSES_ICAC,
                                         TO_CHAR(SNCNES_ICAC) as SNCNES_ICAC,
                                         TO_CHAR(TTAL_INGRSOS_BRTO) as TTAL_INGRSOS_BRTO,
                                         TO_CHAR(DVLCNES_RBJAS_DSC) as DVLCNES_RBJAS_DSC,
                                         --MNOS_INGRSOS_X_EXP,
                                         --MNOS_INGRSOS_X_VNTA,
                                         TO_CHAR(INGRSOS_EXNTOS) as INGRSOS_EXNTOS,
                                         TO_CHAR(TTAL_INGRSOS_GRVBLE) as TTAL_INGRSOS_GRVBLE,
                                         TO_CHAR(TTAL_IMPSTO_ICA) as TTAL_IMPSTO_ICA,
                                         TO_CHAR(RTNCNES_O_AUTORTNCNES) as RTNCNES_O_AUTORTNCNES,
                                         TO_CHAR(SLDO_PGAR) as SLDO_PGAR,
                                         TO_CHAR(ID_DCLRCION) as ID_DCLRCION,
                                         TO_CHAR(INDCDOR_PRCSDO) as INDCDOR_PRCSDO,
                                         TO_CHAR(ID_PRCSO_CRGA) as ID_PRCSO_CRGA,
                                         TO_CHAR(ID_PRCSO_INTRMDIA) as ID_PRCSO_INTRMDIA,
                                         TO_CHAR(NMERO_LNEA) as NMERO_LNEA,
                                         TO_CHAR(MNSJE_PRCSDO) as MNSJE_PRCSDO
                                    from gi_g_intermedia_dian
                                   where id_intrmdia_dian =
                                         c_dclrcion.id_intrmdia_dian) intermedia

                                 unpivot(valor for columna in(ID_INTRMDIA_DIAN,
                                                              VGNCIA_GRVBLE,
                                                              PRDO_GRVBLE,
                                                              TPO_IDNTFCCION,
                                                              IDNTFCCION,
                                                              RZON_SCIAL,
                                                              DRCCION_SCCNAL,
                                                              CNSCTVO_DCLRCION,
                                                              FCHA_RCDO,
                                                              PGO_TTAL_ICAC,
                                                              INTRSES_ICAC,
                                                              SNCNES_ICAC,
                                                              TTAL_INGRSOS_BRTO,
                                                              DVLCNES_RBJAS_DSC,
                                                              --MNOS_INGRSOS_X_EXP,
                                                              --MNOS_INGRSOS_X_VNTA,
                                                              INGRSOS_EXNTOS,
                                                              TTAL_INGRSOS_GRVBLE,
                                                              TTAL_IMPSTO_ICA,
                                                              RTNCNES_O_AUTORTNCNES,
                                                              SLDO_PGAR,
                                                              ID_DCLRCION,
                                                              INDCDOR_PRCSDO,
                                                              ID_PRCSO_CRGA,
                                                              ID_PRCSO_INTRMDIA,
                                                              NMERO_LNEA,
                                                              MNSJE_PRCSDO))) loop
              --insert into muerto (n_001,v_001,t_001) values (555,'dentro del cursor c_vlr',systimestamp);commit;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_nmbre_up,
                                    v_nvel,
                                    'dentro del cursor c_vlr: ' ||
                                    c_vlr.columna,
                                    6);
              --pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_nmbre_up,  v_nvel, 'dentro del cursor v_resultado: '||v_resultado, 6);

              if (c_vlr.columna = v_resultado and v_resultado <> 'N') then

                select JSON_OBJECT('ID' VALUE
                                   'RGN' || c_clmnas.id_frmlrio_rgion ||
                                   'ATR' ||
                                   c_clmnas.id_frmlrio_rgion_atrbto ||
                                   'FLA' || 1,
                                   'ID_FRMLRIO_RGION' VALUE
                                   TO_CHAR(c_clmnas.id_frmlrio_rgion),
                                   'ID_FRMLRIO_RGION_ATRBTO' VALUE
                                   TO_CHAR(c_clmnas.id_frmlrio_rgion_atrbto),
                                   'FLA' VALUE 1,
                                   'NEW' VALUE TO_CHAR(c_vlr.valor),
                                   'DISPLAY' VALUE TO_CHAR(c_vlr.valor),
                                   'ACCION' VALUE 'I',
                                   'ORDEN' VALUE '1')
                  INTO v_json
                  FROM DUAL;

                --insert into muerto (n_001,v_001,t_001) values(555,'Entrando al if',systimestamp );commit;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nvel,
                                      'v_json v_resultado[' || v_resultado ||
                                      ']-->' || v_json,
                                      6);
                -- DBMS_OUTPUT.put_line(v_json);
                --insert into muerto (n_001,v_001,t_001) values(555,'antes insert into gi_g_dclrcnes_crga_trza',systimestamp );commit;

                insert into gi_g_dclrcnes_crga_trza
                  (id,
                   id_frmlrio_rgion,
                   id_frmlrio_rgion_atrbto,
                   fla,
                   new_valor,
                   display,
                   accion,
                   orden)
                values
                  ('RGN' || c_clmnas.id_frmlrio_rgion || 'ATR' ||
                   c_clmnas.id_frmlrio_rgion_atrbto || 'FLA' || 1,
                   TO_CHAR(c_clmnas.id_frmlrio_rgion),
                   TO_CHAR(c_clmnas.id_frmlrio_rgion_atrbto),
                   '1',
                   TO_CHAR(c_vlr.valor),
                   TO_CHAR(c_vlr.valor),
                   'I',
                   '1');
                --commit;
                --insert into muerto (n_001,v_001,t_001) values(555,'despues insert into gi_g_dclrcnes_crga_trza',systimestamp );commit;
                --pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_nmbre_up,  v_nvel, 'despues del insert gi_g_dclrcnes_crga_trza', 6);

                --elsif (c_vlr.columna = v_resultado and c_clmnas.vlor_gnrco is not null) then
              elsif (v_resultado = 'N' and c_clmnas.vlor_gnrco is not null) then
                select JSON_OBJECT('ID' VALUE
                                   'RGN' || c_clmnas.id_frmlrio_rgion ||
                                   'ATR' ||
                                   c_clmnas.id_frmlrio_rgion_atrbto ||
                                   'FLA' || 1,
                                   'ID_FRMLRIO_RGION' VALUE
                                   TO_CHAR(c_clmnas.id_frmlrio_rgion),
                                   'ID_FRMLRIO_RGION_ATRBTO' VALUE
                                   TO_CHAR(c_clmnas.id_frmlrio_rgion_atrbto),
                                   'FLA' VALUE 1,
                                   'NEW' VALUE TO_CHAR(c_clmnas.vlor_gnrco),
                                   'DISPLAY' VALUE
                                   TO_CHAR(c_clmnas.vlor_gnrco),
                                   'ACCION' VALUE 'I',
                                   'ORDEN' VALUE '1')
                  INTO v_json
                  FROM DUAL;
                --insert into muerto (n_001,v_001,t_001) values(555,'Entrando al if',systimestamp );commit;
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_nmbre_up,
                                      v_nvel,
                                      'v_json v_resultado N[' ||
                                      v_resultado || ']-->' || v_json,
                                      6);

                -- DBMS_OUTPUT.put_line(v_json);
                --insert into muerto (n_001,v_001,t_001) values(555,'antes insert into gi_g_dclrcnes_crga_trza',systimestamp );commit;

                insert into gi_g_dclrcnes_crga_trza
                  (id,
                   id_frmlrio_rgion,
                   id_frmlrio_rgion_atrbto,
                   fla,
                   new_valor,
                   display,
                   accion,
                   orden)
                values
                  ('RGN' || c_clmnas.id_frmlrio_rgion || 'ATR' ||
                   c_clmnas.id_frmlrio_rgion_atrbto || 'FLA' || 1,
                   TO_CHAR(c_clmnas.id_frmlrio_rgion),
                   TO_CHAR(c_clmnas.id_frmlrio_rgion_atrbto),
                   '1',
                   TO_CHAR(c_clmnas.vlor_gnrco),
                   TO_CHAR(c_clmnas.vlor_gnrco),
                   'I',
                   '1');

                exit;
                --commit;
                --insert into muerto (n_001,v_001,t_001) values(555,'despues insert into gi_g_dclrcnes_crga_trza',systimestamp );commit;
                --pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_nmbre_up,  v_nvel, 'despues del insert gi_g_dclrcnes_crga_trza', 6);
              end if;

            end loop;
          end loop;

          select JSON_ARRAYAGG(JSON_OBJECT('ID' VALUE ID,
                                           'ID_FRMLRIO_RGION' VALUE
                                           TO_CHAR(ID_FRMLRIO_RGION),
                                           'ID_FRMLRIO_RGION_ATRBTO' VALUE
                                           TO_CHAR(ID_FRMLRIO_RGION_ATRBTO),
                                           'FLA' VALUE TO_CHAR(FLA),
                                           'NEW' VALUE TO_CHAR(new_valor),
                                           'DISPLAY' VALUE TO_CHAR(display),
                                           'ACCION' VALUE 'I',
                                           'ORDEN' VALUE ORDEN) RETURNING CLOB)
            INTO v_json
            FROM gi_g_dclrcnes_crga_trza;
          --insert into muerto (n_001,v_001,t_001) values(555,'despues select   JSON_ARRAYAGG(JSON_OBJECT( ID VALUE ID',systimestamp );commit;
          --pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_nmbre_up,  v_nvel, 'despues del insert gi_g_dclrcnes_crga_trza', 6);

          --DBMS_OUTPUT.put_line(TO_CLOB(v_json));

          delete gi_g_dclrcnes_crga_trza;
        end;

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_nmbre_up,
                              v_nvel,
                              'v_json-->' || v_json,
                              6);

        -- Se registra la declaracion
        --insert into muerto (n_001,v_001,t_001) values(555,'Antes de pkg_gi_declaraciones.prc_rg_declaracion',systimestamp );commit;

        begin

          select count(1)
            into v_exste_incial
            from gi_g_declaraciones b
           where b.id_sjto_impsto = v_id_sjto_impsto
             and b.id_dclrcion_vgncia_frmlrio = v_vgn_frm;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => 'existe inicial:' ||
                                                v_exste_incial ||
                                                ' - p_id_vld_dplcdo:' ||
                                                p_id_vld_dplcdo,
                                p_nvel_txto  => 3);

        exception
          when others then
            null;
        end;

        if (p_id_vld_dplcdo = 'S' or
           (p_id_vld_dplcdo = 'N' and v_exste_incial = 0)) then

          begin
            v_id_dclrcion := null;
            --VALIDA SI LA DECLARACI?N EXISTE

            pkg_gi_declaraciones.prc_rg_declaracion(p_cdgo_clnte                 => p_cdgo_clnte,
                                                    p_id_dclrcion_vgncia_frmlrio => v_vgn_frm,
                                                    p_id_cnddto_vgncia           => null,
                                                    p_id_usrio                   => p_id_usrio,
                                                    p_json                       => v_json,
                                                    p_id_orgen_tpo               => 2,
                                                    p_id_dclrcion                => v_id_dclrcion,
                                                    p_id_sjto_impsto             => v_id_sjto_impsto,
                                                    o_cdgo_rspsta                => o_cdgo_rspsta,
                                                    o_mnsje_rspsta               => o_mnsje_rspsta);
            pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => 'o_cdgo_rspsta: ' ||
                                                  o_cdgo_rspsta ||
                                                  ' - v_id_dclrcion :' ||
                                                  v_id_dclrcion,
                                  p_nvel_txto  => 3);

            update gi_g_declaraciones
               set cdgo_dclrcion_estdo = 'PRS'
             where id_dclrcion = v_id_dclrcion;

            if o_cdgo_rspsta <> 0 then
              rollback;
              o_cdgo_rspsta  := 10;
              o_mnsje_rspsta := o_cdgo_rspsta ||
                                '. No se pudo registrar la declaracion [' ||
                                c_dclrcion.cnsctvo_dclrcion || '] para: ' ||
                                c_dclrcion.idntfccion || ' - ' ||
                                o_mnsje_rspsta;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => o_mnsje_rspsta,
                                    p_nvel_txto  => 3);

              update gi_g_intermedia_dian
                 set mnsje_prcsdo   = 'No se pudo registrar la declaracion - ' ||
                                      o_mnsje_rspsta,
                     indcdor_prcsdo = 'E'
               where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
              commit;
              continue;
            end if;
            --commit;
          exception
            when others then
              rollback;
              o_cdgo_rspsta  := 20;
              o_mnsje_rspsta := o_cdgo_rspsta ||
                                '. No se pudo registrar la declaracion [' ||
                                c_dclrcion.cnsctvo_dclrcion || '] para: ' ||
                                c_dclrcion.idntfccion || ' Error: ' ||
                                sqlerrm;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => o_mnsje_rspsta,
                                    p_nvel_txto  => 3);

              update gi_g_intermedia_dian
                 set mnsje_prcsdo = o_mnsje_rspsta, indcdor_prcsdo = 'E'
               where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
              commit;
              continue;
          end;

          -- Se reconstruye el recaudo
          -- se registra el recaudo control
          begin

            pkg_re_recaudos.prc_rg_recaudo_control(p_cdgo_clnte        => p_cdgo_clnte,
                                                   p_id_impsto         => p_id_impsto,
                                                   p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,
                                                   p_id_bnco           => p_id_bnco,
                                                   p_id_bnco_cnta      => p_id_bnco_cnta,
                                                   p_fcha_cntrol       => to_date(c_dclrcion.fcha_rcdo,
                                                                                  'DD/MM/YYYY'),
                                                   p_obsrvcion         => 'Control de pago declaraciones externas.',
                                                   p_cdgo_rcdo_orgen   => 'AD' -- Archivo DIAN
                                                  ,
                                                   p_id_usrio          => p_id_usrio,
                                                   o_id_rcdo_cntrol    => v_rcdo_cntrol,
                                                   o_cdgo_rspsta       => o_cdgo_rspsta,
                                                   o_mnsje_rspsta      => o_mnsje_rspsta);
            pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => 'v_rcdo_cntrol: ' ||
                                                  v_rcdo_cntrol,
                                  p_nvel_txto  => 3);

            if o_cdgo_rspsta <> 0 then
              rollback;
              o_cdgo_rspsta  := 30;
              o_mnsje_rspsta := o_cdgo_rspsta ||
                                '. No se pudo registrar el recaudo control declaraci?n [' ||
                                c_dclrcion.cnsctvo_dclrcion || '] para: ' ||
                                c_dclrcion.idntfccion || ' - ' ||
                                o_mnsje_rspsta;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => o_mnsje_rspsta,
                                    p_nvel_txto  => 3);

              update gi_g_intermedia_dian
                 set mnsje_prcsdo = o_mnsje_rspsta, indcdor_prcsdo = 'E'
               where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
              commit;
              continue;
            end if;

          exception
            when others then
              rollback;
              o_cdgo_rspsta  := 40;
              o_mnsje_rspsta := o_cdgo_rspsta ||
                                '. No se pudo registrar el recaudo control declaraci?n [' ||
                                c_dclrcion.cnsctvo_dclrcion || '] para: ' ||
                                c_dclrcion.idntfccion || ' Error: ' ||
                                sqlerrm;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => o_mnsje_rspsta,
                                    p_nvel_txto  => 3);

              update gi_g_intermedia_dian
                 set mnsje_prcsdo = o_mnsje_rspsta, indcdor_prcsdo = 'E'
               where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
              commit;
              continue;
          end;

          -- se registra el recaudo
          begin
            pkg_re_recaudos.prc_rg_recaudo(p_cdgo_clnte         => p_cdgo_clnte,
                                           p_id_rcdo_cntrol     => v_rcdo_cntrol,
                                           p_id_sjto_impsto     => v_id_sjto_impsto,
                                           p_cdgo_rcdo_orgn_tpo => 'DL',
                                           p_id_orgen           => v_id_dclrcion,
                                           p_vlor               => c_dclrcion.pgo_ttal_icac --v_vlor_ttal_dcmnto --????
                                          ,
                                           p_obsrvcion          => 'Recaudo archivo DIAN',
                                           p_cdgo_frma_pgo      => 'TR' -- Transferencia
                                          ,
                                           p_cdgo_rcdo_estdo    => 'RG' -- Se coloca RG para que se pueda aplicar.
                                          ,
                                           o_id_rcdo            => v_id_rcdo,
                                           o_cdgo_rspsta        => o_cdgo_rspsta,
                                           o_mnsje_rspsta       => o_mnsje_rspsta);
            pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => 'v_id_rcdo: ' || v_id_rcdo,
                                  p_nvel_txto  => 3);

            if o_cdgo_rspsta <> 0 then
              rollback;
              o_cdgo_rspsta  := 50;
              o_mnsje_rspsta := o_cdgo_rspsta ||
                                '. No se pudo registrar el recaudo declaraci?n [' ||
                                c_dclrcion.cnsctvo_dclrcion || '] para: ' ||
                                c_dclrcion.idntfccion || ' - ' ||
                                o_mnsje_rspsta;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => o_mnsje_rspsta,
                                    p_nvel_txto  => 3);

              update gi_g_intermedia_dian
                 set mnsje_prcsdo = o_mnsje_rspsta, indcdor_prcsdo = 'E'
               where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
              commit;
              continue;
            end if;

          exception
            when others then
              rollback;
              o_cdgo_rspsta  := 60;
              o_mnsje_rspsta := o_cdgo_rspsta ||
                                '. No se pudo registrar el recaudo declaraci?n [' ||
                                c_dclrcion.cnsctvo_dclrcion || '] para: ' ||
                                c_dclrcion.idntfccion || ' Error: ' ||
                                sqlerrm;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => o_mnsje_rspsta,
                                    p_nvel_txto  => 3);

              update gi_g_intermedia_dian
                 set mnsje_prcsdo = o_mnsje_rspsta, indcdor_prcsdo = 'E'
               where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
              commit;
              continue;
          end;

          --Se recrea el recaudo
          --1. Aplicacion de Declaracion:
          -- Crea la liquidaci?n
          -- Baja los movimientos a cartera
          -- Actualiza los Movimientos Financieros a Declaraci?n MF(gi_g_dclrcnes_mvmnto_fnncro)
          begin
            pkg_gi_declaraciones_utlddes.prc_ap_declaracion(p_cdgo_clnte     => p_cdgo_clnte,
                                                            p_id_usrio       => p_id_usrio,
                                                            p_id_dclrcion    => v_id_dclrcion,
                                                            o_vlor_sldo_fvor => v_vlor_sldo_fvor, --19/03/2025 mejora de Declaraciones V2
                                                            o_cdgo_rspsta    => o_cdgo_rspsta,
                                                            o_mnsje_rspsta   => o_mnsje_rspsta);

            pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => 'Termina prc_ap_declaracion',
                                  p_nvel_txto  => 3);

            if o_cdgo_rspsta <> 0 then
              rollback;
              o_cdgo_rspsta  := 65;
              o_mnsje_rspsta := o_cdgo_rspsta ||
                                '. No se pudo aplicar la declaraci?n [' ||
                                c_dclrcion.cnsctvo_dclrcion || '] para: ' ||
                                c_dclrcion.idntfccion || ' - ' ||
                                o_mnsje_rspsta;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => o_mnsje_rspsta,
                                    p_nvel_txto  => 3);

              update gi_g_intermedia_dian
                 set mnsje_prcsdo = o_mnsje_rspsta, indcdor_prcsdo = 'E'
               where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
              commit;
              continue;
            end if;

          exception
            when others then
              rollback;
              o_cdgo_rspsta  := 70;
              o_mnsje_rspsta := o_cdgo_rspsta ||
                                '. No se pudo aplicar la declaraci?n [' ||
                                c_dclrcion.cnsctvo_dclrcion || '] para: ' ||
                                c_dclrcion.idntfccion || ' Error: ' ||
                                sqlerrm;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => o_mnsje_rspsta,
                                    p_nvel_txto  => 3);

              update gi_g_intermedia_dian
                 set mnsje_prcsdo = o_mnsje_rspsta, indcdor_prcsdo = 'E'
               where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
              commit;
              continue;
          end;

          -- Actualizar movimientos del origen con fecha recaudo del archivo
          begin
            select id_lqdcion, id_dclrcion_vgncia_frmlrio
              into v_id_lqdcion, v_id_dclrcion_vgncia_frmlrio
              from gi_g_declaraciones g
             where id_dclrcion = v_id_dclrcion;
          exception
            when others then
              rollback;
              o_cdgo_rspsta  := 75;
              o_mnsje_rspsta := o_cdgo_rspsta ||
                                '. No se pudo encontrar la declaraci?n para: ' ||
                                c_dclrcion.cnsctvo_dclrcion || ' - ' ||
                                o_mnsje_rspsta || ' Error: ' || sqlerrm;
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => o_mnsje_rspsta,
                                    p_nvel_txto  => 3);

              update gi_g_intermedia_dian
                 set mnsje_prcsdo = o_mnsje_rspsta, indcdor_prcsdo = 'E'
               where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
              commit;
              continue;
          end;

          update gi_g_liquidaciones
             set fcha_lqdcion = to_date(c_dclrcion.fcha_rcdo, 'dd/mm/yyyy')
           where id_lqdcion = v_id_lqdcion;

          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => 'Actualiza fecha de liqudiaci?n: ' ||
                                                v_id_lqdcion,
                                p_nvel_txto  => 3);

          update gf_g_movimientos_detalle
             set fcha_mvmnto = to_date(c_dclrcion.fcha_rcdo, 'dd/mm/yyyy')
           where cdgo_mvmnto_orgn = 'LQ'
             and id_orgen = v_id_lqdcion;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => 'Actualiza fecha de cartera: ' ||
                                                v_id_lqdcion,
                                p_nvel_txto  => 3);

          --Indica si se Aplica el Recaudo de Declaracion
          if (c_dclrcion.pgo_ttal_icac > 0) then

            for c_crtra in (select *
                              from gf_g_movimientos_detalle
                             where cdgo_mvmnto_orgn = 'LQ'
                               and id_orgen = v_id_lqdcion
                               and vlor_dbe > 0) loop

              --Inserta los Movimientos Financiero de Capital(PC)
              begin
                insert into gf_g_movimientos_detalle
                  (id_mvmnto_fncro,
                   cdgo_mvmnto_orgn,
                   id_orgen,
                   cdgo_mvmnto_tpo,
                   vgncia,
                   id_prdo,
                   cdgo_prdcdad,
                   fcha_mvmnto,
                   id_cncpto,
                   id_cncpto_csdo,
                   vlor_dbe,
                   vlor_hber,
                   actvo,
                   gnra_intres_mra,
                   fcha_vncmnto,
                   id_impsto_acto_cncpto)
                values
                  (c_crtra.id_mvmnto_fncro,
                   'RE',
                   v_id_rcdo,
                   'PC',
                   c_crtra.vgncia,
                   c_crtra.id_prdo,
                   c_crtra.cdgo_prdcdad,
                   c_crtra.fcha_mvmnto,
                   c_crtra.id_cncpto,
                   c_crtra.id_cncpto_csdo,
                   0,
                   c_crtra.vlor_dbe,
                   'S',
                   'N',
                   c_crtra.fcha_vncmnto,
                   c_crtra.id_impsto_acto_cncpto);
              exception
                when others then
                  rollback;
                  o_cdgo_rspsta  := 80;
                  o_mnsje_rspsta := o_cdgo_rspsta ||
                                    '. No fue posible crear el movimiento financiero para la declaracion ' ||
                                    c_dclrcion.cnsctvo_dclrcion ||
                                    ' Error: ' || sqlerrm;
                  pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                        p_id_impsto  => null,
                                        p_nmbre_up   => v_nmbre_up,
                                        p_nvel_log   => v_nvel,
                                        p_txto_log   => o_mnsje_rspsta,
                                        p_nvel_txto  => 3);

                  update gi_g_intermedia_dian
                     set mnsje_prcsdo   = o_mnsje_rspsta,
                         indcdor_prcsdo = 'E'
                   where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
                  commit;
                  continue;
              end;

              -- se registran los movimientos PI e IT
              if c_crtra.gnra_intres_mra = 'S' then
                -- Se busca el concepto de interes asociado al concepto Capital
                begin

                  select b.id_cncpto,
                         a.id_frmlrio_rgion,
                         b.id_frmlrio_rgion_atrbto
                    into v_id_cncpto, v_rgn, v_atrbto
                    from gi_d_dclrcnes_acto_cncpto a
                    join gi_d_dclrcnes_cncpto_rlcnal b
                      on a.id_dclrcion_acto_cncpto =
                         b.id_dclrcion_acto_cncpto
                    join df_i_conceptos c
                      on b.id_cncpto = c.id_cncpto
                   where a.id_dclrcion_vgncia_frmlrio =
                         v_id_dclrcion_vgncia_frmlrio
                     and a.id_impsto_acto_cncpto =
                         c_crtra.id_impsto_acto_cncpto
                     and c.ctgria_cncpto = 'I';
                exception
                  when no_data_found then
                    continue;
                end;

                begin
                  select vlor
                    into v_vlor
                    from gi_g_declaraciones_detalle
                   where id_dclrcion = v_id_dclrcion
                     and id_frmlrio_rgion = v_rgn
                     and id_frmlrio_rgion_atrbto = v_atrbto;

                exception
                  when no_data_found then
                    continue;
                end;

                if to_number(v_vlor) > 0 then
                  -- Tipo movimiento IT
                  begin
                    insert into gf_g_movimientos_detalle
                      (id_mvmnto_fncro,
                       cdgo_mvmnto_orgn,
                       id_orgen,
                       cdgo_mvmnto_tpo,
                       vgncia,
                       id_prdo,
                       cdgo_prdcdad,
                       fcha_mvmnto,
                       id_cncpto,
                       id_cncpto_csdo,
                       vlor_dbe,
                       vlor_hber,
                       actvo,
                       gnra_intres_mra,
                       fcha_vncmnto,
                       id_impsto_acto_cncpto)
                      select id_mvmnto_fncro,
                             'RE',
                             v_id_rcdo,
                             'IT',
                             vgncia,
                             id_prdo,
                             cdgo_prdcdad,
                             fcha_mvmnto,
                             id_cncpto,
                             v_id_cncpto,
                             to_number(v_vlor),
                             0,
                             actvo,
                             'N',
                             fcha_vncmnto,
                             id_impsto_acto_cncpto
                        from gf_g_movimientos_detalle
                       where cdgo_mvmnto_orgn = 'LQ'
                         and id_orgen = v_id_lqdcion
                         and id_impsto_acto_cncpto =
                             c_crtra.id_impsto_acto_cncpto;
                  exception
                    when others then
                      rollback;
                      o_cdgo_rspsta  := 83;
                      o_mnsje_rspsta := o_cdgo_rspsta ||
                                        '. No fue posible crear el movimiento financiero IT para la declaracion ' ||
                                        c_dclrcion.cnsctvo_dclrcion ||
                                        ' Error: ' || sqlerrm;
                      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                            p_id_impsto  => null,
                                            p_nmbre_up   => v_nmbre_up,
                                            p_nvel_log   => v_nvel,
                                            p_txto_log   => o_mnsje_rspsta,
                                            p_nvel_txto  => 3);

                      update gi_g_intermedia_dian
                         set mnsje_prcsdo   = o_mnsje_rspsta,
                             indcdor_prcsdo = 'E'
                       where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
                      commit;
                      continue;
                  end;

                  -- Tipo movimiento PI
                  begin
                    insert into gf_g_movimientos_detalle
                      (id_mvmnto_fncro,
                       cdgo_mvmnto_orgn,
                       id_orgen,
                       cdgo_mvmnto_tpo,
                       vgncia,
                       id_prdo,
                       cdgo_prdcdad,
                       fcha_mvmnto,
                       id_cncpto,
                       id_cncpto_csdo,
                       vlor_dbe,
                       vlor_hber,
                       actvo,
                       gnra_intres_mra,
                       fcha_vncmnto,
                       id_impsto_acto_cncpto)
                      select id_mvmnto_fncro,
                             'RE',
                             v_id_rcdo,
                             'PI',
                             vgncia,
                             id_prdo,
                             cdgo_prdcdad,
                             fcha_mvmnto,
                             id_cncpto,
                             v_id_cncpto,
                             0,
                             to_number(v_vlor),
                             actvo,
                             'N',
                             fcha_vncmnto,
                             id_impsto_acto_cncpto
                        from gf_g_movimientos_detalle
                       where cdgo_mvmnto_orgn = 'LQ'
                         and id_orgen = v_id_lqdcion
                         and id_impsto_acto_cncpto =
                             c_crtra.id_impsto_acto_cncpto;
                  exception
                    when others then
                      rollback;
                      o_cdgo_rspsta  := 85;
                      o_mnsje_rspsta := o_cdgo_rspsta ||
                                        '. No fue posible crear el movimiento financiero PI para la declaracion ' ||
                                        c_dclrcion.cnsctvo_dclrcion ||
                                        ' Error: ' || sqlerrm;
                      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                            p_id_impsto  => null,
                                            p_nmbre_up   => v_nmbre_up,
                                            p_nvel_log   => v_nvel,
                                            p_txto_log   => o_mnsje_rspsta,
                                            p_nvel_txto  => 3);

                      update gi_g_intermedia_dian
                         set mnsje_prcsdo   = o_mnsje_rspsta,
                             indcdor_prcsdo = 'E'
                       where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
                      commit;
                      continue;
                  end;
                end if;
              end if;
            end loop;

          end if;

          --Actualiza el Consolidado de Cartera Despues de Aplicar Recaudo
          begin
            pkg_gf_movimientos_financiero.prc_ac_concepto_consolidado(p_cdgo_clnte     => p_cdgo_clnte,
                                                                      p_id_sjto_impsto => v_id_sjto_impsto);
          exception
            when others then
              rollback;
              o_cdgo_rspsta  := 90;
              o_mnsje_rspsta := 'No fue posible actualizar el consolidado del sujeto impuesto.';
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => (o_cdgo_rspsta || '-' ||
                                                    o_mnsje_rspsta || '.' ||
                                                    sqlerrm),
                                    p_nvel_txto  => 3);
              return;
          end;

          --Actualiza los Datos del Recaudo Aplicado
          update re_g_recaudos a
             set cdgo_rcdo_estdo  = 'AP',
                 fcha_apliccion   = systimestamp,
                 mnsje_rspsta     = nvl(o_mnsje_rspsta, 'Aplicado'),
                 id_usrio_aplco   = p_id_usrio,
                 fcha_ingrso_bnco = to_date(c_dclrcion.fcha_ingrso_bnco,
                                            'dd/mm/yyyy')
           where id_rcdo = v_id_rcdo
             and cdgo_rcdo_estdo = 'RG';

          --Actualiza la Liquidaci?n a Declaraci?n
          update gi_g_declaraciones
             set id_rcdo             = v_id_rcdo,
                 cdgo_dclrcion_estdo = 'APL',
                 fcha_rgstro         = to_date(c_dclrcion.fcha_rcdo,
                                               'dd/mm/yyyy'),
                 fcha_prsntcion      = to_date(c_dclrcion.fcha_rcdo,
                                               'dd/mm/yyyy'),
                 fcha_aplccion       = to_date(c_dclrcion.fcha_rcdo,
                                               'dd/mm/yyyy'),
                 id_usrio_aplccion   = p_id_usrio
           where id_dclrcion = v_id_dclrcion;

          -- Actualiza regsitro a PROCESADO
          update gi_g_intermedia_dian
             set indcdor_prcsdo = 'S'
           where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;

          commit;

        elsif (p_id_vld_dplcdo = 'N' and v_exste_incial <> 0) then
          -- o_cdgo_rspsta  := 85;
          rollback;
          o_mnsje_rspsta := 95 || '.Declaraci?n ya existe [' ||
                            c_dclrcion.cnsctvo_dclrcion || '] para: ' ||
                            c_dclrcion.idntfccion || ' Error: ' || sqlerrm;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 3);

          update gi_g_intermedia_dian
             set mnsje_prcsdo = o_mnsje_rspsta, indcdor_prcsdo = 'E'
           where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
          commit;

        end if;

      exception
        when others then
          rollback;
          o_cdgo_rspsta  := 100;
          o_mnsje_rspsta := o_cdgo_rspsta ||
                            '. No se pudo procesar declaraci?n [' ||
                            c_dclrcion.cnsctvo_dclrcion || '] para: ' ||
                            c_dclrcion.idntfccion || ' Error: ' || sqlerrm;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 3);

          update gi_g_intermedia_dian
             set mnsje_prcsdo = o_mnsje_rspsta, indcdor_prcsdo = 'E'
           where id_intrmdia_dian = c_dclrcion.id_intrmdia_dian;
          commit;

      end;

    end loop;

    if o_cdgo_rspsta = 0 then
      select count(1)
        into v_prcsdos
        from gi_g_intermedia_dian a
       where id_prcso_crga = p_id_prcso_crga
         and indcdor_prcsdo = 'N';

      -- Si se procesaron todos los registros, se marca el proceso de carga como procesado
      if v_prcsdos = 0 then
        update et_g_procesos_carga
           set indcdor_prcsdo = 'S'
         where id_prcso_crga = p_id_prcso_crga;
        commit;
      end if;
    end if;

  exception
    when others then
      rollback;
      o_cdgo_rspsta  := 200;
      o_mnsje_rspsta := o_cdgo_rspsta || '. Error al procesar carga --> ' ||
                        p_id_prcso_crga;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => p_cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => o_mnsje_rspsta || ' - ' ||
                                            sqlerrm,
                            p_nvel_txto  => 3);

  end prc_rg_declaracion_externa;

  /*
  * Función que retorna los conceptos pagados de la declaracion inicial
  * Creación      : 7/02/2024
  * Modificación  : 7/02/2024
  * Brayan Villegas
  */

  function fnc_co_cncptos_antriores(p_id_dclrcion in gi_g_declaraciones.id_dclrcion%type)
    return varchar2 as
    v_json_cncptos varchar2(4000);
  begin
    select json_object('CONCEPTOS' value
                       json_arrayagg(json_object(b.name value c.vlor -- c.vlor_dsplay
                                                 ))) as_json
      into v_json_cncptos
      from gi_d_formulario_hmlg_dtlle a
      join apex_190100.wwv_flow_step_items b
        on a.id_frmlrio_rgion_atrbto_pgna = b.id
      join gi_g_declaraciones_detalle c
        on c.id_frmlrio_rgion = a.id_frmlrio_rgion_orgn
       and c.id_frmlrio_rgion_atrbto = a.id_frmlrio_rgion_atrbto_orgn
     where c.id_dclrcion = p_id_dclrcion
       and b.source in ('CNCPTO_INDSTRIA_CMRCIO', --'VLOR_PGO_INDSTRIA_CMRCIO',  --CÁLCULO CONCEPTO ANTERIOR IMPUESTO INDUSTRIA Y COMERCIO
                        'CNCPTO_AVSOS_TBLROS', --'VLR_PGO_AVSOS_TBLROS',--CÁLCULO CONCEPTO ANTERIOR IMPUESTO DE AVISOS Y TABLEROS
                        'CNCPTO_SBRTSA_BMBRIL', --'CLCLO_VLR_PGO_SBRTSA_BMBRIL',--CÁLCULO CONCEPTO ANTERIOR SOBRETASA BOMBERIL
                        'ANTCPO_ANIO_SGNTE', --CÁLCULO CONCEPTO ANTERIOR ANTICIPO DEL AÑO SIGUIENTE DE SEGURIDAD
                        'CNCPTO_SBRTSA_SGRDAD', --CÁLCULO CONCEPTO ANTERIOR SOBRETASA DE SEGURIDAD
                        'CLCLO_DSCNTO_INDSTRIA_CMRCIO',
                        'CLCLO_DSCNTO_AVSOS_TBLROS',
                        'CLCLO_DSCNTO_SBRTSA_BMBRIL',
                        'CLCLO_DSCNTO_INTRES_IND_CMRCIO',
                        'CLCLO_DSCNTO_INTRES_AVSOS_TBLR',
                        'CLCLO_DSCNTO_INTRES_SBR_BMBRIL',
                        'INTRSES_MRA',
                        'TTL_PGAR',
                        'VLR_CNCPTO_SNCION',
                        'CLCLO_DSCNTO_SNCION',
                        'VLR_CNCPTO_ANTCPO',
                        'TTL_SLDO_FVOR',
                        'TTL_SLDO_CRGO');

    return v_json_cncptos;
  end fnc_co_cncptos_antriores;

  /*
      * @Descripción  : Aplicación de Ley Ineficaz a las Declaraciones vencidas sin pagos o pagos parciales
      * @Creación     : 20/02/2025
      * @Modificación : 20/02/2025  - Brayan Villegas
  */

  procedure prc_ap_ley_infcz_dclrcion as
    v_nmbre_up           varchar2(100) := 'pkg_gi_declaraciones_utlddes.prc_ap_ley_infcz_dclrcion';
    v_nvel               number;
    v_vlor               clob;
    v_id_sjto_tpo        number;
    v_idntfccion         number;
    v_fcha_lmte_dclrcion timestamp;
    v_indcdor_extmprneo  varchar2(1);
    v_vlor_mnmo          number;
    v_undad_drcion_mnmo  varchar2(3);
    v_drcion_mnmo        number;
    v_dia_tpo_mnmo       varchar2(1);
    v_vlor_mxmo          number;
    v_undad_drcion_mxmo  varchar2(3);
    v_drcion_mxmo        number;
    v_dia_tpo_mxmo       varchar2(1);
    v_fcha_fnal_mnmo     timestamp;
    v_fcha_fnal_mxmo     timestamp;
    o_cdgo_rspsta        number;
    o_mnsje_rspsta       clob;
    v_count              number := 1;
  begin
    o_cdgo_rspsta  := 0;
    o_mnsje_rspsta := 'OK';
    --Cursosr que recorre y trae las declaraciones que tienen cartera pendiente por pagar
    for c_crtera_dclrcns in (select a.id_dclrcion,
                                    a.cdgo_clnte,
                                    a.id_dclrcion_vgncia_frmlrio,
                                    a.fcha_prsntcion_pryctda,
                                    a.vlor_ttal
                               from gi_g_declaraciones a
                               join gi_d_dclrcnes_vgncias_frmlr b
                                 on b.id_dclrcion_vgncia_frmlrio =
                                    a.id_dclrcion_vgncia_frmlrio
                               join gi_d_dclrcnes_tpos_vgncias c
                                 on c.id_dclrcion_tpo_vgncia =
                                    b.id_dclrcion_tpo_vgncia
                               join gi_d_declaraciones_tipo d
                                 on d.id_dclrcn_tpo = c.id_dclrcn_tpo
                                and d.actvo_infcaz = 'S'
                               join v_gf_g_cartera_x_vigencia e
                                 on e.cdgo_clnte = a.cdgo_clnte
                                and e.id_sjto_impsto = a.id_sjto_impsto
                                and e.id_orgen = a.id_dclrcion
                                and e.cdgo_mvmnto_orgn = 'DL'
                                and e.cdgo_mvnt_fncro_estdo != 'CN'
                                and e.vlor_sldo_cptal > 0
                              where a.cdgo_dclrcion_estdo in ('APL', 'PRS')) loop
      v_nvel := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                                            p_id_impsto  => null,
                                            p_nmbre_up   => v_nmbre_up);

      o_mnsje_rspsta := 'Declaración No. ' || c_crtera_dclrcns.id_dclrcion;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => o_mnsje_rspsta,
                            p_nvel_txto  => 6);

      --Busca la Homologación del Tipo de Sujeto
      pkg_gi_declaraciones.prc_co_homologacion(p_cdgo_clnte    => c_crtera_dclrcns.cdgo_clnte,
                                               p_cdgo_hmlgcion => 'PRD',
                                               p_cdgo_prpdad   => 'TST',
                                               p_id_dclrcion   => c_crtera_dclrcns.id_dclrcion,
                                               o_vlor          => v_vlor,
                                               o_cdgo_rspsta   => o_cdgo_rspsta,
                                               o_mnsje_rspsta  => o_mnsje_rspsta);
      v_id_sjto_tpo := to_number(v_vlor);
      --Verifica si Hubo Error
      if (o_cdgo_rspsta <> 0) then
        o_cdgo_rspsta  := 1;
        o_mnsje_rspsta := o_cdgo_rspsta || '. Para la declaración No.[' ||
                          c_crtera_dclrcns.id_dclrcion ||
                          '], no fue posible encontrar la homologación del tipo de sujeto.';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 6);
        continue;
      end if;

      --Busca la Homologación de Identificación
      pkg_gi_declaraciones.prc_co_homologacion(p_cdgo_clnte    => c_crtera_dclrcns.cdgo_clnte,
                                               p_cdgo_hmlgcion => 'PRD',
                                               p_cdgo_prpdad   => 'IDT',
                                               p_id_dclrcion   => c_crtera_dclrcns.id_dclrcion,
                                               o_vlor          => v_vlor,
                                               o_cdgo_rspsta   => o_cdgo_rspsta,
                                               o_mnsje_rspsta  => o_mnsje_rspsta);
      v_idntfccion := to_number(v_vlor);

      --Verifica si Hubo Error
      if (o_cdgo_rspsta <> 0) then
        o_cdgo_rspsta  := 2;
        o_mnsje_rspsta := o_cdgo_rspsta || '. Para la declaración No.[' ||
                          c_crtera_dclrcns.id_dclrcion ||
                          '], no fue posible encontrar la homologación de la identificación.';
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 6);
        continue;
      end if;

      o_mnsje_rspsta := 'id_dclrcion_vgncia_frmlrio: ' ||
                        c_crtera_dclrcns.id_dclrcion_vgncia_frmlrio ||
                        ' , v_idntfccion: ' || v_idntfccion ||
                        ' , v_id_sjto_tpo: ' || v_id_sjto_tpo ||
                        ' , fcha_prsntcion_pryctda: ' ||
                        c_crtera_dclrcns.fcha_prsntcion_pryctda;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                            p_id_impsto  => null,
                            p_nmbre_up   => v_nmbre_up,
                            p_nvel_log   => v_nvel,
                            p_txto_log   => o_mnsje_rspsta,
                            p_nvel_txto  => 6);

      --Fecha limite de presentación de la declaración.
      begin
        select pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion(p_id_dclrcion_vgncia_frmlrio => c_crtera_dclrcns.id_dclrcion_vgncia_frmlrio,
                                                              p_idntfccion                 => v_idntfccion,
                                                              p_id_sjto_tpo                => v_id_sjto_tpo) as fcha_lmte_dclrcion
          into v_fcha_lmte_dclrcion
          from dual;
        o_mnsje_rspsta := 'v_fcha_lmte_dclrcion: ' || v_fcha_lmte_dclrcion;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 6);

      exception
        when others then
          o_cdgo_rspsta  := 3;
          o_mnsje_rspsta := o_cdgo_rspsta || '. Para la declaración No.[' ||
                            c_crtera_dclrcns.id_dclrcion ||
                            '], no fue posible encontrar la fecha limite de presentación.';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 6);
          continue;
      end;

      --Indicador que valida si la declaración se presento de manera extemporanea o no.
      begin
        select pkg_gi_declaraciones_funciones.fnc_vl_fecha_limite(p_cdgo_clnte                 => c_crtera_dclrcns.cdgo_clnte,
                                                                  p_id_dclrcion_vgncia_frmlrio => c_crtera_dclrcns.id_dclrcion_vgncia_frmlrio,
                                                                  p_idntfccion                 => v_idntfccion,
                                                                  p_fcha_prsntcion             => to_char(c_crtera_dclrcns.fcha_prsntcion_pryctda,
                                                                                                          'dd/mm/yyyy'),
                                                                  p_id_sjto_tpo                => v_id_sjto_tpo) as indcdor_extmprneo
          into v_indcdor_extmprneo
          from dual;
        o_mnsje_rspsta := 'v_indcdor_extmprneo: ' || v_indcdor_extmprneo;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 6);

      exception
        when others then
          o_cdgo_rspsta  := 4;
          o_mnsje_rspsta := o_cdgo_rspsta || '. Para la declaración No.[' ||
                            c_crtera_dclrcns.id_dclrcion ||
                            '], no fue posible identificar si fue extemporaneo.';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 6);
          continue;
      end;

      --Parametrica de Ley Ineficaz antes del vencimiento
      begin
        select (d.vlor * c.vlor_mnmo) vlor_mnmo,
               c.undad_drcion_mnmo,
               c.drcion_mnmo,
               c.dia_tpo_mnmo,
               (e.vlor * c.vlor_mxmo) vlor_mxmo,
               c.undad_drcion_mxmo,
               c.drcion_mxmo,
               c.dia_tpo_mxmo
          into v_vlor_mnmo,
               v_undad_drcion_mnmo,
               v_drcion_mnmo,
               v_dia_tpo_mnmo,
               v_vlor_mxmo,
               v_undad_drcion_mxmo,
               v_drcion_mxmo,
               v_dia_tpo_mxmo
          from gi_d_dclrcnes_vgncias_frmlr a
          join gi_d_dclrcnes_tpos_vgncias b
            on b.id_dclrcion_tpo_vgncia = a.id_dclrcion_tpo_vgncia
          join gi_d_declaraciones_tipo c
            on c.id_dclrcn_tpo = b.id_dclrcn_tpo
          join df_s_indicadores_economico d
            on d.cdgo_indcdor_tpo = c.cdgo_indcdor_tpo_mnmo
           and systimestamp between d.fcha_dsde and d.fcha_hsta
          join df_s_indicadores_economico e
            on e.cdgo_indcdor_tpo = c.cdgo_indcdor_tpo_mxmo
           and systimestamp between e.fcha_dsde and e.fcha_hsta
         where a.id_dclrcion_vgncia_frmlrio =
               c_crtera_dclrcns.id_dclrcion_vgncia_frmlrio;
      exception
        when others then
          o_cdgo_rspsta  := 5;
          o_mnsje_rspsta := o_cdgo_rspsta || '. Para la declaración No.[' ||
                            c_crtera_dclrcns.id_dclrcion ||
                            '], no fue posible hallar la parametrización del Tipo de Declaración.';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 6);
          continue;
      end;

      if v_indcdor_extmprneo = 'S' then
        begin
          update gi_g_declaraciones a
             set a.cdgo_dclrcion_estdo = 'INE'
           where a.id_dclrcion = c_crtera_dclrcns.id_dclrcion;

          o_mnsje_rspsta := v_count || '° Declaración actualizada.';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 6);
          v_count        := v_count + 1;
          o_mnsje_rspsta := 'update 1 Actualizó el estado de la declaracion  No.[' ||
                            c_crtera_dclrcns.id_dclrcion || ']';
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 6);

        exception
          when others then
            o_cdgo_rspsta  := 6;
            o_mnsje_rspsta := o_cdgo_rspsta || '. Para la declaración No.[' ||
                              c_crtera_dclrcns.id_dclrcion ||
                              '], no fue posible actualizar su estado a Ineficaz.';
            pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                                  p_id_impsto  => null,
                                  p_nmbre_up   => v_nmbre_up,
                                  p_nvel_log   => v_nvel,
                                  p_txto_log   => o_mnsje_rspsta,
                                  p_nvel_txto  => 6);
            continue;
        end;
      elsif v_indcdor_extmprneo = 'N' then

        o_mnsje_rspsta := 'Dentro de la fecha vlor_ttal: ' ||
                          c_crtera_dclrcns.vlor_ttal || ' ,  v_vlor_mxmo: ' ||
                          v_vlor_mxmo || ' ,  v_vlor_mnmo: ' || v_vlor_mnmo;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                              p_id_impsto  => null,
                              p_nmbre_up   => v_nmbre_up,
                              p_nvel_log   => v_nvel,
                              p_txto_log   => o_mnsje_rspsta,
                              p_nvel_txto  => 6);

        if c_crtera_dclrcns.vlor_ttal >= v_vlor_mxmo then
          o_mnsje_rspsta := '1 condicion v_undad_drcion_mxmo: ' ||
                            v_undad_drcion_mxmo || ' ,  v_drcion_mxmo: ' ||
                            v_drcion_mxmo || ' ,  v_dia_tpo_mxmo: ' ||
                            v_dia_tpo_mxmo;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 6);

          begin
            select pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte    => c_crtera_dclrcns.cdgo_clnte,
                                                         p_fecha_inicial => v_fcha_lmte_dclrcion, --'20/12/2024',--
                                                         p_undad_drcion  => v_undad_drcion_mxmo,
                                                         p_drcion        => v_drcion_mxmo,
                                                         p_dia_tpo       => v_dia_tpo_mxmo)
              into v_fcha_fnal_mxmo
              from dual;
          exception
            when others then
              o_cdgo_rspsta  := 7;
              o_mnsje_rspsta := o_cdgo_rspsta ||
                                '. Para la declaración No.[' ||
                                c_crtera_dclrcns.id_dclrcion ||
                                '], no fue posible calcular su fecha de vencimiento.';
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => o_mnsje_rspsta,
                                    p_nvel_txto  => 6);
              continue;
          end;
          o_mnsje_rspsta := '1 condicion v_fcha_fnal_mxmo: ' ||
                            v_fcha_fnal_mxmo;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 6);

          if v_fcha_fnal_mxmo < systimestamp then
            begin
              update gi_g_declaraciones a
                 set a.cdgo_dclrcion_estdo = 'INE'
               where a.id_dclrcion = c_crtera_dclrcns.id_dclrcion;

              o_mnsje_rspsta := v_count || '° Declaración actualizada.';
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => o_mnsje_rspsta,
                                    p_nvel_txto  => 6);
              v_count        := v_count + 1;
              o_mnsje_rspsta := 'update 2 Actualizó el estado de la declaracion  No.[' ||
                                c_crtera_dclrcns.id_dclrcion || ']';
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => o_mnsje_rspsta,
                                    p_nvel_txto  => 6);

            exception
              when others then
                o_cdgo_rspsta  := 8;
                o_mnsje_rspsta := o_cdgo_rspsta ||
                                  '. Para la declaración No.[' ||
                                  c_crtera_dclrcns.id_dclrcion ||
                                  '], no fue posible actualizar su estado a Ineficaz.';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                                      p_id_impsto  => null,
                                      p_nmbre_up   => v_nmbre_up,
                                      p_nvel_log   => v_nvel,
                                      p_txto_log   => o_mnsje_rspsta,
                                      p_nvel_txto  => 6);
                continue;
            end;

          else
            continue;
          end if;

        elsif c_crtera_dclrcns.vlor_ttal < v_vlor_mnmo then
          o_mnsje_rspsta := '2 condicion v_undad_drcion_mnmo: ' ||
                            v_undad_drcion_mnmo || ' ,  v_drcion_mnmo: ' ||
                            v_drcion_mnmo || ' ,  v_dia_tpo_mnmo: ' ||
                            v_dia_tpo_mnmo;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 6);

          begin
            select pk_util_calendario.fnc_cl_fecha_final(p_cdgo_clnte    => c_crtera_dclrcns.cdgo_clnte,
                                                         p_fecha_inicial => v_fcha_lmte_dclrcion, --'20/02/2024',--
                                                         p_undad_drcion  => v_undad_drcion_mnmo,
                                                         p_drcion        => v_drcion_mnmo,
                                                         p_dia_tpo       => v_dia_tpo_mnmo)
              into v_fcha_fnal_mnmo
              from dual;
          exception
            when others then
              o_cdgo_rspsta  := 9;
              o_mnsje_rspsta := o_cdgo_rspsta ||
                                '. Para la declaración No.[' ||
                                c_crtera_dclrcns.id_dclrcion ||
                                '], no fue posible calcular su fecha de vencimiento.';
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => o_mnsje_rspsta,
                                    p_nvel_txto  => 6);
              continue;
          end;
          o_mnsje_rspsta := '2 condicion v_fcha_fnal_mnmo: ' ||
                            v_fcha_fnal_mnmo;
          pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                                p_id_impsto  => null,
                                p_nmbre_up   => v_nmbre_up,
                                p_nvel_log   => v_nvel,
                                p_txto_log   => o_mnsje_rspsta,
                                p_nvel_txto  => 6);

          if v_fcha_fnal_mnmo < systimestamp then
            begin
              update gi_g_declaraciones a
                 set a.cdgo_dclrcion_estdo = 'INE'
               where a.id_dclrcion = c_crtera_dclrcns.id_dclrcion;

              o_mnsje_rspsta := v_count || '° Declaración actualizada.';
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => o_mnsje_rspsta,
                                    p_nvel_txto  => 6);
              v_count        := v_count + 1;
              o_mnsje_rspsta := 'update 3 Actualizó el estado de la declaracion  No.[' ||
                                c_crtera_dclrcns.id_dclrcion || ']';
              pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                                    p_id_impsto  => null,
                                    p_nmbre_up   => v_nmbre_up,
                                    p_nvel_log   => v_nvel,
                                    p_txto_log   => o_mnsje_rspsta,
                                    p_nvel_txto  => 6);

            exception
              when others then
                o_cdgo_rspsta  := 10;
                o_mnsje_rspsta := o_cdgo_rspsta ||
                                  '. Para la declaración No.[' ||
                                  c_crtera_dclrcns.id_dclrcion ||
                                  '], no fue posible actualizar su estado a Ineficaz.';
                pkg_sg_log.prc_rg_log(p_cdgo_clnte => c_crtera_dclrcns.cdgo_clnte,
                                      p_id_impsto  => null,
                                      p_nmbre_up   => v_nmbre_up,
                                      p_nvel_log   => v_nvel,
                                      p_txto_log   => o_mnsje_rspsta,
                                      p_nvel_txto  => 6);
                continue;
            end;
          else
            continue;
          end if;
        else
          continue;
        end if;
      end if;
    end loop;
  end prc_ap_ley_infcz_dclrcion;

  /*
  * Procedimiento que homologa los formulario: Realiza la homologación
  * del formulario v2 y crea el registro en las tablas de declaraciones v1.
  * creación      : 17/01/2024
  * modificación  : 17/02/2024 Mejora req 25989
  * Luis Ariza
  */
  procedure prc_hg_formulario(p_cdgo_clnte                 in number,
                              p_id_sjto_impsto             in number,
                              p_id_dclrcion_v2             in number,
                              p_id_cnddto_vgncia           in number default null,
                              p_id_dclrcion_vgncia_frmlrio in number,
                              p_id_pagina                  in number,
                              p_id_usrio                   in number,
                              p_id_orgen_tpo               in number default 1,
                              p_json_actvdds               in clob default null,
                              o_id_dclrcion                out number,
                              o_cdgo_rspsta                out number,
                              o_mnsje_rspsta               out varchar2) as
    v_nl                          number;
    v_prcdmnto                    varchar2(200) := 'pkg_gi_declaraciones_utlddes.prc_hg_formulario';
    v_cdgo_prcso                  varchar2(100) := 'DCL10';
    v_id_dclrcion_vgncia_frmlrio  number;
    v_json_length                 number;
    v_id_impsto                   number;
    v_id_impsto_sbmpsto           number;
    v_vgncia                      number;
    v_id_prdo                     number;
    v_id_frmlrio                  number;
    v_cdgo_cnsctvo                varchar2(3);
    v_nmro_cnsctvo                number;
    v_cdgo_dclrcion_estdo         varchar2(3);
    v_idntfccion                  varchar2(100);
    v_cdgo_dclrcion_uso           varchar2(3);
    v_fcha_prsntcion_pryctda      varchar2(100);
    v_id_dclrcion_uso             varchar2(100);
    v_id_sjto_impsto              number := p_id_sjto_impsto;
    v_id_dclrcion_crrcion         number;
    v_cdgo_dclrcion_crrcion_estdo varchar2(3);
    v_bse_grvble                  varchar2(30);
    v_vlor_ttal                   varchar2(30);
    v_vlor_pgo                    varchar2(30);
    v_exste_incial                number := 0; -- REQ. DIAN

    v_id_frmlrio_hmlgcion number;
    v_json                clob;
    v_resultado           varchar2(500);
    v_id_dclrcion         number;

    v_id_page                      number;
    v_columna                      varchar2(100);
    v_valor                        varchar2(100);
    v_gi_d_formulario_hmlg_dtlle   gi_d_formulario_hmlg_dtlle%rowtype;
    v_id_frmlrio_rgion_atrbto_orgn number;
    v_id_frmlrio_rgion_orgn        number;
    v_display_value                varchar2(1000);
  begin
    --Determinamos el nivel del Log de la UPv
    v_nl := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte, null, v_prcdmnto);
    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_prcdmnto,
                          v_nl,
                          'Proceso iniciado',
                          1);
    o_cdgo_rspsta := 0;

    /*
    Consultar si existe homologación del formulario presentado
    */

    if p_id_dclrcion_v2 is null then
      o_cdgo_rspsta  := 1;
      o_mnsje_rspsta := '|' || v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                        ' El parametro p_id_dclrcion_v2,' || ' está vacio' ||
                        o_mnsje_rspsta;
      return;
    end if;

    begin
      select a.id_frmlrio_hmlgcion, a.id_frmlrio, a.id_page
        into v_id_frmlrio_hmlgcion, v_id_frmlrio, v_id_page
        from gi_d_formulario_hmlgcion a
        join gi_d_dclrcnes_vgncias_frmlr b
          on a.id_frmlrio = b.id_frmlrio
       where b.id_dclrcion_vgncia_frmlrio = p_id_dclrcion_vgncia_frmlrio;
    exception
      when others then
        o_cdgo_rspsta  := 1;
        o_mnsje_rspsta := '|' || v_cdgo_prcso || '-' || o_cdgo_rspsta ||
                          ' Problemas al consultar la homologación y el formulario de la declaración,' ||
                          ' por favor, solicitar apoyo tecnico con este mensaje.' ||
                          o_mnsje_rspsta;
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              o_mnsje_rspsta,
                              2);
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              sqlerrm,
                              2);
        return;
    end;

    --Extraemos las acticades del json para regsitrarla en la tabla gi_g_declaraciones_actvdad.
    if p_json_actvdds is not null and p_json_actvdds != '{}' then
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_prcdmnto,
                            v_nl,
                            'Entro en actividades',
                            6);

      for c_actvdds in (select id_dclrcns_esqma_trfa,
                               dscrpcion,
                               trfa,
                               vlor_igrsos_grvdos,
                               ingrss_actvdad,
                               ingrss_grvble,
                               vlor_ipsto,
                               fcha_incio,
                               fcha_fnal,
                               idntfccion_cntrtta,
                               nmbre_cntrtta,
                               fla
                          from json_table(p_json_actvdds,
                                          '$[*]'
                                          columns(id_dclrcns_esqma_trfa
                                                  varchar2 path
                                                  '$.ID_DCLRCNS_ESQMA_TRFA',
                                                  dscrpcion varchar2 path
                                                  '$.DSCRPCION',
                                                  trfa varchar2 path '$.TRFA',
                                                  vlor_igrsos_grvdos varchar2 path
                                                  '$.VLOR_IGRSOS_GRVDOS',
                                                  ingrss_actvdad varchar2 path
                                                  '$.INGRSS_ACTVDAD',
                                                  ingrss_grvble varchar2 path
                                                  '$.INGRSS_GRVBLE',
                                                  vlor_ipsto varchar2 path
                                                  '$.VLOR_IPSTO',
                                                  fcha_incio varchar2 path
                                                  '$.FCHA_INCIO',
                                                  fcha_fnal varchar2 path
                                                  '$.FCHA_FNAL',
                                                  idntfccion_cntrtta varchar2 path
                                                  '$.IDNTFCCION_CNTRTTA',
                                                  nmbre_cntrtta varchar2 path
                                                  '$.NMBRE_CNTRTTA',
                                                  fla varchar2 path '$.FLA'))) loop
        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              'Entro hacer insert actividades c_actvdds.fcha_incio ' ||
                              c_actvdds.fcha_incio,
                              6);

        insert into gi_g_declaraciones_actvdad
          (id_dclrcion,
           id_dclrcns_esqma_trfa,
           trfa,
           vlor_igrsos_grvdos,
           vlor_ipsto,
           fcha_incio,
           fcha_fnal,
           idntfccion_cntrtta,
           nmbre_cntrtta,
           fla,
           dscrpcion,
           ingrss_actvdad,
           ingrss_grvble)
        values
          (p_id_dclrcion_v2,
           c_actvdds.id_dclrcns_esqma_trfa,
           c_actvdds.trfa,
           c_actvdds.vlor_igrsos_grvdos,
           c_actvdds.vlor_ipsto,
           c_actvdds.fcha_incio,
           c_actvdds.fcha_fnal,
           c_actvdds.idntfccion_cntrtta,
           c_actvdds.nmbre_cntrtta,
           c_actvdds.fla,
           c_actvdds.dscrpcion,
           c_actvdds.ingrss_actvdad,
           c_actvdds.ingrss_grvble);
      end loop;

      --Creamos el json actividades economica con la estructura requerida de declaraciones.
      --  pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, 'Antes de loop actividades', 6);

      for c_gmlcion_dtlle in (select columna, valor, dscrpcion, fla
                              -- into  v_columna , v_valor , v_fla
                                from (select TO_CHAR(ID_DCLRCNS_ESQMA_TRFA) as ID_DCLRCNS_ESQMA_TRFA,
                                             TO_CHAR(DSCRPCION) as DSCRPCION,
                                             TO_CHAR(TRFA) as TRFA,
                                             TO_CHAR(VLOR_IGRSOS_GRVDOS) as VLOR_IGRSOS_GRVDOS,
                                             TO_CHAR(INGRSS_ACTVDAD) as INGRSS_ACTVDAD,
                                             TO_CHAR(INGRSS_GRVBLE) as INGRSS_GRVBLE,
                                             TO_CHAR(VLOR_IPSTO) as VLOR_IPSTO,
                                             TO_CHAR(FCHA_INCIO) as FCHA_INCIO,
                                             TO_CHAR(FCHA_FNAL) as FCHA_FNAL,
                                             TO_CHAR(IDNTFCCION_CNTRTTA) as IDNTFCCION_CNTRTTA,
                                             TO_CHAR(NMBRE_CNTRTTA) as NMBRE_CNTRTTA,
                                             TO_CHAR(FLA) as FLA
                                        from gi_g_declaraciones_actvdad a
                                       where a.id_dclrcion = p_id_dclrcion_v2) itermedia unpivot(valor for columna in(id_dclrcns_esqma_trfa,
                                                                                                                      TRFA,
                                                                                                                      vlor_igrsos_grvdos,
                                                                                                                      ingrss_actvdad,
                                                                                                                      Ingrss_Grvble,
                                                                                                                      vlor_ipsto,
                                                                                                                      fcha_incio,
                                                                                                                      fcha_fnal,
                                                                                                                      idntfccion_cntrtta,
                                                                                                                      nmbre_cntrtta)) x
                               order by fla asc) loop

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              'Antes de la select c_gmlcion_dtlle.columna  ' ||
                              c_gmlcion_dtlle.columna,
                              6);

        select case
                 when c_gmlcion_dtlle.columna = 'ID_DCLRCNS_ESQMA_TRFA' then
                  to_char(c_gmlcion_dtlle.dscrpcion)
                 when c_gmlcion_dtlle.columna = 'FCHA_INCIO' then
                  to_char(c_gmlcion_dtlle.valor)
                 when c_gmlcion_dtlle.columna = 'FCHA_FNAL' then
                  to_char(c_gmlcion_dtlle.valor)
                 when c_gmlcion_dtlle.columna = 'IDNTFCCION_CNTRTTA' then
                  to_char(c_gmlcion_dtlle.valor)
                 when c_gmlcion_dtlle.columna = 'NMBRE_CNTRTTA' then
                  to_char(c_gmlcion_dtlle.valor)
                 when c_gmlcion_dtlle.columna = 'TRFA' then
                  to_char(c_gmlcion_dtlle.valor)
                 else
                  to_char(to_number(c_gmlcion_dtlle.valor),
                          'FM999G999G999G999G999')
               end
          into v_display_value
          from dual;

        -- pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, 'v_display_value => '||v_display_value, 6);

        begin
          select a.id_frmlrio_rgion_orgn, a.id_frmlrio_rgion_atrbto_orgn
            into v_id_frmlrio_rgion_orgn, v_id_frmlrio_rgion_atrbto_orgn
            from gi_d_formulario_hmlg_dtlle a
            join apex_190100.wwv_flow_step_items b
              on a.id_frmlrio_rgion_atrbto_pgna = b.id
           where a.id_frmlrio_hmlgcion = v_id_frmlrio_hmlgcion
             and a.id_frmlrio_rgion_atrbto_pgna is not null
             and b.source is not null
             and b.source = c_gmlcion_dtlle.columna;

          select JSON_OBJECT('ID' VALUE
                             'RGN' || v_id_frmlrio_rgion_orgn || 'ATR' ||
                             v_id_frmlrio_rgion_atrbto_orgn || 'FLA' ||
                             c_gmlcion_dtlle.fla,
                             'ID_FRMLRIO_RGION' VALUE
                             TO_CHAR(v_id_frmlrio_rgion_orgn),
                             'ID_FRMLRIO_RGION_ATRBTO' VALUE
                             TO_CHAR(v_id_frmlrio_rgion_atrbto_orgn),
                             'FLA' VALUE c_gmlcion_dtlle.fla,
                             'VLOR' VALUE TO_CHAR(c_gmlcion_dtlle.valor),
                             'DISPLAY' VALUE TO_CHAR(v_display_value),
                             'ACCION' VALUE 'I',
                             'ORDEN' VALUE '1')
            INTO v_json
            FROM DUAL;

          insert into gi_g_dclrcnes_crga_trza
            (id,
             id_frmlrio_rgion,
             id_frmlrio_rgion_atrbto,
             fla,
             new_valor,
             display,
             accion,
             orden)
          values
            ('RGN' || v_id_frmlrio_rgion_orgn || 'ATR' ||
             v_id_frmlrio_rgion_atrbto_orgn || 'FLA' ||
             c_gmlcion_dtlle.fla,
             TO_CHAR(v_id_frmlrio_rgion_orgn),
             TO_CHAR(v_id_frmlrio_rgion_atrbto_orgn),
             TO_CHAR(c_gmlcion_dtlle.fla),
             TO_CHAR(c_gmlcion_dtlle.valor),
             TO_CHAR(v_display_value),
             'I',
             '1');
          -- pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, 'Creando actividades economicas: '||c_gmlcion_dtlle.columna ||'-'||c_gmlcion_dtlle.valor, 6);

        exception
          when no_data_found then

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_prcdmnto,
                                  v_nl,
                                  'No se encontro parametrizado la columna : ' ||
                                  c_gmlcion_dtlle.columna,
                                  6);

            null;
          when too_many_rows then
            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_prcdmnto,
                                  v_nl,
                                  'Se encontro más de un registro para la columna :  ' ||
                                  c_gmlcion_dtlle.columna,
                                  6);
        end;

      end loop;

    else
      null;
    end if;

    begin
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_prcdmnto,
                            v_nl,
                            'Antes de loop items',
                            6);

      for c_hmlgcion in (select a.id_frmlrio_rgion_orgn,
                                a.id_frmlrio_rgion_atrbto_orgn,
                                b.flow_step_id,
                                b.id,
                                b.name,
                                b.source
                           from gi_d_formulario_hmlg_dtlle a
                           join apex_190100.wwv_flow_step_items b
                             on a.id_frmlrio_rgion_atrbto_pgna = b.id
                          where a.id_frmlrio_hmlgcion =
                                v_id_frmlrio_hmlgcion
                            and a.id_frmlrio_rgion_atrbto_pgna is not null
                            and b.source is not null
                         -- and a.id_frmlrio_rgion_orgn  = 1012
                         ) loop

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              'Iniciando homologación: ' || c_hmlgcion.name,
                              6);

        v_resultado := nvl(c_hmlgcion.source, 'N');

        pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                              null,
                              v_prcdmnto,
                              v_nl,
                              'ANTES DE ENTRAR c_hmlgcion: ' || v_resultado,
                              6);

        if (v_resultado is not null and v_resultado <> 'N') then
          --  v_resultado:=nvl(c_hmlgcion.source,'N');
          begin
            select columna, valor
              into v_columna, v_valor
              from (select TO_CHAR(ID_CLASIFICACION) as ID_CLASIFICACION,
                           TO_CHAR(CDGO_OPCION_DE_USO) as CDGO_OPCION_DE_USO,
                           TO_CHAR(FCHA_MXMA_PRSNTCION, 'dd/mm/yyyy') as FCHA_MXMA_PRSNTCION,
                           TO_CHAR(CLCLO_DCLRCION_CRRCCION) as CLCLO_DCLRCION_CRRCCION,
                           TO_CHAR(NMRO_DCLRCION_ANTRIOR) as NMRO_DCLRCION_ANTRIOR,
                           TO_CHAR(NMBRES_RZN_SCIAL) as NMBRES_RZN_SCIAL,
                           TO_CHAR(CDGO_IDNTFCCION_TPO) as CDGO_IDNTFCCION_TPO,
                           TO_CHAR(IDNTFCCION) as IDNTFCCION,
                           TO_CHAR(DGTO_VRFCCION_DCLRNTE) as DGTO_VRFCCION_DCLRNTE,
                           TO_CHAR(DRCCION_NTFCCION) as DRCCION_NTFCCION,
                           TO_CHAR(ID_DPRTMNTO) as ID_DPRTMNTO,
                           TO_CHAR(ID_MNCPIO) as ID_MNCPIO,
                           TO_CHAR(TLFNO) as TLFNO,
                           TO_CHAR(CRREO_ELCTRNCO) as CRREO_ELCTRNCO,
                           TO_CHAR(NMRO_ESTBLCMNTOS) as NMRO_ESTBLCMNTOS,
                           TO_CHAR(AVSS_TBLRS) as AVSS_TBLRS,
                           TO_CHAR(CNSRCIO_UNION_TMPRAL) as CNSRCIO_UNION_TMPRAL,
                           TO_CHAR(RLZA_ACTDS_PNIO_AUTNMO) as RLZA_ACTDS_PNIO_AUTNMO,
                           TO_CHAR(CNCLCION_ESTBLCMIENTO) as CNCLCION_ESTBLCMIENTO,
                           TO_CHAR(ES_AGNTE_AUTRTNDOR) as ES_AGNTE_AUTRTNDOR,
                           TO_CHAR(TTL_INGRS_ORIOS_EXTRS_PAIS) as TTL_INGRS_ORIOS_EXTRS_PAIS,
                           TO_CHAR(MNS_INGRSS_FUERA_MNCPIO) as MNS_INGRSS_FUERA_MNCPIO,
                           TO_CHAR(TTL_INGRS_ORIOS_EXTRS_MNCPIO) as TTL_INGRS_ORIOS_EXTRS_MNCPIO,
                           TO_CHAR(MNS_INGRSOS_DVLCION_RBJA_DSNTO) as MNS_INGRSOS_DVLCION_RBJA_DSNTO,
                           TO_CHAR(MNS_INGRSOS_EXPRTCIONS) as MNS_INGRSOS_EXPRTCIONS,
                           TO_CHAR(MNS_INGRSOS_VNTA_ACTVOS_FJOS) as MNS_INGRSOS_VNTA_ACTVOS_FJOS,
                           TO_CHAR(MNS_INGRSOS_ACTVDDES_EXCLDAS) as MNS_INGRSOS_ACTVDDES_EXCLDAS,
                           TO_CHAR(MNS_INGRSOS_ACTVDDES_EXNTAS) as MNS_INGRSOS_ACTVDDES_EXNTAS,
                           TO_CHAR(MNS_RTNCNES_PRCTCRON_PRDO) as MNS_RTNCNES_PRCTCRON_PRDO,

                           TO_CHAR(AUTORRETNCNES_AVSOS_TBLROS) as AUTORRETNCNES_AVSOS_TBLROS,
                           TO_CHAR(AUTO_RRTNCNES_SBRTSA_BMBROS) as AUTO_RRTNCNES_SBRTSA_BMBROS,
                           TO_CHAR(TOTAL_AUTORRETENCIONES) as TOTAL_AUTORRETENCIONES,
                           TO_CHAR(TTAL_PGOS_ABNOS_CUENTA_ICA) as TTAL_PGOS_ABNOS_CUENTA_ICA,

                           TO_CHAR(TTAL_INGRESOS_GRVBLES) as TTAL_INGRESOS_GRVBLES,
                           TO_CHAR(TTAL_INGRSOS_GRVDAS) as TTAL_INGRSOS_GRVDAS,
                           TO_CHAR(TTAL_IMPSTO) as TTAL_IMPSTO,
                           TO_CHAR(GNRCION_ENRGIA) as GNRCION_ENRGIA,
                           TO_CHAR(IMPSTO_LEY) as IMPSTO_LEY,
                           TO_CHAR(TTAL_IMPSTO_INDSTRIA_CMRCIO) as TTAL_IMPSTO_INDSTRIA_CMRCIO,
                           TO_CHAR(CLCLO_CNCPTO_INDSTRIA_CMRCIO) as CLCLO_CNCPTO_INDSTRIA_CMRCIO,
                           TO_CHAR(CNCPTO_INDSTRIA_CMRCIO) as CNCPTO_INDSTRIA_CMRCIO,
                           TO_CHAR(SLDO_FVOR_CNCPTO_INDSTRI_CMRCI) as SLDO_FVOR_CNCPTO_INDSTRI_CMRCI,
                           TO_CHAR(CLCLO_CNCPTO_ANTRIOR_INDS_CCIO) as CLCLO_CNCPTO_ANTRIOR_INDS_CCIO,
                           TO_CHAR(CLCLO_DFRNCIA_PGO_INDST_CMRCIO) as CLCLO_DFRNCIA_PGO_INDST_CMRCIO,
                           TO_CHAR(VLOR_PGO_INDSTRIA_CMRCIO) as VLOR_PGO_INDSTRIA_CMRCIO,
                           TO_CHAR(CLCLO_DSCNTO_INDSTRIA_CMRCIO) as CLCLO_DSCNTO_INDSTRIA_CMRCIO,
                           TO_CHAR(CLCLO_INTRES_INDSTRIA_CMRCIO) as CLCLO_INTRES_INDSTRIA_CMRCIO,
                           TO_CHAR(CLCLO_DSCNTO_INTRES_IND_CMRCIO) as CLCLO_DSCNTO_INTRES_IND_CMRCIO,
                           TO_CHAR(CLCLO_SLDO_FVOR_PGO_INDS_CMRCI) as CLCLO_SLDO_FVOR_PGO_INDS_CMRCI,
                           TO_CHAR(ID_IMPSTO_AVSOS_TBLROS) as ID_IMPSTO_AVSOS_TBLROS,
                           TO_CHAR(SLDO_FVOR_AVSOS_TBLROS) as SLDO_FVOR_AVSOS_TBLROS,
                           TO_CHAR(CNCPTO_AVSOS_TBLROS) as CNCPTO_AVSOS_TBLROS,
                           TO_CHAR(CLCLO_DFRNCIA_AVSOS_TBLROS) as CLCLO_DFRNCIA_AVSOS_TBLROS,
                           TO_CHAR(CLCLO_ANTRIOR_AVSOS_TBLRS) as CLCLO_ANTRIOR_AVSOS_TBLRS,
                           TO_CHAR(CLCLO_DFRNCIA_PGO_AVSOS_TBLROS) as CLCLO_DFRNCIA_PGO_AVSOS_TBLROS,
                           TO_CHAR(VLR_PGO_AVSOS_TBLROS) as VLR_PGO_AVSOS_TBLROS,
                           TO_CHAR(CLCLO_DSCNTO_AVSOS_TBLROS) as CLCLO_DSCNTO_AVSOS_TBLROS,
                           TO_CHAR(CLCLO_INTRES_AVSOS_TBLROS) as CLCLO_INTRES_AVSOS_TBLROS,
                           TO_CHAR(CLCLO_DSCNTO_INTRES_AVSOS_TBLR) as CLCLO_DSCNTO_INTRES_AVSOS_TBLR,
                           TO_CHAR(CLCLO_SLDO_FVOR_PGO_AVSOS_TBLR) as CLCLO_SLDO_FVOR_PGO_AVSOS_TBLR,
                           TO_CHAR(PGO_UNDDS_CMRCLES) as PGO_UNDDS_CMRCLES,
                           TO_CHAR(ID_SBRTSA_BMBRIL) as ID_SBRTSA_BMBRIL,
                           TO_CHAR(SLDO_FVOR_CNPTO_SBRTSA_BMBRIL) as SLDO_FVOR_CNPTO_SBRTSA_BMBRIL,
                           TO_CHAR(DFRNCIA_CNCPTO_SBRTSA_BMBRIL) as DFRNCIA_CNCPTO_SBRTSA_BMBRIL,
                           TO_CHAR(CNCPTO_SBRTSA_BMBRIL) as CNCPTO_SBRTSA_BMBRIL,
                           TO_CHAR(CLCLO_CNCPTO_ANTRIOR_SBR_BMBRL) as CLCLO_CNCPTO_ANTRIOR_SBR_BMBRL,
                           TO_CHAR(CLCLO_DFRNCIA_PGO_SBRTS_BMBRIL) as CLCLO_DFRNCIA_PGO_SBRTS_BMBRIL,
                           TO_CHAR(CLCLO_VLR_PGO_SBRTSA_BMBRIL) as CLCLO_VLR_PGO_SBRTSA_BMBRIL,
                           TO_CHAR(CLCLO_DSCNTO_SBRTSA_BMBRIL) as CLCLO_DSCNTO_SBRTSA_BMBRIL,
                           TO_CHAR(CLCLO_INTRSES_SBRTSA_BMBRIL) as CLCLO_INTRSES_SBRTSA_BMBRIL,
                           TO_CHAR(CLCLO_DSCNTO_INTRES_SBR_BMBRIL) as CLCLO_DSCNTO_INTRES_SBR_BMBRIL,
                           TO_CHAR(CLCLO_SLDO_FVR_PGO_SBRT_BMBRIL) as CLCLO_SLDO_FVR_PGO_SBRT_BMBRIL,
                           TO_CHAR(ID_SBRTSA_SGRDAD) as ID_SBRTSA_SGRDAD,
                           TO_CHAR(CNCPTO_SBRTSA_SGRDAD) as CNCPTO_SBRTSA_SGRDAD,
                           TO_CHAR(CLCLO_DFRNCIA_CNCPTO_SB_SGRDAD) as CLCLO_DFRNCIA_CNCPTO_SB_SGRDAD,
                           TO_CHAR(SLDO_FVR_CNCPTO_SBRTSA_SGRDAD) as SLDO_FVR_CNCPTO_SBRTSA_SGRDAD,
                           TO_CHAR(CLCLO_CNCPTO_ANTRIOR_SB_SGRDAD) as CLCLO_CNCPTO_ANTRIOR_SB_SGRDAD,
                           TO_CHAR(CLCLO_DFRNCIA_PGO_SBRTS_SGRDAD) as CLCLO_DFRNCIA_PGO_SBRTS_SGRDAD,
                           TO_CHAR(CLCLO_PGO_SBRTSA_SGRDAD) as CLCLO_PGO_SBRTSA_SGRDAD,
                           TO_CHAR(CLCLO_DSCNTO_SBRTSA_SGRDAD) as CLCLO_DSCNTO_SBRTSA_SGRDAD,
                           TO_CHAR(CLCLO_INTRES_SBRTSA_SGRDAD) as CLCLO_INTRES_SBRTSA_SGRDAD,
                           TO_CHAR(CLCLO_DSCNTO_INTRES_SBR_SGRDAD) as CLCLO_DSCNTO_INTRES_SBR_SGRDAD,
                           TO_CHAR(CLCLO_SLDO_FVR_PGO_SBRT_SGRDAD) as CLCLO_SLDO_FVR_PGO_SBRT_SGRDAD,
                           TO_CHAR(TTL_IMPSTO_CRGO) as TTL_IMPSTO_CRGO,
                           TO_CHAR(MENS_VLR_EXNCION_EXNRCI_IMPSTO) as MENS_VLR_EXNCION_EXNRCI_IMPSTO,
                           TO_CHAR(MNS_RTNCNES) as MNS_RTNCNES,
                           TO_CHAR(MNS_AUTRRTNCNES) as MNS_AUTRRTNCNES,
                           TO_CHAR(MNS_ANTCPO_LIQDDO_ANIO_ANTRIOR) as MNS_ANTCPO_LIQDDO_ANIO_ANTRIOR,

                           TO_CHAR(ANTCPO_ANIO_SGNTE) as ANTCPO_ANIO_SGNTE,
                           TO_CHAR(SLDO_FVR_CNCPTO_ANTCPO) as SLDO_FVR_CNCPTO_ANTCPO,
                           TO_CHAR(DFRNCIA_CNCPTO_ANTCPO) as DFRNCIA_CNCPTO_ANTCPO,
                           TO_CHAR(VLR_CNCPTO_ANTCPO) as VLR_CNCPTO_ANTCPO,
                           TO_CHAR(CLCLO_INTRS_ANTCPO) as CLCLO_INTRS_ANTCPO,
                           TO_CHAR(CLCLO_PGO_CNCPTO_ANTCPO) as CLCLO_PGO_CNCPTO_ANTCPO,
                           TO_CHAR(CLCLO_DFRNCIA_PGO_CNCPTO_ANTCPO) as CLCLO_DFRNCIA_PGO_CNCPTO_ANTCPO,
                           TO_CHAR(CLCLO_DSCNTO_INTRES_CNCPTO_ANTCPO) as CLCLO_DSCNTO_INTRES_CNCPTO_ANTCPO,
                           TO_CHAR(CLCLO_CNCPTO_ANTRIOR_ANTCPO) as CLCLO_CNCPTO_ANTRIOR_ANTCPO,
                           TO_CHAR(CLCLO_SLDO_FVR_PGO_ANTCPO) as CLCLO_SLDO_FVR_PGO_ANTCPO,

                           TO_CHAR(TPO_SNCION) as TPO_SNCION,
                           TO_CHAR(TPO_CLCLO_SNCION) as TPO_CLCLO_SNCION,
                           TO_CHAR(SNCION_MNUAL) as SNCION_MNUAL,
                           TO_CHAR(SNCION_SGRDA) as SNCION_SGRDA,
                           TO_CHAR(CLCLO_IMPSTO_CRGO_SNCION) as CLCLO_IMPSTO_CRGO_SNCION,
                           TO_CHAR(CLCLO_NTO_SNCION) as CLCLO_NTO_SNCION,
                           TO_CHAR(SNCION_SLCCNDA) as SNCION_SLCCNDA,
                           TO_CHAR(DFRNCIA_CNCPTO_SNCION) as DFRNCIA_CNCPTO_SNCION,
                           TO_CHAR(CLCLO_DFRNCIA_PGO_SNCION) as CLCLO_DFRNCIA_PGO_SNCION,
                           TO_CHAR(VLR_CNCPTO_SNCION) as VLR_CNCPTO_SNCION,
                           TO_CHAR(CLCLO_DSCNTO_SNCION) as CLCLO_DSCNTO_SNCION,
                           TO_CHAR(CLCLO_SLDO_FVR_PGO_SNCION) as CLCLO_SLDO_FVR_PGO_SNCION,
                           TO_CHAR(MNS_SLDO_FVR_PRDO_ANTRIOR) as MNS_SLDO_FVR_PRDO_ANTRIOR,
                           TO_CHAR(CLCLO_TTL_SLDO_CRGO) as CLCLO_TTL_SLDO_CRGO,
                           TO_CHAR(TTL_SLDO_CRGO) as TTL_SLDO_CRGO,
                           TO_CHAR(TTL_SLDO_FVOR) as TTL_SLDO_FVOR,
                           TO_CHAR(VLR_PGR) as VLR_PGR,
                           TO_CHAR(DSCNTO_PRNTO_PGO) as DSCNTO_PRNTO_PGO,
                           TO_CHAR(INTRSES_MRA) as INTRSES_MRA,
                           TO_CHAR(TTL_PGAR) as TTL_PGAR,
                           TO_CHAR(APRTE_VLNTRIO) as APRTE_VLNTRIO,
                           TO_CHAR(VLR_PGO_VLNTRIO) as VLR_PGO_VLNTRIO,
                           TO_CHAR(DSTNO_APRTE_VLNTRIO) as DSTNO_APRTE_VLNTRIO,
                           TO_CHAR(TTL_PGAR_PGO_VLNTRIO) as TTL_PGAR_PGO_VLNTRIO,
                           TO_CHAR(VLR_PGAR_BNCOS) as VLR_PGAR_BNCOS,
                           TO_CHAR(CLCLO_VLR_PGAR_BNCOS) as CLCLO_VLR_PGAR_BNCOS,
                           TO_CHAR(ID_SJTO_RSPNSBLE_FRMA) as ID_SJTO_RSPNSBLE_FRMA,
                           TO_CHAR(CDGO_IDNTFCCION_TPO_RSPNS_FRMA) as CDGO_IDNTFCCION_TPO_RSPNS_FRMA,
                           TO_CHAR(IDNTFCCION_RSPNS_FRMA) as IDNTFCCION_RSPNS_FRMA,
                           TO_CHAR(ID_SJTO_RSPNSBLE_FR_RVS_CNTDOR) as ID_SJTO_RSPNSBLE_FR_RVS_CNTDOR,
                           TO_CHAR(CDGO_IDNTFCCION_TPO_RSP_FRMA_R) as CDGO_IDNTFCCION_TPO_RSP_FRMA_R,
                           TO_CHAR(IDNTFCCION_RSPNS_FR_RVS_CNTDOR) as IDNTFCCION_RSPNS_FR_RVS_CNTDOR,
                           TO_CHAR(ITEM_CERO) as ITEM_CERO,
                           TO_CHAR(ETQUETA_FRMA_PRNCPAL) as ETQUETA_FRMA_PRNCPAL,
                           TO_CHAR(ETQUETA_FRMA_SCNDRIA) as ETQUETA_FRMA_SCNDRIA,
                           TO_CHAR(MNS_VLR_EXNCION_SBRE_IMPSTO) as MNS_VLR_EXNCION_SBRE_IMPSTO,
                           TO_CHAR(MENS_VLR_EXNCN_SBRE_IMPSTO) as MENS_VLR_EXNCN_SBRE_IMPSTO,
                           TO_CHAR(MENS_RTNCINES_PRCTRON_PRDO) as MENS_RTNCINES_PRCTRON_PRDO,
                           TO_CHAR(REVISADO) as REVISADO,
                           TO_CHAR(TARJETA_PROFESIONAL) as TARJETA_PROFESIONAL,
                           TO_CHAR(NMBRE_RSPNS_FRMA) NMBRE_RSPNS_FRMA
                      from gi_g_declaraciones_v2 a
                     where a.id_dclrcion = p_id_dclrcion_v2) itermedia unpivot(valor for columna in(ID_CLASIFICACION,
                                                                                                    CDGO_OPCION_DE_USO,
                                                                                                    FCHA_MXMA_PRSNTCION,
                                                                                                    CLCLO_DCLRCION_CRRCCION,
                                                                                                    NMRO_DCLRCION_ANTRIOR,
                                                                                                    NMBRES_RZN_SCIAL,
                                                                                                    CDGO_IDNTFCCION_TPO,
                                                                                                    IDNTFCCION,
                                                                                                    DGTO_VRFCCION_DCLRNTE,
                                                                                                    DRCCION_NTFCCION,
                                                                                                    ID_DPRTMNTO,
                                                                                                    ID_MNCPIO,
                                                                                                    TLFNO,
                                                                                                    CRREO_ELCTRNCO,
                                                                                                    NMRO_ESTBLCMNTOS,
                                                                                                    AVSS_TBLRS,
                                                                                                    CNSRCIO_UNION_TMPRAL,
                                                                                                    RLZA_ACTDS_PNIO_AUTNMO,
                                                                                                    CNCLCION_ESTBLCMIENTO,
                                                                                                    ES_AGNTE_AUTRTNDOR,
                                                                                                    TTL_INGRS_ORIOS_EXTRS_PAIS,
                                                                                                    MNS_INGRSS_FUERA_MNCPIO,
                                                                                                    TTL_INGRS_ORIOS_EXTRS_MNCPIO,
                                                                                                    MNS_INGRSOS_DVLCION_RBJA_DSNTO,
                                                                                                    MNS_INGRSOS_EXPRTCIONS,
                                                                                                    MNS_INGRSOS_VNTA_ACTVOS_FJOS,
                                                                                                    MNS_INGRSOS_ACTVDDES_EXCLDAS,
                                                                                                    MNS_INGRSOS_ACTVDDES_EXNTAS,
                                                                                                    MNS_RTNCNES_PRCTCRON_PRDO,
                                                                                                    AUTORRETNCNES_AVSOS_TBLROS,
                                                                                                    AUTO_RRTNCNES_SBRTSA_BMBROS,
                                                                                                    TOTAL_AUTORRETENCIONES,
                                                                                                    TTAL_PGOS_ABNOS_CUENTA_ICA,
                                                                                                    TTAL_INGRESOS_GRVBLES,
                                                                                                    TTAL_INGRSOS_GRVDAS,
                                                                                                    TTAL_IMPSTO,
                                                                                                    GNRCION_ENRGIA,
                                                                                                    IMPSTO_LEY,
                                                                                                    TTAL_IMPSTO_INDSTRIA_CMRCIO,
                                                                                                    CLCLO_CNCPTO_INDSTRIA_CMRCIO,
                                                                                                    CNCPTO_INDSTRIA_CMRCIO,
                                                                                                    SLDO_FVOR_CNCPTO_INDSTRI_CMRCI,
                                                                                                    CLCLO_CNCPTO_ANTRIOR_INDS_CCIO,
                                                                                                    CLCLO_DFRNCIA_PGO_INDST_CMRCIO,
                                                                                                    VLOR_PGO_INDSTRIA_CMRCIO,
                                                                                                    CLCLO_DSCNTO_INDSTRIA_CMRCIO,
                                                                                                    CLCLO_INTRES_INDSTRIA_CMRCIO,
                                                                                                    CLCLO_DSCNTO_INTRES_IND_CMRCIO,
                                                                                                    CLCLO_SLDO_FVOR_PGO_INDS_CMRCI,
                                                                                                    ID_IMPSTO_AVSOS_TBLROS,
                                                                                                    SLDO_FVOR_AVSOS_TBLROS,
                                                                                                    CNCPTO_AVSOS_TBLROS,
                                                                                                    CLCLO_DFRNCIA_AVSOS_TBLROS,
                                                                                                    CLCLO_ANTRIOR_AVSOS_TBLRS,
                                                                                                    CLCLO_DFRNCIA_PGO_AVSOS_TBLROS,
                                                                                                    VLR_PGO_AVSOS_TBLROS,
                                                                                                    CLCLO_DSCNTO_AVSOS_TBLROS,
                                                                                                    CLCLO_INTRES_AVSOS_TBLROS,
                                                                                                    CLCLO_DSCNTO_INTRES_AVSOS_TBLR,
                                                                                                    CLCLO_SLDO_FVOR_PGO_AVSOS_TBLR,
                                                                                                    PGO_UNDDS_CMRCLES,
                                                                                                    ID_SBRTSA_BMBRIL,
                                                                                                    SLDO_FVOR_CNPTO_SBRTSA_BMBRIL,
                                                                                                    DFRNCIA_CNCPTO_SBRTSA_BMBRIL,
                                                                                                    CNCPTO_SBRTSA_BMBRIL,
                                                                                                    CLCLO_CNCPTO_ANTRIOR_SBR_BMBRL,
                                                                                                    CLCLO_DFRNCIA_PGO_SBRTS_BMBRIL,
                                                                                                    CLCLO_VLR_PGO_SBRTSA_BMBRIL,
                                                                                                    CLCLO_DSCNTO_SBRTSA_BMBRIL,
                                                                                                    CLCLO_INTRSES_SBRTSA_BMBRIL,
                                                                                                    CLCLO_DSCNTO_INTRES_SBR_BMBRIL,
                                                                                                    CLCLO_SLDO_FVR_PGO_SBRT_BMBRIL,
                                                                                                    ID_SBRTSA_SGRDAD,
                                                                                                    CNCPTO_SBRTSA_SGRDAD,
                                                                                                    CLCLO_DFRNCIA_CNCPTO_SB_SGRDAD,
                                                                                                    SLDO_FVR_CNCPTO_SBRTSA_SGRDAD,
                                                                                                    CLCLO_CNCPTO_ANTRIOR_SB_SGRDAD,
                                                                                                    CLCLO_DFRNCIA_PGO_SBRTS_SGRDAD,
                                                                                                    CLCLO_PGO_SBRTSA_SGRDAD,
                                                                                                    CLCLO_DSCNTO_SBRTSA_SGRDAD,
                                                                                                    CLCLO_INTRES_SBRTSA_SGRDAD,
                                                                                                    CLCLO_DSCNTO_INTRES_SBR_SGRDAD,
                                                                                                    CLCLO_SLDO_FVR_PGO_SBRT_SGRDAD,
                                                                                                    TTL_IMPSTO_CRGO,
                                                                                                    MENS_VLR_EXNCION_EXNRCI_IMPSTO,
                                                                                                    MNS_RTNCNES,
                                                                                                    MNS_AUTRRTNCNES,
                                                                                                    MNS_ANTCPO_LIQDDO_ANIO_ANTRIOR,
                                                                                                    ANTCPO_ANIO_SGNTE,
                                                                                                    SLDO_FVR_CNCPTO_ANTCPO,
                                                                                                    DFRNCIA_CNCPTO_ANTCPO,
                                                                                                    VLR_CNCPTO_ANTCPO,
                                                                                                    CLCLO_INTRS_ANTCPO,
                                                                                                    CLCLO_PGO_CNCPTO_ANTCPO,
                                                                                                    CLCLO_DFRNCIA_PGO_CNCPTO_ANTCPO,
                                                                                                    CLCLO_DSCNTO_INTRES_CNCPTO_ANTCPO,
                                                                                                    CLCLO_CNCPTO_ANTRIOR_ANTCPO,
                                                                                                    CLCLO_SLDO_FVR_PGO_ANTCPO,
                                                                                                    TPO_SNCION,
                                                                                                    TPO_CLCLO_SNCION,
                                                                                                    SNCION_MNUAL,
                                                                                                    SNCION_SGRDA,
                                                                                                    CLCLO_IMPSTO_CRGO_SNCION,
                                                                                                    CLCLO_NTO_SNCION,
                                                                                                    SNCION_SLCCNDA,
                                                                                                    DFRNCIA_CNCPTO_SNCION,
                                                                                                    CLCLO_DFRNCIA_PGO_SNCION,
                                                                                                    VLR_CNCPTO_SNCION,
                                                                                                    CLCLO_DSCNTO_SNCION,
                                                                                                    CLCLO_SLDO_FVR_PGO_SNCION,
                                                                                                    MNS_SLDO_FVR_PRDO_ANTRIOR,
                                                                                                    CLCLO_TTL_SLDO_CRGO,
                                                                                                    TTL_SLDO_CRGO,
                                                                                                    TTL_SLDO_FVOR,
                                                                                                    VLR_PGR,
                                                                                                    DSCNTO_PRNTO_PGO,
                                                                                                    INTRSES_MRA,
                                                                                                    TTL_PGAR,
                                                                                                    APRTE_VLNTRIO,
                                                                                                    VLR_PGO_VLNTRIO,
                                                                                                    DSTNO_APRTE_VLNTRIO,
                                                                                                    TTL_PGAR_PGO_VLNTRIO,
                                                                                                    VLR_PGAR_BNCOS,
                                                                                                    CLCLO_VLR_PGAR_BNCOS,
                                                                                                    ID_SJTO_RSPNSBLE_FRMA,
                                                                                                    CDGO_IDNTFCCION_TPO_RSPNS_FRMA,
                                                                                                    IDNTFCCION_RSPNS_FRMA,
                                                                                                    ID_SJTO_RSPNSBLE_FR_RVS_CNTDOR,
                                                                                                    CDGO_IDNTFCCION_TPO_RSP_FRMA_R,
                                                                                                    IDNTFCCION_RSPNS_FR_RVS_CNTDOR,
                                                                                                    ITEM_CERO,
                                                                                                    ETQUETA_FRMA_PRNCPAL,
                                                                                                    ETQUETA_FRMA_SCNDRIA,
                                                                                                    MNS_VLR_EXNCION_SBRE_IMPSTO,
                                                                                                    MENS_VLR_EXNCN_SBRE_IMPSTO,
                                                                                                    MENS_RTNCINES_PRCTRON_PRDO,
                                                                                                    REVISADO,
                                                                                                    TARJETA_PROFESIONAL,
                                                                                                    NMBRE_RSPNS_FRMA)) x
             where x.columna = v_resultado;

            pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                  null,
                                  v_prcdmnto,
                                  v_nl,
                                  'IF  c_vlor.columna => ' || v_columna ||
                                  ' =  v_resultado => ' || v_resultado,
                                  6);

            --pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, 'ID ATRIBUTO  => '||'RGN'||c_hmlgcion.id_frmlrio_rgion_orgn||'ATR'||c_hmlgcion.id_frmlrio_rgion_atrbto_orgn||'FLA'||1, 6);
            case
              when v_columna = 'ID_DPRTMNTO' then
                select a.nmbre_dprtmnto
                  into v_display_value
                  from df_s_departamentos a
                 where a.id_dprtmnto = to_char(v_valor);
              when v_columna = 'ID_MNCPIO' then
                select a.nmbre_mncpio as text
                  into v_display_value
                  from df_s_municipios a
                 where a.id_mncpio = to_char(v_valor);
              when v_columna = 'ID_CLASIFICACION' then
                select a.nmbre_sjto_tpo
                  into v_display_value
                  from df_i_sujetos_tipo a
                 where a.id_sjto_tpo = to_char(v_valor);
              when v_columna = 'CDGO_OPCION_DE_USO' then
                v_display_value := to_char(v_valor);
              when v_columna = 'NMBRES_RZN_SCIAL' then
                v_display_value := to_char(v_valor);
              when v_columna = 'FCHA_MXMA_PRSNTCION' then
                v_display_value := to_char(v_valor);
              when v_columna = 'CLCLO_DCLRCION_CRRCCION' then
                v_display_value := to_char(v_valor);
              when v_columna = 'CDGO_IDNTFCCION_TPO' then
                select dscrpcion_idntfccion_tpo
                  into v_display_value
                  from df_s_identificaciones_tipo
                 where cdgo_idntfccion_tpo = to_char(v_valor);
              when v_columna = 'IDNTFCCION' then
                v_display_value := to_char(v_valor);
              when v_columna = 'DGTO_VRFCCION_DCLRNTE' then
                v_display_value := to_char(v_valor);
              when v_columna = 'DRCCION_NTFCCION' then
                v_display_value := to_char(v_valor);
              when v_columna = 'TLFNO' then
                v_display_value := to_char(v_valor);
              when v_columna = 'CRREO_ELCTRNCO' then
                v_display_value := to_char(v_valor);
              when v_columna = 'AVSS_TBLRS' then
                v_display_value := to_char(v_valor);
              when v_columna = 'CNSRCIO_UNION_TMPRAL' then
                v_display_value := to_char(v_valor);
              when v_columna = 'RLZA_ACTDS_PNIO_AUTNMO' then
                v_display_value := to_char(v_valor);
              when v_columna = 'CNCLCION_ESTBLCMIENTO' then
                v_display_value := to_char(v_valor);
              when v_columna = 'ES_AGNTE_AUTRTNDOR' then
                v_display_value := to_char(v_valor);
              when v_columna = 'TPO_SNCION' then
                v_display_value := to_char(v_valor);
              when v_columna = 'TPO_CLCLO_SNCION' then
                v_display_value := to_char(v_valor);
              when v_columna = 'APRTE_VLNTRIO' then
                v_display_value := to_char(v_valor);
              when v_columna = 'DSTNO_APRTE_VLNTRIO' then
                v_display_value := to_char(to_number(v_valor),
                                           'FM999G999G999G999G999');
              when v_columna = 'IDNTFCCION_RSPNS_FRMA' then
                v_display_value := to_char(v_valor);
              when v_columna = 'IDNTFCCION_RSPNS_FR_RVS_CNTDOR' then
                v_display_value := to_char(v_valor);
              when v_columna = 'ETQUETA_FRMA_PRNCPAL' then
                v_display_value := to_char(v_valor);
              when v_columna = 'ETQUETA_FRMA_SCNDRIA' then
                v_display_value := to_char(v_valor);
              when v_columna = 'REVISADO' then
                v_display_value := to_char(v_valor);
              when v_columna = 'TARJETA_PROFESIONAL' then
                v_display_value := to_char(v_valor);
              when v_columna = 'NMBRE_RSPNS_FRMA' then
                v_display_value := to_char(v_valor);
              when v_columna = 'ID_SJTO_RSPNSBLE_FRMA' then
                select a.prmer_nmbre || ' ' || a.prmer_aplldo || ' ' ||
                       a.sgndo_aplldo
                  into v_display_value
                  from si_i_sujetos_responsable a
                 where a.id_sjto_rspnsble = to_char(v_valor);

              when v_columna = 'CDGO_IDNTFCCION_TPO_RSPNS_FRMA' then
                select dscrpcion_idntfccion_tpo
                  into v_display_value
                  from df_s_identificaciones_tipo
                 where cdgo_idntfccion_tpo = to_char(v_valor);

              when v_columna = 'ID_SJTO_RSPNSBLE_FR_RVS_CNTDOR' then
                select a.prmer_nmbre || ' ' || a.prmer_aplldo || ' ' ||
                       a.sgndo_aplldo
                  into v_display_value
                  from si_i_sujetos_responsable a
                 where a.id_sjto_rspnsble = to_char(v_valor);

              when v_columna = 'CDGO_IDNTFCCION_TPO_RSP_FRMA_R' then
                select dscrpcion_idntfccion_tpo
                  into v_display_value
                  from df_s_identificaciones_tipo
                 where cdgo_idntfccion_tpo = to_char(v_valor);
              when v_columna = 'REVISADO' then
                select a.dscrpcion_rspnsble_tpo
                  into v_display_value
                  from df_s_responsables_tipo a
                 where a.cdgo_rspnsble_tpo = to_char(v_valor);
                pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                      null,
                                      v_prcdmnto,
                                      v_nl,
                                      'REVISADO  => ' || v_valor,
                                      6);

              when v_columna = 'TTAL_IMPSTO_INDSTRIA_CMRCIO' then

                -- v_display_value:=  to_char(v_valor,'FM999G999G999G999');
                v_display_value := to_char(to_number(v_valor),
                                           'FM999G999G999G999G999');

              else
                v_display_value := to_char(to_number(v_valor),
                                           'FM999G999G999G999G999');
            end case;

            select JSON_OBJECT('ID' VALUE
                               'RGN' || c_hmlgcion.id_frmlrio_rgion_orgn ||
                               'ATR' ||
                               c_hmlgcion.id_frmlrio_rgion_atrbto_orgn ||
                               'FLA' || 1,
                               'ID_FRMLRIO_RGION' VALUE
                               TO_CHAR(c_hmlgcion.id_frmlrio_rgion_orgn),
                               'ID_FRMLRIO_RGION_ATRBTO' VALUE
                               TO_CHAR(c_hmlgcion.id_frmlrio_rgion_atrbto_orgn),
                               'FLA' VALUE 1,
                               'NEW' VALUE TO_CHAR(v_valor),
                               'DISPLAY' VALUE TO_CHAR(v_display_value),
                               'ACCION' VALUE 'I',
                               'ORDEN' VALUE '1')
              INTO v_json
              FROM DUAL;

            -- pkg_sg_log.prc_rg_log( p_cdgo_clnte, null, v_prcdmnto,  v_nl, 'v_json v_resultado['||v_resultado||']-->'||v_json, 6);
            -- DBMS_OUTPUT.put_line(v_json);
            insert into gi_g_dclrcnes_crga_trza
              (id,
               id_frmlrio_rgion,
               id_frmlrio_rgion_atrbto,
               fla,
               new_valor,
               display,
               accion,
               orden)
            values
              ('RGN' || c_hmlgcion.id_frmlrio_rgion_orgn || 'ATR' ||
               c_hmlgcion.id_frmlrio_rgion_atrbto_orgn || 'FLA' || 1,
               TO_CHAR(c_hmlgcion.id_frmlrio_rgion_orgn),
               TO_CHAR(c_hmlgcion.id_frmlrio_rgion_atrbto_orgn),
               '1',
               TO_CHAR(v_valor),
               TO_CHAR(v_display_value),
               'I',
               '1');
          exception
            when no_data_found then
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_prcdmnto,
                                    v_nl,
                                    'No se encontro datos para el item : ' ||
                                    c_hmlgcion.name,
                                    6);

              null;
            when too_many_rows then
              pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                                    null,
                                    v_prcdmnto,
                                    v_nl,
                                    'Se encontro más de un registro para el atributo:  ' ||
                                    v_resultado,
                                    6);

          end;

        end if;

      end loop;

      select JSON_ARRAYAGG(JSON_OBJECT('ID' VALUE ID,
                                       'ID_FRMLRIO_RGION' VALUE
                                       TO_CHAR(ID_FRMLRIO_RGION),
                                       'ID_FRMLRIO_RGION_ATRBTO' VALUE
                                       TO_CHAR(ID_FRMLRIO_RGION_ATRBTO),
                                       'FLA' VALUE TO_CHAR(FLA),
                                       'NEW' VALUE TO_CHAR(new_valor),
                                       'DISPLAY' VALUE TO_CHAR(display),
                                       'ACCION' VALUE 'I',
                                       'ORDEN' VALUE ORDEN) RETURNING CLOB)
        INTO v_json
        FROM gi_g_dclrcnes_crga_trza;

      insert into muerto
        (n_001, v_001, c_001, t_001)
      values
        (111, 'json_resultado', v_json, systimestamp);
      commit;
      delete gi_g_dclrcnes_crga_trza;
      commit;

    end;

    begin
      -- p_id_dclrcion := p_id_dclrcion_v2;
      v_id_dclrcion := null;
      --VALIDA SI LA DECLARACI?N EXISTE

      pkg_gi_declaraciones.prc_rg_declaracion(p_cdgo_clnte                 => p_cdgo_clnte,
                                              p_id_dclrcion_vgncia_frmlrio => p_id_dclrcion_vgncia_frmlrio,
                                              p_id_cnddto_vgncia           => null,
                                              p_id_usrio                   => p_id_usrio,
                                              p_json                       => v_json,
                                              p_id_orgen_tpo               => 1,
                                              p_id_dclrcion                => v_id_dclrcion,
                                              p_id_sjto_impsto             => v_id_sjto_impsto,
                                              o_cdgo_rspsta                => o_cdgo_rspsta,
                                              o_mnsje_rspsta               => o_mnsje_rspsta);

      o_id_dclrcion := v_id_dclrcion;
      pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                            null,
                            v_prcdmnto,
                            v_nl,
                            'o_cdgo_rspsta: ' || o_cdgo_rspsta ||
                            ' - v_id_dclrcion :' || o_id_dclrcion,
                            6);

    end;

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          'pkg_gi_declaraciones.prc_rg_declaracion',
                          v_nl,
                          'Proceso Terminado con exito',
                          6);
    --commit;
  end prc_hg_formulario;

  /*
  * Función que retorna los conceptos pagados de la declaracion inicial
  * Creación      : 24/06/2025
  * Modificación  : 24/06/2025
  * Luis Ariza
  */
  function fnc_co_cncptos_antriores_pago(p_id_dclrcion in gi_g_declaraciones.id_dclrcion%type)
    return varchar2 as
    v_json_cncptos varchar2(4000);

    v_json_obj                   JSON_OBJECT_T;
    v_concepto                   JSON_OBJECT_T := JSON_OBJECT_T(); --Obejto que contiene el v_json_array.
    v_json_array                 JSON_ARRAY_T := JSON_ARRAY_T();
    v_vlor_rcdo                  gi_g_declaraciones.vlor_pago%type;
    v_id_dclrcion_vgncia_frmlrio number;
  begin
    begin
      select a.id_dclrcion_vgncia_frmlrio
        into v_id_dclrcion_vgncia_frmlrio
        from gi_g_declaraciones a
       where a.id_dclrcion = p_id_dclrcion;
    exception
      when others then
        return v_json_cncptos;
    end;

    for c_cncptos in (select b.id_cncpto,
                             b.gnra_intres_mra,
                             c.id_frmlrio_rgion_item_pgna,
                             c.id_frmlrio_rgion_item,
                             d.name
                      -- into v_id_cncpto, v_gnra_intres_mra
                        from df_i_impuestos_acto_concepto b
                        join gi_d_dclrcnes_acto_cncpto c
                          on c.id_impsto_acto_cncpto =
                             b.id_impsto_acto_cncpto
                        join apex_190100.wwv_flow_step_items d
                          on c.id_frmlrio_rgion_item_pgna = d.id
                       where c.id_dclrcion_vgncia_frmlrio =
                             v_id_dclrcion_vgncia_frmlrio
                         and b.gnra_intres_mra = 'S') loop
      -- dbms_output.put_line('ATRIBUTO => '||c_cncptos.name  );
      v_json_obj  := JSON_OBJECT_T();
      v_vlor_rcdo := 0;
      for c_pgos in (WITH Correcciones(id_dclrcion,
                       id_dclrcion_crrccion,
                       id_rcdo,
                       vlor_pago,
                       fcha_vncmnto) AS
                        (SELECT id_dclrcion,
                               id_dclrcion_crrccion,
                               id_rcdo,
                               vlor_pago,
                               (case
                                 when trunc(fcha_prsntcion) >
                                      trunc(fcha_prsntcion_pryctda) then
                                  trunc(fcha_prsntcion)
                                 else
                                  trunc(fcha_prsntcion_pryctda)
                               end) fcha_vncmnto
                          FROM gi_g_declaraciones
                         WHERE id_dclrcion = p_id_dclrcion -- El ID de la declaración que quieres buscar

                        UNION ALL

                        SELECT d.id_dclrcion,
                               d.id_dclrcion_crrccion,
                               d.id_rcdo,
                               d.vlor_pago,
                               (case
                                 when trunc(fcha_prsntcion) >
                                      trunc(fcha_prsntcion_pryctda) then
                                  trunc(fcha_prsntcion)
                                 else
                                  trunc(fcha_prsntcion_pryctda)
                               end) fcha_vncmnto
                          FROM gi_g_declaraciones d
                         INNER JOIN Correcciones c
                            ON d.id_dclrcion = c.id_dclrcion_crrccion
                        -- and d.cdgo_dclrcion_estdo in ( 'APL', 'RLA')
                        )
                       SELECT * FROM Correcciones order by id_dclrcion) loop
        select sum(nvl(vlor_hber, 0))
          into v_vlor_rcdo
          from v_gf_g_movimientos_detalle a
          join df_i_conceptos b
            on a.id_cncpto = b.id_cncpto
           and b.sncion = 'N'
         where id_orgen = c_pgos.id_dclrcion --inicial 853430  corr ???
           and b.id_cncpto = c_cncptos.id_cncpto
           and a.cdgo_mvmnto_orgn_dtlle = 'RE'
           and a.cdgo_mvmnto_tpo in ('PC' /*,'DI'*/);
        -- dbms_output.put_line('ID CONCEPTO => '||c_cncptos.id_cncpto||' - VALOR => '|| v_vlor_rcdo  );

      end loop;

      v_json_obj.PUT(c_cncptos.name, v_vlor_rcdo);
      v_json_array.APPEND(v_json_obj);
    end loop;
    v_concepto.put('CONCEPTOS', JSON_ARRAY_T(v_json_array));

    v_json_cncptos := v_concepto.to_clob;
    return v_json_cncptos;
  end fnc_co_cncptos_antriores_pago;

end pkg_gi_declaraciones_utlddes;
/

