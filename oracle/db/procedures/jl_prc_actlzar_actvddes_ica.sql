
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_PRC_ACTLZAR_ACTVDDES_ICA" (p_vgncia number) is

  cursor c1(r_vgncia number) is
    select e.*, f.id_dclrcns_esqma_trfa_tpo, f.nmbre_dclrcns_esqma_trfa_tpo
      from (select a.idntfccion_sjto,
                   a.id_sjto_impsto,
                   a.nmro_cnsctvo,
                   a.id_dclrcion,
                   a.vgncia,
                   (select to_number(to_char(x.vlor))
                      from gi_g_declaraciones_detalle x
                     where x.id_frmlrio_rgion_atrbto = 4712
                       and x.id_dclrcion = a.id_dclrcion
                       and x.fla = 1) ID_DCLRCNS_ESQMA_TRFA,
                   (select to_char(x.vlor_dsplay)
                      from gi_g_declaraciones_detalle x
                     where x.id_frmlrio_rgion_atrbto = 4712
                       and x.id_dclrcion = a.id_dclrcion
                       and x.fla = 1) actvdad
              from v_gi_g_declaraciones a
             where a.cdgo_dclrcion_estdo = 'APL'
               and a.id_frmlrio = 764
               and a.vgncia = r_vgncia
               and a.idntfccion_sjto not in ('1234567890', '12345678900')
               and a.id_dclrcion =
                   (select max(b.id_dclrcion)
                      from gi_g_declaraciones b
                     where b.id_dclrcion_vgncia_frmlrio =
                           a.id_dclrcion_vgncia_frmlrio
                       and b.id_sjto_impsto = a.id_sjto_impsto
                       and b.cdgo_dclrcion_estdo = 'APL')
               and not exists
             (select 1
                      from temp_actividades_ica_declaracion c
                     where c.id_sjto_impsto = a.id_sjto_impsto)) e
      join GI_D_DCLRCNS_ESQMA_TRFA d
        on d.id_dclrcns_esqma_trfa = e.ID_DCLRCNS_ESQMA_TRFA
      join GI_D_DCLRCNS_ESQMA_TRFA_TPO f
        on f.id_dclrcns_esqma_trfa_tpo = d.id_dclrcns_esqma_trfa_tpo
     where e.ID_DCLRCNS_ESQMA_TRFA is not null;

  cursor c2 is
    select a.id_sjto_impsto,
           a.idntfccion_sjto,
           d.id_dclrcns_esqma_trfa,
           d.dscrpcion,
           f.id_dclrcns_esqma_trfa_tpo,
           f.nmbre_dclrcns_esqma_trfa_tpo
      from v_si_i_sujetos_impuesto a
      join si_i_personas b
        on b.id_sjto_impsto = a.id_sjto_impsto
      join GI_D_DCLRCNS_ESQMA_TRFA d
        on d.id_dclrcns_esqma_trfa = b.id_actvdad_ecnmca
      join GI_D_DCLRCNS_ESQMA_TRFA_TPO f
        on f.id_dclrcns_esqma_trfa_tpo = d.id_dclrcns_esqma_trfa_tpo
     where a.id_impsto = 230012
       and b.id_actvdad_ecnmca is not null
       and not exists
     (select 1
              from temp_actividades_ica_declaracion c
             where c.id_sjto_impsto = a.id_sjto_impsto);

begin
  delete from temp_actividades_ica_declaracion;

  for r1 in c1(p_vgncia) loop
    insert into temp_actividades_ica_declaracion
      (idntfccion_sjto,
       id_sjto_impsto,
       nmro_cnsctvo,
       id_dclrcion,
       ID_DCLRCNS_ESQMA_TRFA,
       actvdad,
       id_dclrcns_esqma_trfa_tpo,
       nmbre_dclrcns_esqma_trfa_tpo,
       VGNCIA_DCLRCION)
    values
      (r1.idntfccion_sjto,
       r1.id_sjto_impsto,
       r1.nmro_cnsctvo,
       r1.id_dclrcion,
       r1.ID_DCLRCNS_ESQMA_TRFA,
       r1.actvdad,
       r1.id_dclrcns_esqma_trfa_tpo,
       r1.nmbre_dclrcns_esqma_trfa_tpo,
       r1.VGNCIA);
  end loop;
  commit;
  for r1 in c1(p_vgncia - 1) loop
    insert into temp_actividades_ica_declaracion
      (idntfccion_sjto,
       id_sjto_impsto,
       nmro_cnsctvo,
       id_dclrcion,
       ID_DCLRCNS_ESQMA_TRFA,
       actvdad,
       id_dclrcns_esqma_trfa_tpo,
       nmbre_dclrcns_esqma_trfa_tpo,
       VGNCIA_DCLRCION)
    values
      (r1.idntfccion_sjto,
       r1.id_sjto_impsto,
       r1.nmro_cnsctvo,
       r1.id_dclrcion,
       r1.ID_DCLRCNS_ESQMA_TRFA,
       r1.actvdad,
       r1.id_dclrcns_esqma_trfa_tpo,
       r1.nmbre_dclrcns_esqma_trfa_tpo,
       r1.VGNCIA);
  end loop;
  commit;

  for r1 in c1(p_vgncia - 2) loop
    insert into temp_actividades_ica_declaracion
      (idntfccion_sjto,
       id_sjto_impsto,
       nmro_cnsctvo,
       id_dclrcion,
       ID_DCLRCNS_ESQMA_TRFA,
       actvdad,
       id_dclrcns_esqma_trfa_tpo,
       nmbre_dclrcns_esqma_trfa_tpo,
       VGNCIA_DCLRCION)
    values
      (r1.idntfccion_sjto,
       r1.id_sjto_impsto,
       r1.nmro_cnsctvo,
       r1.id_dclrcion,
       r1.ID_DCLRCNS_ESQMA_TRFA,
       r1.actvdad,
       r1.id_dclrcns_esqma_trfa_tpo,
       r1.nmbre_dclrcns_esqma_trfa_tpo,
       r1.VGNCIA);
  end loop;
  commit;

  for r3 in c2 loop
    insert into temp_actividades_ica_declaracion
      (idntfccion_sjto,
       id_sjto_impsto,
       nmro_cnsctvo,
       id_dclrcion,
       ID_DCLRCNS_ESQMA_TRFA,
       actvdad,
       id_dclrcns_esqma_trfa_tpo,
       nmbre_dclrcns_esqma_trfa_tpo,
       VGNCIA_DCLRCION)
    values
      (r3.idntfccion_sjto,
       r3.id_sjto_impsto,
       null,
       null,
       r3.ID_DCLRCNS_ESQMA_TRFA,
       r3.dscrpcion,
       r3.id_dclrcns_esqma_trfa_tpo,
       r3.nmbre_dclrcns_esqma_trfa_tpo,
       null);
  end loop;
  commit;
exception
  when others then
    rollback;
    raise;
end jl_prc_actlzar_actvddes_ica;
/

