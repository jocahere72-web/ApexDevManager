
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_CRGAR_PQR_ADJUNTO_RESPUESTA" (p_nmro_rdcdo_dsplay clob,
                                                           p_extnsion          varchar2) is
  cursor c1 is
    select a.nmro_rdcdo_dsplay || p_extnsion archvo,
           b.id_qja_rclmo,
           b.user_dgta
      from pq_g_solicitudes a
      join pq_g_quejas_reclamo b
        on b.id_slctud = a.id_slctud
     where a.nmro_rdcdo_dsplay is not null
       and p_nmro_rdcdo_dsplay like '%' || a.nmro_rdcdo_dsplay || '%'
     order by a.nmro_rdcdo_dsplay;

  v_src_loc bfile;
  v_b       blob;

  v_file_mimetype varchar2(50);

begin

  if p_extnsion = '.pdf' then
    v_file_mimetype := 'application/pdf';
  elsif p_extnsion = '.zip' then
    v_file_mimetype := 'application/zip';
  elsif p_extnsion = '.rar' then
    v_file_mimetype := 'application/x-rar-compressed';
  else
    raise_application_error(-20001,
                            'Extensión no soportada: ' || p_extnsion);
  end if;

  for r1 in c1 loop
    v_src_loc := bfilename('LOGS', r1.archvo);

    if dbms_lob.fileexists(v_src_loc) = 1 then
      dbms_lob.open(v_src_loc, dbms_lob.lob_readonly);

      dbms_lob.createtemporary(v_b, true);

      dbms_lob.loadfromfile(v_b, v_src_loc, dbms_lob.getlength(v_src_loc));

      insert into pq_g_quejas_reclamo_adjunto
        (id_qja_rclmo,
         obsrvcion,
         file_blob,
         file_name,
         file_mimetype,
         user_dgta,
         fcha_dgta,
         file_bfile)
      values
        (r1.id_qja_rclmo,
         r1.archvo,
         v_b,
         r1.archvo,
         v_file_mimetype,
         r1.user_dgta,
         sysdate,
         null);

      dbms_lob.close(v_src_loc);

    else
      dbms_output.put_line('No existe: ' || r1.archvo);
    end if;

  end loop;

end jl_crgar_pqr_adjunto_respuesta;
/

