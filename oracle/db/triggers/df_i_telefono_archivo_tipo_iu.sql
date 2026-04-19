
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_TELEFONO_ARCHIVO_TIPO_IU"
	for insert on df_i_telefono_archivo_tipo
	compound trigger
	d number;

		before each row is
		begin
			if inserting then
				if :new.id_telefono_archvo_tpo is null then
					d	:= sq_df_i_telefono_archivo_tipo.nextval();
					:new.id_telefono_archvo_tpo := d;
				end if;
			end if;
		end before each row;
	end;


/
ALTER TRIGGER "DF_I_TELEFONO_ARCHIVO_TIPO_IU" ENABLE;

