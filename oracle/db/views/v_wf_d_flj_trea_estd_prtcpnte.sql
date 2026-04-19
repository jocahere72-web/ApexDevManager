
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_WF_D_FLJ_TREA_ESTD_PRTCPNTE" ("ID_FLJO_TREA_ESTDO", "ID_FLJO_TREA", "ID_USRIO", "NMBRE_TRCRO") AS
  select distinct a.id_fljo_trea_estdo,
            b.id_fljo_trea,
            c.id_usrio,
            c.nmbre_trcro
       from wf_d_flj_trea_estd_prtcpnte a
       join wf_d_flujos_tarea_prtcpnte b
         on a.id_fljo_trea_prtcpnte = b.id_fljo_trea_prtcpnte
       join (select c.id_prfil,
                    a.id_usrio,
                    A.nmbre_trcro
               from v_sg_g_usuarios a
               join sg_g_perfiles_usuario b
                 on b.id_usrio = a.id_usrio
               join sg_g_perfiles c
                 on c.id_prfil  = b.id_prfil ) c
            on decode(b.tpo_prtcpnte , 'USUARIO', c.id_usrio,'PERFIL',c.id_prfil) = b.id_prtcpte
            and a.actvo = 'S';

