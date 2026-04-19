
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_GSTION_JRDCA_TAREAS" ("ID_FLJO_TREA", "ID_USRIO") AS
  select      g.id_fljo_trea,
			f.id_usrio
from        (
                select      a.id_fljo_trea,
							b.id_usrio
                from        wf_d_flujos_tarea_prtcpnte      a
                inner join  sg_g_usuarios                   b   on  b.id_usrio      =   a.id_prtcpte
                                                                and a.tpo_prtcpnte  =   'USUARIO'
                where       a.actvo     =   'S'
                union
                select      c.id_fljo_trea,
							e.id_usrio
                from        wf_d_flujos_tarea_prtcpnte      c
                inner join  sg_g_perfiles_usuario           d   on  d.id_prfil      =   c.id_prtcpte
                                                                and c.tpo_prtcpnte  =   'PERFIL'
                inner join  sg_g_usuarios                   e   on  e.id_usrio      =   d.id_usrio
                where       c.actvo     =   'S'
            )                       f
inner join  wf_d_flujos_tarea   g   on  g.id_fljo_trea  =   f.id_fljo_trea
inner join  wf_d_flujos         h   on  h.id_fljo       =   g.id_fljo
and         h.id_prcso      =       14;

