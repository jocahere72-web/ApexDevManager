
  CREATE OR REPLACE EDITIONABLE PACKAGE "PKG_GI_ASOCIADO" as

  /*
        @autor:          heyder gomez
        @creado en:      14-11-2024
        @modificado en:  00-00-0000
        @organizaciã³n:   informatica y tributos sas
        @descripciã³n:
            package encargado gestion de asociados a sujetos tributos.
  */

  --procedimiento que registra las solicitudes de autorizacion
  --solicitud principal
  procedure prc_rg_solicitud_asociado(p_cdgo_clnte      in number,
                                      p_tken            in varchar2,
                                      p_nmro_cnsctvo    in number,
                                      p_id_sjto         in number,
                                      p_id_usrio        in number,
                                      p_email           in varchar2,
                                      o_id_slctud_ascdo out number,
                                      o_cdgo_rspsta     out number,
                                      o_mnsje_rspsta    out varchar2);

  --procedimiento que procesa la solicitud de autorizacion y realiza el envio de email al sujeto especificado

  procedure prc_gn_envio_asociado(p_cdgo_clnte      number,
                                  p_cdna            clob,
                                  p_id_sjto         number,
                                  p_id_usrio        number,
                                  p_email           varchar2,
                                  p_id_slctud_ascdo out number,
                                  o_cdgo_rspsta     out number,
                                  o_mnsje_rspsta    out varchar2);

  --prcedimiento que actualiza el detalle de la solicitud de autorizacion con los sujetos impuestos espcificados
  procedure prc_ac_solicitud_asociado_detalle(p_cdgo_clnte           in number,
                                              p_id_slctud_ascdo      in number,
                                              p_id_slctd_ascdo_dtlle in number default null,
                                              p_cdgo_rspta           in varchar2,
                                              p_id_usuario           in number,
                                              o_cdgo_rspsta          out number,
                                              o_mnsje_rspsta         out varchar2);
  --procedimiento que actualiza estado de la solicitud y el detalle relacionado
  procedure prc_ac_sujeto_asociado(p_cdgo_clnte      in number,
                                   p_id_slctud_ascdo in number,
                                   p_cdna            in varchar2,
                                   p_cdgo_rspta      in varchar2,
                                   o_cdgo_rspsta     out number,
                                   o_mnsje_rspsta    out varchar2);
  --procedimiento que registra el detalle de la solicitud de autorizacion de sujeto asociado
  procedure prc_rg_solicitud_asociado_detalle(p_cdgo_clnte      in number,
                                              p_id_slctud_ascdo in number,
                                              p_id_impsto       in number,
                                              p_id_sjto_impsto  in number,
                                              p_id_usrio        in number,
                                              o_cdgo_rspsta     out number,
                                              o_mnsje_rspsta    out varchar2);
  --proceimiento que registra y realiza la relacion entre sujeto impuesto y usuario
  procedure prc_rg_sujeto_asociado(p_cdgo_clnte in number,
                                   -- p_id_slctud_ascdo  in number,
                                   p_id_impsto      in number,
                                   p_id_sjto_impsto in number,
                                   p_id_usrio       in number,
                                   o_cdgo_rspsta    out number,
                                   o_mnsje_rspsta   out varchar2);
  --procedimiento que registra la solicitud de gestion de permisos de los sujetos asociados
  procedure prc_rg_solicitud_gestion_permisos(p_cdgo_clnte         in number,
                                              p_tken               in varchar2,
                                              p_nmro_cnsctvo       in number,
                                              p_cdna_id_sjto_ascdo in varchar2,
                                              p_id_sjto            in number,
                                              p_id_usrio           in number,
                                              p_cdgo_gstion        in varchar2,
                                              p_email              in varchar2,
                                              o_id_slctud_prmsos   out number,
                                              o_cdgo_rspsta        out number,
                                              o_mnsje_rspsta       out varchar2);

  -- procedimiento que procesa y envia el email con la solicitud de gestion de permisos
  procedure prc_gn_envio_permisos(p_cdgo_clnte       number,
                                  p_id_sjto          number,
                                  p_cdna             varchar2,
                                  p_id_usrio         number,
                                  p_cdgo_gstion      varchar2,
                                  p_email            varchar2,
                                  p_id_slctud_prmsos out number,
                                  o_cdgo_rspsta      out number,
                                  o_mnsje_rspsta     out varchar2);
  --procedimiento que registra la traza de la gestiond e permisos del sujeto asociado
  procedure prc_rg_traza_estado_asociados(p_cdgo_clnte       in number,
                                          p_id_slctud_prmsos in number,
                                          p_id_sjto_ascdo    in number,
                                          p_id_sjto_impsto   in number,
                                          p_id_usrio         in number,
                                          p_cdgo_gstion      in varchar2,
                                          o_cdgo_rspsta      out number,
                                          o_mnsje_rspsta     out varchar2);
  --procedimiento que actualiza el estado del sujeto asociado
  procedure prc_ac_estado_asociado(p_cdgo_clnte     in number,
                                   p_cdgo_gstion    in varchar2,
                                   p_id_usuario     in number,
                                   p_id_sjto_impsto in number,
                                   o_cdgo_rspsta    out number,
                                   o_mnsje_rspsta   out varchar2);
  --procedimiento que gestiona solicitud de la gestion de permisos del sujeto asociado
  procedure prc_ac_permisos_sujeto_asociado(p_cdgo_clnte       in number,
                                            p_id_slctud_prmsos in number,
                                            p_cdna             in varchar2,
                                            p_cdgo_rspta       in varchar2,
                                            p_cdgo_gstion      in varchar2,
                                            o_cdgo_rspsta      out number,
                                            o_mnsje_rspsta     out varchar2);
  --procedimiento que actualzia el estado del sujeto asociado
  procedure prc_ac_estado_solicitud(p_cdgo_clnte   in number,
                                    p_cdgo_vncmnto in varchar2,
                                    p_id_slctud    in number,
                                    o_cdgo_rspsta  out number,
                                    o_mnsje_rspsta out varchar2);
  --procedimiento que consulta las solicitudes en estado pendiente y verifica con la parametriza de dias de vencimienot de autorizacion para su cambia de estado a vencidas
  --en dado caso cumpla con la condicion
  procedure prc_co_solicitudes_ascdos(p_cdgo_clnte   in number,
                                      o_cdgo_rspsta  out number,
                                      o_mnsje_rspsta out varchar2);

end pkg_gi_asociado;
/

