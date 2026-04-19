
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_GN_AJSTES_AL_PESO_ATMTCO"
as
begin
declare
    v_gf_g_movimientos_detalle gf_g_movimientos_detalle%rowtype;
    v_gf_d_ajuste_motivo       gf_d_ajuste_motivo%rowtype;
    v_id_fljo                  wf_d_flujos.id_fljo%type;
    v_id_usrio                 sg_g_usuarios.id_usrio%type;
    v_fcha                     date := trunc(sysdate);
    v_id_ajste                 gf_g_ajustes.id_ajste%type;
    o_mnsje_rspsta             varchar2(4000);
    v_fljo_trea                wf_g_instancias_flujo.id_instncia_fljo%type;
    v_instncia_fljo            v_wf_d_flujos_transicion.id_fljo_trea%type;

    type t_ajstes is record
    (
        id_ajste       gf_g_ajustes.id_ajste%type,
        id_sjto_impsto gf_g_ajustes.id_sjto_impsto%type,
        cdgo_clnte     gf_g_ajustes.cdgo_clnte%type
    );

    type c_ajstes is table of t_ajstes index by binary_integer;
    v_ajstes c_ajstes;
begin

    for c_vigencias in (
                              select a.cdgo_clnte
                                   , a.cdgo_mvmnto_orgn
                                   , a.id_orgen
                                   , a.vgncia
                                   , a.id_prdo
                                   , a.id_impsto
                                   , a.id_impsto_sbmpsto
                                   , a.id_sjto_impsto
                                   , a.vlor_sldo_cptal
                                from v_gf_g_cartera_x_vigencia a
                               where ( cdgo_mvmnto_orgn , id_orgen ) in (
                                                                                    select cdgo_mvmnto_orgn
                                                                                         , id_orgen
                                                                                      from gf_g_movimientos_financiero where id_mvmnto_fncro in (
                                                                                    select id_mvmnto_fncro
                                                                                      from gf_g_movimientos_detalle where id_mvmnto_dtlle in (
                                                                                                                                                    select id_mvmnto_dtlle
                                                                                                                                                      from re_g_documentos_detalle
                                                                                                                                                     where id_dcmnto in (
                                                                                                                                                                            select id_dcmnto
                                                                                                                                                                              from re_g_documentos
                                                                                                                                                                             where cdgo_dcmnto_tpo    = 'DNO'
                                                                                                                                                                               and indcdor_pgo_aplcdo = 'S'
                                                                                                                                                                        )
                                                                                                                                             ))
                                                                        )
                                and vlor_sldo_cptal <> 0
                                and vlor_sldo_cptal <= 1000
                                and vlor_intres     <= 1000
                                and a.id_sjto_impsto in (
                                                            select b.id_sjto_impsto
                                                            from v_re_g_recaudos a
                                                            join re_g_documentos b on a.id_orgen = b.id_dcmnto
                                                            where trunc(a.fcha_apliccion) BETWEEN '01/10/20' and '13/10/20'
                                                            --and trunc(b.fcha_dcmnto) BETWEEN '01/10/20' and '13/10/20'
                                                            and a.cdgo_rcdo_estdo = 'AP'
                                                            and a.id_impsto = 101
                                                            and b.cdgo_dcmnto_tpo = 'DNO'
                                                            and b.indcdor_pgo_aplcdo = 'S'
                                                        )
                           order by a.id_sjto_impsto
                                  , a.vgncia
        ) loop

                 begin
                    select /*+ RESULT_CACHE */
                           a.*
                      into v_gf_d_ajuste_motivo
                      from gf_d_ajuste_motivo a
                     where cdgo_clnte      = c_vigencias.cdgo_clnte
                       and id_impsto       = c_vigencias.id_impsto
                       and cdgo_ajste_mtvo = 'AJCP';
                 exception
                       when no_data_found then
                            raise_application_error(-20326,'Error no se encuentra parametrizado el motivo del ajuste.');
                 end;

                 begin
                    select /*+ RESULT_CACHE */
                           id_fljo
                      into v_id_fljo
                      from wf_d_flujos
                     where cdgo_clnte = c_vigencias.cdgo_clnte
                       and cdgo_fljo = 'AJG';
                 exception
                      when no_data_found then
                           raise_application_error(-20326,'Error no se encuentra parametrizado el flujo de ajuste.');
                 end;

                begin
                  select /*+ RESULT_CACHE */
                        id_usrio
                   into v_id_usrio
                   from v_sg_g_usuarios
                  where cdgo_clnte = c_vigencias.cdgo_clnte
                    and user_name  = '1111111111';
                exception
                   when no_data_found then
                        raise_application_error(-20326,'Error no se encuentra parametrizado el usuario administrador.');
                end;

                begin
                    select  /*+ RESULT_CACHE */
                           id_ajste
                      into v_id_ajste
                      from gf_g_ajustes
                     where cdgo_clnte        = c_vigencias.cdgo_clnte
                       and id_impsto         = c_vigencias.id_impsto
                       and id_impsto_sbmpsto = c_vigencias.id_impsto_sbmpsto
                       and id_sjto_impsto    = c_vigencias.id_sjto_impsto
                       and id_ajste_mtvo     = v_gf_d_ajuste_motivo.id_ajste_mtvo
                       and trunc(fcha)       = v_fcha;
                  exception
                       when no_data_found then

                            declare
                                v_numro_ajste gf_g_ajustes.numro_ajste%type;
                                e_null exception;
                            begin
                                --Registra la Instancia del Flujo
                                pkg_pl_workflow_1_0.prc_rg_instancias_flujo( p_id_fljo          => v_id_fljo
                                                                           , p_id_usrio         => v_id_usrio
                                                                           , p_id_prtcpte       => null
                                                                           , p_obsrvcion        => 'Instancia de Flujo de Ajuste Automático, Credito al Peso'
                                                                           , o_id_instncia_fljo => v_instncia_fljo
                                                                           , o_id_fljo_trea     => v_fljo_trea
                                                                           , o_mnsje            => o_mnsje_rspsta );

                                if( v_instncia_fljo is null ) then
                                    raise e_null;
                                end if;

                                update wf_g_instancias_flujo
                                   set estdo_instncia   = 'FINALIZADA'
                                 where id_instncia_fljo = v_instncia_fljo;

                                v_numro_ajste := pkg_gn_generalidades.fnc_cl_consecutivo( p_cdgo_clnte => c_vigencias.cdgo_clnte , p_cdgo_cnsctvo => 'AJT' );

                                --Inserta el Registro del Ajuste
                                insert into gf_g_ajustes( cdgo_clnte , id_impsto , id_impsto_sbmpsto , id_sjto_impsto , orgen
                                                        , fcha , tpo_ajste , vlor , id_ajste_mtvo , obsrvcion
                                                        , cdgo_ajste_estdo , tpo_dcmnto_sprte , nmro_dcmto_sprte , fcha_dcmnto_sprte
                                                        , nmro_slctud , id_usrio , id_instncia_fljo , id_fljo_trea
                                                        , numro_ajste , ind_ajste_prcso )
                                                 values ( c_vigencias.cdgo_clnte , c_vigencias.id_impsto , c_vigencias.id_impsto_sbmpsto , c_vigencias.id_sjto_impsto , 'A'
                                                        , v_fcha , v_gf_d_ajuste_motivo.tpo_ajste , 0 , v_gf_d_ajuste_motivo.id_ajste_mtvo , upper(v_gf_d_ajuste_motivo.dscrpcion) || ', GENERADO POR EL SISTEMA.'
                                                        , 'RG' , 0 , to_number( to_char(v_fcha , 'YYYYMMDD') || c_vigencias.id_sjto_impsto ) , v_fcha
                                                        , to_number( to_char(v_fcha , 'YYYYMMDD') || c_vigencias.id_sjto_impsto ) , v_id_usrio , v_instncia_fljo , v_fljo_trea
                                                        , v_numro_ajste , 'C' )
                                                returning id_ajste into v_id_ajste;
                            exception
                                 when others then
                                      rollback;
                                      dbms_output.put_line( sqlerrm || '-' || o_mnsje_rspsta);
                                      continue;
                            end;
              end;

             if( not v_ajstes.exists(v_id_ajste)) then
                 v_ajstes(v_id_ajste).id_ajste       := v_id_ajste;
                 v_ajstes(v_id_ajste).id_sjto_impsto := c_vigencias.id_sjto_impsto;
                 v_ajstes(v_id_ajste).cdgo_clnte     := c_vigencias.cdgo_clnte;
             end if;

                     for c_conceptos in (
                                                select id_mvmnto_fncro
                                                     , id_cncpto
                                                     , vlor_sldo_cptal
                                                     , vlor_intres
                                                     , cdgo_prdcdad
                                                     , gnra_intres_mra
                                                     , fcha_vncmnto
                                                     , id_impsto_acto_cncpto
                                                  from v_gf_g_cartera_x_concepto
                                                 where cdgo_clnte         = c_vigencias.cdgo_clnte
                                                   and id_impsto          = c_vigencias.id_impsto
                                                   and id_impsto_sbmpsto  = c_vigencias.id_impsto_sbmpsto
                                                   and vgncia             = c_vigencias.vgncia
                                                   and id_prdo            = c_vigencias.id_prdo
                                                   and id_sjto_impsto     = c_vigencias.id_sjto_impsto
                                                   and cdgo_mvmnto_orgn   = c_vigencias.cdgo_mvmnto_orgn
                                                   and id_orgen           = c_vigencias.id_orgen
                                                   and vlor_sldo_cptal   <> 0
                                        ) loop

                          --Almacena el Detalle del Movimiento de Ingreso
                          begin
                              select a.*
                                into v_gf_g_movimientos_detalle
                                from gf_g_movimientos_detalle a
                               where a.id_mvmnto_fncro = c_conceptos.id_mvmnto_fncro
                                 and a.id_cncpto       = c_conceptos.id_cncpto
                                 and a.cdgo_mvmnto_tpo = 'IN'
                                 and a.cdgo_mvmnto_orgn = 'LQ';
                          exception
                               when no_data_found then
                                    rollback;
                                    dbms_output.put_line('No se encontro el ingreso en movimiento financieros');
                                    exit;
                          end;

                          begin
                              insert into gf_g_ajuste_detalle( id_ajste , vgncia , id_prdo , id_cncpto , sldo_cptal
                                                             , vlor_ajste , id_mvmnto_orgn , vlor_intres , ajste_dtlle_tpo )
                                                      values ( v_id_ajste , c_vigencias.vgncia , c_vigencias.id_prdo , c_conceptos.id_cncpto , c_conceptos.vlor_sldo_cptal
                                                             , c_conceptos.vlor_sldo_cptal , v_gf_g_movimientos_detalle.id_mvmnto_dtlle , c_conceptos.vlor_intres , 'C' );

                              update gf_g_ajustes
                                 set vlor = vlor + c_conceptos.vlor_sldo_cptal
                               where id_ajste = v_id_ajste;

                          exception
                               when others then
                                    rollback;
                                    dbms_output.put_line( sqlerrm );
                                    exit;
                          end;

                          --Ajuste credito
                          begin
                              insert into gf_g_movimientos_detalle( id_mvmnto_dtlle , id_mvmnto_fncro , cdgo_mvmnto_orgn , id_orgen , cdgo_mvmnto_tpo , vgncia , id_prdo
                                                                  , cdgo_prdcdad , fcha_mvmnto , id_cncpto , id_cncpto_csdo , vlor_dbe , vlor_hber , id_mvmnto_dtlle_bse
                                                                  , actvo , gnra_intres_mra , fcha_vncmnto , id_impsto_acto_cncpto )
                                                           values ( sq_gf_g_movimientos_detalle.nextval , c_conceptos.id_mvmnto_fncro , 'AJ' , v_id_ajste , 'AC' , c_vigencias.vgncia , c_vigencias.id_prdo
                                                                  , c_conceptos.cdgo_prdcdad , sysdate , c_conceptos.id_cncpto , c_conceptos.id_cncpto , 0 , c_conceptos.vlor_sldo_cptal , null
                                                                  , 'S' , c_conceptos.gnra_intres_mra , c_conceptos.fcha_vncmnto , c_conceptos.id_impsto_acto_cncpto );
                              commit;
                          exception
                               when others then
                                    rollback;
                                    dbms_output.put_line( sqlerrm );
                                    exit;
                          end;
                     end loop;
        commit;
    end loop;

    dbms_output.put_line(v_ajstes.count);

    if( v_ajstes.count > 0 ) then
        for i in v_ajstes.first..v_ajstes.last loop

            update gf_g_ajustes
               set cdgo_ajste_estdo = 'AP'
                 , fcha_aplccion    = systimestamp
             where id_ajste         = v_ajstes(i).id_ajste;

            pkg_gf_movimientos_financiero.prc_ac_concepto_consolidado( p_cdgo_clnte     => v_ajstes(i).cdgo_clnte
                                                                     , p_id_sjto_impsto => v_ajstes(i).id_sjto_impsto );

            commit;
        end loop;
    end if;

end;
end;
/

