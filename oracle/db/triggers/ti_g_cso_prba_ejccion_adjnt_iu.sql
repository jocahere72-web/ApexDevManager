
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_G_CSO_PRBA_EJCCION_ADJNT_IU"
	for insert or update on ti_g_cso_prba_ejccion_adjnt
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_cso_prba_ejccion_adjnt is null then
				:new.id_cso_prba_ejccion_adjnt := sq_ti_g_cso_prba_ejccion_adjnt.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "TI_G_CSO_PRBA_EJCCION_ADJNT_IU" ENABLE;

