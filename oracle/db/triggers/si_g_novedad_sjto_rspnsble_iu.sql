
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_G_NOVEDAD_SJTO_RSPNSBLE_IU"
    for insert or update on si_g_novedad_sjto_rspnsble
    compound trigger
    d number;

    before each row is
    begin
        if inserting then
            if  :new.id_nvdad_sjto is null then
                :new.id_nvdad_sjto := sq_si_g_novedad_sjto_rspnsble.nextval;
            end if;
        end if;
    end before each row;
end;


/
ALTER TRIGGER "SI_G_NOVEDAD_SJTO_RSPNSBLE_IU" ENABLE;

