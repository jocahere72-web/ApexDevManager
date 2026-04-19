
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_TRMTES_TPO_MTCION_CLSE" ("CDGO_TRMTE_TPO", "DSCRPCION_TRMTE_TPO", "CDGO_MTCION_CLSE", "DSCRPCION_MTCION_CLSE", "ID_TRMTE_TPO_MTCION_CLSE") AS
  (
select a.cdgo_trmte_tpo,
       a.dscrpcion as dscrpcion_trmte_tpo,
       c.cdgo_mtcion_clse,
       c.dscrpcion as dscrpcion_mtcion_clse,
       b.id_trmte_tpo_mtcion_clse
       from df_s_tramites_tipo a
    join df_s_trmtes_tpo_mtcion_clse b
    on a.cdgo_trmte_tpo = b.cdgo_trmte_tpo
    join df_s_mutaciones_clase c
    on b.cdgo_mtcion_clse = c.cdgo_mtcion_clse
);

