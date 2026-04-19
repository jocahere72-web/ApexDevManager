
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_D_CONFIGURACIONES_GNRAL_IU" FOR
    INSERT OR UPDATE ON mc_d_configuraciones_gnral
COMPOUND TRIGGER
    BEFORE EACH ROW IS BEGIN
        IF inserting THEN
            IF :new.id_cnfgrcion_gnral IS NULL THEN
                :new.id_cnfgrcion_gnral := sq_mc_d_configuraciones_gnral.nextval;
            END IF;

            :new.user_dgta := user;
            :new.fcha_dgta := systimestamp;
        ELSIF updating THEN
            :new.user_mdfca := coalesce(sys_context('APEX$SESSION', 'app_user'), regexp_substr(sys_context('userenv', 'client_identifier'
            ), '^[^:]*'), sys_context('userenv', 'session_user'));

            :new.fcha_mdfca := systimestamp;
        END IF;
    END BEFORE EACH ROW;
END;




/
ALTER TRIGGER "MC_D_CONFIGURACIONES_GNRAL_IU" ENABLE;

