
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_SALDOS_FAVOR_SOPORTE_IU"
  for insert on gf_g_saldos_favor_soporte
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_sldo_fvor_sprte is null then
        d := sq_gf_g_saldos_favor_soporte.nextval;
        :new.id_sldo_fvor_sprte := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "GF_G_SALDOS_FAVOR_SOPORTE_IU" ENABLE;

