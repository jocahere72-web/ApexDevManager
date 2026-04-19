
  CREATE OR REPLACE EDITIONABLE TRIGGER "GJ_D_PARAMETROS_IU"
  for insert or update on gj_d_parametros
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_prmtro is null then
  			d := sq_gj_d_parametros.nextval();
  			:new.id_prmtro := d;
  		end if;
  	end if;
  end before each row;
end gj_d_parametros_iu;


/
ALTER TRIGGER "GJ_D_PARAMETROS_IU" ENABLE;

