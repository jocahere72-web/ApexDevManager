
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_SUJETOS_ESTADO_IU"
for insert or update on DF_I_SUJETOS_ESTADO compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_SJTO_ESTDO is null then

				select nvl(max(ID_SJTO_ESTDO)+1, 1) into d from DF_I_SUJETOS_ESTADO;
				:new.ID_SJTO_ESTDO := d;

			end if;
		end if;
	end before each row;

end;









/
ALTER TRIGGER "DF_I_SUJETOS_ESTADO_IU" ENABLE;

