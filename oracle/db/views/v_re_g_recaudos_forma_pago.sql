
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_RECAUDOS_FORMA_PAGO" ("ID_RCDO_FRMA_PGO", "ID_RCDO", "FCHA_RCDO", "NMRO_DCMNTO", "VLOR", "CDGO_FRMA_PGO", "DSCRPCION_FRMA_PGO", "VLOR_PGDO", "RCDO_ORGN") AS
  select	a.id_rcdo_frma_pgo,
		a.id_rcdo,
		b.fcha_rcdo,
		b.nmro_dcmnto,
		b.vlor,
		a.cdgo_frma_pgo,
		decode(a.cdgo_frma_pgo,'EF','EFECTIVO','CH','CHEQUE','TR','TRANSFERENCIA') dscrpcion_frma_pgo,
		a.vlor_pgdo,
		a.rcdo_orgn
from	re_g_recaudos_forma_pago	a
join	re_g_recaudos				b	on	a.id_rcdo	=	b.id_rcdo;

