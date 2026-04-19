
  CREATE OR REPLACE EDITIONABLE PROCEDURE "TEMP_CRUCE_CAMARA" (p_cdgo_clnte     varchar2,
                                              p_identificacion varchar2) is

  cursor c1 is
    select c.*, rowid
      from temp_camara_comercio c
     where (c.identificacion = p_identificacion or p_identificacion is null)
     order by c.identificacion;

  cursor c2(r_idntfccion varchar2) is
    select *
      from v_si_i_sujetos_impuesto i
     where i.cdgo_clnte = p_cdgo_clnte
       and i.id_impsto = p_cdgo_clnte || 2
       and (
           -- coincidencia exacta con r_idntfccion
            i.idntfccion_sjto = r_idntfccion or
           -- coincidencia con r_idntfccion seguida de un dígito de verificación
            (i.idntfccion_sjto like r_idntfccion || '%' and
            length(i.idntfccion_sjto) = length(r_idntfccion) + 1) or
           -- lo mismo para la identificación anterior
            i.idntfccion_antrior = r_idntfccion or
            (i.idntfccion_antrior like r_idntfccion || '%' and
            length(i.idntfccion_antrior) = length(r_idntfccion) + 1))
     order by i.id_sjto_estdo desc;

  v_exste varchar2(1);
  v_estdo number;
begin

  for r1 in c1 loop
    v_exste := 'N';
    v_estdo := null;
    for r2 in c2(r1.identificacion) loop
      v_exste := 'S';
      v_estdo := r2.id_sjto_estdo;
      if r2.id_sjto_estdo = 1 then
        v_estdo := 1;
        exit;
      end if;

    end loop;
    update temp_camara_comercio t
       set t.exste = v_exste, t.estado = v_estdo
     where t.rowid = r1.rowid;
    commit;
  end loop;

end temp_cruce_camara;
/

