
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_LOG_ERROR_IU"
	for insert on sg_g_log_error
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_log_error is null then
				d := sq_sg_g_log_error.nextval;
				:new.id_log_error := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "SG_G_LOG_ERROR_IU" ENABLE;

