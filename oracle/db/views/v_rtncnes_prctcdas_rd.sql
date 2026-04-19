
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_RTNCNES_PRCTCDAS_RD" ("IDNTFCCION_SJTO", "NMBRE_RZON_SCIAL", "DSCRPCION_CNCPTO", "VLOR_BSE", "TRFA", "VLOR_RTNCION", "VGNCIA_RTNCION", "PRDO", "CDGO_PRDO", "CDGO_EXGNA_TPO_RGSTRO", "IDNTFCCION") AS
  select c.idntfccion_sjto,
       d.nmbre_rzon_scial,
       a.dscrpcion_cncpto,
       ltrim(rtrim(to_char(a.vlor_bse, 'FM$999G999G999G999G999G999G990'))) as vlor_bse,
       a.trfa,
       ltrim(rtrim(to_char(a.vlor_rtncion, 'FM$999G999G999G999G999G999G990'))) as vlor_rtncion,
       a.vgncia_rtncion,
       a.prdo,
       case
         when a.prdo = 'ENERO' then
          1
         when a.prdo = 'FEBRERO' then
          2
         when a.prdo = 'MARZO' then
          3
         when a.prdo = 'ABRIL' then
          4
         when a.prdo = 'MAYO' then
          5
         when a.prdo = 'JUNIO' then
          6
         when a.prdo = 'JULIO' then
          7
         when a.prdo = 'AGOSTO' then
          8
         when a.prdo = 'SEPTIEMBRE' then
          9
         when a.prdo = 'OCTUBRE' then
          10
         when a.prdo = 'NOVIEMBRE' then
          11
         when a.prdo = 'DICIEMBRE' then
          12
       end as cdgo_prdo,
       a.cdgo_exgna_tpo_rgstro,
       nvl(substr(a.idntfccion, 1, instr(a.idntfccion, '-') - 1),
           a.idntfccion) as idntfccion
  from gi_g_exogena_retenciones a
  join gi_g_informacion_exogena b
    on b.id_infrmcion_exgna = a.id_infrmcion_exgna
  join v_si_i_sujetos_impuesto c
    on c.id_sjto_impsto = b.id_sjto_impsto
  join si_i_personas d
    on d.id_sjto_impsto = c.id_sjto_impsto
 where b.fcha_dgta = (select max(x.fcha_dgta)
                        from gi_g_informacion_exogena x
                       where x.id_sjto_impsto = b.id_sjto_impsto
                         and x.vgncia = b.vgncia)
;

