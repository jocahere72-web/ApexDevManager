
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_DSMBRGS_RSLCION_JSON_IU"
    for insert on mc_g_dsmbrgs_rslcion_json
    compound trigger
    d number;

    before each row is
    begin
        if inserting then
            if :new.ID_DSMBRGS_RSLCION_JSON is null then
                d    := sq_mc_g_dsmbrgs_rslcion_json.nextval();
                :new.ID_DSMBRGS_RSLCION_JSON := d;
            end if;
        end if;
    end before each row;
end;



/
ALTER TRIGGER "MC_G_DSMBRGS_RSLCION_JSON_IU" ENABLE;

