
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_G_SLCTDS_PERMISOS_ASOCIADO_IU"
    for insert or update on si_g_slctds_permisos_asociado
    compound trigger
    d number;

    before each row is
    begin
        if inserting then
            if  :new.id_slctud_prmsos is null then
                :new.id_slctud_prmsos := sq_si_g_slctds_permiso_asociado.nextval;
            end if;
        end if;
    end before each row;
end;


/
ALTER TRIGGER "SI_G_SLCTDS_PERMISOS_ASOCIADO_IU" ENABLE;

