
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_SG_G_LOG_ERROR" ("ID_LOG_ERROR", "FCHA_ERROR", "CDGO_ERROR", "MESSAGE", "ADDITIONAL_INFO", "DISPLAY_LOCATION", "ASSOCIATION_TYPE", "PAGE_ITEM_NAME", "APPLICATION_ID", "APPLICATION_NAME", "PAGE_ID", "PAGE_NAME", "REGION_ID", "REGION_NAME", "COLUMN_ALIAS", "ROW_NUM", "IS_INTERNAL_ERROR", "APEX_ERROR_CODE", "ORA_SQLCODE", "ORA_SQLERRM", "ERROR_BACKTRACE", "ERROR_STATEMENT") AS
  select
  a.id_log_error,
  a.fcha_error,
  a.cdgo_error,
  a.message,
  a.additional_info,
  a.display_location,
  a.association_type,
  a.page_item_name,
  b.application_id,
  b.application_name,
  b.page_id,
  b.page_name,
  a.region_id,
  b.region_name,
  a.column_alias,
  a.row_num,
  a.is_internal_error,
  a.apex_error_code,
  a.ora_sqlcode,
  a.ora_sqlerrm,
  a.error_backtrace,
  a.error_statement
from sg_g_log_error a, apex_application_page_regions b
where a.region_id = b.region_id(+);

