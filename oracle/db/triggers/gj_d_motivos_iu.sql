
  CREATE OR REPLACE EDITIONABLE TRIGGER "GJ_D_MOTIVOS_IU"
  for insert or update on gj_d_motivos
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_mtvo is null then
  			d := sq_gj_d_motivos.nextval();
  			:new.id_mtvo := d;
  		end if;
  	end if;
  end before each row;
end gj_d_motivos_iu;


/
ALTER TRIGGER "GJ_D_MOTIVOS_IU" ENABLE;

