
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_D_FISCA_ARCHIVO_TIPO_IU"
	for insert or update on fi_d_fisca_archivo_tipo
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_fisca_archvo_tpo is null then
				d := sq_fi_d_fisca_archivo_tipo.nextval();
				:new.id_fisca_archvo_tpo := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_D_FISCA_ARCHIVO_TIPO_IU" ENABLE;

