
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_PRC_UNIFICACION_PLACAS" (p_cdgo_clnte        number,
                                                        p_id_impsto         number,
                                                        p_id_impsto_sbmpsto number,
                                                        p_id_usrio          number,
                                                        o_cdgo_rspsta       out number,
                                                        o_mnsje_rspsta      out varchar2) is

  --type empcurtyp is ref cursor;
  --v_placas_cursor empcurtyp;
  --v_record        v_si_i_sujetos_impuesto%rowtype;
  --v_stmt_str varchar2(600);

  v_id_usrio  number;
  v_id_impsto number;
  V_ID_SJTO   NUMBER;

  v_id_nvdad_prsna number;
begin

  --validacion usuario
  begin
    select u.id_usrio
      into v_id_usrio
      from sg_g_usuarios u
     where u.id_usrio = p_id_usrio;
  exception
    when others then
      o_cdgo_rspsta  := 1;
      o_mnsje_rspsta := 'El usuario no existe';
      raise;
  end;

  --validacion cliente
  begin
    select u.cdgo_clnte
      into v_id_impsto
      from df_s_clientes u
     where u.cdgo_clnte = p_cdgo_clnte;
  exception
    when others then
      o_cdgo_rspsta  := 2;
      o_mnsje_rspsta := 'El cliente no existe';
      raise;
  end;

  --validacion de impuesto y subimpuesto
  begin
    select u.id_impsto
      into v_id_impsto
      from df_i_impuestos_subimpuesto u
     where u.cdgo_clnte = p_cdgo_clnte
       and u.id_impsto = p_id_impsto
       and u.id_impsto_sbmpsto = p_id_impsto_sbmpsto;
  exception
    when others then
      o_cdgo_rspsta  := 3;
      o_mnsje_rspsta := 'El impueso o subimpuesto no existe';
      raise;
  end;

  for unificacion in (select t.*,
                             i.id_sjto_impsto,
                             i.idntfccion_sjto,
                             i.idntfccion_antrior,
                             i.id_sjto
                        from temp_unificacion_placas t
                        join v_si_i_sujetos_impuesto i
                          on i.idntfccion_sjto = t.plca_unfcda
                       where t.plca_unfcda <> 'CASO ESPECIAL'
                         and i.id_impsto = p_id_impsto
                         and i.cdgo_clnte = p_cdgo_clnte
                         and t.estdo = 'N'
                         and i.id_sjto_estdo = 1
                      --  and t.plca_unfcda IN ('205918') --'210409',
                       order by t.nmro_plcas desc) loop

    begin
      --registrar la novedad de cambio de nit
      insert into si_g_novedades_persona
        (id_nvdad_prsna,
         cdgo_clnte,
         id_impsto,
         id_impsto_sbmpsto,
         id_sjto_impsto,
         obsrvcion,
         cdgo_nvdad_tpo,
         id_instncia_fljo,
         id_instncia_fljo_pdre,
         id_slctud,
         cdgo_nvdad_prsna_estdo,
         fcha_rgstro,
         id_usrio_rgstro,
         fcha_aplco,
         id_usrio_aplco,
         fcha_rchzo,
         id_usrio_rchzo,
         id_fljo_trea,
         obsrvcion_rchzo,
         id_acto,
         dcmnto_html)
      values
        (sq_si_g_novedades_persona.nextval,
         p_cdgo_clnte,
         p_id_impsto,
         p_id_impsto_sbmpsto,
         unificacion.id_sjto_impsto,
         'ACTUALIZACION DE NIT DE ACUERDO AL PROCESO DE UNIFICACION DE PLACAS',
         'ACT',
         null,
         null,
         null,
         'APL',
         sysdate,
         p_id_usrio,
         sysdate,
         p_id_usrio,
         null,
         null,
         19,
         null,
         null,
         null)
      returning id_nvdad_prsna into v_id_nvdad_prsna;
    exception
      when others then
        o_cdgo_rspsta  := 4;
        o_mnsje_rspsta := 'Error registrando si_g_novedades_persona placa: ' ||
                          unificacion.idntfccion_sjto || ' - ' ||
                          to_char(SQLERRM);
        raise;
    end;

    --registrando el detalle de la novedad
    begin
      insert into SI_G_NOVEDADES_PRSNA_DTLLE
        (ID_NVDAD_PRSNA_DTLLE,
         ID_NVDAD_PRSNA,
         ATRBTO,
         LBEL_ATRBTO,
         VLOR_ANTRIOR,
         VLOR_NVO,
         USER_DGTA,
         FCHA_DGTA,
         USER_MDFCA,
         FCHA_MDFCA,
         TXTO_VLOR_ANTRIOR,
         TXTO_VLOR_NVO)
      values
        (sq_SI_G_NOVEDADES_PRSNA_DTLLE.Nextval,
         v_id_nvdad_prsna,
         'P34_CDGO_IDNTFCCION_TPO',
         'Tipo de Identificación',
         'M',
         'N',
         'APEX_PUBLIC_USER',
         sysdate,
         null,
         null,
         'MATRICULA',
         'NÚMERO DE IDENTIFICACIÓN TRIBUTARIA');

      insert into SI_G_NOVEDADES_PRSNA_DTLLE
        (ID_NVDAD_PRSNA_DTLLE,
         ID_NVDAD_PRSNA,
         ATRBTO,
         LBEL_ATRBTO,
         VLOR_ANTRIOR,
         VLOR_NVO,
         USER_DGTA,
         FCHA_DGTA,
         USER_MDFCA,
         FCHA_MDFCA,
         TXTO_VLOR_ANTRIOR,
         TXTO_VLOR_NVO)
      values
        (sq_SI_G_NOVEDADES_PRSNA_DTLLE.Nextval,
         v_id_nvdad_prsna,
         'P34_IDNTFCCION',
         'Identificación',
         unificacion.idntfccion_sjto,
         unificacion.idntfccion_antrior,
         'APEX_PUBLIC_USER',
         sysdate,
         null,
         null,
         unificacion.idntfccion_sjto,
         unificacion.idntfccion_antrior);
    exception
      when others then
        o_cdgo_rspsta  := 5;
        o_mnsje_rspsta := 'Error registrando SI_G_NOVEDADES_PRSNA_DTLLE placa: ' ||
                          unificacion.idntfccion_sjto || ' - ' ||
                          to_char(SQLERRM);
        raise;
    end;

    begin
      update si_c_sujetos s
         set s.idntfccion         = s.idntfccion_antrior,
             s.idntfccion_antrior = s.idntfccion
       where s.id_sjto = unificacion.id_sjto;
    exception
      when DUP_VAL_ON_INDEX then
        BEGIN

          SELECT C.ID_SJTO
            INTO V_ID_SJTO
            FROM SI_C_SUJETOS C
           WHERE C.CDGO_CLNTE = P_CDGO_CLNTE
             AND C.IDNTFCCION = UNIFICACION.idntfccion_antrior;

          UPDATE SI_I_SUJETOS_IMPUESTO I
             SET I.ID_SJTO = V_ID_SJTO
           WHERE I.ID_SJTO_IMPSTO = UNIFICACION.ID_SJTO_IMPSTO;
        exception
          WHEN OTHERS THEN
            o_cdgo_rspsta  := 7;
            o_mnsje_rspsta := 'Error actualizando si_c_sujetos cuando ya existe placa: ' ||
                              unificacion.idntfccion_sjto || ' - ' ||
                              to_char(SQLERRM);
        END;
      WHEN OTHERS THEN
        o_cdgo_rspsta  := 8;
        o_mnsje_rspsta := 'Error actualizando si_c_sujetos placa: ' ||
                          unificacion.idntfccion_sjto || ' - ' ||
                          to_char(SQLERRM);
        raise;
    end;

    update si_i_personas p
       set p.cdgo_idntfccion_tpo = 'N'
     WHERE P.ID_SJTO_IMPSTO = UNIFICACION.ID_SJTO_IMPSTO;

    UPDATE temp_unificacion_placas T
       SET T.ESTDO = 'S'
     WHERE T.PLCA_UNFCDA = UNIFICACION.PLCA_UNFCDA;

    COMMIT;
    --cursor que recorre las placas a unificar
    for placas in (select i.id_sjto_impsto
                     from v_si_i_sujetos_impuesto i
                    where i.cdgo_clnte = p_cdgo_clnte
                      and i.id_impsto = p_id_impsto
                      and i.idntfccion_antrior =
                          unificacion.idntfccion_antrior
                      and i.id_sjto_estdo = 1) loop
      begin
        --novedad de cancelacion
        insert into SI_G_NOVEDADES_PERSONA
          (ID_NVDAD_PRSNA,
           CDGO_CLNTE,
           ID_IMPSTO,
           ID_IMPSTO_SBMPSTO,
           ID_SJTO_IMPSTO,
           OBSRVCION,
           CDGO_NVDAD_TPO,
           ID_INSTNCIA_FLJO,
           ID_INSTNCIA_FLJO_PDRE,
           ID_SLCTUD,
           CDGO_NVDAD_PRSNA_ESTDO,
           FCHA_RGSTRO,
           ID_USRIO_RGSTRO,
           FCHA_APLCO,
           ID_USRIO_APLCO,
           FCHA_RCHZO,
           ID_USRIO_RCHZO,
           ID_FLJO_TREA,
           OBSRVCION_RCHZO,
           ID_ACTO,
           DCMNTO_HTML)
        values
          (sq_SI_G_NOVEDADES_PERSONA.Nextval,
           P_CDGO_CLNTE,
           p_ID_IMPSTO,
           p_ID_IMPSTO_SBMPSTO,
           placas.id_sjto_impsto,
           'CANCELACION DE MATRICULA POR UNIFICACION DE PLACAS, SE TRASLADAD AL NIT: ' ||
           UNIFICACION.NIT || ' PLACA: ' || UNIFICACION.PLCA_UNFCDA,
           'CNC',
           NULL,
           null,
           null,
           'APL',
           SYSDATE,
           P_ID_USRIO,
           SYSDATE,
           P_ID_USRIO,
           null,
           null,
           19,
           null,
           NULL,
           '<CLOB>');

        UPDATE SI_I_SUJETOS_IMPUESTO I
           SET I.ID_SJTO_ESTDO = 2
         WHERE I.ID_SJTO_IMPSTO = placas.id_sjto_impsto;
        COMMIT;
      exception
        when others then
          o_cdgo_rspsta  := 9;
          o_mnsje_rspsta := 'Error registrando SI_G_NOVEDADES_PERSONA placa: ' ||
                            unificacion.idntfccion_sjto || ' - ' ||
                            to_char(SQLERRM);
          raise;

      end;
    end loop;
  end loop;
end temp_prc_unificacion_placas;

  /*
  --select de las placas a unificar
        v_stmt_str := 'SELECT * FROM v_si_i_sujetos_impuesto WHERE id_sjto_estdo = 1 and idntfccion_sjto <> ''' ||
                    unificacion.plca_unfcda || ''' and idntfccion_sjto in (' || '''' ||
                    replace(replace(unificacion.plcas,
                                    ',',
                                    '''' || ',' || ''''),
                            ' ',
                            '') || '''' || ')';

      open v_placas_cursor for v_stmt_str;


      loop
        fetch v_placas_cursor
          into v_record;

        --registrar la novedad de inactivación y unificación

        dbms_output.put_line(v_record.idntfccion_sjto);
        exit when v_placas_cursor%notfound;
      end loop;
    */
/

