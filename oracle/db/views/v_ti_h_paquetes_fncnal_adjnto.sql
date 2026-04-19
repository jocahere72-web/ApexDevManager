
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_TI_H_PAQUETES_FNCNAL_ADJNTO" ("ID_PQTE_FNCNAL_ADJNTO_HSTRCO", "ID_PQTE_FNCNAL_ADJNTO", "NMBRE_PQTE_FNCNAL", "FCHA_PQTE_FNCNAL", "ID_USRIO_PQTE_FNCNAL", "CDGO_ADJNTO_TPO", "DSCRPCION_ADJNTO_TPO", "FCHA", "OBSRVCION", "NMRO_APLCCION", "NMRO_PGNA", "FILE_BLOB", "FILE_NAME", "FILE_MIMETYPE", "NMRO_VRSION") AS
  select a.id_pqte_fncnal_adjnto_hstrco,
		a.id_pqte_fncnal_adjnto,
		b.nmbre_pqte_fncnal,
		b.fcha_pqte_fncnal,
		b.id_usrio_pqte_fncnal,
		a.cdgo_adjnto_tpo,
		c.dscrpcion				dscrpcion_adjnto_tpo,
		a.fcha,
		a.obsrvcion,
		a.nmro_aplccion,
		a.nmro_pgna,
		a.file_blob,
		a.file_name,
		a.file_mimetype,
        a.nmro_vrsion
   from ti_h_paquetes_fncnal_adjnto a
   join v_ti_g_paquetes_fncnal_adjnto	b on a.id_pqte_fncnal_adjnto = b.id_pqte_fncnal_adjnto
   join ti_d_adjuntos_tipo				c on a.cdgo_adjnto_tpo = c.cdgo_adjnto_tpo;

