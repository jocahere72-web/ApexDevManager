
  CREATE OR REPLACE EDITIONABLE TRIGGER "GJ_G_RECURSOS_ACCION_IU"
  for insert or update on gj_g_recursos_accion
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_rcrso_accion is null then
  			d := sq_gj_g_recursos_accion.nextval();
  			:new.id_rcrso_accion := d;
  		end if;
  	end if;
  end before each row;
end gj_g_recursos_accion_iu;


/
ALTER TRIGGER "GJ_G_RECURSOS_ACCION_IU" ENABLE;

