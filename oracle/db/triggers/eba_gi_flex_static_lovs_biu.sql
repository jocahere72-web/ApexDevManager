
  CREATE OR REPLACE EDITIONABLE TRIGGER "EBA_GI_FLEX_STATIC_LOVS_BIU"
  before insert or update on eba_gi_flex_static_lovs
  for each row
begin
	if inserting and :new.id is null then
		:new.id := eba_gi.gen_id();
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
ALTER TRIGGER "EBA_GI_FLEX_STATIC_LOVS_BIU" ENABLE;

