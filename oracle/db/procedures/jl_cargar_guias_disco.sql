
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_CARGAR_GUIAS_DISCO" (p_id_prcso_crga number,
                                                  p_file_mimetype varchar2 default 'image/tiff',
                                                  p_fcha_pblccion date default sysdate,
                                                  o_mensaje       out varchar2) is

  cursor c1 is
    select a.nmbre_evdncia_cmplto,
           a.fcha_ntfccion,
           c.id_ntfcion_mdio_evdncia,
           c.id_ntfccion_rspnsble,
           e.id_acto,
           e.indcdor_ntfccion
      from nt_g_notificacion_guia a
      join nt_d_lote_detalle b
        on b.id_lte_dtlle = a.id_lte_dtlle
      join nt_g_ntfccnes_rspnsble c
        on c.id_ntfccion_rspnsble = b.id_ntfccion_rspnsble
      left join nt_g_medio_entidad_evdncia d
        on d.id_ntfcion_mdio_evdncia = c.id_ntfcion_mdio_evdncia
      join gn_g_actos e
        on e.id_acto = b.id_acto
     where a.id_prcso_crga = p_id_prcso_crga
       and d.file_name is null
     order by a.id_ntfccion_guia desc;

  v_id_mdio                 number := 1;
  v_cdgo_clnte              number := 23001;
  v_id_ntfcion_mdio_evdncia number;

  v_bfile bfile;

begin
  for r1 in c1 loop

    v_bfile := bfilename('TS_GUIAS', r1.nmbre_evdncia_cmplto);

    if dbms_lob.fileexists(v_bfile) = 1 then

      if r1.id_ntfcion_mdio_evdncia is null then

        v_id_ntfcion_mdio_evdncia := null;
        --insertamos en nt_g_medio_entidad_evdncia
        begin
          insert into nt_g_medio_entidad_evdncia
            (id_mdio,
             file_name,
             file_mimetype,
             fcha_ntfccion,
             cdgo_clnte,
             file_bfile)
          values
            (v_id_mdio,
             r1.nmbre_evdncia_cmplto,
             p_file_mimetype,
             r1.fcha_ntfccion,
             v_cdgo_clnte,
             v_bfile)
          returning id_ntfcion_mdio_evdncia into v_id_ntfcion_mdio_evdncia;

          update nt_g_ntfccnes_rspnsble a
             set a.id_ntfcion_mdio_evdncia = v_id_ntfcion_mdio_evdncia
           where a.id_ntfccion_rspnsble = r1.id_ntfccion_rspnsble;

        exception
          when others then
            o_mensaje := 'Error insertando en nt_g_medio_entidad_evdncia - ' ||
                         sqlerrm;
            rollback;
            raise;
        end;
      else
        --actualizamos en nt_g_medio_entidad_evdncia
        update nt_g_medio_entidad_evdncia a
           set a.file_mimetype = p_file_mimetype,
               a.file_name     = r1.nmbre_evdncia_cmplto,
               a.file_bfile    = v_bfile
         where a.id_ntfcion_mdio_evdncia = r1.id_ntfcion_mdio_evdncia;
      end if;

      if p_fcha_pblccion is not null then

        if r1.indcdor_ntfccion = 'S' then
          update gn_g_actos a
             set a.ntfcdo_pag_web = 'S', a.fcha_pblccion = p_fcha_pblccion
           where a.id_acto = r1.id_acto;
        else
          update gn_g_actos a
             set a.fcha_ntfccion    = p_fcha_pblccion,
                 a.indcdor_ntfccion = 'S',
                 a.ntfcdo_pag_web   = 'S',
                 a.fcha_pblccion    = p_fcha_pblccion
           where a.id_acto = r1.id_acto;
        end if;
      end if;
    else
      dbms_output.put_line('La guia ' || r1.nmbre_evdncia_cmplto ||
                           ' no existe');
    end if;

  end loop;
  commit;
  o_mensaje := 'Se insertaron los datos de Notificacion exitosamente';
end jl_cargar_guias_disco;
/

