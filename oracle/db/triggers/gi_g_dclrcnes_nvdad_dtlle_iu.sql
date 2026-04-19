
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DCLRCNES_NVDAD_DTLLE_IU"
    for insert or update on gi_g_dclrcnes_nvdad_dtlle
    compound trigger
    d number;

        before each row is
        begin
            if inserting then
                if :new.id_nvdad_dtlle is null then
                    d := sq_gi_g_dclrcnes_nvdad_dtlle.nextval();
                    :new.id_nvdad_dtlle := d;
                end if;
            end if;
        end before each row;
end;


/
ALTER TRIGGER "GI_G_DCLRCNES_NVDAD_DTLLE_IU" ENABLE;

