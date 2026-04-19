
  CREATE OR REPLACE EDITIONABLE TRIGGER "EBA_GI_FLEX_PAGE_MAP_BIU"
before insert or update on eba_gi_flex_page_map
for each row
begin
	if inserting and :new.id is null then
		:new.id := eba_gi.gen_id();
	end if;
	if inserting then
		:new.created_by := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
		:new.created := localtimestamp;
	end if;
	:new.updated_by := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
	:new.updated := localtimestamp;
end;









/
ALTER TRIGGER "EBA_GI_FLEX_PAGE_MAP_BIU" ENABLE;

