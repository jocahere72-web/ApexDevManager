
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_D_SECUESTRES_AUXILIAR_IU"
	for insert or update on mc_d_secuestres_auxiliar
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_scstrs_auxlr is null then

				select nvl(max(id_scstrs_auxlr)+1, 1) into d
				  from mc_d_secuestres_auxiliar;
				:new.id_scstrs_auxlr := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_D_SECUESTRES_AUXILIAR_IU" ENABLE;

