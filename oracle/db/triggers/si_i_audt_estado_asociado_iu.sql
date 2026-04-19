
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_I_AUDT_ESTADO_ASOCIADO_IU"
    for insert or update on si_i_audt_estado_asociado
    compound trigger
    d number;

    before each row is
    begin
        if inserting then
            if  :new.id_audt_estdo is null then
                :new.id_audt_estdo := sq_si_i_audt_estad_asociado.nextval;
            end if;
        end if;
    end before each row;
end;


/
ALTER TRIGGER "SI_I_AUDT_ESTADO_ASOCIADO_IU" ENABLE;

