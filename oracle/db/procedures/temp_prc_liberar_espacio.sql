
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_PRC_LIBERAR_ESPACIO" is
begin
  -- se borran los logs mayores a un mes
  delete from apex_190100.wwv_flow_activity_log1$ t
   where (trunc(sysdate) - trunc(t.time_stamp)) > 30;

  delete from apex_190100.wwv_flow_activity_log2$ t
   where (trunc(sysdate) - trunc(t.time_stamp)) > 30;

  commit;

  --se reconstruyen los indices
  for r1 in (select 'alter index ' || owner || '.' || index_name ||
                    ' rebuild' exe_sql
               from all_indexes
              where status not in ('VALID', 'USABLE', 'N/A')) loop
    execute immediate r1.exe_sql;
  end loop;

  --se reconstruyen las tablas
  execute immediate 'alter table apex_190100.wwv_flow_activity_log1$ move tablespace DATOS';
  execute immediate 'alter table apex_190100.wwv_flow_activity_log2$ move tablespace DATOS';
  execute immediate 'alter table apex_190100.wwv_flow_activity_log1$ move tablespace apex';
  execute immediate 'alter table apex_190100.wwv_flow_activity_log2$ move tablespace apex';

  --se borran las colecciones mayores a dos d?as
  delete from flows_files.wwv_flow_file_objects$ t
   where (trunc(sysdate) - trunc(t.created_on)) > 3;
  commit;

  --se reconstruyen los indices
  for r1 in (select 'alter index ' || owner || '.' || index_name ||
                    ' rebuild' exe_sql
               from all_indexes
              where status not in ('VALID', 'USABLE', 'N/A')) loop
    execute immediate r1.exe_sql;
  end loop;

  --se reconstruyen las tablas
  execute immediate 'alter table flows_files.wwv_flow_file_objects$ move tablespace apex';

  --se reconstruyen los indices
  for r1 in (select 'alter index ' || owner || '.' || index_name ||
                    ' rebuild' exe_sql
               from all_indexes
              where status not in ('VALID', 'USABLE', 'N/A')) loop
    execute immediate r1.exe_sql;
  end loop;

  --se reconstruyen los blob de las colecciones
  for r1 in (SELECT 'alter table ' || A.owner || '.' || B.TABLE_NAME ||
                    ' move tablespace APEX LOB(' || B.COLUMN_NAME ||
                    ') store as ' || A.segment_name || '(tablespace APEX)' exe_sql
               FROM sys.dba_segments A
               LEFT JOIN sys.dba_lobs B
                 ON B.SEGMENT_NAME = A.segment_name
              WHERE A.tablespace_name = 'APEX'
                and round(bytes / 1024 / 1024) > 1
                and b.TABLE_NAME in
                    ('WWV_FLOW_FILE_OBJECTS$',
                     'WWV_FLOW_COLLECTION_MEMBERS$')) loop
    execute immediate r1.exe_sql;
  end loop;

  --se reconstruyen los indices
  for r1 in (select 'alter index ' || owner || '.' || index_name ||
                    ' rebuild' exe_sql
               from all_indexes
              where status not in ('VALID', 'USABLE', 'N/A')) loop
    execute immediate r1.exe_sql;
  end loop;

  execute immediate 'truncate table ad_g_audit_trail';

end temp_prc_liberar_espacio;
/

