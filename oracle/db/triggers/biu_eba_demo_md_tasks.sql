
  CREATE OR REPLACE EDITIONABLE TRIGGER "BIU_EBA_DEMO_MD_TASKS"
    before insert or update on eba_demo_md_tasks
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then
        :new.created    := localtimestamp;
        :new.created_by := nvl(wwv_flow.g_user,user);
    end if;
    :new.updated    := localtimestamp;
    :new.updated_by := nvl(wwv_flow.g_user,user);
end;










/
ALTER TRIGGER "BIU_EBA_DEMO_MD_TASKS" ENABLE;

