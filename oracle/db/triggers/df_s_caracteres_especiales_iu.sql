
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_CARACTERES_ESPECIALES_IU" FOR
    INSERT OR UPDATE ON df_s_caracteres_especiales
COMPOUND TRIGGER
    d NUMBER;
    BEFORE EACH ROW IS BEGIN
        IF inserting THEN
            IF :new.id_crctre_espcles IS NULL THEN
                SELECT
                    nvl(MAX(id_crctre_espcles) + 1, 1)
                INTO d
                FROM
                    df_s_caracteres_especiales;

                :new.id_crctre_espcles := d;
            END IF;

        END IF;
    END BEFORE EACH ROW;
END;




/
ALTER TRIGGER "DF_S_CARACTERES_ESPECIALES_IU" ENABLE;

