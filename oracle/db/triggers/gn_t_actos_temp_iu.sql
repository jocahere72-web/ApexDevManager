
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_T_ACTOS_TEMP_IU"
  for insert or update on gn_t_actos_temp
  compound trigger
    d number;

    before each row is
    begin
    if inserting then
      if :new.id_actos_temp is null then
        d := sq_gn_t_actos_temp.nextval();
        :new.id_actos_temp := d;
      end if;
    end if;
  end before each row;
end;


/
ALTER TRIGGER "GN_T_ACTOS_TEMP_IU" ENABLE;

