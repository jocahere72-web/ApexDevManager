
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_CONVENIOS_VGNCIAS_FTRAS" ("ID_CNVNIO", "CDGO_CLNTE") AS
  select a.id_cnvnio, c.cdgo_clnte
        from v_gf_g_convenios           a
        join gf_d_convenios_tipo        b   on a.id_cnvnio_tpo = b.id_cnvnio_tpo
        join v_gf_g_cartera_x_vigencia  c   on a.id_sjto_impsto = c.id_sjto_impsto
        join v_gf_g_movimientos_detalle d   on a.cdgo_clnte = d.cdgo_clnte
                                            and a.id_impsto = d.id_impsto
                                            and a.id_impsto_sbmpsto = d.id_impsto_sbmpsto
                                            and a.id_sjto_impsto = d.id_sjto_impsto
                                            and c.vgncia = d.vgncia
                                            and c.id_prdo = d.id_prdo
                                            and d.cdgo_mvmnto_orgn = 'LQ'
                                            and to_char(d.fcha_mvmnto_orgen) > a.fcha_aplccion
       where b.indcdor_rvctria_vgncia_ftra = 'S'
         and c.cdgo_mvnt_fncro_estdo = 'NO'
         and c.vlor_sldo_cptal > 0
         and d.fcha_vncmnto < sysdate
         and a.cdgo_cnvnio_estdo = 'APL'
     group by a.id_cnvnio, c.cdgo_clnte;

