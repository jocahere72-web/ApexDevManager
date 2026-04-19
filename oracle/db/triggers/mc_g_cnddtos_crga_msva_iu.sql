
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_CNDDTOS_CRGA_MSVA_IU"
    for insert on mc_g_cnddtos_crga_msva
    compound trigger
    d number;

    before each row is
    begin
        if inserting then
            if :new.id_cnddtos_crga_msva is null then
                d    := sq_mc_g_cnddtos_crga_msva.nextval();
                :new.id_cnddtos_crga_msva := d;
            end if;
        end if;
    end before each row;
end;



/
ALTER TRIGGER "MC_G_CNDDTOS_CRGA_MSVA_IU" ENABLE;

