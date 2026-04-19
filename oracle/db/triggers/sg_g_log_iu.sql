
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_LOG_IU"
	for insert on genesys.sg_g_log
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_log is null then
				d := sq_sg_g_log.nextval;

                :new.id_log := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "SG_G_LOG_IU" ENABLE;

