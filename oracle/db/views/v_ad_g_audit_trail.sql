
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_AD_G_AUDIT_TRAIL" ("ID_AUDITORIA", "NMBRE_TBLA", "ID_LLVE_PRMRIA", "OPERACIÓN", "JSON", "USRIO", "FECHA", "HOST", "IP_ADDRESS", "SERVER_HOST", "OS_USER", "TERMINAL", "AUTHENTICATION_METHOD", "PROXY_USER", "PROXY_USERID") AS
  select a.id_auditoria,
       a.nmbre_tbla,
       a.id_llve_prmria,
       decode(a.tpo_oprcion, 'U','Update', 'I' , 'Insert') Operación,
       a.json,
       a.usrio,
       a.fecha,
       a.host,
       a.ip_address,
       a.server_host,
       a.os_user,
       a.terminal,
       a.authentication_method,
       a.proxy_user,
       a.proxy_userid
  from ad_g_audit_trail a;

