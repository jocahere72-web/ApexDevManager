
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_D_NVDDES_PRSNA_ADJNTO_TP_IU"
    for insert or update on si_d_nvddes_prsna_adjnto_tp
    compound trigger

    before each row is
    begin
        if inserting then
            :new.id_nvdad_prsna_adjnto_tpo    := sq_si_d_nvddes_prsna_adjnto_tp.nextval;
            :new.user_dgta := user;
            :new.fcha_dgta := systimestamp;
        elsif updating then
            :new.user_mdfca := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
            :new.fcha_mdfca := systimestamp;
        end if;
    end before each row;
end;




/
ALTER TRIGGER "SI_D_NVDDES_PRSNA_ADJNTO_TP_IU" ENABLE;

