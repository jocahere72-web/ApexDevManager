
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_G_SLCTD_ASOCIADO_DETALLE_IU"
    for insert or update on si_g_slctd_asociado_detalle
    compound trigger
    d number;

    before each row is
    begin
        if inserting then
            if  :new.id_slctd_ascdo_dtlle is null then
                :new.id_slctd_ascdo_dtlle := sq_si_g_slctd_asociado_detalle.nextval;
            end if;
        end if;
    end before each row;
end;


/
ALTER TRIGGER "SI_G_SLCTD_ASOCIADO_DETALLE_IU" ENABLE;

