
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_C_TERCEROS_IU"
	for insert or update on si_c_terceros
	compound trigger
	d number;
  x varchar2(100);
	v_idntfccion number;

	before each row is
	begin
    select regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*') into x from dual;
		if inserting then
            :new.usrio_dgta := coalesce( sys_context('APEX$SESSION','app_user'), x , sys_context('userenv','session_user') );
            :new.fcha_dgta  := systimestamp;

			if :new.id_trcro is null then
				d := sq_si_c_terceros.nextval;
				:new.id_trcro := d;
			end if;

        elsif updating then
            :new.usrio_mdfca := coalesce( sys_context('APEX$SESSION','app_user'), x , sys_context('userenv','session_user') );
            :new.fcha_mdfca  := systimestamp;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "SI_C_TERCEROS_IU" ENABLE;

