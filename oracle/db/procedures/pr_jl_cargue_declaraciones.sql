
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PR_JL_CARGUE_DECLARACIONES" (o_mnsje_rspsta out varchar2) is

  cursor c1 is
    select d.id_dclrcion, d.nmro_cnsctvo
      from gi_g_declaraciones d
      join temp_jl_cargue_declaraciones a
        on a.nmro_cnsctvo = d.nmro_cnsctvo
     where a.prcsdo = 'N'
     order by d.id_dclrcion;

  v_src_loc bfile;
  v_b       blob;

  v_id_dclrcn_archvo_tpo number;
  v_cntdad_dcmntos       number;

begin

  for r1 in c1 loop

    v_cntdad_dcmntos := 0;

    o_mnsje_rspsta := null;

    select count(1)
      into v_cntdad_dcmntos
      from gi_g_dclrcnes_arhvos_adjnto
     where id_dclrcion = r1.id_dclrcion;

    if v_cntdad_dcmntos = 0 then

      v_src_loc := bfilename('ETL_CARGA', r1.nmro_cnsctvo || '.pdf');

      if dbms_lob.fileexists(v_src_loc) = 1 then

        dbms_lob.open(v_src_loc, dbms_lob.lob_readonly);

        dbms_lob.createtemporary(v_b, true);

        dbms_lob.loadfromfile(v_b,
                              v_src_loc,
                              dbms_lob.getlength(v_src_loc));

        --validamos el tipo de archivo

        begin
          select d.id_dclrcn_archvo_tpo
            into v_id_dclrcn_archvo_tpo
            from gi_d_dclrcnes_vgncias_frmlr a
            join gi_d_dclrcnes_tpos_vgncias b
              on b.id_dclrcion_tpo_vgncia = a.id_dclrcion_tpo_vgncia
            join gi_g_declaraciones c
              on c.id_dclrcion_vgncia_frmlrio =
                 a.id_dclrcion_vgncia_frmlrio
            join gi_d_dclrcnes_archvos_tpo d
              on d.id_dclrcn_tpo = b.id_dclrcn_tpo
            join GI_D_SUBIMPUESTOS_ADJNTO_TP e
              on e.id_sbmpto_adjnto_tpo = d.id_sbmpto_adjnto_tpo
             and e.id_impsto_sbmpsto = c.id_impsto_sbmpsto
           where c.id_dclrcion = r1.id_dclrcion;

          begin

            insert into gi_g_dclrcnes_arhvos_adjnto
              (id_dclrcion,
               id_dclrcn_archvo_tpo,
               file_blob,
               file_name,
               file_mimetype)
            values
              (r1.id_dclrcion,
               v_id_dclrcn_archvo_tpo,
               v_b,
               r1.nmro_cnsctvo || '.pdf',
               'application/pdf');

            update temp_jl_cargue_declaraciones t
               set t.prcsdo = 'S'
             where t.nmro_cnsctvo = r1.nmro_cnsctvo;

            commit;

          exception
            when others then
              o_mnsje_rspsta := 'Error al intentar guardar documento recibido. ' ||
                                sqlerrm;
              raise;
          end;

        exception
          when others then
            o_mnsje_rspsta := 'Error al intentar consular el tipo de arcivo de la declaracion. ' ||
                              sqlerrm;
            raise;
        end;

        dbms_lob.close(v_src_loc);
      end if;
    end if;
  end loop;

end pr_jl_cargue_declaraciones;
/

