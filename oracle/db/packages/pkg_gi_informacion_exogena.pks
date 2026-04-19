
  CREATE OR REPLACE EDITIONABLE PACKAGE "PKG_GI_INFORMACION_EXOGENA" as

  /*
    Autor: Brayan Villegas
    Creada el: 23-07-2021
    Modificada en: 23-07-2021
    Descripcion: Procedimiento que traslada informacion exogena
                 hacia las tablas de gestion de exogena.
  */
  procedure prc_rg_informacion_exogena(p_cdgo_clnte         in number,
                                       p_id_infrmcion_exgna in number,
                                       p_id_usrio           in number,
                                       o_cdgo_rspsta        out number,
                                       o_mnsje_rspsta       out varchar2);

  -- Funcion para validar datos numericos
  function fnc_vl_dato_numerico(v_vlor in varchar2) return varchar2;

  -- Funcion para validar datos numericos
  function fnc_vl_dato_numerico_decimal(v_vlor in varchar2) return varchar2;

  -- Funcion para validar datos alfabeticos
  function fnc_vl_dato_alfabetico(v_valor in varchar2) return varchar2;

  -- Funcion para validar estructura de correo electronico
  function fnc_vl_email(v_email in varchar2) return varchar2;

  -- Funcion para validar datos alfanumericos
  function fnc_vl_dato_alfanumerico(v_valor in varchar2) return varchar2;

  --Función para validar una fecha en formato AAAA-MM-DD y que sea real
  function fnc_vl_fecha(v_fecha in varchar2) return varchar2;

  procedure prc_gn_rprte_rtncnes_rd(p_cdgo_clnte   number,
                                    p_idntfccion   in varchar2,
                                    p_vgncia       in varchar2,
                                    p_tpo_rtncion  in varchar2,
                                    o_file_blob    out blob,
                                    o_cdgo_rspsta  out number,
                                    o_mnsje_rspsta out varchar2);

  procedure prc_rg_informacion_exogena_dtlle(p_sql in varchar2);

end pkg_gi_informacion_exogena;
/

