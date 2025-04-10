*** Settings ***
Resource    ../Settings/db_settings.robot
Variables    ../Variables/db_var.yml

*** Keywords ***
Connect To DB
    Connect To Database    ${DBVars.DBMODULE}    ${DBVars.DBNAME}    ${DBVars.DBUSER.Username}    ${DBVars.DBUSER.Password}    ${DBVars.DBHOST}
    
Disconnect DB
    Disconnect From Database