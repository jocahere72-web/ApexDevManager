
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_GF_G_PRSCRPCNES_SJTO_IMPSTO" ("ID_PRSCRPCION_SJTO_IMPSTO", "ID_PRSCRPCION", "ID_INSTNCIA_FLJO", "NMRO_PRSCRPCION", "CDGO_RSPSTA", "ID_USRIO_RSPSTA", "FCHA_RSPSTA", "ID_USRIO_AUTRZA_RSPSTA", "FCHA_AUTRZA_RSPSTA", "CDGO_CSAL_ANLCION", "ID_INSTNCIA_FLJO_PDRE", "ID_SLCTUD", "CDGO_CLNTE", "ID_IMPSTO", "CDGO_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "CDGO_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_SJTO_IMPSTO", "ID_SJTO", "IDNTFCCION", "IDNTFCCION_SJTO_FRMTDA") AS
  select     a.id_prscrpcion_sjto_impsto,
            a.id_prscrpcion,
            b.id_instncia_fljo,
            b.nmro_prscrpcion,
            b.cdgo_rspsta,
            b.id_usrio_rspsta,
            b.fcha_rspsta,
            b.id_usrio_autrza_rspsta,
            b.fcha_autrza_rspsta,
            b.cdgo_csal_anlcion,
            b.id_instncia_fljo_pdre,
            b.id_slctud,
            c.cdgo_clnte,
            d.id_impsto,
            d.cdgo_impsto,
            d.nmbre_impsto,
            e.id_impsto_sbmpsto,
            e.cdgo_impsto_sbmpsto,
            e.nmbre_impsto_sbmpsto,
            f.id_sjto_impsto,
            f.id_sjto,
            g.idntfccion,
            case
                when length(g.idntfccion) = 15 then
                    pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => g.idntfccion, p_frmto => 'xx-xx-xxxx-xxxx-xxx', p_crcter_dlmtdor
                    => '-')
                when length(g.idntfccion) = 25 then
                    pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => g.idntfccion, p_frmto => 'xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx'
                    , p_crcter_dlmtdor => '-')
                else
                    g.idntfccion
            end as idntfccion_sjto_frmtda
from        gf_g_prscrpcnes_sjto_impsto a
inner join  gf_g_prescripciones         b   on  b.id_prscrpcion     =   a.id_prscrpcion
inner join  df_s_clientes               c   on  c.cdgo_clnte        =   a.cdgo_clnte
inner join  df_c_impuestos              d   on  d.id_impsto         =   a.id_impsto
inner join  df_i_impuestos_subimpuesto  e   on  e.id_impsto_sbmpsto =   a.id_impsto_sbmpsto
inner join  si_i_sujetos_impuesto       f   on  f.id_sjto_impsto    =   a.id_sjto_impsto
inner join  si_c_sujetos                g   on  g.id_sjto           =   f.id_sjto;

