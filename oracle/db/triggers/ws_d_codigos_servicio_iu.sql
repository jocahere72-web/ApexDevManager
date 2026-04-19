
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_D_CODIGOS_SERVICIO_IU"
  for insert on ws_d_codigos_servicio
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_cdgo_srvcio is null then

        d := sq_ws_d_codigos_servicio.nextval;

        :new.id_cdgo_srvcio := d;

      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "WS_D_CODIGOS_SERVICIO_IU" ENABLE;

