
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_CRGAR_PQR_ADJNTO" (p_vgncia_prdio varchar2,
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

  v_src_loc BFILE;
  v_b       BLOB;

begin
  p_ttal_size := 0;

  for r1 in c1 loop
    v_src_loc := BFILENAME('ETL_CARGA', r1.archvo);

    IF dbms_lob.fileexists(v_src_loc) = 1 THEN
      DBMS_LOB.OPEN(v_src_loc, DBMS_LOB.LOB_READONLY);

      DBMS_LOB.CREATETEMPORARY(v_b, true);

      DBMS_LOB.LOADFROMFILE(v_b, v_src_loc, dbms_lob.getlength(v_src_loc));

      if dbms_lob.getlength(v_b) < dbms_lob.getlength(r1.file_blob) then

        p_ttal_size := p_ttal_size +
                       (dbms_lob.getlength(v_b) / 1024 / 1024);

        update pq_g_documentos d
           set d.file_blob = v_b
         where d.id_dcmnto = r1.id_dcmnto;

        commit;

      else
        p_ttal_size := p_ttal_size +
                       (dbms_lob.getlength(r1.file_blob) / 1024 / 1024);

      end if;

      DBMS_LOB.CLOSE(v_src_loc);

    ELSE
      SITPR001('No existe: ' || r1.archvo,
               'LOG_CARGUE_PQR_' || p_vgncia_prdio || '.TXT');

    END IF;

  end loop;

  p_ttal_size := round(p_ttal_size, 2);

end jl_crgar_pqr_adjnto;
/

