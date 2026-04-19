
  CREATE OR REPLACE EDITIONABLE TRIGGER "TI_D_CATEGORIA_DESPLIEGUE_IU"
	for insert or update on ti_d_categoria_despliegue
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_ctgria_dsplgue is null then
				select nvl( max(id_ctgria_dsplgue), 0 ) + 1  into :new.id_ctgria_dsplgue
				from ti_d_categoria_despliegue;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "TI_D_CATEGORIA_DESPLIEGUE_IU" ENABLE;

