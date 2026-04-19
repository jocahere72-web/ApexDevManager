
  CREATE OR REPLACE EDITIONABLE PACKAGE "PKG_PQ_PQR" as
  g_id_fljo_trea number;
  procedure prc_rg_solicitud_pqr(p_id_tpo                in pq_g_solicitudes.id_tpo%type,
                                 p_id_usrio              in pq_g_solicitudes.id_usrio%type,
                                 p_id_prsntcion_tpo      in pq_g_solicitudes.id_prsntcion_tpo%type,
                                 p_cdgo_clnte            in number,
                                 p_id_instncia_fljo      in pq_g_solicitudes.id_instncia_fljo%type,
                                 p_nmro_flio             in pq_g_solicitudes.nmro_flio%type,
                                 p_id_rdcdor             in pq_g_radicador.id_rdcdor%type,
                                 p_cdgo_rspnsble_tpo     in pq_g_solicitantes.cdgo_rspnsble_tpo%type,
                                 p_cdgo_idntfccion_tpo   in pq_g_radicador.cdgo_idntfccion_tpo%type,
                                 p_idntfccion            in pq_g_radicador.idntfccion%type,
                                 p_prmer_nmbre           in pq_g_radicador.prmer_nmbre%type,
                                 p_sgndo_nmbre           in pq_g_radicador.sgndo_nmbre%type,
                                 p_prmer_aplldo          in pq_g_radicador.prmer_aplldo%type,
                                 p_sgndo_aplldo          in pq_g_radicador.sgndo_aplldo%type,
                                 p_cdgo_idntfccion_tpo_s in pq_g_solicitantes.cdgo_idntfccion_tpo%type,
                                 p_idntfccion_s          in pq_g_solicitantes.idntfccion%type,
                                 p_prmer_nmbre_s         in pq_g_solicitantes.prmer_nmbre%type,
                                 p_sgndo_nmbre_s         in pq_g_solicitantes.sgndo_nmbre%type,
                                 p_prmer_aplldo_s        in pq_g_solicitantes.prmer_aplldo%type,
                                 p_sgndo_aplldo_s        in pq_g_solicitantes.sgndo_aplldo%type,
                                 p_id_pais_ntfccion      in pq_g_solicitantes.id_pais_ntfccion%type,
                                 p_id_dprtmnto_ntfccion  in pq_g_solicitantes.id_dprtmnto_ntfccion%type,
                                 p_id_mncpio_ntfccion    in pq_g_solicitantes.id_mncpio_ntfccion%type,
                                 p_drccion_ntfccion      in pq_g_solicitantes.drccion_ntfccion%type,
                                 p_email                 in pq_g_solicitantes.email%type,
                                 p_tlfno                 in pq_g_solicitantes.tlfno%type,
                                 p_cllar                 in pq_g_solicitantes.cllar%type,
                                 p_id_motivo             in number,
                                 p_idntfccion_sjto       in varchar2,
                                 p_id_impsto             in number,
                                 p_id_impsto_sbmpsto     in number,
                                 p_obsrvcion             in varchar2,
                                 p_trnscion              in varchar2 default 'S',
                                 p_inddor_dcmnto_pdnte   in varchar2 default 'N' -- req. 22309
                                ,
                                 p_fcha_rdcdo            in date default null -- req.0023223
                                ,
                                 p_ntfca_emil            in pq_g_solicitantes.ntfca_emil%type default null -- Req. 0025429
                                ,
                                 o_cdgo_rspsta           out number,
                                 o_mnsje_rspsta          out varchar2);

  procedure prc_rg_solicitud_portal(p_id_tpo            in pq_g_solicitudes.id_tpo%type,
                                    p_id_usrio          in pq_g_solicitudes.id_usrio%type,
                                    p_id_prsntcion_tpo  in pq_g_solicitudes.id_prsntcion_tpo%type,
                                    p_cdgo_clnte        in number,
                                    p_nmro_flio         in pq_g_solicitudes.nmro_flio%type,
                                    p_id_motivo         in number,
                                    p_idntfccion_sjto   in varchar2,
                                    p_id_impsto         in number,
                                    p_id_impsto_sbmpsto in number,
                                    p_obsrvcion         in varchar2,
                                    o_cdgo_rspsta       out number,
                                    o_mnsje_rspsta      out varchar2,
                                    o_id_slctud         out number);

  procedure prc_rg_instancia_flujo(p_id_instncia_fljo in wf_g_instancias_transicion.id_instncia_fljo%type,
                                   p_id_fljo_trea     in wf_g_instancias_transicion.id_fljo_trea_orgen%type);

  procedure prc_rg_radicar_solicitud(p_id_slctud  pq_g_solicitudes.id_slctud%type,
                                     p_cdgo_clnte in number);

  procedure prc_ac_solicitud(p_id_slctud   in pq_g_solicitudes.id_slctud%type,
                             p_cdgo_clnte  in number,
                             p_id_mtvo     in pq_g_solicitudes_motivo.id_mtvo%type,
                             p_id_acto     in gn_g_actos.id_acto%type,
                             p_id_usrio    in sg_g_usuarios.id_usrio%type,
                             p_fcha_real   in timestamp default systimestamp,
                             p_obsrvcion   in pq_g_solicitudes_obsrvcion.obsrvcion%type,
                             p_cdgo_rspsta in varchar2);

  procedure prc_ac_documentos(p_id_slctud in pq_g_solicitudes.id_slctud%type,
                              p_json      clob);

  procedure prc_rg_mensaje_radicado(p_id_slctud         in pq_g_solicitudes.id_slctud%type,
                                    p_nmro_rdcdo_dsplay in pq_g_solicitudes.nmro_rdcdo_dsplay%type default null);

  procedure prc_rg_manejador(p_id_instncia_fljo     in wf_g_instancias_transicion.id_instncia_fljo%type,
                             p_id_fljo_trea         in v_wf_d_flujos_tarea.id_fljo_trea%type,
                             p_id_instncia_fljo_hjo in wf_g_instancias_transicion.id_instncia_fljo%type,
                             o_cdgo_rspsta          out number,
                             o_mnsje_rspsta         out varchar2);

  procedure prc_rg_finalizar_flujo(p_id_instncia_fljo in number,
                                   p_id_fljo_trea     in number);

  procedure prc_ac_solicitud(p_id_slctud    in pq_g_solicitudes.id_slctud%type,
                             p_cdgo_clnte   in number,
                             o_cdgo_rspsta  out number,
                             o_mnsje_rspsta out varchar2);

  procedure prc_ac_quejas_reclamo(p_id_instncia_fljo in number,
                                  p_id_fljo_trea     in number);

  procedure prc_ac_quejas_reclamo_flujo(p_id_instncia_fljo in number);

  procedure prc_rg_paz_salvo(p_id_instncia_fljo in number,
                             p_cdgo_rspsta      in varchar2,
                             p_blob             in blob,
                             o_cdgo_rspsta      out number,
                             o_mnsje_rspsta     out varchar2);

  function fnc_cl_url_portal(p_id_slctud in number) return varchar2;

  procedure prc_rg_documento_pendiente_pqr(p_cdgo_clnte          number,
                                           p_id_slctud           number,
                                           p_id_usrio            number,
                                           p_inddor_dcmnto_pdnte varchar2,
                                           o_cdgo_rspsta         out number,
                                           o_mnsje_rspsta        out varchar2);

  procedure prc_rg_cierre_radicado(p_id_slctud    in pq_g_solicitudes.id_slctud%type,
                                   o_cdgo_rspsta  out number,
                                   o_mnsje_rspsta out varchar2);

  procedure prc_ac_solicitud_pqr(p_id_tpo                in pq_g_solicitudes.id_tpo%type,
                                 p_id_usrio              in pq_g_solicitudes.id_usrio%type,
                                 p_id_prsntcion_tpo      in pq_g_solicitudes.id_prsntcion_tpo%type,
                                 p_cdgo_clnte            in number,
                                 p_id_instncia_fljo      in pq_g_solicitudes.id_instncia_fljo%type,
                                 p_nmro_flio             in pq_g_solicitudes.nmro_flio%type,
                                 p_id_rdcdor             in pq_g_radicador.id_rdcdor%type,
                                 p_cdgo_rspnsble_tpo     in pq_g_solicitantes.cdgo_rspnsble_tpo%type,
                                 p_cdgo_idntfccion_tpo   in pq_g_radicador.cdgo_idntfccion_tpo%type,
                                 p_idntfccion            in pq_g_radicador.idntfccion%type,
                                 p_prmer_nmbre           in pq_g_radicador.prmer_nmbre%type,
                                 p_sgndo_nmbre           in pq_g_radicador.sgndo_nmbre%type,
                                 p_prmer_aplldo          in pq_g_radicador.prmer_aplldo%type,
                                 p_sgndo_aplldo          in pq_g_radicador.sgndo_aplldo%type,
                                 p_cdgo_idntfccion_tpo_s in pq_g_solicitantes.cdgo_idntfccion_tpo%type,
                                 p_idntfccion_s          in pq_g_solicitantes.idntfccion%type,
                                 p_prmer_nmbre_s         in pq_g_solicitantes.prmer_nmbre%type,
                                 p_sgndo_nmbre_s         in pq_g_solicitantes.sgndo_nmbre%type,
                                 p_prmer_aplldo_s        in pq_g_solicitantes.prmer_aplldo%type,
                                 p_sgndo_aplldo_s        in pq_g_solicitantes.sgndo_aplldo%type,
                                 p_id_pais_ntfccion      in pq_g_solicitantes.id_pais_ntfccion%type,
                                 p_id_dprtmnto_ntfccion  in pq_g_solicitantes.id_dprtmnto_ntfccion%type,
                                 p_id_mncpio_ntfccion    in pq_g_solicitantes.id_mncpio_ntfccion%type,
                                 p_drccion_ntfccion      in pq_g_solicitantes.drccion_ntfccion%type,
                                 p_email                 in pq_g_solicitantes.email%type,
                                 p_tlfno                 in pq_g_solicitantes.tlfno%type,
                                 p_cllar                 in pq_g_solicitantes.cllar%type,
                                 p_id_motivo             in number,
                                 p_idntfccion_sjto       in varchar2,
                                 p_id_impsto             in number,
                                 p_id_impsto_sbmpsto     in number,
                                 p_obsrvcion             in varchar2,
                                 p_trnscion              in varchar2 default 'S',
                                 p_inddor_dcmnto_pdnte   in varchar2 default 'N' -- req. 22309
                                ,
                                 p_fcha_rdcdo            in date default null -- req.0023223
                                ,
                                 p_ntfca_emil            in pq_g_solicitantes.ntfca_emil%type default null -- Req. 0025429
                                ,
                                 p_id_fljo_trea          in number,
                                 o_cdgo_rspsta           out number,
                                 o_mnsje_rspsta          out varchar2);

  procedure prc_elm_archivos_adjuntos(p_id_slctud    in number,
                                      p_id_dcmnto    in number,
                                      p_cdgo_clnte   in number,
                                      p_id_mtvo      in number,
                                      o_cdgo_rspsta  out number,
                                      o_mnsje_rspsta out varchar2);

  procedure prc_rg_acto_quejas_reclamo(p_cdgo_clnte       in number,
                                       p_cdgo_acto_orgen  in varchar2,
                                       p_id_orgen         in number,
                                       p_id_acto_tpo      in number,
                                       p_anio             in number,
                                       p_id_usrio         in number,
                                       p_id_fncnrio_frma  in number,
                                       p_id_instncia_fljo in number,
                                       o_id_acto          out number);

  --Procedimiento que permite Modificar la Información de las PQRS
  --11/03/2025
  --autor: Alexander Carraballo
  --modificado: Jean Adies

  procedure prc_rg_actualiza_motivo_pqr(p_nmro_rdcdo_dsplay in varchar,
                                        p_id_rdcdor         in varchar default null,
                                        p_id_slctnte        in varchar default null,
                                        p_id_mtvo_nuevo     in number default null,
                                        p_id_impsto         in number default null,
                                        p_id_sbimpsto       in number default null,
                                        p_email             in varchar default null,
                                        p_drccion           in varchar default null,
                                        p_cllar             in varchar default null,
                                        p_idntfccion        in varchar default null,
                                        p_id_usrio          in number,
                                        p_cdgo_clnte        in number,
                                        o_cdgo_rspsta       out number,
                                        o_mnsje_rspsta      out varchar);

  --Procedimiento que permite almacenar la trazabilidad al trasladar una PRQ
  --11/03/2025
  --autor: Alexander Carraballo
  --modificado: Jean Adies
  procedure prc_rg_pqg_slctdes_tsldo_trza(p_cdgo_clnte in number,
                                          --            p_id_solicitud    in number,
                                          p_json         in clob,
                                          p_mtvo_pqr_nva in number default null,
                                          p_id_impsto    in number default null,
                                          p_id_sbimpsto  in number default null,
                                          p_email        in varchar2 default null,
                                          p_drccion      in varchar2 default null,
                                          p_cllar        in varchar2 default null,
                                          p_obsrvcion    in varchar2 default null,
                                          p_idntfccion   in varchar2 default null,
                                          o_cdgo_rspsta  out number,
                                          o_mnsje_rspsta out varchar2);

end pkg_pq_pqr;
/

