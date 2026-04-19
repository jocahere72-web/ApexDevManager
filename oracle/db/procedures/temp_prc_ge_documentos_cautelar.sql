
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_PRC_GE_DOCUMENTOS_CAUTELAR" (p_cnsctvo_embrgo     in number,
                                                            p_gnra_embrgo        in varchar2,
                                                            p_gnra_ofcio_embrgo  in varchar2,
                                                            p_gnra_dsmbrgo       in varchar2,
                                                            p_gnra_ofcio_dsmbrgo in varchar2,
                                                            p_mnsje_rspsta       out varchar2) is
  v_documento_embrgo       clob;
  v_documento_embrgo_ofcio clob;

  v_documento_dsmbrgo       clob;
  v_documento_dsmbrgo_ofcio clob;

  p_json_rslciones clob;

  v_id_embrgos_crtra number;

  v_id_embrgos_rslcion number;
  v_id_slctd_ofcio     number;

  v_id_dsmbrgos_rslcion number;
  v_id_dsmbrgo_ofcio    number;

  v_id_acto_embrgo        number;
  v_id_acto_embrgo_ofcio  number;
  v_id_acto_dsmbrgo       number;
  v_id_acto_dsmbrgo_ofcio number;

  v_id_plntlla_embrgo        number;
  v_id_plntlla_embrgo_ofcio  number;
  v_id_plntlla_dsmbrgo       number;
  v_id_plntlla_dsmbrgo_ofcio number;

  v_id_csles_dsmbrgo number;

  v_data varchar2(4000);

  v_cdgo_rspsta  number;
  v_mnsje_rspsta varchar2(1000);

  v_id_instncia_fljo   number;
  v_id_tpos_mdda_ctlar number;

  v_cdgo_clnte number := 23001;

begin

  --buscar datos

  begin

    select e.id_embrgos_rslcion,
           e.id_embrgos_crtra,
           e.id_acto,
           e.id_plntlla,
           a.id_instncia_fljo,
           a.id_tpos_mdda_ctlar
      into v_id_embrgos_rslcion,
           v_id_embrgos_crtra,
           v_id_acto_embrgo,
           v_id_plntlla_embrgo,
           v_id_instncia_fljo,
           v_id_tpos_mdda_ctlar
      from mc_g_embargos_resolucion e
      join mc_g_embargos_cartera a
        on a.id_embrgos_crtra = e.id_embrgos_crtra
     where e.cnsctvo_embrgo = p_cnsctvo_embrgo;
  exception
    when no_data_found then
      p_mnsje_rspsta := 'No existe resolucion de embargo con n?mero:' ||
                        p_cnsctvo_embrgo;
      return;
  end;

  --resolucion embargo
  if p_gnra_embrgo = 'S' then
    v_data := '<id_embrgos_crtra>' || v_id_embrgos_crtra ||
              '</id_embrgos_crtra><id_embrgos_rslcion>' ||
              v_id_embrgos_rslcion || '</id_embrgos_rslcion><id_acto>' ||
              v_id_acto_embrgo || '</id_acto>';

    v_documento_embrgo := pkg_gn_generalidades.fnc_ge_dcmnto(v_data,
                                                             v_id_plntlla_embrgo);

    if dbms_lob.getlength(v_documento_embrgo) = 0 or
       v_documento_embrgo is null then
      p_mnsje_rspsta := 'No se genero la resolucion de embargo';
      return;
    else
      update mc_g_embargos_resolucion
         set dcmnto_rslcion = v_documento_embrgo
       where id_embrgos_rslcion = v_id_embrgos_rslcion;
      commit;
    end if;
  end if;

  --oficio de embargo
  if p_gnra_ofcio_embrgo = 'S' then

    for r1 in (select a.id_slctd_ofcio, a.id_acto_ofcio, a.id_plntlla_ofcio
                 from mc_g_solicitudes_y_oficios a
                where a.id_embrgos_crtra = v_id_embrgos_crtra
                  and a.id_entddes = 20 --Solo nmuebles
               ) loop

      v_id_slctd_ofcio          := r1.id_slctd_ofcio;
      v_id_acto_embrgo_ofcio    := r1.id_acto_ofcio;
      v_id_plntlla_embrgo_ofcio := r1.id_plntlla_ofcio;

      v_data := '<id_embrgos_crtra>' || v_id_embrgos_crtra ||
                '</id_embrgos_crtra><id_slctd_ofcio>' || v_id_slctd_ofcio ||
                '</id_slctd_ofcio><id_acto>' || v_id_acto_embrgo_ofcio ||
                '</id_acto>';

      v_documento_embrgo_ofcio := pkg_gn_generalidades.fnc_ge_dcmnto(v_data,
                                                                     v_id_plntlla_embrgo_ofcio);

      if dbms_lob.getlength(v_documento_embrgo_ofcio) = 0 then
        p_mnsje_rspsta := p_mnsje_rspsta ||
                          ' - No se gener? la resoluci?n de embargo';
      else
        update mc_g_solicitudes_y_oficios
           set dcmnto_ofcio = v_documento_embrgo_ofcio
         where id_slctd_ofcio = v_id_slctd_ofcio;
        commit;
      end if;
    end loop;
  end if;

  --desembargo
  begin
    select r.id_dsmbrgos_rslcion,
           a.id_acto,
           a.id_plntlla,
           a.id_csles_dsmbrgo
      into v_id_dsmbrgos_rslcion,
           v_id_acto_dsmbrgo,
           v_id_plntlla_dsmbrgo,
           v_id_csles_dsmbrgo
      from mc_g_desembargos_cartera r
      join mc_g_desembargos_resolucion a
        on a.id_dsmbrgos_rslcion = r.id_dsmbrgos_rslcion
     where r.id_embrgos_crtra = v_id_embrgos_crtra;

  exception
    when no_data_found then
      p_mnsje_rspsta := p_mnsje_rspsta ||
                        ' - No se encontro la resolucion de desembargo';
  end;

  if p_gnra_dsmbrgo = 'S' then

    v_documento_dsmbrgo := pkg_gn_generalidades.fnc_ge_dcmnto('{"id_embrgos_crtra":' ||
                                                              v_id_embrgos_crtra ||
                                                              ',"id_dsmbrgos_rslcion":' ||
                                                              v_id_dsmbrgos_rslcion ||
                                                              ',"id_acto":' ||
                                                              v_id_acto_dsmbrgo || '}',
                                                              v_id_plntlla_dsmbrgo);

    if dbms_lob.getlength(v_documento_dsmbrgo) = 0 or
       v_documento_dsmbrgo is null then
      p_mnsje_rspsta := p_mnsje_rspsta ||
                        ' - No se generar la resolucion de desembargo';
    else

      update mc_g_desembargos_resolucion
         set dcmnto_dsmbrgo = v_documento_dsmbrgo
       where id_dsmbrgos_rslcion = v_id_dsmbrgos_rslcion;
      commit;
    end if;
  end if;

  --oficio de desembargo
  if p_gnra_ofcio_dsmbrgo = 'S' then

    for r1 in (select t.id_dsmbrgo_ofcio, t.id_acto, t.id_plntlla
                 from mc_g_desembargos_oficio t
                where t.id_dsmbrgos_rslcion = v_id_dsmbrgos_rslcion) loop

      v_id_dsmbrgo_ofcio         := r1.id_dsmbrgo_ofcio;
      v_id_acto_dsmbrgo_ofcio    := r1.id_acto;
      v_id_plntlla_dsmbrgo_ofcio := r1.id_plntlla;

      v_documento_dsmbrgo_ofcio := pkg_gn_generalidades.fnc_ge_dcmnto('{"id_embrgos_crtra":' ||
                                                                      v_id_embrgos_crtra ||
                                                                      ',"id_dsmbrgo_ofcio":' ||
                                                                      v_id_dsmbrgo_ofcio ||
                                                                      ',"id_acto":' ||
                                                                      v_id_acto_dsmbrgo_ofcio || '}',
                                                                      v_id_plntlla_dsmbrgo_ofcio);

      if dbms_lob.getlength(v_documento_dsmbrgo_ofcio) = 0 then
        p_mnsje_rspsta := p_mnsje_rspsta ||
                          ' - No se gener? el oficio de desembargo';
      else

        update mc_g_desembargos_oficio
           set dcmnto_dsmbrgo = v_documento_dsmbrgo_ofcio
         where id_dsmbrgo_ofcio = v_id_dsmbrgo_ofcio;

        commit;
      end if;
    end loop;
  end if;

  --Creao la session
  if v('APP_SESSION') is null then

    apex_session.create_session(p_app_id   => 80000,
                                p_page_id  => 110,
                                p_username => '1111111112');
  end if;

  apex_session.attach(p_app_id     => 80000,
                      p_page_id    => 110,
                      p_session_id => v('APP_SESSION'));

  apex_util.set_session_state('F_CDGO_CLNTE', v_cdgo_clnte);
  --apex_util.set_session_state('F_NMBRE_USRIO', 'CINDY MESA');
  apex_util.set_session_state('F_FRMTO_MNDA',
                              'FM$999G999G999G999G999G999G990');

  --contruyo el JSON de generaci?n de resoluciones Embargo
  if p_gnra_embrgo = 'S' or p_gnra_ofcio_embrgo = 'S' then

    v_data := '<data><id_embrgos_rslcion>' || v_id_embrgos_rslcion ||
              '</id_embrgos_rslcion></data>';

    p_json_rslciones := '{"ID_ER":' || v_id_embrgos_rslcion || ',"ID_EC":' ||
                        v_id_embrgos_crtra || ', "ID_IF":' ||
                        v_id_instncia_fljo || ', "ID_TE":' ||
                        v_id_tpos_mdda_ctlar || '}';

    pkg_cb_medidas_cautelares.prc_rg_gnrcion_actos_embargo(p_cdgo_clnte     => v_cdgo_clnte,
                                                           p_id_usuario     => 230017,
                                                           p_json_rslciones => p_json_rslciones,
                                                           o_cdgo_rspsta    => v_cdgo_rspsta,
                                                           o_mnsje_rspsta   => v_mnsje_rspsta);

    p_mnsje_rspsta := p_mnsje_rspsta || ' - Genera Embargo: OK' ||
                      v_mnsje_rspsta;
  end if;

  if p_gnra_dsmbrgo = 'S' or p_gnra_ofcio_dsmbrgo = 'S' then
    p_json_rslciones := '{"ID_DR":' || v_id_dsmbrgos_rslcion || ',"ID_EC":' ||
                        v_id_embrgos_crtra || ', "ID_IF":' ||
                        v_id_instncia_fljo || ', "ID_TMC":' ||
                        v_id_tpos_mdda_ctlar || ', "ID_CD":' ||
                        v_id_csles_dsmbrgo || '}';

    pkg_cb_medidas_cautelares.prc_rg_gnrcion_actos_desembargo(p_cdgo_clnte     => v_cdgo_clnte,
                                                              p_id_usuario     => 230017,
                                                              p_json_rslciones => p_json_rslciones,
                                                              o_cdgo_rspsta    => v_cdgo_rspsta,
                                                              o_mnsje_rspsta   => v_mnsje_rspsta);

    p_mnsje_rspsta := p_mnsje_rspsta || ' - Genera Desembargo: ' ||
                      v_mnsje_rspsta;
  end if;

end temp_prc_ge_documentos_cautelar;
/

