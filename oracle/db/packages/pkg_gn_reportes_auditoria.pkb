
  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PKG_GN_REPORTES_AUDITORIA" as

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
  function fnc_vl_reporte_auditoria(p_id_rprte in number) return varchar2 as
    v_resultado number;
  begin
    begin
      select 1
        into v_resultado
        from gn_d_reportes_auditoria a
       where a.id_rprte = p_id_rprte
         and a.actvo = 'S';
    exception
      when no_data_found then
        return 'N';
      when others then
        return 'N';
    end;
    return 'S';
  end fnc_vl_reporte_auditoria;

  /*
  @Autor:      Jorge Badran
  @Fecha Creación: 29/09/2025
  @Descripción:    Función que retorna el valor de un atributo de un json.
  */
  function fnc_co_json_value(p_json in clob, p_key in varchar2)
    return varchar2 is
    v_valor varchar2(4000);
  begin
    -- intenta extraer el valor de la clave
    execute immediate 'select json_value(:1, ''$."' || p_key ||
                      '"'') from dual'
      into v_valor
      using p_json;

    return v_valor;

  exception
    when others then
      return null;
  end;

  /*
  @Autor:      Jorge Badran
  @Fecha Creación: 29/09/2025
  @Descripción:    Función que retorna un json existente con un nuevo atributo.
  */
  function fnc_gn_json_values(p_json  in clob,
                              p_key   in varchar2,
                              p_value in varchar2) return clob is
    v_json_obj json_object_t;
  begin
    -- Si viene vacío, inicializamos un objeto json vacío
    if p_json is null then
      v_json_obj := json_object_t();
    else
      v_json_obj := json_object_t.parse(p_json);
    end if;

    -- Agregar la clave/valor
    v_json_obj.put(p_key, p_value);

    -- Retornar el json actualizado
    return v_json_obj.to_clob;

  exception
    when others then
      return null;
  end fnc_gn_json_values;

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
                                     o_mnsje_rspsta          out varchar2) as
    v_nvel                  number;
    v_nmbre_up              sg_d_configuraciones_log.nmbre_up%type := 'pkg_gn_reportes_auditoria.prc_rg_reporte_auditoria';
    v_id_rprte_audtria_trza gn_g_reportes_auditoria_traza.id_rprte_audtria_trza%type;

    v_id_sjto_impsto number;
    v_cdgo_rspsta    number;
    v_mnsje_rspsta   varchar2(1000);
  begin
    --Determinamos el Nivel del Log de la UP
    v_nvel := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte => p_cdgo_clnte,
                                          p_id_impsto  => null,
                                          p_nmbre_up   => v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nvel,
                          'Entrando prc_rg_reporte_auditoria.',
                          6);

    --   v_id_sjto_impsto := to_number(p_id_sjto_impsto);

    begin
      -- Insertamos la auditoria.
      insert into gn_g_reportes_auditoria_traza
        (id_rprte_audtria_trza,
         id_rprte,
         id_usrio,
         id_sjto_impsto,
         fcha_imprsion)
      values
        (p_id_rprte_audtria_trza,
         p_id_rprte,
         p_id_usrio,
         p_id_sjto_impsto,
         systimestamp);
      commit;

      o_cdgo_rspsta  := 0;
      o_mnsje_rspsta := 'Auditoria Insertada Exitosamente!!';
      return;
    exception
      when others then
        o_cdgo_rspsta  := 20;
        o_mnsje_rspsta := 'Error al registrar la auditoria.' || sqlerrm;
        return;
    end;

  exception
    when others then
      o_cdgo_rspsta  := 10;
      o_mnsje_rspsta := 'Error en el proceso de inserción' || sqlerrm;
      return;
  end prc_rg_reporte_auditoria;

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
                                            o_mnsje_rspsta          out varchar2) as
    v_nvel                  number;
    v_nmbre_up              sg_d_configuraciones_log.nmbre_up%type := 'pkg_gn_reportes_auditoria.prc_rg_dcmnto_reporte_auditoria';
    v_id_rprte_audtria_trza gn_g_reportes_auditoria_traza.id_rprte_audtria_trza%type;

    v_file_name  gn_g_documento_reporte_auditria.file_name%type;
    v_directorio varchar2(50) := 'TS_REPORTES_AUDITORIA';
    v_bfile      bfile;

    v_cdgo_rspsta  number;
    v_mnsje_rspsta varchar2(1000);
  begin
    --Determinamos el Nivel del Log de la UP
    v_nvel := pkg_sg_log.fnc_ca_nivel_log(p_cdgo_clnte => p_cdgo_clnte,
                                          p_id_impsto  => null,
                                          p_nmbre_up   => v_nmbre_up);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nvel,
                          'Entrando prc_rg_dcmnto_reporte_auditoria.',
                          6);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nvel,
                          'Antes de llamar a prc_rg_reporte_auditoria. ',
                          6);

    prc_rg_reporte_auditoria(p_cdgo_clnte            => p_cdgo_clnte,
                             p_id_rprte_audtria_trza => p_id_rprte_audtria_trza,
                             p_id_rprte              => p_id_rprte,
                             p_id_usrio              => p_id_usrio,
                             p_id_sjto_impsto        => p_id_sjto_impsto,
                             o_cdgo_rspsta           => v_cdgo_rspsta,
                             o_mnsje_rspsta          => v_mnsje_rspsta);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nvel,
                          'respuesta de prc_rg_reporte_auditoria. v_cdgo_rspsta: ' ||
                          v_cdgo_rspsta || ' - ' || 'v_mnsje_rspsta: ' ||
                          v_mnsje_rspsta,
                          6);

    if v_cdgo_rspsta <> 0 then
      o_cdgo_rspsta  := v_cdgo_rspsta;
      o_mnsje_rspsta := v_mnsje_rspsta;
      return;
    end if;
    -- v_file_name := p_file_name || '_' || to_char(v_id_rprte_audtria_trza) || '_' || to_char(p_id_usrio);

    -- Concatenamos el nombre del archivo para que sea unico y no sobre escriba archivos existentes: reemplazamos los estacios en blancos por guion bajo "_"
    v_file_name := replace(p_file_name || '_' ||
                           to_char(p_id_rprte_audtria_trza) || '_' ||
                           to_char(p_id_usrio),
                           ' ',
                           '_') || '.pdf';

    -- Registramos el blob como archivo en disco
    pkg_gd_utilidades.prc_rg_dcmnto_dsco(p_blob         => p_file_blob,
                                         p_directorio   => v_directorio,
                                         p_nmbre_archvo => v_file_name,
                                         o_cdgo_rspsta  => v_cdgo_rspsta,
                                         o_mnsje_rspsta => v_mnsje_rspsta);

    pkg_sg_log.prc_rg_log(p_cdgo_clnte,
                          null,
                          v_nmbre_up,
                          v_nvel,
                          'respuesta de prc_rg_dcmnto_dsco. v_cdgo_rspsta: ' ||
                          v_cdgo_rspsta || ' - ' || 'v_mnsje_rspsta: ' ||
                          v_mnsje_rspsta,
                          6);

    if v_cdgo_rspsta = 0 then
      -- Actualizo columna bfile
      v_bfile := bfilename(v_directorio, v_file_name);

      begin
        -- Insertamos la auditoria.
        insert into gn_g_documento_reporte_auditria
          (id_rprte_audtria_trza,
           file_name,
           file_mimetype,
           file_bfile,
           fcha)
        values
          (p_id_rprte_audtria_trza,
           v_file_name,
           p_file_mimetype,
           v_bfile,
           systimestamp);
        commit;

        o_cdgo_rspsta  := 0;
        o_mnsje_rspsta := 'Auditoria Insertada Exitosamente!!';
        return;
      exception
        when others then
          o_cdgo_rspsta  := 50;
          o_mnsje_rspsta := 'Error al registrar el soporte de la auditoria.' ||
                            sqlerrm;
          return;
      end;
    else
      o_cdgo_rspsta  := 40;
      o_mnsje_rspsta := 'error al registrar el documento en el disco: ' ||
                        v_mnsje_rspsta;
    end if;
  exception
    when others then
      o_cdgo_rspsta  := 30;
      o_mnsje_rspsta := 'Error en el proceso de inserción' || sqlerrm;
      return;
  end prc_rg_dcmnto_reporte_auditoria;

end pkg_gn_reportes_auditoria;
/

