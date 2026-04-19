
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_DSCRGAR_PQR_ADJNTO" (p_vgncia_prdio varchar2,
                                                  p_ttal_size    out number) is
  cursor c1 is
    select d.id_dcmnto,
           d.file_blob,
           round(dbms_lob.getlength(d.file_blob) / 1024 / 1024, 2) mb,
           d.id_dcmnto || decode(FILE_MIMETYPE,
                                 'application/pdf',
                                 '.pdf',
                                 'application/zip',
                                 '.zip',
                                 'application/x-rar-compressed',
                                 '.rar') archvo
      from pq_g_documentos d
      join pq_g_solicitudes a
        on a.id_slctud = d.id_slctud
     where to_char(a.fcha_rdcdo, 'yyyymm') = p_vgncia_prdio
       and round(dbms_lob.getlength(d.file_blob) / 1024 / 1024, 2) > 0.5
       and d.file_mimetype = 'application/pdf'
    --and d.id_dcmnto = 135
     order by d.id_dcmnto;

  l_blob_len integer;

begin
  p_ttal_size := 0;

  for r1 in c1 loop
    l_blob_len := dbms_lob.getlength(r1.file_blob);

    p_ttal_size := p_ttal_size + (l_blob_len / 1024 / 1024);

    jl_copy_blob_data_to_file(r1.file_blob, 'ETL_CARGA', r1.archvo);
  end loop;

  p_ttal_size := round(p_ttal_size, 2);

end jl_dscrgar_pqr_adjnto;
/

