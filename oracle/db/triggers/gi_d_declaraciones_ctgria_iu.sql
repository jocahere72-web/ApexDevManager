
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DECLARACIONES_CTGRIA_IU"
	for insert or update on gi_d_declaraciones_categoria
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dclrcion_ctgria is null then

				select nvl(max(id_dclrcion_ctgria)+1, 1) into d from gi_d_declaraciones_categoria;
				:new.id_dclrcion_ctgria := d;

			end if;
		end if;
	end before each row;
end;









/
ALTER TRIGGER "GI_D_DECLARACIONES_CTGRIA_IU" ENABLE;

