
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_CONVENIOS_DOCUMENTOS_IU"
	for insert or update on gf_g_convenios_documentos
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_cnvnio_dcmnto is null then

				d := sq_gf_g_convenios_documentos.nextval;
				:new.id_cnvnio_dcmnto := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "GF_G_CONVENIOS_DOCUMENTOS_IU" ENABLE;

