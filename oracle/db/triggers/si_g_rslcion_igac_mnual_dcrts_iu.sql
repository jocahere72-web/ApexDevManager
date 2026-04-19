
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_G_RSLCION_IGAC_MNUAL_DCRTS_IU"
for insert or update on si_g_rslcion_igac_mnual_dcrts
compound trigger
d number;
    before each row is
    begin
        if inserting then
            if :new.id_rslcion_igac_mnual_dcrts is null then
                d := sq_si_g_rslcion_igac_mnual_dcrts.nextval;
        :new.id_rslcion_igac_mnual_dcrts := d;
            end if;
        end if;
    end before each row;
end;




/
ALTER TRIGGER "SI_G_RSLCION_IGAC_MNUAL_DCRTS_IU" ENABLE;

