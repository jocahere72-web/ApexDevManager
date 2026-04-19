
  CREATE OR REPLACE EDITIONABLE TRIGGER "GJ_G_RECURSOS_VIGENCIA_IU"
  for insert or update on gj_g_recursos_vigencia
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_rcrso_vgncia is null then
  			d := sq_gj_g_recursos_vigencia.nextval();
			:new.id_rcrso_vgncia := d;
  		end if;
  	end if;
  end before each row;
end gj_g_recursos_vigencia_iu;


/
ALTER TRIGGER "GJ_G_RECURSOS_VIGENCIA_IU" ENABLE;

