
  CREATE OR REPLACE EDITIONABLE TRIGGER "MA_D_PROVEEDORES_ENVIO_IU"
  for insert or update on ma_d_proveedores_envio
  compound  trigger
  before each row is
    begin
      if inserting then
        if :new.id_prvdres_envio is null then
          :new.id_prvdres_envio := sq_ma_d_proveedores_envio.nextval;
        end if;
      end if;
    end before each row;
  end;



/
ALTER TRIGGER "MA_D_PROVEEDORES_ENVIO_IU" ENABLE;

