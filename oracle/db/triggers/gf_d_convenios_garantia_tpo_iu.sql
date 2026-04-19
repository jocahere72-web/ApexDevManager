
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_CONVENIOS_GARANTIA_TPO_IU"
	for insert or update on "GF_D_CONVENIOS_TIPO_GRNTIA"
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cnvnio_grntia_tpo is null then

				select nvl(max(id_cnvnio_grntia_tpo)+1, 1) into d
				  from GF_D_CONVENIOS_TIPO_GRNTIA;
				:new.id_cnvnio_grntia_tpo := d;

			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GF_D_CONVENIOS_GARANTIA_TPO_IU" ENABLE;

