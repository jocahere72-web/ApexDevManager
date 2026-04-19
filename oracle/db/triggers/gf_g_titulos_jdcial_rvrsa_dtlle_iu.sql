
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_TITULOS_JDCIAL_RVRSA_DTLLE_IU"
  for insert on GF_G_TITULOS_JDCIAL_RVRSA_DTLLE
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_ttlo_jdcial_rvrsa_dtlle is null then
        :new.id_ttlo_jdcial_rvrsa_dtlle := SQ_GF_G_TITULOS_JDCIAL_RVRSA_DTLLE.nextval;
      end if;
    end if;
  end before each row;
end;
/
ALTER TRIGGER "GF_G_TITULOS_JDCIAL_RVRSA_DTLLE_IU" ENABLE;

