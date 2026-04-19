
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_CONVENIOS_TIPO_CNDCION_IU"
	for insert or update on gf_d_convenios_tipo_cndcion
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cnvnio_tpo_cndcion is null then

				select nvl(max(id_cnvnio_tpo_cndcion)+1, 1) into d
				  from gf_d_convenios_tipo_cndcion;
				:new.id_cnvnio_tpo_cndcion := d;

			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GF_D_CONVENIOS_TIPO_CNDCION_IU" ENABLE;

