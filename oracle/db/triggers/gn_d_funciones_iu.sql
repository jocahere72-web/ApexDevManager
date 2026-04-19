
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_FUNCIONES_IU"
  for insert or update on gn_d_funciones
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_fncion is null then
        select nvl( max(id_fncion), 0 ) + 1  into d
        from gn_d_funciones;
        :new.id_fncion := d;
      end if;
    end if;
  end before each row;
end;








/
ALTER TRIGGER "GN_D_FUNCIONES_IU" ENABLE;

