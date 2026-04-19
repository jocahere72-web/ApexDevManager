
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_TASAS_BANCARIA_IU"
  for insert or update or delete on df_c_tasas_bancaria compound trigger
  v_id_tsa_bncria number;

  before each row is
  begin
    if inserting then
      if :new.id_tsa_bncria is null then
        v_id_tsa_bncria    := sq_df_c_tasas_bancaria.nextval;
        :new.id_tsa_bncria := v_id_tsa_bncria;
      end if;
    end if;

        if inserting or updating then
        :new.tsa_dria := pkg_gf_movimientos_financiero.fnc_cl_tea_a_ted(p_cdgo_clnte    => :new.cdgo_clnte,
                                        p_tsa_efctva_anual  => :new.vlor_tsa,
                                        p_anio              => (extract(year from :new.fcha_hsta)));
        end if;

        if deleting then
            delete from df_i_tasas_bancaria where id_tsa_mra_pdre = :old.id_tsa_bncria;
        end if;
  end before each row;

  after each row is
    begin
      if inserting then
        for c_impstos in (select * from df_c_impuestos where cdgo_clnte = :new.cdgo_clnte) loop
                    insert into df_i_tasas_bancaria (cdgo_clnte,          id_impsto,        fcha_dsde,          fcha_hsta,
                                                     vlor_tsa,          tsa_dria,       id_tsa_mra_pdre)
                                          values(:new.cdgo_clnte,     c_impstos.id_impsto,  :new.fcha_dsde,     :new.fcha_hsta,
                                                 :new.vlor_tsa,     :new.tsa_dria,      :new.id_tsa_bncria);
                end loop;
      end if;

            if updating then
                update df_i_tasas_bancaria
           set fcha_dsde    = :new.fcha_dsde
           , fcha_hsta    = :new.fcha_hsta
           , vlor_tsa     = :new.vlor_tsa
           , tsa_dria     = :new.tsa_dria
         where id_tsa_mra_pdre  = :new.id_tsa_bncria;
            end if;

  end after each row;
end;




/
ALTER TRIGGER "DF_C_TASAS_BANCARIA_IU" ENABLE;

