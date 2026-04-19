
  CREATE OR REPLACE EDITIONABLE TRIGGER "EBA_GI_FLEX_REGISTRY_BIU"
    before insert or update on eba_gi_flex_registry
    for each row
begin


    if inserting and :new.id is null then
        :new.id := eba_gi.gen_id();
    end if;
    if inserting and :new.row_key is null then
        declare
            l_next_seq_val number;
        begin
           select eba_gi_seq.nextval into l_next_seq_val from dual;
           :new.row_key := eba_gi_fw.compress_int(l_next_seq_val);
        end;
    end if;
    if inserting then
        :new.row_version_number := 1;
        :new.created_by := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
        :new.created := localtimestamp;
    end if;
    if updating then
        :new.row_version_number := nvl(:old.row_version_number,1) + 1;
    end if;
    :new.updated_by := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
    :new.updated := localtimestamp;
end;









/
ALTER TRIGGER "EBA_GI_FLEX_REGISTRY_BIU" ENABLE;

