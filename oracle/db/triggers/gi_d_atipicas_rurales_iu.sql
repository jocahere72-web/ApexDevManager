
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_ATIPICAS_RURALES_IU"
	for insert or update on gi_d_atipicas_rurales

compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.id_atpca_rrles is null then

				select nvl(max(id_atpca_rrles)+1, 1)
				  into d
				  from gi_d_atipicas_rurales;
				:new.id_atpca_rrles := d;

			end if;
		end if;
	end before each row;

end;








/
ALTER TRIGGER "GI_D_ATIPICAS_RURALES_IU" ENABLE;

