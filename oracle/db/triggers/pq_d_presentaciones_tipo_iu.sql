
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_D_PRESENTACIONES_TIPO_IU"
  for insert or update on pq_d_presentaciones_tipo
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prsntcion_tpo is null then
        select nvl( max(id_prsntcion_tpo), 0 ) + 1  into d
        from pq_d_presentaciones_tipo;
        :new.id_prsntcion_tpo := d;
      end if;
    end if;
  end before each row;
end;








/
ALTER TRIGGER "PQ_D_PRESENTACIONES_TIPO_IU" ENABLE;

