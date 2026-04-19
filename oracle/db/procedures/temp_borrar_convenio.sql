
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_BORRAR_CONVENIO" (p_nmro_cnvnio number) is
  cursor c1 is
    select c.id_cnvnio, c.id_acto, a.id_dcmnto
      from gf_g_convenios c
      join gn_g_actos a
        on a.id_acto = c.id_acto
     where c.nmro_cnvnio = p_nmro_cnvnio
       and c.cdgo_cnvnio_estdo = 'ANL';
begin

  for r1 in c1 loop
    update gf_g_convenios c
       set c.id_acto = null
     where c.id_cnvnio = r1.id_cnvnio;

    delete from gn_g_actos_sujeto_impuesto t where id_acto = r1.id_acto;
    delete from gn_g_actos_responsable t where id_acto = r1.id_acto;
    delete from gn_g_actos_vigencia t where id_acto = r1.id_acto;
    delete from gn_g_actos t where id_acto = r1.id_acto;

    delete from gd_g_documentos t where t.id_dcmnto = r1.id_dcmnto;

    --borrado de acto de anulacion
    for r2 in (select t.id_acto, t.id_cnvnio_anlcion
                 from gf_g_convenios_anulacion t
                where t.id_cnvnio = r1.id_cnvnio) loop

      update gf_g_convenios_anulacion c
         set c.id_acto = null
       where c.id_cnvnio_anlcion = r2.id_cnvnio_anlcion;

      delete from gn_g_actos_sujeto_impuesto t where id_acto = r2.id_acto;
      delete from gn_g_actos_responsable t where id_acto = r2.id_acto;
      delete from gn_g_actos_vigencia t where id_acto = r2.id_acto;
      delete from gn_g_actos t where id_acto = r2.id_acto;

      delete from gf_g_convenios_anulacion t
       where t.id_cnvnio_anlcion = r2.id_cnvnio_anlcion;

    end loop;

    delete from gf_g_convenios_cartera t where t.id_cnvnio = r1.id_cnvnio;
    delete from gf_g_convenios_documentos t
     where t.id_cnvnio = r1.id_cnvnio;
    delete from gf_g_convenios_excepcion t
     where t.id_cnvnio = r1.id_cnvnio;
    delete from gf_g_convenios_extracto t where t.id_cnvnio = r1.id_cnvnio;
    delete from gf_g_convenios_garantia t where t.id_cnvnio = r1.id_cnvnio;
    delete from gf_g_cnvnios_cta_incl_vgnc t
     where t.id_cnvnio = r1.id_cnvnio;
    delete from gf_g_convenios t where t.id_cnvnio = r1.id_cnvnio;

  end loop;

  commit;

end temp_borrar_convenio;
/

