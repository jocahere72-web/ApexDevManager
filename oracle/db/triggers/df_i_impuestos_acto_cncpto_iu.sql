
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_IMPUESTOS_ACTO_CNCPTO_IU"
	for insert or update on df_i_impuestos_acto_concepto
	compound trigger
    d number;
    v_indcdor_trfa_crctrstcas varchar2(1);
    o_indcdor_trfa_crctrstcas varchar2(1);
    v_vgncia                  number;
    v_prdo                    number;
    v_id_impsto_acto          number;
    v_existe number;
    v_mnsje  varchar2(4000) := ' Excepcion. Solo debe existir un indicador "Sí" en Columna "Indicador Caracteristicas Tarifa" por vigencia' ;

  before each row is
	begin

     v_indcdor_trfa_crctrstcas  := :new.indcdor_trfa_crctrstcas;
     v_vgncia                   := :new.vgncia;
     v_prdo                     := :new.id_prdo;
     v_id_impsto_acto           := :new.id_impsto_acto;
	   o_indcdor_trfa_crctrstcas  := :old.indcdor_trfa_crctrstcas;

  	if inserting then
			if :new.id_impsto_acto_cncpto is null then
				select nvl( max(id_impsto_acto_cncpto), 0 ) + 1  into d
				from df_i_impuestos_acto_concepto;
				:new.id_impsto_acto_cncpto := d;
			end if;
		end if;

	end before each row;

    after statement is

    begin

        if ( inserting or updating ) and v_indcdor_trfa_crctrstcas = 'S' and v_indcdor_trfa_crctrstcas <> nvl( o_indcdor_trfa_crctrstcas , 'N' ) then

              select count(*)
                into v_existe
                from df_i_impuestos_acto_concepto
               where vgncia  = v_vgncia
                 and id_prdo = v_prdo
                 and id_impsto_acto = v_id_impsto_acto
                 and indcdor_trfa_crctrstcas = 'S';

              if v_existe > 1 then
                 apex_error.add_error ( p_message          => v_mnsje
                                      , p_display_location => apex_error.c_inline_with_field );
                 raise_application_error( -20001 , v_mnsje );
              end if;

        end if;
    end after statement;

end;






/
ALTER TRIGGER "DF_I_IMPUESTOS_ACTO_CNCPTO_IU" ENABLE;

