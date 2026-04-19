
  CREATE OR REPLACE EDITIONABLE TRIGGER "GJ_D_ACCIONES_IU"
  for insert or update on gj_d_acciones
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_accion is null then
  			d := sq_gj_d_acciones.nextval();
  			:new.id_accion := d;
  		end if;
  	end if;
  end before each row;
end gj_d_acciones_iu;


/
ALTER TRIGGER "GJ_D_ACCIONES_IU" ENABLE;

