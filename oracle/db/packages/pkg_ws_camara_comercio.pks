
  CREATE OR REPLACE EDITIONABLE PACKAGE "PKG_WS_CAMARA_COMERCIO" as

  -- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  -- |                       VARIABLES GLOBALES                       |
  -- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  -- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  function fnc_ob_url_manejador(p_cdgo_api  in varchar2,
                                p_id_prvdor in number) return clob;

  function fnc_ob_propiedad_provedor(p_cdgo_clnte  in number,
                                     p_id_impsto   in number,
                                     p_id_prvdor   in number,
                                     p_cdgo_prpdad in varchar2)
    return varchar2;

  procedure prc_co_consultarDatos(p_cdgo_clnte      in number,
                                  p_tpo_prcso_cnlta in varchar2 default null,
                                  p_id_prvdor       in number default null,
                                  p_id_impsto       in number,
                                  p_fcha_incial     in timestamp,
                                  p_fcha_fnal       in timestamp,
                                  p_mtrcla          in varchar2 default null,
                                  p_tpo_rprte       in number default 1,
                                  p_id_usrio        number,
                                  p_tpo_accion      in varchar2 default null,
                                  o_cdgo_rspsta     out number,
                                  o_mnsje_rspsta    out clob);

  procedure prc_gn_novedades(p_cdgo_clnte        in number,
                             p_id_prvdor         in number,
                             p_id_impsto         in number,
                             p_id_impsto_sbmpsto in number,
                             p_id_usrio          in number,
                             p_tpo_prcso_cnlta   in varchar2,
                             p_fcha_incial       in timestamp,
                             p_fcha_fnal         in timestamp,
                             p_tpo_rprte         in number,
                             p_tpo_accion        in varchar2,
                             p_obsrvcion         in varchar2,
                             p_id_fljo           in number,
                             o_id_session        out number,
                             o_id_instncia_fljo  out number,
                             o_cdgo_rspsta       out number,
                             o_mnsje_rspsta      out varchar2);

  procedure prc_gn_actos_inscrpcion(p_cdgo_clnte          in number,
                                    p_id_impsto_sbmpsto   in number,
                                    p_idntfccion          in varchar2,
                                    p_id_nvdad_prsna      in number,
                                    p_id_cnfcmra_sjto_lte in number,
                                    p_id_usrio            in number,
                                    p_id_session          in number,
                                    o_cdgo_rspsta         out number,
                                    o_mnsje_rspsta        out varchar2);

  procedure prc_rg_novedades(p_json           in clob,
                             o_id_nvdad_prsna out number,
                             o_cdgo_rspsta    out number,
                             o_mnsje_rspsta   out varchar2);

  procedure prc_co_identificacion(p_cdgo_clnte   number,
                                  p_id_impsto    number,
                                  p_id_prvdor    number,
                                  p_idntfccion   varchar2,
                                  p_cdgo_rspsta  out number,
                                  p_mnsje_rspsta out varchar2);

  /*
    Autor : Jorge Badran
    Creado : 21/02/2025
    Descripción: procedimiento encargado consultar los propietarios de los establecimiento.
  */
  procedure prc_co_DatosPropietario(p_cdgo_clnte   in number,
                                    p_id_prvdor    in number,
                                    p_id_impsto    in number,
                                    p_id_usrio     in number,
                                    o_cdgo_rspsta  out number,
                                    o_mnsje_rspsta out clob);

  /*
    Autor : Jorge Badran
    Creado : 31/03/2025
    Descripción: procedimiento encargado enviar los emails de los actos
  */
  procedure prc_nt_actos(p_cdgo_clnte     in number,
                         p_id_cnfcmra_lte in number);

  /*Procedimiento encargado de registrar sucursales a un expediente.*/
  procedure prc_rg_sucursales(p_idntfccion   in si_c_sujetos.idntfccion%type,
                              o_cdgo_rspsta  out number,
                              o_mnsje_rspsta out varchar2);

  /*Procedimiento encargado de registrar traza de error de un expediente.*/
  procedure prc_rg_trza_error(p_id_cnfcmra_lte      in ws_g_confecamaras_sjto_lte.id_cnfcmra_lte%type,
                              p_id_cnfcmra_sjto_lte in ws_g_confecamaras_sjto_lte.id_cnfcmra_sjto_lte%type,
                              p_obsrvcion           in clob,
                              o_cdgo_rspsta         out number,
                              o_mnsje_rspsta        out varchar2);

  /*Registrar en tablas expediente, el proceso se realiza por pagina obtenida del sistema*/
  procedure prc_rg_datos(p_cdgo_clnte   in number,
                         p_json         in clob,
                         p_json_cnslta  in clob,
                         p_id_usrio     in number,
                         p_tpo_rprte    in number,
                         p_id_impsto    in si_i_sujetos_impuesto.id_impsto%type,
                         p_fcha_incial  in timestamp,
                         p_fcha_fnal    in timestamp,
                         o_cdgo_rspsta  out number,
                         o_mnsje_rspsta out varchar2);

  /*Validación que cada expediente cumpla para poder realizar la novedad en el sistema.
    si el expediente no cumple en su totalidad, se registra obervación en la tabla ws_d_confecmrs_sjt_lt_error
  */
  procedure prc_vl_dprar_dtos(p_cdgo_clnte     in number,
                              P_id_cnfcmra_lte in number,
                              p_id_impsto      in number,
                              o_cdgo_rspsta    out number,
                              o_mnsje_rspsta   out varchar2);

end pkg_ws_camara_comercio;
/

