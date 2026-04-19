
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_ENTIDADES_NOVEDAD_IU"
	for insert or update on df_i_entidades_novedad
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_entdad_nvdad is null then

				select nvl( max(id_entdad_nvdad) , 0 ) + 1
				  into d
				  from df_i_entidades_novedad;
				:new.id_entdad_nvdad := d;

			end if;
		end if;
	end before each row;
end;








/
ALTER TRIGGER "DF_I_ENTIDADES_NOVEDAD_IU" ENABLE;

