
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_REGLAS_NEGOCIO_IU"
for insert or update on "GN_D_REGLAS_NEGOCIO"
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_rgla_ngcio is null then
        select nvl( max(id_rgla_ngcio), 0 ) + 1  into d
        from gn_d_reglas_negocio;
        :new.id_rgla_ngcio := d;
      end if;
    end if;
  end before each row;
end;







/
ALTER TRIGGER "GN_D_REGLAS_NEGOCIO_IU" ENABLE;

