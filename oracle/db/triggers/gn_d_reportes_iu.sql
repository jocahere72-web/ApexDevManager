
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_REPORTES_IU"
	for insert or update on gn_d_reportes
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_rprte is null then
				select nvl( max(id_rprte), 0 ) + 1  into d
				from gn_d_reportes;
				:new.id_rprte := d;
			end if;
		end if;

        if updating then
            if( :new.indcdor_gnrco = 'S' or :new.actvo = 'N' ) then
                delete gn_d_reporte_cliente
                 where id_rprte = :new.id_rprte;
            end if;
        end if;

	end before each row;
end;







/
ALTER TRIGGER "GN_D_REPORTES_IU" ENABLE;

