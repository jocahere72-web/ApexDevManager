
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_MC_G_EMBARGOS_BIENES" ("ID_EMBRGOS_BNES", "ID_SLCTD_OFCIO", "ID_TPOS_DSTNO", "DESCRIPCION_DESTINO", "CDGO_TPOS_DSTNO", "ACTVO", "VLOR_ESTMDO") AS
  select a.id_embrgos_bnes,
        a.id_slctd_ofcio,
        a.id_tpos_dstno,
        b.dscrpcion as descripcion_destino,
        b.cdgo_tpos_dstno,
        b.actvo,
        a.vlor_estmdo
   from mc_g_embargos_bienes a
   left join mc_d_tipos_destino b on a.id_tpos_dstno = b.id_tpos_dstno;

