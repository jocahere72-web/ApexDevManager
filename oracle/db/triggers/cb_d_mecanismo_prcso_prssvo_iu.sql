
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_D_MECANISMO_PRCSO_PRSSVO_IU"
  for insert on cb_d_mecanismo_prcso_prssvo
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_mcnsmo_prcso_prssvo is null then
        d := sq_cb_d_mecanismo_prcso_prssvo.nextval();
        :new.id_mcnsmo_prcso_prssvo := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "CB_D_MECANISMO_PRCSO_PRSSVO_IU" ENABLE;

