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
,p_default_application_id=>80000
,p_default_owner=>'GENESYS'
);
end;
/
 
prompt APPLICATION 80000 - GestiÃ³n de Cobro
--
-- Application Export:
--   Application:     80000
--   Name:            GestiÃ³n de Cobro
--   Exported By:     GENESYS
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         19.1.0.00.15
--   Instance ID:     248394942130614
--

-- Application Statistics:
--   Pages:                    177
--     Items:                1,191
--     Computations:            64
--     Validations:             45
--     Processes:              403
--     Regions:                646
--     Buttons:                457
--     Dynamic Actions:        245
--   Shared Components:
--     Logic:
--       Items:                 24
--       Processes:              2
--     Navigation:
--       Lists:                  4
--       Breadcrumbs:            1
--         Entries:              6
--     Security:
--       Authentication:         3
--       Authorization:          4
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 9
--         Region:              16
--         Label:                7
--         List:                12
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               3
--         Report:              10
--       LOVs:                  58
--       Shortcuts:              1
--       Plug-ins:               7
--     Globalization:
--     Reports:
--     E-Mail:
--   Supporting Objects:  Included

