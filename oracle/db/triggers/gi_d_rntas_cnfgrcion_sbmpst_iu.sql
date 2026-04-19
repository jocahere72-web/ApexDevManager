
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_RNTAS_CNFGRCION_SBMPST_IU"
    for insert or update on gi_d_rntas_cnfgrcion_sbmpst
    compound trigger

    before each row is
    begin
        if inserting then
            :new.id_rnta_cnfgrcion_sbmpsto  := sq_gi_d_rntas_cnfgrcion_sbmpst.nextval;
            :new.user_dgta                     := user;
            :new.fcha_dgta                     := systimestamp;
        elsif updating then
            :new.user_mdfca := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
            :new.fcha_mdfca := systimestamp;
        end if;
    end before each row;
end;




/
ALTER TRIGGER "GI_D_RNTAS_CNFGRCION_SBMPST_IU" ENABLE;

