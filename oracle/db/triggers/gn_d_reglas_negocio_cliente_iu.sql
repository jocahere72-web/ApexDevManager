
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_REGLAS_NEGOCIO_CLIENTE_IU"
  for insert or update on gn_d_reglas_negocio_cliente
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_rgla_ngcio_clnte is null then
        select nvl( max(id_rgla_ngcio_clnte), 0 ) + 1  into d
        from gn_d_reglas_negocio_cliente;
        :new.id_rgla_ngcio_clnte := d;
      end if;
    end if;
  end before each row;
end;








/
ALTER TRIGGER "GN_D_REGLAS_NEGOCIO_CLIENTE_IU" ENABLE;

