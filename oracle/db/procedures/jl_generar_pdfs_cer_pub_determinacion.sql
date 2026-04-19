
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_GENERAR_PDFS_CER_PUB_DETERMINACION" (p_id_lote     in number,
                                                                  p_doc_inicial in varchar2,
                                                                  p_doc_final   in varchar2,
                                                                  p_id_reporte  in number,
                                                                  p_id_cliente  in number) is

  -- variables para la construcción del json
  v_json json_object_t;

  -- variables para el manejo del archivo y el blob (documento pdf)
  v_blob     blob;
  l_blob_len integer;
  l_file     utl_file.file_type;

begin
  -- 1. crear una sesión de apex en el contexto de la base de datos.
  apex_session.create_session(p_app_id   => 66000,
                              p_page_id  => 37,
                              p_username => '1111111111' -- usuario genérico o el que corresponda
                              );

  -- 2. iterar sobre el rango de determinaciones especificado por los parámetros.
  for r1 in (select d.id_dtrmncion, a.nmro_acto, d.id_dtrmncion_lte
               from gi_g_determinaciones d
               join gn_g_actos a
                 on a.id_acto = d.id_acto
              where (d.id_dtrmncion_lte = p_id_lote or p_id_lote is null) -- usar parámetro de lote
                and a.nmro_acto between p_doc_inicial and p_doc_final -- usar parámetros de rango
              order by a.nmro_acto) loop
    -- 3. para cada determinación, configurar los parámetros de sesión de apex.
    -- crear el objeto json con los datos necesarios para el reporte
    v_json := json_object_t();
    v_json.put('id_dtrmncion', r1.id_dtrmncion);
    v_json.put('id_dtrmncion_lte', r1.id_dtrmncion_lte);

    -- establecer los valores en la sesión de apex
    apex_util.set_session_state('P37_JSON', v_json.to_clob());
    apex_util.set_session_state('P37_ID_RPRTE', p_id_reporte); -- usar parámetro de reporte
    apex_util.set_session_state('F_CDGO_CLNTE', p_id_cliente); -- usar parámetro de cliente
    apex_util.set_session_state('F_FRMTO_MNDA',
                                'FM$999G999G999G999G999G999G990'); -- valor fijo

    -- 4. generar el documento pdf llamando a la utilidad de impresión de apex.
    v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                           p_report_query_name  => 'gi_g_det_factura_titulo',
                                           p_report_layout_name => 'gi_g_certificado_factura_titulo',
                                           p_report_layout_type => 'rtf',
                                           p_document_format    => 'pdf');

    l_blob_len := dbms_lob.getlength(v_blob);

    -- 5. si el blob se generó correctamente (tiene contenido), guardarlo en el disco.
    if l_blob_len > 0 then

      jl_copy_blob_data_to_file(p_blob      => v_blob,
                                p_directory => 'EVIDENCIAS',
                                p_file_name => 'CER_PUB_' || r1.nmro_acto ||
                                               '.pdf');

    end if;

  end loop;

  -- 6. finalizar la sesión de apex creada al inicio.
  apex_session.delete_session;

  rollback;

exception
  when others then
    -- en caso de cualquier error, asegurarse de cerrar todos los archivos abiertos por utl_file
    -- para evitar bloqueos y corrupción.
    if utl_file.is_open(l_file) then
      utl_file.fclose(l_file);
    end if;

    utl_file.fclose_all;
    raise;
end jl_generar_pdfs_cer_pub_determinacion;
/

