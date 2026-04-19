
  CREATE OR REPLACE EDITIONABLE TRIGGER "GJ_D_RECURSOS_AJUSTE_MOTIVO_IU"
  for insert or update on gj_d_recursos_ajuste_motivo
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_rcrso_ajste_mtvo is null then
  			d := sq_gj_d_recursos_ajuste_motivo.nextval();
  			:new.id_rcrso_ajste_mtvo := d;
  		end if;
  	end if;
  end before each row;
end gj_d_recursos_ajuste_motivo_iu;


/
ALTER TRIGGER "GJ_D_RECURSOS_AJUSTE_MOTIVO_IU" ENABLE;

