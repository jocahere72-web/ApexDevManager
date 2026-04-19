
  CREATE OR REPLACE EDITIONABLE PACKAGE "PKG_CB_PROCESO_PERSUASIVO" as

  procedure prc_rg_proceso_persuasivo(p_cdgo_clnte        in number,
                                      p_id_prcsos_smu_lte in number,
                                      p_id_sjto_impsto    in number default null,
                                      p_id_usrio          in number,
                                      p_id_plntlla        in number default null);
  /* Creacion: 16-07-2021
     Modificacion: 21-07-2021
     Autor(es): Jose Aguas
     Descripcion: Procedimiento que realiza la generacion de actos de cobro persuasivo.
  */
  procedure prc_gn_documento_persuasivo(p_cdgo_clnte          in number,
                                        p_json_dcmntos_prrsvo in clob,
                                        p_id_usrio            in number);
  /* Creacion: 21-07-2021
     Modificacion: 21-07-2021
     Autor(es): Jose Aguas
     Descripcion: Funcion que retorna valor de parametros de configuracion.
  */
  function fnc_cl_parametro_configuracion(p_cdgo_clnte     in number,
                                          p_cdgo_cnfgrcion in varchar2)
    return clob;

  procedure prc_gn_archvo_excel(p_cdgo_clnte   in number,
                                p_nmro_lte     in number,
                                p_fcha_lte     in date,
                                o_file_blob    out blob,
                                o_cdgo_rspsta  out number,
                                o_mnsje_rspsta out varchar2);

  procedure prc_gn_envio_email(p_cdgo_clnte   in number,
  p_json_actos   in clob,
  o_cdgo_rspsta  out number,
  o_mnsje_rspsta out varchar2);

  procedure prc_gn_documento_persuasivo_job(p_cdgo_clnte          in number,
                                            p_json_dcmntos_prrsvo in clob,
                                            p_id_usrio            in number,
                                            o_cdgo_rspsta         out number,
                                            o_mnsje_rspsta        out varchar2);

  procedure prc_rg_slccion_cndtos(p_cdgo_clnte   in number,
                                  p_json_prmtros in clob,
                                  p_id_fncnrio   in number,
                                  p_id_usrio     in number,
                                  p_nmro_rgstros in number);

  procedure prc_rg_proceso_persuasivo_job(p_cdgo_clnte        in number,
                                          p_id_prcsos_smu_lte in number,
                                          p_id_sjto_impsto    in number default null,
                                          p_id_usrio          in number,
                                          p_id_plntlla        in number default null,
                                          o_cdgo_rspsta       out number,
                                          o_mnsje_rspsta      out varchar2);

  procedure prc_rg_seleccion_cnddts_archvo(p_cdgo_clnte    in number,
                                           p_id_prcso_crga in number,
                                           p_id_lte        in number,
                                           o_cdgo_rspsta   out number,
                                           o_mnsje_rspsta  out varchar2);

  function fnc_vl_estdo_prscrpcion_vgncia(p_id_sjto_impsto in number,
                                          p_vgncia         in number,
                                          p_id_prdo        in number)
    return varchar2;

  procedure prc_rg_proceso_persuasivo_json(p_cdgo_clnte   in number,
                                           p_json_datos   in clob,
                                           p_id_usrio     in number,
                                           o_cdgo_rspsta  out number,
                                           o_mnsje_rspsta out varchar2);

  procedure prc_gn_blob_prssvo(p_cdgo_clnte   in number,
                               p_json_actos   in clob,
                               p_id_usrio     in number,
                               o_cdgo_rspsta  out number,
                               o_mnsje_rspsta out varchar2);

  procedure prc_rg_slccion_cndtos_pntal(p_cdgo_clnte        in cb_g_procesos_simu_lote.cdgo_clnte%type,
                                        p_lte_simu          in cb_g_procesos_simu_lote.id_prcsos_smu_lte%type,
                                        p_id_impsto         in number,
                                        p_id_impsto_sbmpsto in number,
                                        p_sjto_id           in si_c_sujetos.id_sjto%type,
                                        p_id_usrio          in sg_g_usuarios.id_usrio%type,
                                        p_json_movimientos  in clob,
                                        p_obsrvcion_lte     in cb_g_procesos_simu_lote.obsrvcion%type,
                                        p_id_prcso_tpo      in number,
                                        p_cdgo_orgen_sjto   in varchar2,
                                        p_id_prcso_crga     in number default 0,
                                        p_lte_nvo           out cb_g_procesos_simu_lote.id_prcsos_smu_lte%type,
                                        o_cdgo_rspsta       out number,
                                        o_mnsje_rspsta      out varchar2);

  procedure prc_rg_prcsos_prssvo_trza(p_cdgo_clnte          in number,
                                      p_id_prcsos_smu_sjto  in number,
                                      p_id_prcsos_smu_lte   in number,
                                      p_id_sjto             in number,
                                      p_idntfccion_sjto     in varchar2,
                                      p_prcsos_perssvo_trza in clob,
                                      p_fcha_prcso          in date,
                                      p_id_usrio            in number,
                                      p_id_prcsos_prssvo    in number,
                                      p_id_prcso_prssvo_lte in number);

  procedure prc_rg_prssvo_mvmntos(p_cdgo_clnte          in number,
                                  p_id_prcsos_smu_sjto  in number,
                                  p_id_prcsos_smu_lte   in number,
                                  p_id_sjto             in number,
                                  p_id_usrio            in number,
                                  p_id_prcsos_prssvo    in number,
                                  p_id_prcso_prssvo_lte in number,
                                  o_cdgo_rspsta         out number,
                                  o_mnsje_rspsta        out varchar2);

  procedure prc_rg_prcsos_prssvo(p_cdgo_clnte          in number,
                                 p_nmro_prcso          in number,
                                 p_vlor_ttal_dda       in number,
                                 p_id_fncnrio          in number,
                                 p_id_prcso_prssvo_lte in number,
                                 p_msvo                in varchar2,
                                 o_id_prcsos_prssvo    out number,
                                 o_cdgo_rspsta         out number,
                                 o_mnsje_rspsta        out varchar2);

  procedure prc_el_prcsos_prssvo_json(p_cdgo_clnte        in number,
                                      p_id_prcsos_smu_lte in number,
                                      o_cdgo_rspsta       out number,
                                      o_mnsje_rspsta      out varchar2);

  procedure prc_rg_proceso_persuasivo_lote(p_cdgo_clnte            in number,
                                           p_nmro_lte_prcso_prssvo in number,
                                           p_id_fncnrio            in number,
                                           o_id_prcso_prssvo_lte   out number,
                                           o_cdgo_rspsta           out number,
                                           o_mnsje_rspsta          out varchar2);

  procedure prc_rg_proceso_persuasivo_dcmnto(p_cdgo_clnte              in number,
                                             p_id_prcsos_prssvo        in number,
                                             p_id_acto_tpo             in number,
                                             p_id_fncnrio              in number,
                                             p_id_plntlla              in number,
                                             p_dcmnto                  in clob,
                                             o_id_prcsos_prssvo_dcmnto out number,
                                             o_cdgo_rspsta             out number,
                                             o_mnsje_rspsta            out varchar2);

  procedure prc_rg_proceso_persuasivo_rspsble(p_cdgo_clnte           in number,
                                              p_id_prcsos_prssvo     in number,
                                              p_cdgo_idntfccion_tpo  in varchar2,
                                              p_idntfccion           in varchar2,
                                              p_nmbre_cmplto         in varchar2,
                                              p_prncpal_s_n          in varchar2,
                                              p_cdgo_tpo_rspnsble    in varchar2,
                                              p_prcntje_prtcpcion    in varchar2,
                                              p_id_pais_ntfccion     in number,
                                              p_id_dprtmnto_ntfccion in number,
                                              p_id_mncpio_ntfccion   in number,
                                              p_drccion_ntfccion     in varchar2,
                                              p_email                in varchar2,
                                              p_tlfno                in varchar2,
                                              p_cllar                in varchar2,
                                              o_cdgo_rspsta          out number,
                                              o_mnsje_rspsta         out varchar2);

  procedure prc_rg_actlza_rspnsble_prssvo(p_cdgo_clnte    in number,
                                          p_id_prcso_crga in number,
                                          p_id_lte        in number,
                                          o_cdgo_rspsta   out number,
                                          o_mnsje_rspsta  out varchar2);

  procedure prc_ac_prcso_simu_rspnsbles(p_cdgo_clnte    in number,
                                        p_nmro_lte      in mc_g_actualizar_cnddtos.clmuna16%type,
                                        p_id_prcso_crga in mc_g_actualizar_cnddtos.ID_PRCSO_CRGA%type,
                                        o_cdgo_rspsta   out number,
                                        o_mnsje_rspsta  out varchar2);

  procedure prc_rg_simu_sujeto(p_cdgo_clnte         in number,
                               p_id_prcsos_smu_lte  in number,
                               p_id_sjto            in number,
                               p_vlor_ttal_dda      in number,
                               p_id_impsto          in number,
                               p_id_impsto_sbmpsto  in number,
                               p_id_usrio           in number,
                               p_idntfccion         in varchar2,
                               o_id_prcsos_smu_sjto out number,
                               o_cdgo_rspsta        out number,
                               o_mnsje_rspsta       out varchar2);

  procedure prc_rg_simu_responsable(p_cdgo_clnte         in number,
                                    p_id_sjto_impsto     in number,
                                    p_id_prcso_crga      in number,
                                    p_id_lte_prcso       in number,
                                    p_id_prcsos_smu_sjto in number,
                                    p_idntfccion_sjto    in number,
                                    p_id_usrio           in number,
                                    p_id_sjto            in number,
                                    o_cdgo_rspsta        out number,
                                    o_mnsje_rspsta       out varchar2);

  procedure prc_rg_simu_movimientos(p_cdgo_clnte         in number,
                                    p_id_impsto          in number,
                                    p_id_impsto_sbmpsto  in number,
                                    p_id_sjto_impsto     in number,
                                    p_vgncia_dsde        in number,
                                    p_vgncia_hsta        in number,
                                    p_id_prcsos_smu_sjto in number,
                                    p_id_prcsos_smu_lte  in number,
                                    p_idntfccion_sjto    in varchar2,
                                    p_id_usrio           in number,
                                    o_cdgo_rspsta        out number,
                                    o_mnsje_rspsta       out varchar2);

  procedure prc_el_simu_sujeto(p_id_prcsos_smu_sjto in number,
                               p_id_prcsos_smu_lte  in number);
/* procedure prc_gn_documento_persuasivo_msvo(p_cdgo_clnte    in number,
  p_id_lte_prssvo in number);*/

end pkg_cb_proceso_persuasivo;
/

