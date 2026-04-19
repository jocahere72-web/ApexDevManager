
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_D_FUENTE_TPO_BSE_SANCION_IU"
    for insert or update on fi_d_fuente_tpo_bse_sancion
    compound trigger
    d number;

        before each row is
        begin
            if inserting then
                if :new.id_fuente_tipo_base is null then
                    d := sq_fi_d_fuente_tpo_bse_sancion.nextval();
                    :new.id_fuente_tipo_base := d;
                end if;
            end if;
        end before each row;
 end;




/
ALTER TRIGGER "FI_D_FUENTE_TPO_BSE_SANCION_IU" ENABLE;

