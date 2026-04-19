
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_EMBRGO_CNDDTOS_NO_CRGDOS_IU"
    for insert or update on mc_g_embrgo_cnddtos_no_crgdos
    compound trigger
    d number;

        before each row is
        begin
            if inserting then
                if :new.ID_EMBRGO_CNDDTO_NO_CRGDOS is null then
                    d := sq_mc_g_embrgo_cnddtos_no_crgdos.nextval();
                    :new.ID_EMBRGO_CNDDTO_NO_CRGDOS := d;
                end if;
            end if;
        end before each row;
end;



/
ALTER TRIGGER "MC_G_EMBRGO_CNDDTOS_NO_CRGDOS_IU" ENABLE;

