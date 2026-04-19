
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_EXOGENA_ARCHV_ESTRCTRA_IU"
	for insert on df_i_exogena_archv_estrctra
	compound trigger
	d number;

		before each row is
		begin
			if inserting then
				if :new.id_exgna_archv_est is null then
					d	:= sq_df_i_exogena_archv_estrctra.nextval();
					:new.id_exgna_archv_est := d;
				end if;
			end if;
		end before each row;
	end;


/
ALTER TRIGGER "DF_I_EXOGENA_ARCHV_ESTRCTRA_IU" ENABLE;

