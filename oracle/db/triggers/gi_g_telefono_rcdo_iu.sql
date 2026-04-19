
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_TELEFONO_RCDO_IU"
	for insert or update on GI_G_TELEFONO_RECAUDO
	compound  trigger
	before each row is
		begin
			if inserting then
				if :new.ID_TLFNO_RCDO is null then
					:new.ID_TLFNO_RCDO := SQ_GI_G_TLFNO_RCDO.nextval;
				end if;
				:new.user_dgta := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
				:new.fcha_dgta := systimestamp;
			elsif updating then
				:new.user_mdfca := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
				:new.fcha_mdfca := systimestamp;
		end if;
		end before each row;
	end;


/
ALTER TRIGGER "GI_G_TELEFONO_RCDO_IU" ENABLE;

