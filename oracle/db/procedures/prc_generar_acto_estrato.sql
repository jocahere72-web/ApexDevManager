
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_GENERAR_ACTO_ESTRATO" (p_id_acto              in number,
                                                     p_id_nvdad_prdio_dtlle in number) as
  v_blob         blob;
  v_id_rprte     number := 297; -- valor fijo
  v_documento    clob;
  o_mnsje_rspsta varchar2(2000);
begin

  -- obtener el documento clob a partir del detalle de la novedad
  v_documento := pkg_gn_generalidades.fnc_ge_dcmnto('{"id_nvdad_prdio_dtlle":"' ||
                                                    p_id_nvdad_prdio_dtlle || '"}',
                                                    206);

  -- actualizar el campo txto_dcmnto en la tabla si_g_novedades_predio_dtlle
  update si_g_novedades_predio_dtlle x
     set x.txto_dcmnto = v_documento
   where x.id_nvdad_prdio_dtlle = p_id_nvdad_prdio_dtlle;

  commit;

  -- si no hay sesión de apex activa, crear una nueva sesión
  if v('APP_SESSION') is null then
    apex_session.create_session(p_app_id   => 66000,
                                p_page_id  => 2,
                                p_username => '1111111112');
  end if;

  -- adjuntar la sesión de apex
  apex_session.attach(p_app_id     => 66000,
                      p_page_id    => 37,
                      p_session_id => v('APP_SESSION'));

  -- establecer valores en el estado de la sesión de apex
  apex_util.set_session_state('P2_XML',
                              '{"id_nvdad_prdio_dtlle":"' ||
                              p_id_nvdad_prdio_dtlle || '"}');
  apex_util.set_session_state('F_CDGO_CLNTE', 23001);
  apex_util.set_session_state('P37_ID_RPRTE', v_id_rprte);

  -- bloque para la generación del documento pdf
  begin
    v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                           p_report_query_name  => 'si_g_acto_novedad_predial',
                                           p_report_layout_name => 'si_g_acto_novedad_predial',
                                           p_report_layout_type => 'rtf',
                                           p_document_format    => 'PDF');
  exception
    when others then
      o_mnsje_rspsta := 'Error al generar el documento PDF: ' || sqlerrm;
      -- aquí podrías añadir un log o una gestión de errores más robusta si es necesario
  end;

  -- si se generó el blob, intentar almacenar el archivo en el acto
  if v_blob is not null then
    begin
      pkg_gn_generalidades.prc_ac_acto(p_file_blob       => v_blob,
                                       p_id_acto         => p_id_acto,
                                       p_ntfccion_atmtca => 'N');
    exception
      when others then
        o_mnsje_rspsta := 'NO SE PUDO GENERAR EL DOCUMENTO EN EL ACTO: ' ||
                          sqlerrm;
        -- aquí podrías añadir un log o una gestión de errores más robusta
    end;
  else
    o_mnsje_rspsta := 'El BLOB del documento no se generó correctamente.';
  end if;

  -- opcional: podrías devolver o registrar o_mnsje_rspsta para depuración o información.
  -- dbms_output.put_line(o_mnsje_rspsta);

end prc_generar_acto_estrato;
/

