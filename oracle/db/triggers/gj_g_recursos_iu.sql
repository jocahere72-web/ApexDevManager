
  CREATE OR REPLACE EDITIONABLE TRIGGER "GJ_G_RECURSOS_IU"
  for insert or update on gj_g_recursos
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_rcrso is null then
  			d := sq_gj_g_recursos.nextval();
  			:new.id_rcrso := d;
  		end if;
  	end if;
  end before each row;
end gj_g_recursos_iu;


/
ALTER TRIGGER "GJ_G_RECURSOS_IU" ENABLE;

