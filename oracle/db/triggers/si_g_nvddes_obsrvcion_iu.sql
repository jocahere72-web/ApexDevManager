
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_G_NVDDES_OBSRVCION_IU"
for insert or update on si_g_novedades_observacion
compound trigger
    before each row is
    begin
        if inserting then
            :new.id_nvddes_obsrvcion := sq_si_g_novedades_observacion.nextval;
        end if;
        if updating then
            :new.fcha_ultma_actlzcion := systimestamp;
        end if;
    end before each row;
end;


/
ALTER TRIGGER "SI_G_NVDDES_OBSRVCION_IU" ENABLE;

