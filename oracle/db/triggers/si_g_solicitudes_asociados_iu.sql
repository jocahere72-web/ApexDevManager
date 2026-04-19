
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_G_SOLICITUDES_ASOCIADOS_IU"
    for insert or update on si_g_solicitudes_asociados
    compound trigger
    d number;

    before each row is
    begin
        if inserting then
            if  :new.id_slctud_ascdo is null then
                :new.id_slctud_ascdo := sq_si_g_solicitudes_asociados.nextval;
            end if;
        end if;
    end before each row;
end;


/
ALTER TRIGGER "SI_G_SOLICITUDES_ASOCIADOS_IU" ENABLE;

