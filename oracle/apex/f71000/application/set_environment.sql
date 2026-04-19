prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.03.31'
,p_release=>'19.1.0.00.15'
,p_default_workspace_id=>71778384177293184
,p_default_application_id=>71000
,p_default_owner=>'GENESYS'
);
end;
/
 
prompt APPLICATION 71000 - GestiÃ³n Financiera
--
-- Application Export:
--   Application:     71000
--   Name:            GestiÃ³n Financiera
--   Exported By:     GENESYS
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         19.1.0.00.15
--   Instance ID:     248394942130614
--

-- Application Statistics:
--   Pages:                    347
--     Items:                2,896
--     Computations:           142
--     Validations:            304
--     Processes:              834
--     Regions:              1,629
--     Buttons:                788
--     Dynamic Actions:        595
--   Shared Components:
--     Logic:
--       Items:                 21
--       Processes:              1
--       Web Services:           1
--     Navigation:
--       Lists:                 20
--       Breadcrumbs:            1
--         Entries:              3
--     Security:
--       Authentication:         3
--       Authorization:          3
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 9
--         Region:              16
--         Label:                5
--         List:                11
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               3
--         Report:               9
--       LOVs:                  85
--       Shortcuts:              1
--       Plug-ins:               9
--     Globalization:
--     Reports:
--       Queries:               13
--       Layouts:               17
--     E-Mail:
--   Supporting Objects:  Included

