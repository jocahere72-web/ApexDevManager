
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_SECUENCIAS_TIPO_IU"
	for insert or update on gf_d_secuencias_tipo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_scncia_tpo is null then

				select nvl(max(id_scncia_tpo)+1, 1) into d
				  from gf_d_secuencias_tipo;
				:new.id_scncia_tpo := d;

			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GF_D_SECUENCIAS_TIPO_IU" ENABLE;

