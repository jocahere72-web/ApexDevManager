
  CREATE OR REPLACE EDITIONABLE TRIGGER "MA_G_ENVIOS_MEDIO_RESPUESTA_IU"
  for insert or update on ma_g_envios_medio_respuesta
  compound  trigger
  before each row is
    begin
      if inserting then
        if :new.id_envio_mdio_rspsta is null then
          :new.id_envio_mdio_rspsta := sq_ma_g_envios_medio_respuesta.nextval;
        end if;
      end if;
    end before each row;
  end;



/
ALTER TRIGGER "MA_G_ENVIOS_MEDIO_RESPUESTA_IU" ENABLE;

