
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DCLRCNES_LCNCIA_IU"
  for insert or update on gi_g_dclrcnes_lcncia
  compound trigger
	before each row is
        o_cdgo_rspsta       number := 0;
        o_mnsje_rspsta      varchar2(2000);
        v_id_impsto_acto    varchar2(100);

        v_cdgo_undad_tmpo   varchar2(2);
        v_tpo_dias          varchar2(1);
        v_dias_mrgn_mra     number;

	begin
		if inserting then

            :new.id_dclrcion_lcncia := sq_gi_g_dclrcnes_lcncia.nextval;

            --Se valida la definición donde se consulta el impuesto acto que calcula la fecha de vencimiento de la licencia
            begin
                v_id_impsto_acto := pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte				=> :new.cdgo_clnte,
                                                                                    p_cdgo_dfncion_clnte_ctgria => 'DCL',
                                                                                    p_cdgo_dfncion_clnte		=> 'ALI');
            exception
                when others then
                    o_cdgo_rspsta := 1;
                    o_mnsje_rspsta := o_cdgo_rspsta || '. No se pudo insertar el registro.';
                    raise_application_error(-20000, o_mnsje_rspsta);
            end;

            if (v_id_impsto_acto <> '-1') then
                begin
                    --Se consultan los datos del impuesto acto para calcular la fecha de vencimiento
                    select  a.cdgo_undad_tmpo,
                            a.tpo_dias,
                            a.dias_mrgn_mra
                    into    v_cdgo_undad_tmpo,
                            v_tpo_dias,
                            v_dias_mrgn_mra
                    from    df_i_impuestos_acto a
                    where   a.id_impsto_acto    =   to_number(v_id_impsto_acto);
                exception
                    when others then
                        o_cdgo_rspsta := 2;
                        o_mnsje_rspsta := o_cdgo_rspsta || '. No se pudo insertar el registro.';
                        raise_application_error(-20000, o_mnsje_rspsta);
                end;
            end if;

            --Se llama la función que devuelve la fecha de vencimiento
            begin
                :new.fcha_vcmnto := pk_util_calendario.calcular_fecha_final (
                                                                                p_cdgo_clnte    =>  :new.cdgo_clnte,
                                                                                p_fecha_inicial =>  :new.fcha_expdcion,
                                                                                p_tpo_dias      =>  v_tpo_dias,
                                                                                p_nmro_dias     =>  v_dias_mrgn_mra,
                                                                                p_undad_drcion  =>  v_cdgo_undad_tmpo
                                                                             );
            exception
                when others then
                    o_cdgo_rspsta := 3;
                    o_mnsje_rspsta := o_cdgo_rspsta || '. No se pudo insertar el registro.';
                    dbms_output.put_line(sqlerrm);
                    raise_application_error(-20000, o_mnsje_rspsta);
            end;

		end if;
	end before each row;
end gi_g_dclrcnes_lcncia_iu;






/
ALTER TRIGGER "GI_G_DCLRCNES_LCNCIA_IU" ENABLE;

