
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_D_PROCESOS_TIPO_IU"
  for insert on cb_d_procesos_tipo
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prcso_tpo is null then
        d := sq_cb_d_procesos_tipo.nextval();
        :new.id_prcso_tpo := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "CB_D_PROCESOS_TIPO_IU" ENABLE;

