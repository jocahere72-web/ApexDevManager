
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_G_RESPONSABLES_EMBARGADOS" ("ID_EMBRGOS_RSPNSBLE", "IDNTFCCION", "NMTCNCO_IDNTFCCION_TPO", "NMBRE_CMPLTO", "CDGO_CLNTE") AS
  select a.id_embrgos_rspnsble,trim(a.idntfccion) as idntfccion,a.nmtcnco_idntfccion_tpo,trim(a.nmbre_cmplto) as nmbre_cmplto,f.cdgo_clnte
from v_mc_g_embargos_responsable a
join mc_g_embrgs_rslcion_rspnsbl b on b.id_embrgos_rspnsble = a.id_embrgos_rspnsble
join mc_g_embargos_resolucion c on c.id_embrgos_rslcion = b.id_embrgos_rslcion
join mc_g_solicitudes_y_oficios d on d.id_embrgos_rslcion = c.id_embrgos_rslcion
                                 and d.id_embrgos_rspnsble = a.id_embrgos_rspnsble
join mc_g_embargos_cartera f on f.id_embrgos_crtra = a.id_embrgos_crtra
where not exists (select 1
                    from mc_g_desembargos_oficio e
                   where e.id_slctd_ofcio = d.id_slctd_ofcio)
group by a.id_embrgos_rspnsble,a.idntfccion,a.nmtcnco_idntfccion_tpo,a.nmbre_cmplto,f.cdgo_clnte
union all
select a.id_embrgos_rspnsble,trim(a.idntfccion) as idntfccion,a.nmtcnco_idntfccion_tpo,trim(a.nmbre_cmplto) as nmbre_cmplto,f.cdgo_clnte
from v_mc_g_embargos_responsable a
join mc_g_embrgs_rslcion_rspnsbl b on b.id_embrgos_rspnsble = a.id_embrgos_rspnsble
join mc_g_embargos_resolucion c on c.id_embrgos_rslcion = b.id_embrgos_rslcion
join mc_g_solicitudes_y_oficios d on d.id_embrgos_rslcion = c.id_embrgos_rslcion
                                  and d.id_embrgos_rspnsble is null
join mc_g_embargos_cartera f on f.id_embrgos_crtra = a.id_embrgos_crtra
where not exists (select 1
                    from mc_g_desembargos_oficio e
                   where e.id_slctd_ofcio = d.id_slctd_ofcio)
group by a.id_embrgos_rspnsble,a.idntfccion,a.nmtcnco_idntfccion_tpo,a.nmbre_cmplto,f.cdgo_clnte;

