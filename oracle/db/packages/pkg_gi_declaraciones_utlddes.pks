
  CREATE OR REPLACE EDITIONABLE PACKAGE "PKG_GI_DECLARACIONES_UTLDDES" as
  /*
  * @Descripci?n  : Generar Liquidaci?n Puntual (Declaraci?n)
  * @Creaci?n     : 27/11/2019
  * @Modificaci?n : 22/05/2019
  */
  /*
  *g_divisor : Constante Divisor Tarifa
  */
  g_divisor constant number := 1000;

  type t_acto_cncpto is record(
    id_impsto_acto_cncpto df_i_impuestos_acto_concepto.id_impsto_acto_cncpto%type,
    id_cncpto             df_i_conceptos.id_cncpto%type,
    cdgo_cncpto           df_i_conceptos.cdgo_cncpto%type,
    dscrpcion_cncpto      df_i_conceptos.dscrpcion%type,
    bse                   number,
    trfa                  number);

  type g_acto_cncpto is table of t_acto_cncpto;

  /*
  * @Descripción  : Generar Liquidación Puntual (Declaración)
  * @Creación     : 27/11/2019
  * @Modificación : 27/11/2019
  * @Modificación : 07/11/2024
  */

  procedure prc_ge_lqdcion_pntual_dclrcion(p_cdgo_clnte in df_s_clientes.cdgo_clnte%type,

                                           p_id_usrio     in sg_g_usuarios.id_usrio%type,
                                           p_id_dclrcion  in gi_g_declaraciones.id_dclrcion%type,
                                           o_id_lqdcion   out gi_g_liquidaciones.id_lqdcion%type,
                                           o_cdgo_rspsta  out number,
                                           o_mnsje_rspsta out varchar2);

  /*
  * @Descripci?n  : Consulta los Conceptos de la Liquidaci?n de Declaraci?n
  * @Creaci?n     : 27/11/2019
  * @Modificaci?n : 27/11/2019
  */

  function fnc_co_lqdcion_acto_cncpto(p_id_dclrcion in gi_g_declaraciones.id_dclrcion%type)
    return g_acto_cncpto
    pipelined;

  /*
  * @Descripción  : Aplicación de Declaración
  * @Creación     : 27/11/2019
  * @Modificación : 27/11/2019
  * @Modificación : 08/03/2019
  * @Modificación : 07/11/2024 Luis Ariza
  */

  procedure prc_ap_declaracion(p_cdgo_clnte     in df_s_clientes.cdgo_clnte%type,
                               p_id_usrio       in sg_g_usuarios.id_usrio%type default null,
                               p_id_dclrcion    in gi_g_declaraciones.id_dclrcion%type,
                               o_vlor_sldo_fvor out number, --Variable que contiene el saldo a favor generado por la aplicación de una corrección de declaración por menor valor.
                               o_cdgo_rspsta    out number,
                               o_mnsje_rspsta   out varchar2);

  /*
  * @Descripci?n  : Procesamiento declaraciones externas
  * @Creaci?n     : 15/07/2022
  * @Modificaci?n : 15/07/2022
  */
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
                                       o_mnsje_rspsta               out varchar2);

  /*
  * Función que retorna los conceptos pagados de la declaracion inicial
  * Creación      : 7/02/2024
  * Modificación  : 7/02/2024
  * Brayan Villegas
  */
  function fnc_co_cncptos_antriores(p_id_dclrcion in gi_g_declaraciones.id_dclrcion%type)
    return varchar2;

  /*
      * @Descripción  : Aplicación de Ley Ineficaz a las Declaraciones vencidas sin pagos o pagos parciales
      * @Creación     : 20/02/2025
      * @Modificación : 20/02/2025  - Brayan Villegas
  */

  procedure prc_ap_ley_infcz_dclrcion;

  /*
  * Procedimiento que homologa los formulario: Realiza la homologación
  * del formulario v2 y crea el registro en las tablas de declaraciones v1.
  * creación      : 17/01/2024
  * modificación  : 17/01/2024
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
                              o_mnsje_rspsta               out varchar2);

  /*
  * Función que retorna los conceptos pagados de la declaracion inicial
  * Creación      : 24/06/2025
  * Modificación  : 24/06/2025
  * Luis Ariza
  */
  function fnc_co_cncptos_antriores_pago(p_id_dclrcion in gi_g_declaraciones.id_dclrcion%type)
    return varchar2;

end pkg_gi_declaraciones_utlddes;
/

