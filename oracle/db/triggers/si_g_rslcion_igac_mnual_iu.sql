
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_G_RSLCION_IGAC_MNUAL_IU"
for insert or update on si_g_rslcion_igac_mnual
compound trigger
d number;
    before each row is
    begin
        if inserting then
            if :new.ID_RSLCION_IGAC_MNUAL is null then
                d := sq_si_g_rslcion_igac_mnual.nextval;
        :new.ID_RSLCION_IGAC_MNUAL := d;
            end if;
        end if;
    end before each row;
end;




/
ALTER TRIGGER "SI_G_RSLCION_IGAC_MNUAL_IU" ENABLE;

