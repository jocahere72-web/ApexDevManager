
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_D_PARAMETROS_DESEMBARGO_IU"
	for insert or update on mc_d_parametros_desembargo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_prmtros_dsmbrgo is null then

				select nvl(max(id_prmtros_dsmbrgo)+1, 1) into d
				  from mc_d_parametros_desembargo;
				:new.id_prmtros_dsmbrgo := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_D_PARAMETROS_DESEMBARGO_IU" ENABLE;

