
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_ACTOS_ADJUNTO_TP_IU"
	for insert or update on gi_d_actos_adjunto_tp
	compound trigger

	before each row is
	begin
		if inserting then
			:new.id_acto_adjnto_tpo	:= sq_gi_d_actos_adjunto_tp.nextval;
			:new.user_dgta := user;
			:new.fcha_dgta := systimestamp;
		elsif updating then
			:new.user_mdfca := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
			:new.fcha_mdfca := systimestamp;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "GI_D_ACTOS_ADJUNTO_TP_IU" ENABLE;

