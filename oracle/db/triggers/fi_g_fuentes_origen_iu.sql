
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_FUENTES_ORIGEN_IU"
    for insert or update on fi_g_fuentes_origen
    compound trigger
    d number;

        before each row is
        begin
            if inserting then
                if :new.id_fuente_origen is null then
                    d := sq_fi_g_fuentes_origen.nextval();
                    :new.id_fuente_origen := d;
                end if;
            end if;
        end before each row;
    end;



/
ALTER TRIGGER "FI_G_FUENTES_ORIGEN_IU" ENABLE;

