
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_ULTMO_ACTO" (p_cdgo_clnte        number,
                                           p_id_sjto_impsto    in varchar2,
                                           p_vgncia            in number,
                                           p_id_impsto         in number,
                                           p_id_impsto_sbmpsto in number,
                                           p_tpo_acto          out varchar2,
                                           p_nmro_acto         out varchar2,
                                           p_fcha_acto         out date) as

  cursor c1(r_id_impsto number, r_id_impsto_sbmpsto number) is
    select to_number(c.nmro_acto) nmro_dcmnto,
           a.fcha_dtrmncion fcha_dcmnto,
           d.dscrpcion tpo_acto
      from gi_g_determinaciones a
      join gn_g_actos c
        on c.id_acto = a.id_acto
      join gn_d_actos_tipo d
        on d.id_acto_tpo = c.id_acto_tpo
     where a.cdgo_clnte = p_cdgo_clnte
       and a.id_impsto = r_id_impsto
       and a.id_impsto_sbmpsto = r_id_impsto_sbmpsto
       and a.id_sjto_impsto = p_id_sjto_impsto
       and exists (select 1
              from gi_g_determinacion_detalle b
             where b.id_dtrmncion = a.id_dtrmncion
               and a.id_sjto_impsto = b.id_sjto_impsto
               and b.vgncia = p_vgncia)
    union all
    select to_number(e.nmro_acto) nmro_dcmnto,
           e.fcha_acto fcha_dcmnto,
           f.dscrpcion tpo_acto
      from cb_g_procesos_jrdco_dcmnto e
      join gn_d_actos_tipo f
        on f.id_acto_tpo = e.id_acto_tpo
     where e.id_acto_tpo = 35 -- mandamiento
       and exists
     (select 1
              from cb_g_procesos_juridico g
             where g.id_prcsos_jrdco = e.id_prcsos_jrdco
               and exists
             (select 1
                      from cb_g_procesos_jrdco_mvmnto h
                     where h.id_prcsos_jrdco = g.id_prcsos_jrdco
                       and h.vgncia = p_vgncia
                       and h.id_sjto_impsto = p_id_sjto_impsto))
    union all
    select to_number(m.nmro_acto) nmro_dcmnto,
           m.fcha fcha_dcmnto,
           n.dscrpcion tpo_acto
      from gf_g_convenios_revocatoria l
      join gn_g_actos m
        on l.id_acto = m.id_acto
      join gn_d_actos_tipo n
        on n.id_acto_tpo = m.id_acto_tpo
     where exists
     (select 1
              from gf_g_convenios_cartera o
             where o.id_cnvnio = l.id_cnvnio
               and o.vgncia = p_vgncia
               and exists
             (select 1
                      from gf_g_convenios op
                     where op.id_cnvnio = o.id_cnvnio
                       and op.id_sjto_impsto = p_id_sjto_impsto))
    union all
    select p.nmro_cnvnio nmro_dcmnto,
           p.fcha_aplccion fcha_dcmnto,
           'ACUERDO DE PAGO' tpo_acto
      from gf_g_convenios p
     where p.id_sjto_impsto = p_id_sjto_impsto
       and exists (select 1
              from gf_g_convenios_cartera q
             where q.id_cnvnio = p.id_cnvnio
               and q.vgncia = p_vgncia)
     order by fcha_dcmnto desc;

begin

  p_nmro_acto := null;
  p_tpo_acto  := null;
  p_fcha_acto := null;

  for r1 in c1(p_id_impsto, p_id_impsto_sbmpsto) loop
    -- sitpr001('encontro acto', p_archvo);
    p_tpo_acto  := r1.tpo_acto;
    p_nmro_acto := r1.nmro_dcmnto;
    p_fcha_acto := r1.fcha_dcmnto;
    exit;
  end loop;
end;
/

