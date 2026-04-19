
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_TITULOS_JUDICIAL_RSGNDOS_IU"
  for insert or update on GF_G_TITULOS_JUDICIAL_RSGNDOS
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.ID_TTLO_JDCIAL_RSGNDO is null then
        :new.ID_TTLO_JDCIAL_RSGNDO := sq_gf_g_titulos_judicial_rsgndos.nextval;
      end if;
    end if;
  end before each row;
end;


/
ALTER TRIGGER "GF_G_TITULOS_JUDICIAL_RSGNDOS_IU" ENABLE;

