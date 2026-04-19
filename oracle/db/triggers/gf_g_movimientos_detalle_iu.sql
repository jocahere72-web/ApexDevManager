
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_MOVIMIENTOS_DETALLE_IU"
for insert or update on gf_g_movimientos_detalle
compound trigger
d number;

    before each row is
    begin
        if inserting then
            if :new.id_mvmnto_dtlle is null then
                :new.id_mvmnto_dtlle := sq_gf_g_movimientos_detalle.nextval;
            end if;
        end if;
    end before each row;
end;




/
ALTER TRIGGER "GF_G_MOVIMIENTOS_DETALLE_IU" ENABLE;

