
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_TITULOS_JUDICIAL_REVERSA_IU"
  for insert on gf_g_titulos_judicial_reversa
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_ttlo_jdcial_rvrsa is null then
        :new.id_ttlo_jdcial_rvrsa := SQ_GF_G_TITULOS_JDCIAL_RVRSA.nextval;
      end if;
    end if;
  end before each row;
end;
/
ALTER TRIGGER "GF_G_TITULOS_JUDICIAL_REVERSA_IU" ENABLE;

