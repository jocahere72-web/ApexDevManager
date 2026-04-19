
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_D_SECUESTRES_IU"
	for insert or update on mc_d_secuestres
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_scstre is null then

				select nvl(max(id_scstre)+1, 1) into d
				  from mc_d_secuestres;
				:new.id_scstre := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_D_SECUESTRES_IU" ENABLE;

