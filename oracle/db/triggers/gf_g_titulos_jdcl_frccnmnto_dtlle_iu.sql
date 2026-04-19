
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_TITULOS_JDCL_FRCCNMNTO_DTLLE_IU"
  for insert on GF_G_TITULOS_JDCL_FRCCNMNTO_DTLLE
  compound trigger
    before each row is
        begin
            if inserting then
                if :new.id_ttlo_jdcial_frccn_dtlle is null then
                    :new.id_ttlo_jdcial_frccn_dtlle := SQ_GF_G_TITULOS_JDCL_FRCCNMNTO_DTLLE.nextval;
                end if;
            end if;
        end before each row;
    end;
/
ALTER TRIGGER "GF_G_TITULOS_JDCL_FRCCNMNTO_DTLLE_IU" ENABLE;

