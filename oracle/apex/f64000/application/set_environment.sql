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
,p_default_application_id=>64000
,p_default_owner=>'GENESYS'
);
end;
/
 
prompt APPLICATION 64000 - Gestión de Errores
--
-- Application Export:
--   Application:     64000
--   Name:            Gestión de Errores
--   Exported By:     GENESYS
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         19.1.0.00.15
--   Instance ID:     248394942130614
--

-- Application Statistics:
--   Pages:                      9
--     Items:                   42
--     Validations:              2
--     Processes:               13
--     Regions:                 23
--     Buttons:                  9
--     Dynamic Actions:         18
--   Shared Components:
--     Logic:
--       Items:                  5
--     Navigation:
--       Lists:                  2
--       Breadcrumbs:            1
--         Entries:              6
--     Security:
--       Authentication:         2
--       Authorization:          3
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 9
--         Region:              15
--         Label:                5
--         List:                11
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               3
--         Report:               9
--       LOVs:                  11
--       Shortcuts:              1
--       Plug-ins:               2
--     Globalization:
--     Reports:
--     E-Mail:
--   Supporting Objects:  Included

