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
,p_default_application_id=>150000
,p_default_owner=>'GENESYS'
);
end;
/
 
prompt APPLICATION 150000 - Portal
--
-- Application Export:
--   Application:     150000
--   Name:            Portal
--   Exported By:     GENESYS
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         19.1.0.00.15
--   Instance ID:     248394942130614
--

-- Application Statistics:
--   Pages:                     98
--     Items:                1,732
--     Computations:            59
--     Validations:            231
--     Processes:              310
--     Regions:                462
--     Buttons:                314
--     Dynamic Actions:        377
--   Shared Components:
--     Logic:
--       Items:                 18
--       Processes:              2
--       Computations:           6
--     Navigation:
--       Lists:                 11
--       Breadcrumbs:            1
--     Security:
--       Authentication:         3
--       Authorization:          3
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
--       LOVs:                  45
--       Shortcuts:              1
--       Plug-ins:              11
--     Globalization:
--     Reports:
--       Queries:                2
--       Layouts:                3
--     E-Mail:
--   Supporting Objects:  Included

