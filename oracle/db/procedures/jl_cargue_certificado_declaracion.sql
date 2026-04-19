
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_CARGUE_CERTIFICADO_DECLARACION" (p_cdgo_clnte number,
                                                              p_id_usrio   number) is
  cursor c1 is
    select *
      from temp_cargue_certificado_declaracion t
     where t.prcsdo = 'N'
       and t.id_sjto_impsto is not null
       and t.id_acto is null
     order by t.nmro_crtfcdo;

  v_id_acto_tpo number;
  o_id_acto     number;

  v_id_fncnrio_frma number;
begin
  begin
    --validamos el acto
    select a.id_acto_tpo, b.id_fncnrio
      into v_id_acto_tpo, v_id_fncnrio_frma
      from gn_d_actos_tipo a
      join gn_d_actos_funcionario_frma b
        on b.id_acto_tpo = a.id_acto_tpo
     where a.cdgo_clnte = p_cdgo_clnte
       and a.cdgo_acto_tpo = 'CDED'
       and b.actvo = 'S';
  exception
    when others then
      raise;
  end;

  -- identificando el sujeto impuesto
  update temp_cargue_certificado_declaracion t
     set t.id_sjto_impsto   =
         (select a.id_sjto_impsto
            from v_si_i_sujetos_impuesto a
            join gi_g_declaraciones b
              on a.id_sjto_impsto = b.id_sjto_impsto
           where a.cdgo_clnte = p_cdgo_clnte
             and a.id_impsto = a.cdgo_clnte || 2
             and b.cdgo_dclrcion_estdo = 'APL'
             and a.idntfccion_sjto = t.idntfccion
             and b.nmro_cnsctvo = t.nmro_cnsctvo),
         t.id_impsto_sbmpsto =
         (select b.id_impsto_sbmpsto
            from v_si_i_sujetos_impuesto a
            join gi_g_declaraciones b
              on a.id_sjto_impsto = b.id_sjto_impsto
           where a.cdgo_clnte = p_cdgo_clnte
             and a.id_impsto = a.cdgo_clnte || 2
             and b.cdgo_dclrcion_estdo = 'APL'
             and a.idntfccion_sjto = t.idntfccion
             and b.nmro_cnsctvo = t.nmro_cnsctvo),
         t.nmro_crtfcdo      = 'CER-' || t.nmro_cnsctvo
   where t.prcsdo = 'N'
     and t.id_sjto_impsto is null;

  commit;

  for r1 in c1 loop

    --registrando el acto
    insert into gn_g_actos
      (cdgo_clnte,
       cdgo_acto_orgen,
       id_orgen,
       id_undad_prdctra,
       id_acto_tpo,
       nmro_acto,
       anio,
       nmro_acto_dsplay,
       fcha,
       id_usrio,
       id_fncnrio_frma,
       id_acto_rqrdo_ntfccion,
       fcha_incio_ntfccion,
       vlor)
    values
      (p_cdgo_clnte,
       'DEC',
       r1.nmro_cnsctvo,
       r1.nmro_cnsctvo,
       v_id_acto_tpo,
       r1.nmro_crtfcdo,
       extract(year from r1.fcha_acto),
       r1.nmro_crtfcdo,
       r1.fcha_acto,
       p_id_usrio,
       v_id_fncnrio_frma,
       null,
       r1.fcha_acto,
       0)
    returning id_acto into o_id_acto;

    begin

      insert into gn_g_actos_sujeto_impuesto
        (id_acto, id_impsto_sbmpsto, id_sjto_impsto)
      values
        (o_id_acto, r1.id_impsto_sbmpsto, r1.id_sjto_impsto);
    exception
      when others then
        raise;
    end;

    begin

      insert into Gn_g_Actos_Vigencia
        (ID_ACTO, ID_SJTO_IMPSTO, VGNCIA, ID_PRDO, VLOR_CPTAL, VLOR_INTRES)
      values
        (o_id_acto,
         R1.ID_SJTO_IMPSTO,
         R1.VGNCIA,
         (select A.ID_PRDO
            from DF_I_PERIODOS A
           where A.id_impsto = p_cdgo_clnte || 2
             AND A.ID_IMPSTO_SBMPSTO = R1.ID_IMPSTO_SBMPSTO
             AND A.DSCRPCION = 'ANUAL'
             AND A.VGNCIA = R1.VGNCIA),
         0,
         0);
    exception
      when others then
        raise;
    end;

    jl_cargar_blob_acto(p_id_acto => o_id_acto,
                        p_fle_nme => r1.nmro_crtfcdo || '.pdf',
                        p_drctrio => 'LOGS');

    update temp_cargue_certificado_declaracion t
       set t.prcsdo = 'S', t.id_acto = o_id_acto
     where t.idntfccion = r1.idntfccion
       and t.nmro_cnsctvo = r1.nmro_cnsctvo;

    commit;

  end loop;
end jl_cargue_certificado_declaracion;
/

