
  CREATE OR REPLACE EDITIONABLE TRIGGER "AD_D_TABLAS_AUDITADA_IU"
	for insert or update on ad_d_tablas_auditada
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_tbla_adtda is null then
				select nvl( max(id_tbla_adtda), 0 ) + 1  into d
				from ad_d_tablas_auditada;
				:new.id_tbla_adtda := d;
			end if;
		end if;
	end before each row;
end;









/
ALTER TRIGGER "AD_D_TABLAS_AUDITADA_IU" ENABLE;

