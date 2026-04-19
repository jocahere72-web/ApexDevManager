
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_FI_G_CANDIDATOS" ("ID_CNDDTO", "ID_SJTO_IMPSTO", "ID_IMPSTO", "CDGO_IMPSTO", "NMBRE_IMPSTO", "ID_IMPSTO_SBMPSTO", "NMBRE_IMPSTO_SBMPSTO", "CANDIDATO", "INDCDOR_ASGNDO", "CDGO_CNDDTO_ESTDO", "NMBRE", "CDGO_CLNTE", "ID_FSCLZCION_LTE", "NMBRE_PRGRMA", "ID_PRGRMA", "CDGO_PRGRMA", "NMBRE_SBPRGRMA", "CDGO_SBPRGRMA", "ID_SBPRGRMA", "IDNTFCCION", "ACTVO") AS
  SELECT
        c.id_cnddto,
        c.id_sjto_impsto,
        i.id_impsto,
        i.cdgo_impsto,
        i.nmbre_impsto,
        s.id_impsto_sbmpsto,
        s.nmbre_impsto_sbmpsto,
        q.nmbre_rzon_scial AS candidato,
        c.indcdor_asgndo,
        e.cdgo_cnddto_estdo,
        e.nmbre,
        i.cdgo_clnte,
        c.id_fsclzcion_lte,
        p.nmbre_prgrma,
        p.id_prgrma,
        p.cdgo_prgrma,
        s.nmbre_sbprgrma,
        s.cdgo_sbprgrma,
        s.id_sbprgrma,
        a.idntfccion,
        c.actvo
    FROM
             fi_g_candidatos c
        JOIN si_i_sujetos_impuesto      b ON c.id_sjto_impsto = b.id_sjto_impsto
        JOIN si_c_sujetos               a ON b.id_sjto = a.id_sjto
        JOIN df_c_impuestos             i ON c.id_impsto = i.id_impsto
        JOIN df_i_impuestos_subimpuesto s ON c.id_impsto_sbmpsto = s.id_impsto_sbmpsto
        JOIN si_i_personas              q ON c.id_sjto_impsto = q.id_sjto_impsto
        JOIN fi_d_candidato_estado      e ON c.cdgo_cnddto_estdo = e.cdgo_cnddto_estdo
        JOIN fi_d_programas             p ON c.id_prgrma = p.id_prgrma
        JOIN fi_d_subprogramas          s ON c.id_sbprgrma = s.id_sbprgrma;

