
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_DESEMBARGOS_DTLLE_LTE_IU" FOR
    INSERT OR UPDATE ON mc_g_desembargos_dtlle_lte
COMPOUND TRIGGER
    BEFORE EACH ROW IS BEGIN
        IF inserting THEN
            IF :new.id_dsmbrgo_dtlle_lte IS NULL THEN
                :new.id_dsmbrgo_dtlle_lte := sq_mc_g_desembargos_dtlle_lte.nextval;
            END IF;

        END IF;
    END BEFORE EACH ROW;
END;




/
ALTER TRIGGER "MC_G_DESEMBARGOS_DTLLE_LTE_IU" ENABLE;

