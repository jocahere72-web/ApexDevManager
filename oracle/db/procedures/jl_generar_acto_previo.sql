
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_GENERAR_ACTO_PREVIO" (p_cdgo_clnte     number,
                                                   p_vgncia_incial  number,
                                                   p_vgncia_fnal    number,
                                                   p_mnto_mnmo      number,
                                                   p_id_sjto_impsto number default null,
                                                   p_rprcsar_blob   varchar2 default 'N',
                                                   p_nmro_rgstos    number) is

  cursor c1(r_id_acto_tpo number) is
    select *
      from (select t.id_sjto_impsto,
                   j.idntfccion_sjto referencia,
                   p.mtrcla_inmblria,
                   j.idntfccion_rspnsble id_propietario,
                   j.prmer_nmbre propietario,
                   trim(j.drccion) direccion,
                   listagg(t.vgncia, ', ') within group(order by t.vgncia) vigencias,
                   sum(t.vlor_sldo_cptal) capital,
                   sum(t.vlor_intres) interes,
                   sum(t.vlor_sldo_cptal + t.vlor_intres) total
              from v_gf_g_cartera_x_vigencia t
              join v_si_i_sujetos_responsable j
                on t.id_sjto_impsto = j.id_sjto_impsto
              join si_i_predios p
                on p.id_sjto_impsto = j.id_sjto_impsto
             where t.cdgo_clnte = p_cdgo_clnte
               and t.id_impsto = p_cdgo_clnte || 1
               and t.id_impsto_sbmpsto = p_cdgo_clnte || 11
               and t.cdgo_mvnt_fncro_estdo = 'NO'
               and t.indcdor_mvmnto_blqdo = 'N'
               and j.id_sjto_estdo = 1
               and j.prncpal_s_n = 'S'
               and (t.vlor_sldo_cptal) > 0
               and t.vgncia between p_vgncia_incial and p_vgncia_fnal
               and j.prmer_nmbre not in ('MUNICIPIO DE MONTERIA')
               and (t.id_sjto_impsto = p_id_sjto_impsto or
                   p_id_sjto_impsto is null)
               and j.idntfccion_rspnsble not in
                   ('8000967341',
                    '8000967341-4',
                    '800096734-1',
                    '891080007-6',
                    '891080007',
                    '91080032')
               and not exists
             (select 'X'
                      from gi_g_determinacion_detalle d,
                           gi_g_determinaciones       m
                     where m.id_sjto_impsto = t.id_sjto_impsto
                       and m.id_impsto = t.id_impsto
                       and m.id_impsto_sbmpsto = t.id_impsto_sbmpsto
                       and m.id_dtrmncion = d.id_dtrmncion
                       and d.vgncia = t.vgncia)
               and not exists
             (select 1
                      from v_gn_g_actos_sujeto_impuesto h
                      join gn_g_actos_vigencia i
                        on i.id_acto = h.id_acto
                     where h.id_sjto_impsto = t.id_sjto_impsto
                       and h.id_acto_tpo = r_id_acto_tpo
                       and i.vgncia = t.vgncia
                       and i.id_prdo = t.id_prdo)
             group by t.id_sjto_impsto,
                      j.idntfccion_sjto,
                      j.prmer_nmbre,
                      j.drccion,
                      p.mtrcla_inmblria,
                      j.idntfccion_rspnsble)
     where vigencias like p_vgncia_incial || '%'
       and total >= p_mnto_mnmo
     order by total desc, referencia
     FETCH FIRST p_nmro_rgstos ROWS ONLY;

  cursor c2(r_id_acto_tpo number) is
    select *
      from gn_g_actos a
     where a.id_acto_tpo = r_id_acto_tpo
       and (a.id_dcmnto is null and p_rprcsar_blob = 'N')
        or p_rprcsar_blob = 'S'
     order by a.nmro_acto;

  -- variables
  v_json_acto         clob;
  v_slct_sjto_impsto  clob;
  v_slct_vgncias      clob;
  v_slct_rspnsble     clob;
  v_id_acto_tpo       gn_g_actos.id_acto_tpo%type := 198;
  v_cdgo_acto_orgen   varchar2(3) := 'DTM';
  v_id_usrio          number := 244275; -- Fredy Arrieta
  o_id_acto           number;
  v_id_plntlla        number := 314;
  v_id_impsto         number := p_cdgo_clnte || 1;
  v_id_impsto_sbmpsto number := p_cdgo_clnte || 11;

  v_cdgo_rspsta   number;
  o_mnsje_rspsta  varchar2(1000);
  v_nmbre_drctrio varchar2(200) := 'ACTO_PREVIO_DETERMINACION';
  v_nmbre_archvo  varchar2(200);

  v_gn_d_reportes gn_d_reportes%rowtype;
  v_blob          blob;

begin
  -- ===================================================================
  -- fase 1: procesamiento del cursor c1 (creación de actos y documentos)
  -- ===================================================================
  for r1 in c1(v_id_acto_tpo) loop
    v_slct_sjto_impsto := ' select ' || v_id_impsto_sbmpsto ||
                          ' id_impsto_sbmpsto, id_sjto_impsto from si_i_sujetos_impuesto where id_sjto_impsto = ' ||
                          r1.id_sjto_impsto;
    v_slct_vgncias     := ' select distinct a.id_sjto_impsto, a.vgncia, a.id_prdo, a.vlor_sldo_cptal vlor_cptal, a.vlor_intres from V_GF_G_CARTERA_X_VIGENCIA a where a.cdgo_clnte = ' ||
                          p_cdgo_clnte || ' and a.id_impsto = ' ||
                          v_id_impsto || ' and a.id_impsto_sbmpsto = ' ||
                          v_id_impsto_sbmpsto ||
                          ' and a.id_sjto_impsto  = ' || r1.id_sjto_impsto ||
                          ' and a.cdgo_mvnt_fncro_estdo = ''NO'' and a.vgncia IN (' ||
                          r1.vigencias || ')';
    v_slct_rspnsble    := ' select a.cdgo_idntfccion_tpo, a.idntfccion, a.prmer_nmbre, a.sgndo_nmbre, a.prmer_aplldo, a.sgndo_aplldo, b.drccion_ntfccion, b.id_pais_ntfccion, b.id_dprtmnto_ntfccion, b.id_mncpio_ntfccion, b.email, b.tlfno from si_i_sujetos_responsable a join si_i_sujetos_impuesto b on a.id_sjto_impsto = b.id_sjto_impsto where a.id_sjto_impsto = ' ||
                          r1.id_sjto_impsto ||
                          ' group by a.cdgo_idntfccion_tpo, a.idntfccion, a.prmer_nmbre, a.sgndo_nmbre, a.prmer_aplldo, a.sgndo_aplldo, b.drccion_ntfccion, b.id_pais_ntfccion, b.id_dprtmnto_ntfccion, b.id_mncpio_ntfccion, b.email, b.tlfno';

    v_json_acto := pkg_gn_generalidades.fnc_cl_json_acto(p_cdgo_clnte          => p_cdgo_clnte,
                                                         p_cdgo_acto_orgen     => v_cdgo_acto_orgen,
                                                         p_id_orgen            => null,
                                                         p_id_undad_prdctra    => null,
                                                         p_id_acto_tpo         => v_id_acto_tpo,
                                                         p_acto_vlor_ttal      => r1.capital,
                                                         p_cdgo_cnsctvo        => 'APD',
                                                         p_id_acto_rqrdo_hjo   => null,
                                                         p_id_acto_rqrdo_pdre  => null,
                                                         p_fcha_incio_ntfccion => sysdate,
                                                         p_id_usrio            => v_id_usrio,
                                                         p_slct_sjto_impsto    => v_slct_sjto_impsto,
                                                         p_slct_vgncias        => v_slct_vgncias,
                                                         p_slct_rspnsble       => v_slct_rspnsble);

    pkg_gn_generalidades.prc_rg_acto(p_cdgo_clnte   => p_cdgo_clnte,
                                     p_json_acto    => v_json_acto,
                                     o_id_acto      => o_id_acto,
                                     o_cdgo_rspsta  => v_cdgo_rspsta,
                                     o_mnsje_rspsta => o_mnsje_rspsta);

    if v_cdgo_rspsta <> 0 then
      dbms_output.put_line('ERROR en prc_rg_acto para ID_SJTO_IMPSTO ' ||
                           r1.id_sjto_impsto || ': ' || o_mnsje_rspsta);
      raise_application_error(-20001,
                              'Error en lote de la Fase 1, deteniendo el proceso. Mensaje: ' ||
                              o_mnsje_rspsta);
    else
      commit;
    end if;
  end loop;

  -- ===================================================================
  -- fase 2: procesamiento del cursor c2 (generación de blob y archivo)
  -- ===================================================================
  select b.*
    into v_gn_d_reportes
    from gn_d_plantillas a
    join gn_d_reportes b
      on a.id_rprte = b.id_rprte
   where a.id_plntlla = v_id_plntlla;

  if v('app_session') is null then
    apex_session.create_session(p_app_id   => 66000,
                                p_page_id  => 37,
                                p_username => '1111111112');
  else
    apex_session.attach(p_app_id     => 66000,
                        p_page_id    => 37,
                        p_session_id => v('app_session'));
  end if;
  apex_util.set_session_state('p37_id_rprte', v_gn_d_reportes.id_rprte);

  for r2 in c2(v_id_acto_tpo) loop
    begin
      -- bloque anónimo para capturar errores por fila y continuar con el lote
      apex_util.set_session_state('p37_json',
                                  '{"nmbre_rprte":"' ||
                                  v_gn_d_reportes.nmbre_rprte ||
                                  '","id_acto":"' || r2.id_acto ||
                                  '","id_acto_tpo":"' || v_id_acto_tpo || '"}');

      v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                             p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,
                                             p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,
                                             p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,
                                             p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo);

      if dbms_lob.getlength(v_blob) > 5 then
        v_nmbre_archvo := r2.id_acto || ' - ' || r2.nmro_acto || '.pdf';

        pkg_gd_utilidades.prc_rg_dcmnto_dsco(p_blob         => v_blob,
                                             p_directorio   => v_nmbre_drctrio,
                                             p_nmbre_archvo => v_nmbre_archvo,
                                             o_cdgo_rspsta  => v_cdgo_rspsta,
                                             o_mnsje_rspsta => o_mnsje_rspsta);

        if (v_cdgo_rspsta = 0) then
          pkg_gn_generalidades.prc_ac_acto(p_directory       => v_nmbre_drctrio,
                                           p_file_name_dsco  => v_nmbre_archvo,
                                           p_id_acto         => r2.id_acto,
                                           p_ntfccion_atmtca => 'N');

          commit;

        else
          dbms_output.put_line('error registrando en el disco ' ||
                               r2.nmro_acto || ': ' || o_mnsje_rspsta);
        end if;
      else
        dbms_output.put_line('error generando el blob para ' ||
                             r2.nmro_acto);
      end if;
    exception
      when others then
        dbms_output.put_line('error no controlado procesando la fila ' ||
                             r2.nmro_acto || ': ' || sqlerrm);
    end;
  end loop;

exception
  when others then
    dbms_output.put_line('ERROR FATAL en JL_GENERAR_ACTO_PREVIO: ' ||
                         sqlerrm);
    raise;
end jl_generar_acto_previo;
/

