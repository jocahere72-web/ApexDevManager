
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_CONVENIOS_ATRIBUTO_IU"
	for insert or update on gf_d_convenios_atributo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cnvnio_atrbto is null then

				select nvl(max(id_cnvnio_atrbto)+1, 1) into d
				  from gf_d_convenios_atributo;
				:new.id_cnvnio_atrbto := d;

			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GF_D_CONVENIOS_ATRIBUTO_IU" ENABLE;

