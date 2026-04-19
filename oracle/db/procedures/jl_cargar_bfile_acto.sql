
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_CARGAR_BFILE_ACTO" (p_id_acto number,
                                                 p_fle_nme varchar2,
                                                 p_drctrio varchar2) is
  v_src_loc bfile;
  v_b       blob;
begin
  v_src_loc := bfilename(p_drctrio, p_fle_nme);

  if dbms_lob.fileexists(v_src_loc) = 1 then

    pkg_gn_generalidades.prc_ac_acto(p_id_acto         => p_id_acto,
                                     p_ntfccion_atmtca => 'N',
                                     p_directory       => p_drctrio,
                                     p_file_name_dsco  => p_fle_nme);

  else
    dbms_output.put_line('No existe: ' || p_fle_nme);
  end if;

  dbms_lob.close(v_src_loc);

end jl_cargar_bfile_acto;
/

