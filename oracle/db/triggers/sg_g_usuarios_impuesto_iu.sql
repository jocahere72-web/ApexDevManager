
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_USUARIOS_IMPUESTO_IU"
	for insert or update on sg_g_usuarios_impuesto
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_usrio_impsto is null then
				select nvl( max(id_usrio_impsto), 0 ) + 1  into d
				from sg_g_usuarios_impuesto;
				:new.id_usrio_impsto := d;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "SG_G_USUARIOS_IMPUESTO_IU" ENABLE;

