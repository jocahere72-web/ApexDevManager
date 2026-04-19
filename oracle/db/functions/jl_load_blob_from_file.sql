
  CREATE OR REPLACE EDITIONABLE FUNCTION "JL_LOAD_BLOB_FROM_FILE" (p_fle_nme varchar2,
                                                  p_drctrio varchar2)
  return blob is
  v_src_loc bfile;
  v_b       blob;
begin
  -- crea la ubicación del archivo
  v_src_loc := bfilename(p_drctrio, p_fle_nme);

  -- verifica si el archivo existe
  if dbms_lob.fileexists(v_src_loc) = 1 then
    -- abre el archivo bfile
    dbms_lob.open(v_src_loc, dbms_lob.lob_readonly);

    -- crea un blob temporal
    dbms_lob.createtemporary(v_b, true);

    begin
      -- carga el contenido del archivo al blob
      dbms_lob.loadfromfile(v_b, v_src_loc, dbms_lob.getlength(v_src_loc));
    exception
      when others then
        -- libera el blob temporal si ocurre un error
        if dbms_lob.istemporary(v_b) = 1 then
          dbms_lob.freetemporary(v_b);
        end if;
        raise;
    end;

    -- cierra el archivo bfile
    dbms_lob.close(v_src_loc);

    return v_b;
  else
    raise_application_error(-20001, 'Archivo no encontrado: ' || p_fle_nme);
  end if;
end jl_load_blob_from_file;
/

