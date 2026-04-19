
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_I_SUJETOS_ASOCIADOS_IU"
    for insert or update on si_i_sujetos_asociados
    compound trigger
    d number;

    before each row is
    begin
        if inserting then
            if  :new.id_sjto_ascdo is null then
                :new.id_sjto_ascdo := sq_si_i_sujetos_asociados.nextval;
            end if;
        end if;
    end before each row;
end;


/
ALTER TRIGGER "SI_I_SUJETOS_ASOCIADOS_IU" ENABLE;

