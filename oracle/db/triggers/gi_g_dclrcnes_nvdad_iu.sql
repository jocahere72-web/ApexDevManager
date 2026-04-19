
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DCLRCNES_NVDAD_IU"
    for insert or update on gi_g_dclrcnes_nvdad
    compound trigger
    d number;

        before each row is
        begin
            if inserting then
                if :new.id_nvdad is null then
                    d := sq_gi_g_dclrcnes_nvdad.nextval();
                    :new.id_nvdad := d;
                end if;
                :new.user_dgta := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user'));
                :new.fcha_dgta := systimestamp;
            end if;
            if updating then
                :new.user_mdfca := coalesce(sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user'));
                :new.fcha_mdfca := systimestamp;
            end if;
        end before each row;
end;


/
ALTER TRIGGER "GI_G_DCLRCNES_NVDAD_IU" ENABLE;

