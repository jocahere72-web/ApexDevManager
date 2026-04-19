
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_GNRA_ACTO_DETERMINACION" (p_id_dtrmncion number) is
  o_cdgo_rspsta  number;
  o_mnsje_rspsta varchar2(500);

  v_dcmnto clob;

begin

  apex_session.create_session(p_app_id   => 66000,
                              p_page_id  => 37,
                              p_username => '1111111111');

  apex_util.set_session_state('F_CDGO_CLNTE', 23001);
  apex_util.set_session_state('F_FRMTO_MNDA',
                              'FM$999G999G999G999G999G999G990');

  for r1 in (select g.id_dtrmncion, g.id_dtrmncion_lte
               from gi_g_determinaciones g
              where g.id_dtrmncion = p_id_dtrmncion) loop

    v_dcmnto := null;

    v_dcmnto := pkg_gn_generalidades.fnc_ge_dcmnto(p_xml        => '{"ID_DTRMNCION":' ||
                                                                   r1.id_dtrmncion || '}',
                                                   p_id_plntlla => 306);

    update gi_g_determinaciones t
       set t.id_plntlla = 306, t.dcmnto = v_dcmnto
     where t.id_dtrmncion = r1.id_dtrmncion;

    pkg_gi_determinacion.prc_ac_acto_determinacion(r1.id_dtrmncion,
                                                   o_cdgo_rspsta,
                                                   o_mnsje_rspsta);

    commit;

  end loop;

end jl_gnra_acto_determinacion;
/

