
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_TARIFAS_ESQUEMA_IU"
  for insert or update on gi_d_tarifas_esquema
  compound trigger

  v_vlor_trfa varchar2(1000);

  before each row is
  begin

    if inserting then
      if :new.id_trfa_esqma is null then
        :new.id_trfa_esqma := sq_gi_d_tarifas_esquema.nextval;
      end if;
    end if;

    if inserting or updating then

      -- Lógica de formateo
      if mod(:new.vlor_trfa, 1) = 0 then
        -- Es un número entero exacto
        v_vlor_trfa := trim(to_char(:new.vlor_trfa,
                                    '999G999G999G999G999G999G990'));
      else
        -- Tiene decimales
        v_vlor_trfa := trim(to_char(:new.vlor_trfa,
                                    '999G999G999G999G999G999G990D9999'));

        -- CAMBIO AQUI: Eliminar ceros a la derecha
        v_vlor_trfa := RTRIM(v_vlor_trfa, '0');

        -- CAMBIO AQUI: Eliminar el separador decimal (punto o coma) si quedó al final
        -- (Esto ocurre si el redondeo de los 4 decimales dejó el número como entero, ej: 100,00001 -> 100,)
        v_vlor_trfa := RTRIM(v_vlor_trfa, '.,');
      end if;

      -- Concatenación de símbolos (% o /)
      if :new.dvsor_trfa = 100 then
        v_vlor_trfa := v_vlor_trfa || '%';
      elsif :new.dvsor_trfa > 1 then
        v_vlor_trfa := v_vlor_trfa || '/' || :new.dvsor_trfa;
      else
        :new.txto_trfa := v_vlor_trfa;
      end if;

      -- Concatenación del indicador tipo
      if :new.cdgo_indcdor_tpo is not null then
        :new.txto_trfa := v_vlor_trfa || ' ' || :new.cdgo_indcdor_tpo;
      else
        :new.txto_trfa := v_vlor_trfa;
      end if;

      -- Limpieza de campos según banderas
      if :new.indcdor_bse_usa_vlor_fjo = 'S' then
        :new.cdgo_indcdor_tpo_bse := null;
      end if;

      if :new.indcdor_lqdcion_usa_vlor_fjo = 'S' then
        :new.cdgo_indcdor_tpo_lqdccion := null;
      end if;
    end if;

  end before each row;

end;


/
ALTER TRIGGER "GI_D_TARIFAS_ESQUEMA_IU" ENABLE;

