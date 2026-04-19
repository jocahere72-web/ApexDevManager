
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_RNTAS_USRIO_SN_ATRZCN_IU"
	for insert or update on gi_g_rntas_usrio_sn_atrzcn
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_usrio_rnta_sn_atrzcion is null then
				:new.id_usrio_rnta_sn_atrzcion := sq_gi_g_rntas_usrio_sn_atrzcn.nextval;
			end if;
			:new.user_dgta := user;
			:new.fcha_dgta := systimestamp;
		elsif updating then
			:new.user_mdfca := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
			:new.fcha_mdfca := systimestamp;
		end if;
	end before each row;
end;






/
ALTER TRIGGER "GI_G_RNTAS_USRIO_SN_ATRZCN_IU" ENABLE;

