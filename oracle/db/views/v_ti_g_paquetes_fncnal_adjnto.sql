
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_TI_G_PAQUETES_FNCNAL_ADJNTO" ("ID_PQTE_FNCNAL_ADJNTO", "ID_PQTE_FNCNAL", "NMBRE_PQTE_FNCNAL", "FCHA_PQTE_FNCNAL", "ID_USRIO_PQTE_FNCNAL", "ID_USRIO_ADJNTO", "NMBRE_ID_USRIO_ADJNTO", "CDGO_ADJNTO_TPO", "DSCRPCION_ADJNTO_TPO", "FCHA", "OBSRVCION", "NMRO_APLCCION", "NMRO_PGNA", "FILE_BLOB", "FILE_NAME", "FILE_MIMETYPE", "NMRO_VRSION") AS
  select a.id_pqte_fncnal_adjnto,
		a.id_pqte_fncnal,
		b.nmbre					nmbre_pqte_fncnal,
		b.fcha					fcha_pqte_fncnal,
		b.id_usrio				id_usrio_pqte_fncnal,
        a.id_usrio_adjnto,
        d.nmbre_trcro           nmbre_id_usrio_adjnto,
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
   from ti_g_paquetes_fncnal_adjnto a
        join v_ti_g_paquetes_funcional	b on a.id_pqte_fncnal = b.id_pqte_fncnal
        join ti_d_adjuntos_tipo			c on a.cdgo_adjnto_tpo = c.cdgo_adjnto_tpo
left    join v_sg_g_usuarios             d on a.id_usrio_adjnto = d.id_usrio;

