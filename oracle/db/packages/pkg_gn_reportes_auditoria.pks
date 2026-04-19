
  CREATE OR REPLACE EDITIONABLE PACKAGE "PKG_GN_REPORTES_AUDITORIA" as

  /*
        @Autor:         Jorge De Jesús Badrán
        @Creado en:     29-09-2025
        @Modificado en: 00-00-0000
        @OrganizaciÃ³n: INFORMATICA Y TRIBUTOS SAS
        @DescripciÃ³n:  Package encargado de realizar auditorias en la impresión de reportes.
  */

  /*
  @Autor:      Jorge Badran
  @Fecha Creación: 29/09/2025
  @Descripción:    Función que vaalida si un reporte requiere auditoria.
  */
  function fnc_vl_reporte_auditoria(p_id_rprte in number) return varchar2;

  /*
  @Autor:      Jorge Badran
  @Fecha Creación: 29/09/2025
  @Descripción:    Función que retorna el valor de un atributo de un json.
  */
  function fnc_co_json_value(p_json in clob, p_key in varchar2)
    return varchar2;

  /*
  @Autor:      Jorge Badran
  @Fecha Creación: 29/09/2025
  @Descripción:    Función que retorna un json existente con un nuevo atributo.
  */
  function fnc_gn_json_values(p_json  in clob,
                              p_key   in varchar2,
                              p_value in varchar2) return clob;

  /*
  @Autor:      Jorge Badran
  @Fecha Creación: 29/09/2025
  @Descripción:    Procedimiento el cual registra auditoria de un reporte impreso.
  */
  procedure prc_rg_reporte_auditoria(p_cdgo_clnte            in number,
                                     p_id_rprte_audtria_trza in gn_g_reportes_auditoria_traza.id_rprte_audtria_trza%type,
                                     p_id_rprte              in gn_g_reportes_auditoria_traza.id_rprte%type,
                                     p_id_usrio              in gn_g_reportes_auditoria_traza.id_usrio%type default null,
                                     p_id_sjto_impsto        in gn_g_reportes_auditoria_traza.id_sjto_impsto%type default null,
                                     o_cdgo_rspsta           out number,
                                     o_mnsje_rspsta          out varchar2);

  /*
  @Autor:      Jorge Badran
  @Fecha Creación: 29/09/2025
  @Descripción:    Procedimiento el cual registra documento de soporte de la auditoria.
  */
  procedure prc_rg_dcmnto_reporte_auditoria(p_cdgo_clnte            in number,
                                            p_id_rprte_audtria_trza in gn_g_reportes_auditoria_traza.id_rprte_audtria_trza%type,
                                            p_id_rprte              in gn_g_reportes_auditoria_traza.id_rprte%type,
                                            p_id_usrio              in gn_g_reportes_auditoria_traza.id_usrio%type default null,
                                            p_id_sjto_impsto        in gn_g_reportes_auditoria_traza.id_sjto_impsto%type default null,
                                            p_file_name             in gn_g_documento_reporte_auditria.file_name%type,
                                            p_file_mimetype         in gn_g_documento_reporte_auditria.file_mimetype%type,
                                            p_file_blob             in gn_g_documento_reporte_auditria.file_blob%type default null,
                                            o_cdgo_rspsta           out number,
                                            o_mnsje_rspsta          out varchar2);

end pkg_gn_reportes_auditoria;
/

