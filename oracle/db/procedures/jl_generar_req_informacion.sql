
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_GENERAR_REQ_INFORMACION" (p_idntfccion   varchar2,
                                                       p_id_plntlla   number,
                                                       p_id_acto_tpo  number,
                                                       p_id_usrio     number,
                                                       p_id_fljo_trea number,
                                                       p_fcha_acto    date,
                                                       p_gngrar_acto  varchar2 default 'S',
                                                       p_crgar_pdf    varchar2 default 'S',
                                                       p_archvo_log   varchar2) is
  cursor c1 is
    select a.nmro_acto,
           b.cdgo_clnte,
           c.id_cnddto,
           b.id_impsto,
           b.id_sjto_impsto,
           c.id_instncia_fljo,
           e.idntfccion_sjto,
           c.id_fsclzcion_expdnte,
           c.id_fncnrio
      from temp_req_informcion_2023 a
      join fi_g_candidatos b
        on b.id_sjto_impsto = a.id_sjto_impsto
       and b.id_prgrma = 1
       and b.id_sbprgrma = 1
      join fi_g_fiscalizacion_expdnte c
        on c.id_cnddto = b.id_cnddto
      join v_si_i_sujetos_impuesto e
        on e.id_impsto = b.id_impsto
       and e.id_sjto_impsto = a.id_sjto_impsto
     where (a.idntfccion = p_idntfccion or p_idntfccion is null)
       and (not exists
            (select 1
               from fi_g_fsclzcion_expdnte_acto d
              where d.id_fsclzcion_expdnte = c.id_fsclzcion_expdnte
                and d.id_acto_tpo = p_id_acto_tpo) or p_gngrar_acto = 'N')
     order by a.nmro_acto;

  v_cdgo_rspsta  number;
  v_mnsje_rspsta varchar(1000);
  v_dcmnto       clob;
  v_json         clob;

  l_blob  blob;
  l_bfile bfile;

  v_id_fsclzcion_expdnte_acto number;
  v_id_acto                   number;
  v_id_dcmnto                 number;

begin

  for r1 in c1 loop
    --sitpr001('Iniciando proceso ' || r1.nmro_acto, p_archvo_log);

    v_id_fsclzcion_expdnte_acto := null;
    v_id_acto                   := null;
    v_id_dcmnto                 := null;

    v_dcmnto := 'REQUERIMIENTO GENERADO EXTERNAMENTE';

    if p_gngrar_acto = 'S' then
      /*v_dcmnto := v_dcmnto ||
      pkg_gn_generalidades.fnc_ge_dcmnto(p_xml        => '[{"CDGO_CLNTE":' ||
                                                         r1.cdgo_clnte || ',
                                                               "ID_SJTO_IMPSTO":' ||
                                                         r1.id_sjto_impsto || ',
                                                               "ID_INSTNCIA_FLJO":' ||
                                                         r1.id_instncia_fljo || ',
                                                               "IDNTFCCION":' ||
                                                         r1.idntfccion_sjto || ',
                                                               "ID_FSCLZCION_EXPDNTE":' ||
                                                         r1.id_fsclzcion_expdnte || ',
                                                               "ID_CNDDTO":' ||
                                                         r1.id_cnddto || ',
                                                               "ID_FNCNRIO":"' ||
                                                         r1.id_fncnrio || '"
                                                             }]',
                                         p_id_plntlla => p_id_plntlla);*/

      select json_object('VGNCIA' value
                         (select json_arrayagg(json_object('VGNCIA' value
                                                           a.vgncia,
                                                           'ID_PRDO' value
                                                           a.id_prdo))
                            from v_fi_g_fiscalizacion_expdnte_dtlle a
                           where a.id_cnddto = r1.id_cnddto))
        into v_json
        from dual;

      pkg_fi_fiscalizacion.prc_rg_expediente_acto(p_cdgo_clnte                => r1.cdgo_clnte,
                                                  p_id_usrio                  => p_id_usrio,
                                                  p_id_fljo_trea              => p_id_fljo_trea,
                                                  p_id_plntlla                => p_id_plntlla,
                                                  p_id_acto_tpo               => p_id_acto_tpo,
                                                  p_id_fsclzcion_expdnte      => r1.id_fsclzcion_expdnte,
                                                  p_dcmnto                    => v_dcmnto,
                                                  p_id_fsclzcion_expdnte_acto => null,
                                                  p_json                      => v_json,
                                                  o_id_fsclzcion_expdnte_acto => v_id_fsclzcion_expdnte_acto,
                                                  o_cdgo_rspsta               => v_cdgo_rspsta,
                                                  o_mnsje_rspsta              => v_mnsje_rspsta);
      --sitpr001('Paso 1 ' || r1.nmro_acto, p_archvo_log);
      pkg_fi_fiscalizacion.prc_rg_acto(p_cdgo_clnte                => r1.cdgo_clnte,
                                       p_id_usrio                  => p_id_usrio,
                                       p_id_cnddto                 => r1.id_cnddto,
                                       p_id_fsclzcion_expdnte_acto => v_id_fsclzcion_expdnte_acto,
                                       o_cdgo_rspsta               => v_cdgo_rspsta,
                                       o_mnsje_rspsta              => v_mnsje_rspsta);
      --sitpr001('Paso 2 ' || r1.nmro_acto, p_archvo_log);

      select b.id_acto, b.id_dcmnto
        into v_id_acto, v_id_dcmnto
        from fi_g_fsclzcion_expdnte_acto a
        join gn_g_actos b
          on b.id_acto = a.id_acto
       where a.id_fsclzcion_expdnte_acto = v_id_fsclzcion_expdnte_acto;

      update fi_g_fsclzcion_expdnte_acto a
         set a.fcha_crcion = p_fcha_acto
       where a.id_fsclzcion_expdnte_acto = v_id_fsclzcion_expdnte_acto;

      update gn_g_actos a
         set a.fcha                = p_fcha_acto,
             a.fcha_incio_ntfccion = p_fcha_acto,
             a.nmro_acto           = r1.nmro_acto,
             a.nmro_acto_dsplay    = r1.nmro_acto
       where a.id_acto = v_id_acto;

      update gd_g_documentos a
         set a.fcha = p_fcha_acto
       where a.id_dcmnto = v_id_dcmnto;

      commit;
      --sitpr001('Acto generado: ' || r1.nmro_acto, p_archvo_log);
    end if;

    if p_crgar_pdf = 'S' then

      if v_id_dcmnto is null then
        select b.id_dcmnto
          into v_id_dcmnto
          from fi_g_fsclzcion_expdnte_acto a
          join gn_g_actos b
            on b.id_acto = a.id_acto
         where a.id_fsclzcion_expdnte = r1.id_fsclzcion_expdnte
           and a.id_acto_tpo = p_id_acto_tpo;
      end if;

      begin
        -- abrir el archivo blob
        l_bfile := bfilename('LOGS', 'REQ_' || r1.nmro_acto || '.pdf');
        dbms_lob.fileopen(l_bfile, dbms_lob.file_readonly);

        -- inicializa el BLOB
        dbms_lob.createtemporary(l_blob, TRUE);

        -- carga el contenido del archivo en el blob
        dbms_lob.loadfromfile(l_blob, l_bfile, dbms_lob.getlength(l_bfile));

        update gd_g_documentos h
           set h.file_blob = l_blob
         where h.id_dcmnto = v_id_dcmnto;

        -- cierra el archivo bfile
        dbms_lob.fileclose(l_bfile);

        -- confirmar la transacción
        commit;

      exception
        when others then
          dbms_lob.fileclose(l_bfile);
          rollback; -- revertir en caso de error
          sitpr001('Error cargando el PDF de: ' || r1.nmro_acto,
                   p_archvo_log);
          continue;
      end;
    end if;

  --sitpr001('Finalizado proceso ' || r1.nmro_acto, p_archvo_log);
  end loop;

end jl_generar_req_informacion;
/

