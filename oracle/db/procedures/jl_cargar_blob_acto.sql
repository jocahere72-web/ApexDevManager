
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_CARGAR_BLOB_ACTO" (p_id_acto number,
                                                p_fle_nme varchar2,
                                                p_drctrio varchar2) is
  v_src_loc bfile;
  v_b       blob;
begin
  v_src_loc := bfilename(p_drctrio, p_fle_nme);

  if dbms_lob.fileexists(v_src_loc) = 1 then
    dbms_lob.open(v_src_loc, dbms_lob.lob_readonly);

    dbms_lob.createtemporary(v_b, true);

    dbms_lob.loadfromfile(v_b, v_src_loc, dbms_lob.getlength(v_src_loc));

    pkg_gn_generalidades.prc_ac_acto(p_file_blob       => v_b,
                                     p_id_acto         => p_id_acto,
                                     p_ntfccion_atmtca => 'N');

    dbms_lob.close(v_src_loc);

  else
    dbms_output.put_line('No existe: ' || p_fle_nme);
  end if;

end jl_cargar_blob_acto;
/

