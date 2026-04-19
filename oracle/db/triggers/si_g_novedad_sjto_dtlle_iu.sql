
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_G_NOVEDAD_SJTO_DTLLE_IU"
    for insert or update on si_g_novedad_sjto_dtlle
    compound trigger
    d number;

    before each row is
    begin
        if inserting then
            if  :new.id_nvdad_dtlle is null then
                :new.id_nvdad_dtlle := sq_si_g_novedad_sjto_dtlle.nextval;
            end if;
        end if;
    end before each row;
end;


/
ALTER TRIGGER "SI_G_NOVEDAD_SJTO_DTLLE_IU" ENABLE;

