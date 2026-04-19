
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_D_CONFIGURACIONES_GNRAL_IU" for
insert or update on RE_d_configuraciones_gnral
compound trigger
d number;
before each row is
begin
	if inserting then
		if ( :new.id_cnfgrcion_gnral is null ) then
			d := sq_re_d_configuraciones_gnral.nextval;
			:new.id_cnfgrcion_gnral := d;
		end if;
				:new.user_dgta := user;
				:new.fcha_dgta := systimestamp;
	elsif updating then
		:new.user_mdfca := coalesce(sys_context('apex$session', 'app_user'), regexp_substr(sys_context('userenv', 'client_identifier'
		), '^[^:]*'), sys_context('userenv', 'session_user'));

		:new.fcha_mdfca := systimestamp;
	end if;
end before each row;
end;





/
ALTER TRIGGER "RE_D_CONFIGURACIONES_GNRAL_IU" ENABLE;

