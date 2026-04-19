
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_GARANTIAS_TIPO_IU"
	for insert or update on gf_d_garantias_tipo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_grntia_tpo is null then

				select nvl(max(id_grntia_tpo)+1, 1) into d
				  from gf_d_garantias_tipo;
				:new.id_grntia_tpo := d;

			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GF_D_GARANTIAS_TIPO_IU" ENABLE;

