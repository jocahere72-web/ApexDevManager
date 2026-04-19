
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_DFNCNES_CLNTE_CTGRIA_IU"
	for insert or update on df_c_definiciones_clnte_ctgria
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_dfncion_clnte_ctgria is null then
				select nvl( max(to_number(id_dfncion_clnte_ctgria)), 0 ) + 1  into d
				from df_c_definiciones_clnte_ctgria;
				:new.id_dfncion_clnte_ctgria := d;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "DF_C_DFNCNES_CLNTE_CTGRIA_IU" ENABLE;

