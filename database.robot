*** Settings ***
Documentation    Testing the database library
Variables    Ressources/Variables/db_var.yml
Resource    Ressources/Keywords/db_keywords.robot
Resource    Ressources/Settings/db_settings.robot
Suite Setup    Connect To DB
Suite Teardown    Disconnect DB

*** Variables ***
${EXISTS}    ${OutputVars.EXISTS}
${output}    ${OutputVars.output}

*** Test Cases ***
Create person Table
    # Catch if the table person has already been created
    TRY
        ${output} =    Execute SQL String    CREATE TABLE person (id integer unique,first_name varchar(255),last_name varchar(255));
    EXCEPT    OperationalError: (1050, "Table 'person' already exists")
        ${output} =    Execute Sql String    SHOW TABLES;
    END
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Insert Data In person Table
    TRY
        ${output} =    Execute Sql String    INSERT INTO person (id,first_name, last_name) VALUES (1,'John','Doe');
    EXCEPT    IntegrityError: (1062, "Duplicate entry '1' for key 'id'")
        ${output} =    Execute Sql String    INSERT INTO person (id,first_name, last_name) VALUES (2,'John','Doe');
    END
    Log    ${output}
    Should Be Equal As Strings    ${output}    None

Remove All John Doe Entries
    ${output} =    Execute Sql String    DELETE FROM person WHERE first_name='John';
    Log    ${output}
    Should Be Equal As Strings    ${output}    None