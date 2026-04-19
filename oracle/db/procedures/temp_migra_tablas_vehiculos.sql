
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_MIGRA_TABLAS_VEHICULOS" (p_vgncia number) is

  cursor c1 is
    select *
      from iuva_linea_vehiculos@sucre_taxation a
     where a.vgncia = p_vgncia
       and not exists
     (select 1
              from df_s_vehiculos_linea b
             where b.dscrpcion_vhclo_lnea = a.dscrpcion_lnea);

  cursor c2 is
    select a.cdgo_clse, a.dscrpcion_clse, a.idntfcdor
      from iuva_clase_vehiculos@sucre_taxation a
     where not exists (select 1
              from df_s_vehiculos_clase b
             where b.cdgo_vhclo_clse = a.cdgo_clse);

  cursor c3 is
    select a.*, b.ctgria
      from iuva_automovil_grupo@sucre_taxation a
      join iuva_linea_vehiculos@sucre_taxation b
        on b.cdgo_mrca_vhclo = a.cdgo_mrca
       and b.cdgo_lnea = a.cdgo_lnea
       and b.vgncia = a.vgncia
     where a.vgncia = p_vgncia;

  cursor c4 is
    select * from iuva_avaluos@sucre_taxation a where a.vgncia = p_vgncia;

  v_cdgo_lnea            number;
  v_id_vhclo_clse_ctgria number;
  v_id_vhclo_lnea        number;
  v_cdgo_grpo_smart      number;

begin

  --se crea el campo en la tabla linea antes de hacer el cargue
  --alter table df_s_vehiculos_linea add cdgo_lnea_tax varchar2(10);
  --alter table df_s_vehiculos_grupo add cdgo_grpo_tax varchar2(10);

  -- carga de las nuevas marcas
  insert into migra.mg_s_vehiculos_marca
    select a.*, 'N', null
      from iuva_marca_vehiculos@sucre_taxation a
     where not exists (select 1
              from df_s_vehiculos_marca b
             where b.cdgo_vhclo_mrca = a.cdgo_mrca_vhclo);

  commit;

  for r1 in c1 loop
    begin
      insert into migra.mg_s_vehiculos_linea
        (cdgo_vhclo_mrca, dscrpcion_vhclo_lnea, mnstrio, cdgo_lnea_tax)
      values
        (r1.cdgo_mrca_vhclo, r1.dscrpcion_lnea, r1.minist, r1.cdgo_lnea);
    exception
      when others then
        null;
    end;

  end loop;
  commit;

  for r2 in c2 loop
    --cargar las clases
    insert into migra.mg_s_vehiculos_clase
    values
      (r2.cdgo_clse, r2.dscrpcion_clse, r2.idntfcdor, 'N', null);

  end loop;

  for r3 in c3 loop

    insert into migra.mg_s_vehiculos_grupo
      (vgncia,
       cdgo_vhclo_mrca,
       CDGO_LNEA_TAX,
       VHCLO_CLSE_CTGRIA,
       clndrje_dsde,
       clndrje_hsta,
       cpcdad_dsde,
       cpcdad_hsta,
       cdgo_grpo_tax)
    values
      (p_vgncia,
       r3.cdgo_mrca,
       R3.CDGO_LNEA,
       r3.ctgria,
       r3.clndrje,
       r3.clndrje,
       r3.cpcdad_crga,
       r3.cpcdad_crga,
       r3.cdgo_grpo);
  end loop;

  commit;

  for r4 in c4 loop

    insert into migra.mg_s_vehiculos_avaluo
      (mdlo, grpo_tax, vlor_avluo, mlje)
    values
      (r4.mdlo, r4.grpo, (r4.vlor * 1000), r4.vlor);
  end loop;

  commit;

  /*
  --se ejecuta una sola vez asociar las lineas de la vigencia anterior a las catagerias

  insert into df_s_vehiculos_clase_ctgria
    (vgncia, cdgo_vhclo_clse, cdgo_vhclo_ctgtria)
    select p_vgncia, b.cdgo_vhclo_clse, b.cdgo_vhclo_ctgtria
      from df_s_vehiculos_clase_ctgria b
     where vgncia = p_vgncia - 1;

  */

end temp_migra_tablas_vehiculos;
/

