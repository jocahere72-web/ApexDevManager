
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_I_VEHICULOS_IU" for insert or update on SI_I_VEHICULOS compound trigger

  d number;

  before each row is
  begin
    if inserting then
      if :new.ID_VHCLO is null then

        select nvl(max(ID_VHCLO)+1, 1) into d from SI_I_VEHICULOS;
        :new.ID_VHCLO := d;

      end if;
    end if;
  end before each row;

end;





/
ALTER TRIGGER "SI_I_VEHICULOS_IU" ENABLE;

