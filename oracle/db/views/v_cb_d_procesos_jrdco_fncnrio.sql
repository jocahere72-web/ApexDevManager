
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CB_D_PROCESOS_JRDCO_FNCNRIO" ("ID_PRCSOS_JRDCO_FNCNRIO", "ID_FNCNRIO", "CDGO_CLNTE", "NMBRE_TRCRO", "ID_USRIO") AS
  select a.id_prcsos_jrdco_fncnrio,
        a.id_fncnrio,
        a.cdgo_clnte,
        b.nmbre_trcro,
        b.id_usrio
  from cb_d_procesos_jrdco_fncnrio a
  join v_sg_g_usuarios b
    on a.id_fncnrio = b.id_fncnrio
 where a.actvo      = 'S';

