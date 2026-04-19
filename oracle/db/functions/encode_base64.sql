
  CREATE OR REPLACE EDITIONABLE FUNCTION "ENCODE_BASE64" ( p_blob_in in blob )
return clob is
    v_clob clob;
    v_result clob;
    v_offset integer;
    v_chunk_size binary_integer := (48 / 4) * 3;
    v_buffer_varchar varchar2(48);
    v_buffer_raw raw(48);
begin
    if p_blob_in is null then
      return null;
    end if;
    dbms_lob.createtemporary(v_clob, true);
    v_offset := 1;
    for i in 1 .. ceil(dbms_lob.getlength(p_blob_in) / v_chunk_size) loop
      dbms_lob.read(p_blob_in, v_chunk_size, v_offset, v_buffer_raw);
      v_buffer_raw := utl_encode.base64_encode(v_buffer_raw);
      v_buffer_varchar := utl_raw.cast_to_varchar2(v_buffer_raw);
      dbms_lob.writeappend(v_clob, length(v_buffer_varchar), v_buffer_varchar);
      v_offset := v_offset + v_chunk_size;
    end loop;
    v_result := v_clob;
    dbms_lob.freetemporary(v_clob);
    return v_result;
  end encode_base64;
/

