
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_USUARIOS_SUBIMPUESTO_IU"
	for insert or update on sg_g_usuarios_subimpuesto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_usrio_sbmpsto is null then
				:new.id_usrio_sbmpsto := sq_sg_g_usuarios_subimpuesto.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "SG_G_USUARIOS_SUBIMPUESTO_IU" ENABLE;

