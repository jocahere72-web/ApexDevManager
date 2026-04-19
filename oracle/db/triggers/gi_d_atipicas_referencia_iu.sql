
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_ATIPICAS_REFERENCIA_IU"
	for insert or update on gi_d_atipicas_referencia

compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.id_atpca_rfrncia is null then

				select nvl(max(id_atpca_rfrncia)+1, 1)
				  into d
				  from gi_d_atipicas_referencia;
				:new.id_atpca_rfrncia := d;

			end if;
		end if;
	end before each row;

end;








/
ALTER TRIGGER "GI_D_ATIPICAS_REFERENCIA_IU" ENABLE;

