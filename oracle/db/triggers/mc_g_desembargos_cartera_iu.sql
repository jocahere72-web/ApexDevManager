
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_DESEMBARGOS_CARTERA_IU"
  for insert on mc_g_desembargos_cartera
  compound trigger  d number;

  before each row is
  begin
    if inserting then
      if :new.id_dsmbrgo_crtra is null then
        :new.id_dsmbrgo_crtra := sq_mc_g_desembargos_cartera.nextval;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "MC_G_DESEMBARGOS_CARTERA_IU" ENABLE;

