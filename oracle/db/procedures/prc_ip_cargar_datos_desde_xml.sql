
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_IP_CARGAR_DATOS_DESDE_XML" (p_nmbre_archvo in varchar2) is
  v_clob         clob;
  v_bfile        bfile;
  v_dest_offset  integer := 1;
  v_src_offset   integer := 1;
  v_warning      integer;
  v_lang_context integer := dbms_lob.default_lang_ctx;

  -- variables para capturar ids generados
  v_id_folio     number;
  v_id_anotacion number;
begin

  -- abrir el archivo desde el directorio
  v_bfile := bfilename('LOGS', p_nmbre_archvo);
  dbms_lob.createtemporary(v_clob, true);
  dbms_lob.fileopen(v_bfile, dbms_lob.file_readonly);

  -- cargar el contenido del archivo al clob
  dbms_lob.loadclobfromfile(dest_lob     => v_clob,
                            src_bfile    => v_bfile,
                            amount       => dbms_lob.lobmaxsize,
                            dest_offset  => v_dest_offset,
                            src_offset   => v_src_offset,
                            bfile_csid   => dbms_lob.default_csid,
                            lang_context => v_lang_context,
                            warning      => v_warning);

  dbms_lob.fileclose(v_bfile);

  for folio in (select *
                  from xmltable('/MATRICULAS_PREDIOS_REGISTRO/MATRICULAS/FOLIO_MATRICULA'
                                passing xmltype(v_clob) columns id_circulo
                                number path 'ID_CIRCULO',
                                id_matricula number path 'ID_MATRICULA',
                                fecha_apertura date path 'FECHA_APERTURA',
                                id_estado varchar2(20) path 'ID_ESTADO',
                                id_nrocatastro varchar2(50) path
                                'ID_NROCATASTRO',
                                id_nrocatastro_ant varchar2(50) path
                                'ID_NROCATASTRO_ANT',
                                id_departamento number path 'ID_DEPARTAMENTO',
                                id_municipio number path 'ID_MUNICIPIO',
                                id_tipo_predio varchar2(20) path
                                'ID_TIPO_PREDIO',
                                direccion_actual varchar2(200) path
                                'DIRECCION_ACTUAL',
                                folio_linderos clob path
                                'LINDEROS/FOLIO_LINDEROS',
                                anotaciones xmltype path 'ANOTACIONES')
                /*where id_matricula = '99834'*/
                ) loop

    dbms_output.put_line(folio.id_matricula);

    -- insertar el folio y obtener su id
    insert into ip_g_folios_matricula
      (id_folio,
       id_circulo,
       id_matricula,
       fecha_apertura,
       id_estado,
       id_nrocatastro,
       id_nrocatastro_ant,
       id_departamento,
       id_municipio,
       id_tipo_predio,
       direccion_actual,
       folio_linderos,
       nombre_archivo)
    values
      (seq_ip_g_folios_matricula.nextval,
       folio.id_circulo,
       folio.id_matricula,
       folio.fecha_apertura,
       folio.id_estado,
       folio.id_nrocatastro,
       folio.id_nrocatastro_ant,
       folio.id_departamento,
       folio.id_municipio,
       folio.id_tipo_predio,
       folio.direccion_actual,
       folio.folio_linderos,
       p_nmbre_archvo)
    returning id_folio into v_id_folio;

    for anotacion in (select *
                        from xmltable('ANOTACIONES/ANOTACION_FOLIO' passing
                                      folio.anotaciones columns
                                      id_anotacion_real number path
                                      'ID_ANOTACION_REAL',
                                      fecha_anotacion date path
                                      'FECHA_ANOTACION',
                                      id_radicacion varchar2(50) path
                                      'ID_RADICACION',
                                      id_instrumento varchar2(50) path
                                      'ID_INSTRUMENTO',
                                      id_numero_instrumento varchar2(20) path
                                      'ID_NUMERO_INSTRUMENTO',
                                      id_fecha_instrumento date path
                                      'ID_FECHA_INSTRUMENTO',
                                      id_oficina_origen varchar2(50) path
                                      'ID_OFICINA_ORIGEN',
                                      id_ciudad_origen varchar2(50) path
                                      'ID_CIUDAD_ORIGEN',
                                      id_naturaleza_juridica varchar2(50) path
                                      'ID_NATURALEZA_JURIDICA',
                                      valor varchar2(50) path 'VALOR',
                                      personas xmltype path
                                      'PERSONAS_ANOTACION',
                                      segregaciones xmltype path
                                      'SEGREGACIONES_ANOTACION')) loop

      insert into ip_g_anotaciones
        (id_anotacion,
         id_folio,
         id_anotacion_real,
         fecha_anotacion,
         id_radicacion,
         id_instrumento,
         id_numero_instrumento,
         id_fecha_instrumento,
         id_oficina_origen,
         id_ciudad_origen,
         id_naturaleza_juridica,
         valor)
      values
        (seq_ip_g_anotaciones.nextval,
         v_id_folio,
         anotacion.id_anotacion_real,
         anotacion.fecha_anotacion,
         anotacion.id_radicacion,
         anotacion.id_instrumento,
         anotacion.id_numero_instrumento,
         anotacion.id_fecha_instrumento,
         anotacion.id_oficina_origen,
         anotacion.id_ciudad_origen,
         anotacion.id_naturaleza_juridica,
         anotacion.valor)
      returning id_anotacion into v_id_anotacion;

      -- procesar personas_anotacion
      for persona in (select *
                        from xmltable('PERSONAS_ANOTACION/PERSONA_DE | PERSONAS_ANOTACION/PERSONA_A' -- nodo de personas de y a
                                      passing anotacion.personas -- fragmento xml de personas_anotacion
                                      columns id_tipo_dea varchar2(2) path
                                      'ID_TIPO_DEA',
                                      id_tipo_documento varchar2(20) path
                                      'ID_TIPO_DOCUMENTO',
                                      id_documento varchar2(50) path
                                      'ID_DOCUMENTO',
                                      id_apellido1 varchar2(50) path
                                      'ID_APELLIDO1',
                                      id_apellido2 varchar2(50) path
                                      'ID_APELLIDO2',
                                      id_nombre varchar2(50) path 'ID_NOMBRE',
                                      id_porcentaje VARCHAR2(50) path
                                      'ID_PORCENTAJE')) loop
        -- inserción en ip_g_personas_anotacion
        insert into ip_g_personas_anotacion
          (id_persona,
           id_anotacion,
           id_tipo_dea,
           id_tipo_documento,
           id_documento,
           id_apellido1,
           id_apellido2,
           id_nombre,
           id_porcentaje)
        values
          (seq_ip_g_personas_anotacion.nextval,
           v_id_anotacion,
           persona.id_tipo_dea,
           persona.id_tipo_documento,
           persona.id_documento,
           persona.id_apellido1,
           persona.id_apellido2,
           persona.id_nombre,
           persona.id_porcentaje);
      end loop;

      -- procesar segregaciones_anotacion
      for segregacion in (select *
                            from xmltable('SEGREGACIONES_ANOTACION/SEGREGACION'
                                          passing anotacion.segregaciones -- fragmento xml de segregaciones_anotacion
                                          columns id_matricula_dependiente
                                          number path
                                          'ID_MATRICULA_DEPENDIENTE',
                                          id_tipo_movimiento varchar2(10) path
                                          'ID_TIPO_MOVIMIENTO',
                                          descripcion_segregacion clob path
                                          'DESCRIPCION_SEGREGACION')) loop
        -- inserción en ip_g_segregaciones_anotacion
        insert into ip_g_segregaciones_anotacion
          (id_segregacion,
           id_anotacion,
           id_matricula_dependiente,
           id_tipo_movimiento,
           descripcion_segregacion)
        values
          (seq_ip_g_segregaciones_anotacion.nextval,
           v_id_anotacion,
           segregacion.id_matricula_dependiente,
           segregacion.id_tipo_movimiento,
           segregacion.descripcion_segregacion);
      end loop;

    end loop;

  end loop;
  commit;
  -- limpiar el clob temporal
  dbms_lob.freetemporary(v_clob);
exception
  when others then
    rollback;
    dbms_lob.freetemporary(v_clob);
    RAISE_APPLICATION_ERROR(-20001, 'Error: ' || SQLERRM);

end prc_ip_cargar_datos_desde_xml;
/

