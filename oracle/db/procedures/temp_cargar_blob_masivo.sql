
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_CARGAR_BLOB_MASIVO" is

  CURSOR C1 IS
  --DETERMINACIONES
    SELECT D.ID_ACTO, A.NMRO_ACTO, A.NMRO_ACTO || '.pdf' NMBRE_ARCHVO
      FROM GI_G_DETERMINACIONES D
      JOIN GN_G_ACTOS A
        ON A.ID_ACTO = D.ID_ACTO
     WHERE d.id_dtrmncion_lte in (302, 303, 304)
       AND A.NMRO_ACTO > 0
       and a.id_dcmnto is null
    -- and d.id_dtrmncion = 1016218
     ORDER BY A.NMRO_ACTO;

  --MANDAMIENTOS DE PAGO
  /*SELECT I.idntfccion_sjto,
                           J.Nmro_Acto,
                           J.ID_ACTO,
                           J.NMRO_ACTO || '.pdf' NMBRE_ARCHVO
                      FROM CB_G_PROCESOS_JRDCO_DCMNTO J
                      JOIN CB_G_PROCESOS_JURIDICO T
                        ON J.ID_PRCSOS_JRDCO = T.ID_PRCSOS_JRDCO
                      JOIN CB_G_PROCESOS_JURIDICO_SJTO S
                        ON S.ID_PRCSOS_JRDCO = J.ID_PRCSOS_JRDCO
                      JOIN V_SI_I_SUJETOS_IMPUESTO I
                        ON I.ID_SJTO = S.ID_SJTO
                       AND I.ID_IMPSTO = 230011
                     WHERE J.ID_ACTO_TPO = 35
                       AND TO_CHAR(J.FCHA_ACTO, 'YYYYMMDD') = '20190510'
                       and j.nmro_acto > 0
                       and J.ID_ACTO is not null
                     order by TO_NUMBER(j.nmro_acto);

  --CITACIONES
    SELECT I.idntfccion_sjto,
           J.Nmro_Acto,
           J.ID_ACTO,
           J.NMRO_ACTO || '.pdf' NMBRE_ARCHVO
      FROM CB_G_PROCESOS_JRDCO_DCMNTO J
      JOIN CB_G_PROCESOS_JURIDICO T
        ON J.ID_PRCSOS_JRDCO = T.ID_PRCSOS_JRDCO
      JOIN CB_G_PROCESOS_JURIDICO_SJTO S
        ON S.ID_PRCSOS_JRDCO = J.ID_PRCSOS_JRDCO
      JOIN V_SI_I_SUJETOS_IMPUESTO I
        ON I.ID_SJTO = S.ID_SJTO
       AND I.ID_IMPSTO = 230011
     WHERE J.ID_ACTO_TPO = 26
       AND TO_CHAR(J.FCHA_ACTO, 'YYYYMMDD') = '20190510'
       and j.nmro_acto > 0
       and J.ID_ACTO is not null
     order by TO_NUMBER(j.nmro_acto);*/

begin
  FOR R1 IN C1 LOOP
    jl_cargar_blob_acto(p_id_acto => r1.id_acto,
                        p_fle_nme => r1.nmbre_archvo,
                        p_drctrio => 'DIR_DETERMINACIONES');

    COMMIT;
  END LOOP;
end TEMP_CARGAR_BLOB_MASIVO;
/

