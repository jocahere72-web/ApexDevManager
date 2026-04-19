
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_D_ENTIDADES" ("ID_ENTDDES", "CDGO_CLNTE", "DSCRPCION", "DRCCION", "CNTCTO", "CRGO_CNTCTO", "ID_BNCO", "OFCIO_X_PRPTRIO", "ACTVO", "ID_TPOS_MDDA_CTLAR", "CDGO_TPOS_MDDA_CTLAR", "DSCRPCION_TPO_EMBRGO", "ESTDO_TPO_EMBRGO") AS
  select a.id_entddes,a.cdgo_clnte,a.dscrpcion,a.drccion,a.cntcto,a.crgo_cntcto,a.id_bnco,a.ofcio_x_prptrio,a.actvo,c.id_tpos_mdda_ctlar,C.cdgo_tpos_mdda_ctlar,c.dscrpcion as dscrpcion_tpo_embrgo,c.actvo as estdo_tpo_embrgo
from mc_d_entidades a
inner join mc_d_entidades_tipo_embargo b on b.id_entddes = a.id_entddes
inner join mc_d_tipos_mdda_ctlar c on c.id_tpos_mdda_ctlar = b.id_tpos_mdda_ctlar
where a.cdgo_clnte = c.cdgo_clnte
and a.actvo = 'S'
and c.actvo = 'S';

