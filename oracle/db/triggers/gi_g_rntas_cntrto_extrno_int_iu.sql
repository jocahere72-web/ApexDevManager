
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_RNTAS_CNTRTO_EXTRNO_INT_IU"
	for insert  on gi_g_rntas_cntrto_extrno_int
	compound  trigger

	before each row is
		begin
			if inserting then
				if :new.id_rnta_cntrto_extrno_int is null then
					:new.id_rnta_cntrto_extrno_int := sq_gi_g_rntas_cntrto_extrno_int.nextval;
				end if;
			end if;
		end before each row;
	end;


/
ALTER TRIGGER "GI_G_RNTAS_CNTRTO_EXTRNO_INT_IU" ENABLE;

