
  CREATE OR REPLACE EDITIONABLE TRIGGER "CS_G_CONSULTAS_MAESTRO_IU"
	for insert or update on cs_g_consultas_maestro
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cnslta_mstro is null then
				select nvl( max(id_cnslta_mstro), 0 ) + 1  into d
				from cs_g_consultas_maestro;
				:new.id_cnslta_mstro := d;
			end if;
            :new.usrnme_dgta := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') );
			:new.fcha_dgta := systimestamp;
		end if;
		if updating then
			:new.usrnme_mdfca := coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user'));
			:new.fcha_mdfca := systimestamp;
		end if;
	end before each row;
end cs_g_consultas_maestro_iu;









/
ALTER TRIGGER "CS_G_CONSULTAS_MAESTRO_IU" ENABLE;

