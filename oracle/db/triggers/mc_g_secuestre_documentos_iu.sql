
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_SECUESTRE_DOCUMENTOS_IU"
	for insert or update on mc_g_secuestre_documentos
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_scstre_dcmnto is null then

				select nvl(max(id_scstre_dcmnto)+1, 1) into d
				  from mc_g_secuestre_documentos;
				:new.id_scstre_dcmnto := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_G_SECUESTRE_DOCUMENTOS_IU" ENABLE;

