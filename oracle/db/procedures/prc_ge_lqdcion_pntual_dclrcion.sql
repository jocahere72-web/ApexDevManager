
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_GE_LQDCION_PNTUAL_DCLRCION" ( p_cdgo_clnte   in  df_s_clientes.cdgo_clnte%type
                                        , p_id_usrio     in  sg_g_usuarios.id_usrio%type
                                        , p_id_dclrcion  in  gi_g_declaraciones.id_dclrcion%type
                                        , o_id_lqdcion   out gi_g_liquidaciones.id_lqdcion%type
                                        , o_cdgo_rspsta  out number
                                        , o_mnsje_rspsta out varchar2 )
as
    v_nvel                number;
    v_nmbre_up            sg_d_configuraciones_log.nmbre_up%type := 'pkg_gi_declaraciones_utlddes.prc_ge_lqdcion_pntual_dclrcion';
    v_gi_g_declaraciones  gi_g_declaraciones%rowtype;
    v_cdgo_prdcdad        df_i_periodos.cdgo_prdcdad%type;
    v_id_lqdcion_antrior  gi_g_liquidaciones.id_lqdcion_antrior%type;
    v_id_lqdcion_tpo      df_i_liquidaciones_tipo.id_lqdcion_tpo%type;
    v_fcha_vncmnto        date;

    type t_cncptos is record
    (
       id_cncpto             df_i_conceptos.id_cncpto%type,
       id_impsto_acto_cncpto df_i_impuestos_acto_concepto.id_impsto_acto_cncpto%type
    );

    type r_cncptos is table of t_cncptos;
    v_cncptos r_cncptos;
begin

    --Respuesta Exitosa
    o_cdgo_rspsta := 0;

    --Determinamos el Nivel del Log de la UP
    v_nvel := pkg_sg_log.fnc_ca_nivel_log( p_cdgo_clnte => p_cdgo_clnte , p_id_impsto => null , p_nmbre_up => v_nmbre_up );

    o_mnsje_rspsta := 'Inicio del procedimiento ' || v_nmbre_up;
    pkg_sg_log.prc_rg_log( p_cdgo_clnte => p_cdgo_clnte , p_id_impsto => null , p_nmbre_up => v_nmbre_up
                         , p_nvel_log => v_nvel , p_txto_log => o_mnsje_rspsta , p_nvel_txto => 1 );

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
              o_mnsje_rspsta := o_cdgo_rspsta || '. La declaración #[' || p_id_dclrcion || '], no existe en el sistema.';
              pkg_sg_log.prc_rg_log( p_cdgo_clnte => p_cdgo_clnte , p_id_impsto => null , p_nmbre_up => v_nmbre_up
                                   , p_nvel_log => v_nvel , p_txto_log => o_mnsje_rspsta , p_nvel_txto => 3 );
              return;
    end;

    --Verifica si la Declaración no se Encuentra Liquidada
    if( v_gi_g_declaraciones.id_lqdcion is not null ) then
        o_cdgo_rspsta  := 2;
        o_mnsje_rspsta := o_cdgo_rspsta || '. La declaración #' || v_gi_g_declaraciones.nmro_cnsctvo ||', ya se encuentra liquidada.';
        pkg_sg_log.prc_rg_log( p_cdgo_clnte => p_cdgo_clnte , p_id_impsto => null , p_nmbre_up => v_nmbre_up
                             , p_nvel_log => v_nvel , p_txto_log => o_mnsje_rspsta , p_nvel_txto => 3 );
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
              o_mnsje_rspsta := o_cdgo_rspsta || '. El período #[' || v_gi_g_declaraciones.id_prdo || '], no existe en el sistema.';
              pkg_sg_log.prc_rg_log( p_cdgo_clnte => p_cdgo_clnte , p_id_impsto => null , p_nmbre_up => v_nmbre_up
                                   , p_nvel_log => v_nvel , p_txto_log => o_mnsje_rspsta , p_nvel_txto => 3 );
              return;
    end;

    --Busca el Tipo de Liquidación
    begin
        select id_lqdcion_tpo
          into v_id_lqdcion_tpo
          from df_i_liquidaciones_tipo
         where cdgo_clnte       = p_cdgo_clnte
           and id_impsto        = v_gi_g_declaraciones.id_impsto
           and cdgo_lqdcion_tpo = 'DLC';
    exception
         when no_data_found then
              o_cdgo_rspsta  := 4;
              o_mnsje_rspsta := o_cdgo_rspsta || '. El tipo de liquidación [DLC], no existe en el sistema.';
              pkg_sg_log.prc_rg_log( p_cdgo_clnte => p_cdgo_clnte , p_id_impsto => null , p_nmbre_up => v_nmbre_up
                                   , p_nvel_log => v_nvel , p_txto_log => o_mnsje_rspsta , p_nvel_txto => 3 );
              return;
    end;

    --Busca si Existe Liquidación Actual
    begin
        select id_lqdcion
          into v_id_lqdcion_antrior
          from gi_g_liquidaciones
         where cdgo_clnte         = p_cdgo_clnte
           and id_impsto          = v_gi_g_declaraciones.id_impsto
           and id_impsto_sbmpsto  = v_gi_g_declaraciones.id_impsto_sbmpsto
           and id_prdo            = v_gi_g_declaraciones.id_prdo
           and id_sjto_impsto     = v_gi_g_declaraciones.id_sjto_impsto
           and cdgo_lqdcion_estdo = 'L'
           and id_lqdcion_tpo     = v_id_lqdcion_tpo;
    exception
         when no_data_found then
              null;
         when too_many_rows then
              o_cdgo_rspsta  := 5;
              o_mnsje_rspsta := o_cdgo_rspsta || '. Para la declaración #' || v_gi_g_declaraciones.nmro_cnsctvo || ', no fue posible encontrar la última liquidación ya que existe mas de un registro con estado [L].';
              pkg_sg_log.prc_rg_log( p_cdgo_clnte => p_cdgo_clnte , p_id_impsto => null , p_nmbre_up => v_nmbre_up
                                   , p_nvel_log => v_nvel , p_txto_log => ( o_mnsje_rspsta || ' Error: ' || sqlerrm ) , p_nvel_txto => 3 );
              return;
    end;

    --Inserta el Registro de Liquidación
    begin
        insert into gi_g_liquidaciones ( cdgo_clnte , id_impsto , id_impsto_sbmpsto , vgncia , id_prdo
                                       , id_sjto_impsto , fcha_lqdcion , cdgo_lqdcion_estdo , bse_grvble , vlor_ttal
                                       , id_lqdcion_tpo , cdgo_prdcdad , id_lqdcion_antrior , id_usrio )
                                values ( p_cdgo_clnte , v_gi_g_declaraciones.id_impsto , v_gi_g_declaraciones.id_impsto_sbmpsto , v_gi_g_declaraciones.vgncia , v_gi_g_declaraciones.id_prdo
                                       , v_gi_g_declaraciones.id_sjto_impsto , systimestamp , 'L' , 0 , 0
                                       , v_id_lqdcion_tpo , v_cdgo_prdcdad , v_id_lqdcion_antrior , p_id_usrio )
        returning id_lqdcion
             into o_id_lqdcion;
    exception
         when others then
              o_cdgo_rspsta  := 6;
              o_mnsje_rspsta := o_cdgo_rspsta || '. No fue posible crear el registro de liquidación.';
              pkg_sg_log.prc_rg_log( p_cdgo_clnte => p_cdgo_clnte , p_id_impsto => null , p_nmbre_up => v_nmbre_up
                                   , p_nvel_log => v_nvel , p_txto_log => ( o_mnsje_rspsta || ' Error: ' || sqlerrm ) , p_nvel_txto => 3 );
              return;
    end;

    --Busca los Conceptos de la Liquidación
    select i.id_cncpto
         , i.id_impsto_acto_cncpto
      bulk collect
      into v_cncptos
      from df_i_impuestos_acto_concepto i
     where i.id_impsto_acto = (
                                    select c.id_impsto_acto
                                      from gi_d_dclrcnes_vgncias_frmlr a
                                      join gi_d_dclrcnes_tpos_vgncias b
                                        on a.id_dclrcion_tpo_vgncia     = b.id_dclrcion_tpo_vgncia
                                      join gi_d_declaraciones_tipo c
                                        on b.id_dclrcn_tpo              = c.id_dclrcn_tpo
                                     where a.id_dclrcion_vgncia_frmlrio = v_gi_g_declaraciones.id_dclrcion_vgncia_frmlrio
                              )
       and i.vgncia    =  v_gi_g_declaraciones.vgncia
       and i.id_prdo   =  v_gi_g_declaraciones.id_prdo
       and i.id_cncpto <> 120
       and i.actvo     =  'S'
  order by i.orden;

    --Verifica si Existen Conceptos por Liquidar
    if( v_cncptos.count = 0 ) then
        o_cdgo_rspsta  := 7;
        o_mnsje_rspsta := o_cdgo_rspsta || '. No se encuentra parametrizado los actos conceptos en el sistema.';
        pkg_sg_log.prc_rg_log( p_cdgo_clnte => p_cdgo_clnte , p_id_impsto => null , p_nmbre_up => v_nmbre_up
                             , p_nvel_log => v_nvel , p_txto_log => o_mnsje_rspsta , p_nvel_txto => 3 );
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
       where a.id_sjto = (
                              select b.id_sjto
                                from si_i_sujetos_impuesto b
                               where b.id_sjto_impsto = v_gi_g_declaraciones.id_sjto_impsto
                         );

      --Busca la Homologación del Tipo de Sujeto
      /*pkg_gi_declaraciones.prc_co_homologacion( p_cdgo_clnte    => p_cdgo_clnte
                                              , p_cdgo_hmlgcion => 'PRD'
                                              , p_cdgo_prpdad   => 'TST'
                                              , p_id_dclrcion   => v_gi_g_declaraciones.id_dclrcion
                                              , o_vlor          => v_vlor
                                              , o_cdgo_rspsta   => o_cdgo_rspsta
                                              , o_mnsje_rspsta  => o_mnsje_rspsta );

      --Verifica si Hubo Error
      if( o_cdgo_rspsta <> 0 ) then
          o_cdgo_rspsta  := 8;
          o_mnsje_rspsta := o_cdgo_rspsta || '. Para la declaración #[' || v_gi_g_declaraciones.id_dclrcion || '], no fue posible encontrar la homologación del tipo de sujeto.';
          pkg_sg_log.prc_rg_log( p_cdgo_clnte => p_cdgo_clnte , p_id_impsto => null , p_nmbre_up => v_nmbre_up
                               , p_nvel_log => v_nvel , p_txto_log => o_mnsje_rspsta , p_nvel_txto => 3 );
          return;
      end if;*/

      --Busca la Fecha de Vencimiento de la Declaración
      v_fcha_vncmnto := pkg_gi_declaraciones.fnc_co_fcha_lmte_dclrcion( p_id_dclrcion_vgncia_frmlrio => v_gi_g_declaraciones.id_dclrcion_vgncia_frmlrio
                                                                      , p_idntfccion                 => v_idntfccion
                                                                      , p_id_sjto_tpo                => null/*to_char(v_vlor)*/);

      --Verifica si la Fecha de Vencimiento no es Nula
      if( v_fcha_vncmnto is null ) then
          o_cdgo_rspsta  := 9;
          o_mnsje_rspsta := o_cdgo_rspsta || '. Para la identificación #' || v_idntfccion || ', no fue posible encontrar la fecha de vencimiento.';
          pkg_sg_log.prc_rg_log( p_cdgo_clnte => p_cdgo_clnte , p_id_impsto => null , p_nmbre_up => v_nmbre_up
                               , p_nvel_log => v_nvel , p_txto_log => o_mnsje_rspsta , p_nvel_txto => 3 );
          return;
      end if;
    end;

    --Recorre la Colección de Conceptos
    for i in 1..v_cncptos.count loop
        declare
            v_vlor_clcldo gi_g_liquidaciones_concepto.vlor_clcldo%type;
            v_vlor_lqddo  gi_g_liquidaciones_concepto.vlor_lqddo%type;
            v_trfa        number;
        begin
            --Verifica si Existe el Concepto en Declaración
            select a.bse
                 , a.bse
                 , a.trfa
              into v_vlor_clcldo
                 , v_vlor_lqddo
                 , v_trfa
              from table ( pkg_gi_declaraciones_utlddes.fnc_co_lqdcion_acto_cncpto( p_id_dclrcion => p_id_dclrcion )) a
             where a.id_impsto_acto_cncpto = v_cncptos(i).id_impsto_acto_cncpto;

            --Inserta el Registro de Liquidación Concepto
            begin
                 insert into gi_g_liquidaciones_concepto ( id_lqdcion , id_impsto_acto_cncpto , vlor_lqddo , vlor_clcldo , trfa
                                                         , bse_cncpto , txto_trfa , vlor_intres , indcdor_lmta_impsto , fcha_vncmnto )
                                                  values ( o_id_lqdcion , v_cncptos(i).id_impsto_acto_cncpto , v_vlor_lqddo , v_vlor_clcldo , v_trfa
                                                         , v_vlor_lqddo , ( v_trfa || '/' || 1000 ) , 0 , 'N' , v_fcha_vncmnto );
            exception
                  when others then
                       o_cdgo_rspsta  := 10;
                       o_mnsje_rspsta := o_cdgo_rspsta || '. No fue posible crear el registro de liquidación concepto.';
                       pkg_sg_log.prc_rg_log( p_cdgo_clnte => p_cdgo_clnte , p_id_impsto => null , p_nmbre_up => v_nmbre_up
                                            , p_nvel_log => v_nvel , p_txto_log => ( o_mnsje_rspsta || ' Error: ' || sqlerrm ) , p_nvel_txto => 3 );
                       return;
            end;

            --Actualiza el Valor Total de la Liquidación
            update gi_g_liquidaciones
               set vlor_ttal  = nvl( vlor_ttal , 0 ) + v_vlor_lqddo
             where id_lqdcion = o_id_lqdcion;

        exception
             when no_data_found then
                  o_cdgo_rspsta  := 11;
                  o_mnsje_rspsta := o_cdgo_rspsta || '. Para la declaración #' || v_gi_g_declaraciones.nmro_cnsctvo || ', no se encuentra el acto concepto homologado id#[' || v_cncptos(i).id_impsto_acto_cncpto || '].';
                  pkg_sg_log.prc_rg_log( p_cdgo_clnte => p_cdgo_clnte , p_id_impsto => null , p_nmbre_up => v_nmbre_up
                                       , p_nvel_log => v_nvel , p_txto_log => o_mnsje_rspsta , p_nvel_txto => 3 );
                  return;
             when too_many_rows then
                  o_cdgo_rspsta  := 12;
                  o_mnsje_rspsta := o_cdgo_rspsta || '. Para la declaración #' || v_gi_g_declaraciones.nmro_cnsctvo || ', existe mas de un concepto acto homologado id#[' || v_cncptos(i).id_impsto_acto_cncpto || '].';
                  pkg_sg_log.prc_rg_log( p_cdgo_clnte => p_cdgo_clnte , p_id_impsto => null , p_nmbre_up => v_nmbre_up
                                       , p_nvel_log => v_nvel , p_txto_log => ( o_mnsje_rspsta || ' Error: ' || sqlerrm ) , p_nvel_txto => 3 );
                  return;
        end;
    end loop;

    --Inactiva las Liquidaciónes Anteriores
    update gi_g_liquidaciones
       set cdgo_lqdcion_estdo  = 'I'
     where cdgo_clnte          = p_cdgo_clnte
       and id_impsto           = v_gi_g_declaraciones.id_impsto
       and id_impsto_sbmpsto   = v_gi_g_declaraciones.id_impsto_sbmpsto
       and id_prdo             = v_gi_g_declaraciones.id_prdo
       and id_sjto_impsto      = v_gi_g_declaraciones.id_sjto_impsto
       and id_lqdcion_tpo      = v_id_lqdcion_tpo
       and id_lqdcion         <> o_id_lqdcion;

    --Actualiza la Liquidación a Declaración
    update gi_g_declaraciones
       set id_lqdcion  = o_id_lqdcion
     where id_dclrcion = p_id_dclrcion;

    o_mnsje_rspsta := 'Fin del procedimiento ' || v_nmbre_up;
    pkg_sg_log.prc_rg_log( p_cdgo_clnte => p_cdgo_clnte , p_id_impsto => null , p_nmbre_up => v_nmbre_up
                         , p_nvel_log => v_nvel , p_txto_log => o_mnsje_rspsta , p_nvel_txto => 1 );

    o_mnsje_rspsta := 'Liquidación creada con éxito #' || o_id_lqdcion || '.';

exception
     when others then
          o_cdgo_rspsta  := 13;
          o_mnsje_rspsta := o_cdgo_rspsta || '. No fue posible liquidar la declaración #[' || p_id_dclrcion || '], inténtelo más tarde.';
          pkg_sg_log.prc_rg_log( p_cdgo_clnte => p_cdgo_clnte , p_id_impsto => null , p_nmbre_up => v_nmbre_up
                               , p_nvel_log => v_nvel , p_txto_log => ( o_mnsje_rspsta || ' Error: ' || sqlerrm ) , p_nvel_txto => 3 );
end prc_ge_lqdcion_pntual_dclrcion;
/

