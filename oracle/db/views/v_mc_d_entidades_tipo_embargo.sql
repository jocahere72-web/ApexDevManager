
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_D_ENTIDADES_TIPO_EMBARGO" ("ID_ENTDDES_TPO_EMBRGO", "CDGO_CLNTE", "ID_ENTDDES", "DSCRPCION_ENTDAD", "ID_TPOS_MDDA_CTLAR", "DSCRPCION_TPO_MDDA_CTLAR", "CDGO_TPOS_MDDA_CTLAR") AS
  select a.id_entddes_tpo_embrgo,
       a.cdgo_clnte,
       a.id_entddes,
       b.dscrpcion as dscrpcion_entdad,
       a.id_tpos_mdda_ctlar,
       c.dscrpcion as dscrpcion_tpo_mdda_ctlar,
       c.cdgo_tpos_mdda_ctlar
from mc_d_entidades_tipo_embargo a
join mc_d_entidades b on b.id_entddes = a.id_entddes
join mc_d_tipos_mdda_ctlar c on c.id_tpos_mdda_ctlar = a.id_tpos_mdda_ctlar;

