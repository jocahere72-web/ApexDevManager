
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_REPORTES_X_USUARIOS_UI"
	for insert or update on gn_d_reportes_x_usuarios compound trigger

	d 		number;

	before each row is
	begin
		if inserting then
			if :new.id_rprte_x_usrio is null then

				select nvl(max(id_rprte_x_usrio)+1, 1) into d from gn_d_reportes_x_usuarios;
				:new.id_rprte_x_usrio := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "GN_D_REPORTES_X_USUARIOS_UI" ENABLE;

