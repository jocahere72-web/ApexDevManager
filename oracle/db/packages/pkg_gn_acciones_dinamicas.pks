
  CREATE OR REPLACE EDITIONABLE PACKAGE "PKG_GN_ACCIONES_DINAMICAS" as

    --Paquete donde se crearan las up necesarias para realizar determinada accion, ya sea enviar un correo, consumirse un servicio.
    --al apicar un pago, un ajuste, etc
    --Se debe desarrollar una up para cada uno de las acciones
    -- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    -- |                       VARIABLES GLOBALES                       |
    -- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    l_wallet                apex_190100.wwv_flow_security.t_wallet := apex_190100.wwv_flow_security.get_wallet;


    -- Up para registrar la accion a ser procesada
    procedure prc_rg_informacion_accion (   p_cdgo_clnte                  in  number,
                                            p_cdgo_prcso                  in  varchar2,
                                            p_nmbre_tbla                  in  varchar2,
                                            p_nmbre_cmpo                  in  varchar2,
                                            p_id_impsto                   in  number,
                                            p_id_impsto_sbmpsto           in  number,
                                            p_orgen                       in  number,
                                            p_url_ntfccion                in  varchar2 default null,
                                            o_cdgo_rspsta                 out number,
                                            o_mnsje_rspsta                out varchar2);

    --Up que consulta la accion parametrizada
    procedure prc_co_accion(p_cdgo_clnte                  in  number,
                            p_id_impsto                   in  number,
                            p_id_impsto_sbmpsto           in  number,
                            p_cdgo_prcso                  in  varchar2,
                            o_rt_df_c_procesos_accion     out df_c_procesos_accion%rowtype,
                            o_cdgo_rspsta                 out number,
                            o_mnsje_rspsta                out varchar2);

    -- Up que gestiona la up parametrizada
    -- Para este caso, llamar esta up desde el paquete de recaudos cuando apliquen un recaudo
    procedure prc_gn_accion(p_cdgo_clnte                  in  number,
                            p_id_impsto                   in  number,
                            p_id_impsto_sbmpsto           in  number,
                            p_cdgo_prcso                  in  varchar2,
                            p_nmbre_tbla                  in  varchar2,
                            p_nmbre_cmpo                  in  varchar2,
                            p_orgen                       in  number,
                            o_cdgo_rspsta                 out number,
                            o_mnsje_rspsta                out varchar2);


   --Up que realiza la accion para los reacudos aplicados
    procedure prc_gn_aplica_recaudo_rentas( p_cdgo_clnte                  in  number,
                                            p_id_impsto                   in  number,
                                            p_id_impsto_sbmpsto           in  number,
                                            p_cdgo_prcso                  in  varchar2,
                                            p_nmbre_tbla                  in  varchar2,
                                            p_nmbre_cmpo                  in  varchar2,
                                            p_orgen                       in  number,
                                            o_cdgo_rspsta                 out number,
                                            o_mnsje_rspsta                out varchar2);

    --Up que recorre los registros pendientes de procesar
    procedure prc_co_transacciones;


end pkg_gn_acciones_dinamicas;
/

