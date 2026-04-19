
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_GN_INTERFAZ_FINANCIERA" (p_cdgo_clnte in number,
                                                       p_vgncia     in number) as
begin

  --insert into muerto2 (n_001, t_001, v_001) values (99, systimestamp, 'Inicia prc_gn_interfaz_financiera. CLiente:' || p_cdgo_clnte || ' - Vigencia:' || p_vgncia); commit;
  --insert into muerto2 (n_001, t_001, v_001) values (99, systimestamp, 'Inicia Recaudo'); commit;

  --Up de Interfaz Recaudo
  prc_rg_recaudo_intrfaz(p_cdgo_clnte, p_vgncia);
  --insert into muerto2 (n_001, t_001, v_001) values (99, systimestamp, 'Fin Recaudo'); commit;
  --insert into muerto2 (n_001, t_001, v_001) values (99, systimestamp, 'Inicia Ajuste'); commit;

  --Up de Interfaz Ajuste
  prc_rg_ajuste_intrfaz(p_cdgo_clnte, p_vgncia);
  --insert into muerto2 (n_001, t_001, v_001) values (99, systimestamp, 'Fin Ajuste'); commit;
  --insert into muerto2 (n_001, t_001, v_001) values (99, systimestamp, 'Inicia Liquidación'); commit;

  --Up de Interfaz Liquidación
  prc_rg_liquidacion_intrfaz(p_cdgo_clnte, p_vgncia);
  --insert into muerto2 (n_001, t_001, v_001) values (99, systimestamp, 'Fin Liquidación'); commit;
  --insert into muerto2 (n_001, t_001, v_001) values (99, systimestamp, 'Fin prc_gn_interfaz_financiera'); commit;

end;
/

