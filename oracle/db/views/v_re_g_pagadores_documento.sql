
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RE_G_PAGADORES_DOCUMENTO" ("ID_PGDOR_DCMNTO", "CDGO_CLNTE", "NMBRE_CLNTE", "ID_IMPSTO", "CDGO_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "CDGO_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "ID_ORGEN", "CDGO_ORGN_TPO", "DSCRPCION_CDGO_ORGN_TPO", "ID_PGDOR", "IDNTFCCION", "DSCRPCION_IDNTFCCION_TPO", "PRMER_NMBRE", "SGNDO_NMBRE", "PRMER_APLLDO", "SGNDO_APLLDO", "TLFNO_1", "DRCCION_1", "EMAIL", "ID_TRCRO", "INDCDOR_ESTDO_TRNSCCION", "DSCRPCION_ESTDO_TRNSCCION", "FCHA_RGSTRO", "FCHA_MDFCCION", "ID_PRVDOR", "INDCDOR_ESTDO_TRNSCCION2", "REQUEST_ID", "CDGO_FRMLRIO", "CDGO_BNCO", "NMBRE_BNCO", "CDGO_TPO_OPRCION") AS
  select a.id_pgdor_dcmnto,
        a.cdgo_clnte,
        d.nmbre_clnte,
        a.id_impsto,
        b.cdgo_impsto,
        b.nmbre_impsto,
        a.id_impsto_sbmpsto,
        c.cdgo_impsto_sbmpsto,
        c.nmbre_impsto_sbmpsto,
        a.id_orgen,
        a.cdgo_orgn_tpo,
        decode(a.cdgo_orgn_tpo, 'DC', 'DOCUMENTO', 'DECLARACIÓN') as dscrpcion_cdgo_orgn_tpo,
        a.id_pgdor,
        d.idntfccion,
        d.dscrpcion_idntfccion_tpo,
        d.prmer_nmbre,
        d.sgndo_nmbre,
        d.prmer_aplldo,
        d.sgndo_aplldo,
        d.tlfno_1,
        d.drccion_1,
        d.email,
        d.id_trcro,
        a.indcdor_estdo_trnsccion,
        decode(a.indcdor_estdo_trnsccion,
               'IN',
               'INICIADA',
               'PE',
               'PENDIENTE',
               'AP',
               'APROBADA',
               'FA',
               'FALLIDA',
               'RE',
               'RECHAZADA',
               'RE_CU',
               'CANCELADA USUARIO',
               'RE_EX',
               'PETICION EXPIRADA') as dscrpcion_estdo_trnsccion,
        a.fcha_rgstro,
        a.fcha_mdfccion,
        a.id_prvdor,
        a.indcdor_estdo_trnsccion2,
        a.request_id,
        a.cdgo_frmlrio,
        a.cdgo_bnco,
        (select nmbre_bnco
           from ws_d_provedores_banco t
          where t.cdgo_bnco = a.cdgo_bnco) nmbre_bnco,
        (select cdgo_tpo_oprcion
           from ws_d_provedores_cliente p
          where p.id_impsto = a.id_impsto
            and p.id_impsto_sbmpsto = a.id_impsto_sbmpsto
            and p.id_prvdor = a.id_prvdor) cdgo_tpo_oprcion
   from re_g_pagadores_documento a
   join df_c_impuestos b
     on a.id_impsto = b.id_impsto
   join df_i_impuestos_subimpuesto c
     on a.id_impsto_sbmpsto = c.id_impsto_sbmpsto
   join v_re_g_pagadores d
     on a.id_pgdor = d.id_pgdor
;

