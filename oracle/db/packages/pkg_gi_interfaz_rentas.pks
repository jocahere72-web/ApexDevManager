
  CREATE OR REPLACE EDITIONABLE PACKAGE "PKG_GI_INTERFAZ_RENTAS" as

     procedure prc_vl_json ( p_json                      in   clob,
                            o_cdgo_rspsta               out  number,
                            o_mnsje_rspsta              out  varchar2);

    procedure prc_rg_renta (p_json                      in   clob,
                            o_id_rnta                   out  number,
                            o_id_dcmnto                 out  number,
                            o_nmro_dcmnto               out  number,
                            o_cdgo_rspsta               out  number,
                            o_mnsje_rspsta              out  varchar2);


end pkg_gi_interfaz_rentas;
/

