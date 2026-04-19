
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_WF_D_FLUJOS" ("ID_FLJO", "CDGO_CLNTE", "NMBRE_CLNTE", "CDGO_FLJO", "DSCRPCION_FLJO", "ID_PRCSO", "PRCSO", "UNDAD_DRCION", "DSCRPCION_DRCION", "DRCION", "INDCDOR_INCIA_USRIO_FNAL", "DES_INDCDOR_INCIA_USRIO_FNAL", "ACTVO", "DESCRPCION_ACTIVO") AS
  select
	a.id_fljo,
	a.cdgo_clnte,
	(select m.nmbre_clnte from df_s_clientes m where m.cdgo_clnte = a.cdgo_clnte) nmbre_clnte,
	a.cdgo_fljo,
	a.dscrpcion_fljo,
    a.id_prcso,
    b.dscrpcion prcso,
	a.undad_drcion,
	case
		when a.undad_drcion = 'MN' then 'Minutos'
		when a.undad_drcion = 'HR' then	'Horas'
		when a.undad_drcion = 'DI' then	'Días'
		when a.undad_drcion = 'SM' then	'Semanas'
		when a.undad_drcion = 'MS' then	'Meses'
	end as dscrpcion_drcion,
	a.drcion,
    a.indcdor_incia_usrio_fnal,
    decode(a.indcdor_incia_usrio_fnal, 'S', 'Si', 'N', 'NO') des_indcdor_incia_usrio_fnal,
	a.actvo,
	case
		when a.actvo = 'S' then 'Si'
		when a.actvo = 'N' then 'No'
	end as descrpcion_activo
from wf_d_flujos a
join df_s_procesos b on b.id_prcso = a.id_prcso;

