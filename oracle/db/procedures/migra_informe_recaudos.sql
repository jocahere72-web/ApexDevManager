
  CREATE OR REPLACE EDITIONABLE PROCEDURE "MIGRA_INFORME_RECAUDOS" (p_estdo in varchar2,
                                                   p_csal  in varchar2) is

  cursor c1(r_estdo varchar2,
            r_csal  varchar2) is
    select a.*,
           x.nmbre_bnco
      from (
            Select t.clmna9, --"Referencia",
                   t.clmna12, -- "No. Documento Pago",
                   t.clmna13, --"Fecha Recaudo",
                   t.clmna14, --"Valor",
                   t.clmna4, --"Banco",
                   t.clmna5, --"Cuenta",
                   t.clmna6, --"Fecha Ingreso Banco",
                   t.clmna15, --"Observacion Recaudo",
                   decode(t.clmna17,'AC','Aplicado',t.clmna17) estdo_pgo, --"Estado Pago",
                   t.clmna18, --"Fecha Aplicacion",
                   t.clmna19, --"No. Documento Externo",
                   t.clmna21 --"Usuario Registro"
              from migra.mg_g_intermedia_recaudo t
             where t.CDGO_CLNTE        = 10 and
                   t.ID_ENTDAD         = 819 and
                   t.cdgo_estdo_rgstro = r_estdo and
                   t.clmna47           = r_csal) a
                   left join genesys.DF_C_BANCOS x  on nvl(x.CDGO_BNCO,'null') = nvl(a.clmna4,'null')
  order by to_date(a.clmna6,'dd/mm/yyyy hh24:mi:ss');

v_archvo        varchar2(200);
v_archvo_cmmit  varchar2(200);

v_estdo         varchar2(100);
v_csal          varchar2(100);

v_cdna          varchar2(4000);
v_cntdor        number(10);

begin

  if p_estdo = 'E' then
    v_estdo := 'DOCUMENTOS_NO_VALIDOS';

  elsif p_estdo = 'S' then

    v_estdo := 'DOCUMENTO_VALIDO';

    if p_csal ='OK' then
      v_csal := 'CARGADOS';
    elsif p_csal ='DN' then
      v_csal := 'NO_CARGADOS';
    end if;

    v_estdo := v_estdo||'_'||v_csal;
  end if;

  v_archvo       := 'MIGRACION_PAGOS_'||v_estdo||'_'||TO_CHAR(SYSDATE,'YYYYMMDD')||'.TXT';
  v_archvo_cmmit := 'MIGRA_PAGOS_COMMIT_'||v_estdo||'_'||TO_CHAR(SYSDATE,'YYYYMMDD')||'.TXT';

  genesys.sitpr001('Iniciando generaci?nde archivo', v_archvo_cmmit);

  v_cdna := 'Item~Referencia~No. Documento Pago~Fecha Recaudo~Valor~CodBanco~Nombre Banco~';
  v_cdna := v_cdna||'Fecha Banco~Observacion~estdo_pgo~Fecha Aplicacion~No. Documento Externo~Usuario Registro';

  genesys.sitpr001(v_cdna, v_archvo);

  v_cntdor := 1;

  for r1 in c1(p_estdo, p_csal) loop

    v_cdna := v_cntdor||'~'||
              r1.clmna9||'~'||    --"Referencia",
              r1.clmna12||'~'||   -- "No. Documento Pago",

              substr(r1.clmna13,1,10)||'~'||   --"Fecha Recaudo",

              r1.clmna14||'~'||   --"Valor",
              r1.clmna4||'~'||    --"Banco",
              r1.nmbre_bnco||'~'||
              r1.clmna5||'~'||    --"Cuenta",

              substr(r1.clmna6,1,10)||'~'||    --"Fecha Ingreso Banco",

              r1.clmna15||'~'||   --"Observacion Recaudo",
              r1.estdo_pgo||'~'|| --"Estado Pago",

              substr(r1.clmna18,1,10)||'~'||   --"Fecha Aplicacion",

              r1.clmna19||'~'||   --"No. Documento Externo",
              r1.clmna21;         --"Usuario Registro"

    genesys.sitpr001(v_cdna, v_archvo);

    v_cntdor := v_cntdor + 1;

    if (v_cntdor-1)/1000 = trunc((v_cntdor-1)/1000) then
      genesys.sitpr001('Se han procesado: '||(v_cntdor-1), v_archvo_cmmit);
    end if;



  end loop;

  genesys.sitpr001('Se procesaron: '||(v_cntdor-1), v_archvo_cmmit);



end migra_informe_Recaudos;

/

