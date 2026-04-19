
  CREATE OR REPLACE EDITIONABLE PROCEDURE "JL_ENVIAR_SMS_MASIVO" is
  cursor c1 is
    select * from temp_celulares_enviar_sms a order by a.cllar;

  /*

      Población autoretenedores, toca cambiar el id_dclrcion_vgncia_frmlrio

      DELETE FROM temp_celulares_enviar_sms ;
  insert into temp_celulares_enviar_sms
  select a.tlfno,
         'La ALCALDIA DE MONTERIA le recuerda que el 13 de septiembre vence el plazo para declarar el 4 bimestre de AUTORRETENCION del Impuesto de Industria y comercio',
         'PERSUASIVO AUTORRETENEDORES',
         A.idntfccion_sjto
    from temp_identificaciones_ag_retenedores r
    join V_si_i_sujetos_impuesto a
      on a.id_sjto_impsto = r.id_sjto_impsto
   where a.tlfno like '3%'
     and length(a.tlfno) = 10
     and not exists (select 1
            from gi_g_declaraciones b
           where b.cdgo_dclrcion_estdo = 'APL'
             and b.id_dclrcion_vgncia_frmlrio = 9960
             and b.id_sjto_impsto = a.id_sjto_impsto);
  COMMIT;*/

begin

  for r1 in c1 loop
    temp_enviar_sms(p_tlfno     => r1.cllar,
                    p_mnsje     => r1.mnsje,
                    p_tpo_mnsje => r1.tpo_mnsje);

  end loop;

end jl_enviar_sms_masivo;
/

