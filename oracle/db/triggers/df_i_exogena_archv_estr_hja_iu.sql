
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_EXOGENA_ARCHV_ESTR_HJA_IU"
	for insert on df_i_exogena_archv_estr_hja
	compound trigger
	d number;

		before each row is
		begin
			if inserting then
				if :new.id_exgna_archv_est_hja is null then
					d	:= sq_df_i_exogena_archv_estr_hja.nextval();
					:new.id_exgna_archv_est_hja := d;
				end if;
			end if;
		end before each row;
	end;


/
ALTER TRIGGER "DF_I_EXOGENA_ARCHV_ESTR_HJA_IU" ENABLE;

