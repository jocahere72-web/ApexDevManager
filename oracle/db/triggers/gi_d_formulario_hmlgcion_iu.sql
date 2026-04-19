
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_FORMULARIO_HMLGCION_IU"
    for insert or update on gi_d_formulario_hmlgcion
        compound trigger

        d number;

        before each row is
        begin
            if inserting then
                if :new.id_frmlrio_hmlgcion is null then

                    d := sq_gi_d_formulario_hmlgcion.nextval;
                    :new.id_frmlrio_hmlgcion := d;

                end if;
            end if;
	end before each row;

end;


/
ALTER TRIGGER "GI_D_FORMULARIO_HMLGCION_IU" ENABLE;

