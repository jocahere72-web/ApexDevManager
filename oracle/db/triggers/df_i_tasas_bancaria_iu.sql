
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_TASAS_BANCARIA_IU"
  for insert or update on df_i_tasas_bancaria compound trigger

  d         number;
  v_cdgo_clnte  number;

  before each row is
  begin
    if inserting then
      if :new.id_tsa_bncria is null then

        select nvl(max(id_tsa_bncria)+1, 1) into d from df_i_tasas_bancaria;
        :new.id_tsa_bncria := d;

      end if;
    end if;
    if inserting or updating then
        :new.tsa_dria := pkg_gf_movimientos_financiero.fnc_cl_tea_a_ted(p_cdgo_clnte    => :new.cdgo_clnte,
                                        p_tsa_efctva_anual  => :new.vlor_tsa,
                                        p_anio              => (extract(year from :new.fcha_hsta)));
    end if;
  end before each row;
end;




/
ALTER TRIGGER "DF_I_TASAS_BANCARIA_IU" ENABLE;

