
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GN_D_REPORTES_X_USUARIOS" ("ID_USRIO", "ID_RPRTE") AS
  select nvl( b.id_usrio , a.id_orgen ) as id_usrio
        , a.id_rprte
    from (
               select *
                 from gn_d_reportes_x_usuarios
          ) a
left join sg_g_perfiles_usuario b
       on a.id_orgen = b.id_prfil
      and a.tpo    = 'P'
 group by nvl( b.id_usrio , a.id_orgen )
        , a.id_rprte;

