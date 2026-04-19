
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_D_ACTOS_REVISION_IU"
	for insert or update on fi_d_actos_revision
		compound trigger
		d number;

		before each row is
		begin
		if inserting then
			if :new.id_acto_rvsion is null then
				d := sq_fi_d_actos_revision.nextval();
				:new.id_acto_rvsion := d;
			end if;
		end if;
	end before each row;
end;




/
ALTER TRIGGER "FI_D_ACTOS_REVISION_IU" ENABLE;

