
  CREATE OR REPLACE EDITIONABLE TRIGGER "BIU_EBA_DEMO_MD_STATUS"
    before insert or update on eba_demo_md_status
    for each row
begin
    if inserting then
        :new.created    := localtimestamp;
        :new.created_by := nvl(wwv_flow.g_user,user);
    end if;
    :new.cd         := upper(:new.cd);
    :new.updated    := localtimestamp;
    :new.updated_by := nvl(wwv_flow.g_user,user);
end;










/
ALTER TRIGGER "BIU_EBA_DEMO_MD_STATUS" ENABLE;

