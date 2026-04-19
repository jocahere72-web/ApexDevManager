
  CREATE OR REPLACE EDITIONABLE PACKAGE "PKG_GI_INTERFAZ_CONTRATOS" as

  procedure prc_rg_respuesta_externo(p_id_rnta_cntrto_extrno_int in number,
                                     p_cdgo_rspsta               in number,
                                     p_mnsje_rspsta              in varchar2);

  procedure prc_rg_informacion_externo;

  procedure prc_rg_json_contrato(p_json         in clob,
                                 o_cdgo_rspsta  out number,
                                 o_mnsje_rspsta out varchar2);

end pkg_gi_interfaz_contratos;
/

