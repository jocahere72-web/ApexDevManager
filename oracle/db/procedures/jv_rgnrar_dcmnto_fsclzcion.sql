
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JV_RGNRAR_DCMNTO_FSCLZCION" (
                                                          P_id_rprte     number,
                                                          p_id_fsclzcion_expdnte      number,
                                                          o_mnsje_rspsta out varchar2) as
  v_blob          blob;
  v_xml           clob;
  v_id_impsto     number := 700012;
  v_id_usrio      number;
  v_nmbre_cnslta  gn_d_reportes.nmbre_cnslta%type;
  v_nmbre_plntlla gn_d_reportes.nmbre_plntlla%type;
  v_cdgo_clnte    number := 70001;

begin
  for i in (select f.id_fsclzcion_expdnte,
                   f.id_cnddto,
                   f.id_instncia_fljo,
                   f.cdgo_expdnte_estdo,
                   f.id_expdnte,
                   f.fcha_aprtra,
                   f.fcha_crre,
                   f.id_fncnrio,
                   f.id_fsclzcion_expdnte_pdre,
                   f.nmro_expdnte,

                   k.id_fsclzcion_expdnte_acto,
                   f.id_sjto_impsto,
                   k.id_acto
              from genesys.v_fi_g_fiscalizacion_expdnte f
              join genesys.FI_G_FSCLZCION_EXPDNTE_ACTO K
                on k.id_fsclzcion_expdnte = f.id_fsclzcion_expdnte
              join genesys.fi_g_candidatos c
                on c.id_cnddto = f.id_cnddto
             where f.cdgo_clnte = 70001
              -- and k.id_acto = 38353082
              and f.id_fsclzcion_expdnte=p_id_fsclzcion_expdnte
            and k.id_rprte = P_id_rprte
            --  and to_char(k.fcha_crcion,'YYYYMM')='202309'
             group by f.id_fsclzcion_expdnte,
                      f.id_cnddto,
                      f.id_instncia_fljo,
                      f.cdgo_expdnte_estdo,
                      f.id_expdnte,
                      f.fcha_aprtra,
                      f.fcha_crre,
                      f.id_fncnrio,
                      f.id_fsclzcion_expdnte_pdre,
                      f.nmro_expdnte,
                      k.id_fsclzcion_expdnte_acto,
                      f.id_sjto_impsto,
                      k.id_acto) loop

    select o.id_usrio
      into v_id_usrio
      from genesys.v_sg_g_usuarios o
     where o.id_fncnrio = i.id_fncnrio;

    if v('APP_SESSION') is null then

      apex_session.create_session(p_app_id   => 66000,
                                  p_page_id  => 2,
                                  p_username => '1111111111');
    end if;

    apex_session.attach(p_app_id     => 66000,
                        p_page_id    => 2,
                        p_session_id => v('APP_SESSION'));

    v_xml := '<data>
                <id_fsclzcion_expdnte_acto>' ||
             i.id_fsclzcion_expdnte_acto || '</id_fsclzcion_expdnte_acto>
                <p_id_impsto>' || v_id_impsto ||
             '</p_id_impsto>
                <p_id_fsclzcion_expdnte>' ||
             i.id_fsclzcion_expdnte || '</p_id_fsclzcion_expdnte>
                <cdgo_srie>FIS-001</cdgo_srie>
                <id_sjto_impsto>' || i.id_sjto_impsto ||
             '</id_sjto_impsto>
                <id_acto>' || i.id_acto ||
             '</id_acto>
                <cdgo_clnte>' || v_cdgo_clnte ||
             '</cdgo_clnte>
                <id_instncia_fljo>' || i.id_instncia_fljo ||
             '</id_instncia_fljo>
                <id_cnddto>' || i.id_cnddto ||
             '</id_cnddto>
                <id_usrio>' || v_id_usrio ||
             '</id_usrio>
              </data>';

    apex_util.set_session_state('P2_XML', v_xml);
    apex_util.set_session_state('F_CDGO_CLNTE', 70001);
    apex_util.set_session_state('P2_ID_RPRTE', P_id_rprte);
    select u.nmbre_plntlla, nmbre_cnslta
      into v_nmbre_plntlla, v_nmbre_cnslta
      from genesys.gn_d_reportes u
     where u.id_rprte = p_id_rprte;
    begin
      v_blob := apex_util.get_print_document(p_application_id     => 66000,
                                             p_report_query_name  => v_nmbre_cnslta,
                                             p_report_layout_name => v_nmbre_plntlla,
                                             p_report_layout_type => 'rtf',
                                             p_document_format    => 'PDF');

    end;

    if v_blob is not null then
      -- Generacion blob
      begin
        pkg_gn_generalidades.prc_ac_acto(p_file_blob       => v_blob,
                                         p_id_acto         => i.id_acto,
                                         p_ntfccion_atmtca => 'N');
      exception
        when others then

          o_mnsje_rspsta := 'NO SE PUDO GENERAR EL DOCUMENTO';
      end;

    end if;

  end loop;
end JV_rgnrar_dcmnto_fsclzcion;
/

