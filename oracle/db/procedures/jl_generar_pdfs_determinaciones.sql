
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_GENERAR_PDFS_DETERMINACIONES" (p_id_lote     in number,
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
  l_buffer   raw(32767);
  l_pos      integer;
  l_amount   binary_integer := 32767;

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
    v_json.put('id_dtrmncion_lte', r1.id_dtrmncion_lte); -- usar parámetro de lote

    -- establecer los valores en la sesión de apex
    apex_util.set_session_state('P37_JSON', v_json.to_clob());
    apex_util.set_session_state('P37_ID_RPRTE', p_id_reporte); -- usar parámetro de reporte
    apex_util.set_session_state('F_CDGO_CLNTE', p_id_cliente); -- usar parámetro de cliente
    apex_util.set_session_state('F_FRMTO_MNDA',
                                'FM$999G999G999G999G999G999G990'); -- valor fijo

    -- 4. generar el documento pdf llamando a la utilidad de impresión de apex.
    v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                           p_report_query_name  => 'gi_g_det_factura_titulo',
                                           p_report_layout_name => 'gi_g_det_factura_titulo',
                                           p_report_layout_type => 'rtf',
                                           p_document_format    => 'pdf');

    l_blob_len := dbms_lob.getlength(v_blob);

    -- 5. si el blob se generó correctamente (tiene contenido), guardarlo en el disco.
    if l_blob_len > 0 then
      -- abrir el archivo en modo escritura binaria ('wb')
      l_file := utl_file.fopen('DIR_DETERMINACIONES', -- nombre del objeto de directorio en oracle
                               r1.nmro_acto || '.pdf', -- nombre del archivo (ej: 20250000001.pdf)
                               'WB', -- 'write byte' mode
                               32767);

      l_pos := 1;
      -- leer el blob en trozos (chunks) y escribirlos en el archivo
      while l_pos < l_blob_len loop
        dbms_lob.read(v_blob, l_amount, l_pos, l_buffer);
        utl_file.put_raw(l_file, l_buffer, true);
        l_pos := l_pos + l_amount;
      end loop;

      -- cerrar el archivo
      utl_file.fclose(l_file);

      -- liberar la memoria del blob temporal
      dbms_lob.freetemporary(v_blob);
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
end jl_generar_pdfs_determinaciones;
/

