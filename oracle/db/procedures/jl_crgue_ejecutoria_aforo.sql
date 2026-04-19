
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_CRGUE_EJECUTORIA_AFORO" (p_vgncia number) is

  cursor c1 is
    select t.*, 2300122 id_impsto_sbmpsto, A.id_sjto_impsto, t.rowid
      from TEMP_CARGUE_EJECUTORIA_LOA t
      JOIN V_SI_I_SUJETOS_IMPUESTO A
        ON A.idntfccion_sjto = T.IDENTIFICACION
       AND A.id_impsto = 230012
     where T.CRGDA = 'N'
     order by t.liquidacion_de_aforo;

  v_id_acto_tpo         number := 142; --Ejecutoria
  v_cdgo_clnte          number := 23001;
  o_id_acto             number;
  v_id_fncnrio_frma     number := 142; -- Lupita Bello
  v_id_fncnrio_ntfccion number := 5; -- admin
  v_id_usrio            number := 230017; -- admin
  v_fecha               varchar2(50);

  v_id_prdo number;

  v_id_ntfccion      number;
  v_cdgo_rspsta_char varchar2(500);
  v_mnsje_rspsta     varchar2(500);
  v_cdgo_rspsta      number;

begin

  for r1 in c1 loop

    begin
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
        (v_cdgo_clnte,
         'FISCA',
         r1.id_sjto_impsto,
         r1.id_sjto_impsto,
         v_id_acto_tpo,
         r1.Numero_Ejecutoria,
         extract(year from R1.fcha_acto),
         r1.Numero_Ejecutoria,
         R1.fcha_acto,
         v_id_usrio,
         v_id_fncnrio_frma,
         null,
         NULL,
         0)
      returning id_acto into o_id_acto;
    exception
      when others then
        raise_application_error(-20001,
                                'Ocurrió un error al registrar el gn_g_actos: ' ||
                                r1.liquidacion_de_aforo || SQLERRM);
    end;
    --gn_g_actos_sujeto_impuesto
    begin

      insert into gn_g_actos_sujeto_impuesto
        (id_acto, id_impsto_sbmpsto, id_sjto_impsto)
      values
        (o_id_acto, r1.id_impsto_sbmpsto, r1.id_sjto_impsto);
    exception
      when others then
        raise_application_error(-20001,
                                'Ocurrió un error al registrar el gn_g_actos_sujeto_impuesto: ' ||
                                r1.liquidacion_de_aforo || SQLERRM);
    end;

    for c_sjtos_rspnsble in (select *
                               from si_i_personas a
                               join v_si_i_sujetos_impuesto b
                                 on a.id_sjto_impsto = b.id_sjto_impsto
                              where a.id_sjto_impsto = r1.id_sjto_impsto) loop

      --gn_g_actos_responsable
      begin
        insert into gn_g_actos_responsable
          (id_acto,
           cdgo_idntfccion_tpo,
           idntfccion,
           prmer_nmbre,
           sgndo_nmbre,
           prmer_aplldo,
           sgndo_aplldo,
           drccion_ntfccion,
           id_pais_ntfccion,
           id_dprtmnto_ntfccion,
           id_mncpio_ntfccion,
           email,
           tlfno)
        values
          (o_id_acto,
           c_sjtos_rspnsble.cdgo_idntfccion_tpo,
           c_sjtos_rspnsble.idntfccion_sjto,
           c_sjtos_rspnsble.nmbre_rzon_scial,
           '',
           '.',
           '',
           c_sjtos_rspnsble.drccion_ntfccion,
           c_sjtos_rspnsble.id_pais_ntfccion,
           c_sjtos_rspnsble.id_dprtmnto_ntfccion,
           c_sjtos_rspnsble.id_mncpio_ntfccion,
           c_sjtos_rspnsble.email,
           c_sjtos_rspnsble.tlfno);
      exception
        when others then
          raise_application_error(-20001,
                                  'Ocurrió un error al registrar el responsable: ' ||
                                  r1.liquidacion_de_aforo);
      end;
    end loop;

    begin
      select a.id_prdo
        into v_id_prdo
        from df_i_periodos a
       where a.id_impsto = v_cdgo_clnte || 2
         and a.vgncia = r1.vgncia
         and a.cdgo_prdcdad = 'ANU';

      insert into gn_g_actos_vigencia
        (ID_ACTO, ID_SJTO_IMPSTO, VGNCIA, ID_PRDO, VLOR_CPTAL, VLOR_INTRES)
      values
        (o_id_acto, r1.id_sjto_impsto, r1.vgncia, v_id_prdo, 0, 0);
    exception
      when others then
        raise_application_error(-20001,
                                'Ocurrió un error al registrar acto vigencia: ' ||
                                r1.liquidacion_de_aforo);
    end;

    begin
      jl_cargar_blob_acto(p_id_acto => o_id_acto,
                          p_fle_nme => r1.NMBRE_ARCHVO,
                          p_drctrio => 'LOGS');
    exception
      when others then
        raise_application_error(-20001,
                                'Ocurrió un error al registrar el BLOB del acto: ' ||
                                r1.liquidacion_de_aforo);
    end;

    update TEMP_CARGUE_EJECUTORIA_LOA t
       set t.Crgda = 'S'
     where t.rowid = r1.rowid;
    commit;
  end loop;

end jl_crgue_ejecutoria_aforo;
/

