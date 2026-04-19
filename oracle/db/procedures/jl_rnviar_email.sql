
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_RNVIAR_EMAIL" (p_id_envio in number,
                                            p_email    in out varchar2,
                                            o_id_envio out number,
                                            o_mnsje    out varchar2) is
  cursor c1 is
    select a.id_envio,
           a.cdgo_clnte,
           a.id_envio_prgrmdo,
           a.json_prfrncia,
           a.fcha_rgstro,
           a.fcha_prgrmda,
           a.id_sjto_impsto,
           a.id_acto,
           b.id_envio_mdio,
           b.cdgo_envio_mdio,
           b.dstno,
           b.asnto,
           b.txto_mnsje,
           b.cdgo_envio_estdo,
           c.id_envio_adjnto,
           c.file_blob,
           c.file_name,
           c.file_mimetype,
           c.file_bfile
      from ma_g_envios a
      join ma_g_envios_medio b
        on b.id_envio = a.id_envio
      left join ma_g_envios_adjntos c
        on c.id_envio = a.id_envio
     where a.id_envio = p_id_envio;

begin
  p_email := trim(p_email);

  if regexp_like(p_email,
                 '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$') then

    for r1 in c1 loop
      begin
        insert into ma_g_envios
          (cdgo_clnte,
           id_envio_prgrmdo,
           json_prfrncia,
           fcha_rgstro,
           fcha_prgrmda,
           id_sjto_impsto,
           id_acto)
        values
          (r1.cdgo_clnte,
           r1.id_envio_prgrmdo,
           r1.json_prfrncia,
           sysdate,
           sysdate,
           r1.id_sjto_impsto,
           r1.id_acto)
        returning id_envio into o_id_envio;

        insert into ma_g_envios_medio
          (id_envio,
           cdgo_envio_mdio,
           dstno,
           asnto,
           txto_mnsje,
           cdgo_envio_estdo)
        values
          (o_id_envio,
           r1.cdgo_envio_mdio,
           p_email,
           r1.asnto,
           r1.txto_mnsje,
           'ENC');

        if r1.id_envio_adjnto is not null then
          insert into ma_g_envios_adjntos
            (id_envio, file_blob, file_name, file_mimetype, file_bfile)
          values
            (o_id_envio,
             r1.file_blob,
             r1.file_name,
             r1.file_mimetype,
             r1.file_bfile);
        end if;

        commit;
        o_mnsje := 'OK';
      exception
        when others then
          o_id_envio := null;
          o_mnsje    := sqlerrm;
          rollback;
      end;
    end loop;
  else
    o_mnsje := 'Formato de email no valido';
  end if;

end jl_rnviar_email;
/

