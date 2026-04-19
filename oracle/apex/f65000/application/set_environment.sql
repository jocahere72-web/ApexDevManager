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
,p_default_application_id=>65000
,p_default_owner=>'GENESYS'
);
end;
/
 
prompt APPLICATION 65000 - Sistema de NotificaciÃ³n
--
-- Application Export:
--   Application:     65000
--   Name:            Sistema de NotificaciÃ³n
--   Exported By:     GENESYS
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         19.1.0.00.15
--   Instance ID:     248394942130614
--

-- Application Statistics:
--   Pages:                     40
--     Items:                  255
--     Computations:             2
--     Validations:             36
--     Processes:               69
--     Regions:                127
--     Buttons:                 67
--     Dynamic Actions:         48
--   Shared Components:
--     Logic:
--       Items:                 21
--     Navigation:
--       Lists:                  5
--       Breadcrumbs:            1
--         Entries:              1
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
--         Report:              11
--       LOVs:                  14
--       Shortcuts:              2
--       Plug-ins:               4
--     Globalization:
--     Reports:
--       Queries:                2
--       Layouts:                2
--     E-Mail:
--   Supporting Objects:  Included

