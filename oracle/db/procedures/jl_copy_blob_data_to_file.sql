
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_COPY_BLOB_DATA_TO_FILE" (p_blob      blob,
                                                      p_directory VARCHAR2,
                                                      p_file_name VARCHAR2) AS

  v_file          UTL_FILE.FILE_TYPE;
  v_offset        INTEGER := 1;
  v_amount        INTEGER := 32767;
  v_binary_buffer RAW(32767);
BEGIN

  -- open file for writing of bytes (upto v_amount bytes at a time)
  v_file := UTL_FILE.FOPEN(p_directory, p_file_name, 'wb', v_amount);

  --copy the data from v_src_blob to the file
  LOOP
    BEGIN

      -- read charactes from v_src_blob into v_binary_buffer
      DBMS_Lob.Read(p_blob, v_amount, v_offset, v_binary_buffer);

      -- copy the binary data from v_binary_buffer in the file
      UTL_FILE.PUT_RAW(v_file, v_binary_buffer);

      -- add v_amount to v_offset
      v_offset := v_offset + v_amount;
    EXCEPTION

      -- when there is no more data in the file then exit
      WHEN NO_DATA_FOUND THEN
        EXIT;
    END;
  END LOOP;

  -- flush any remaining data to the file
  UTL_FILE.FFLUSH(v_file);

  --close the file
  UTL_FILE.FCLOSE(v_file);

END jl_copy_blob_data_to_file;
/

