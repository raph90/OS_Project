#!/bin/bash

echo "Welcome to the Bash Assignment DBMS 2018!"
while true; do
    echo "What would you like to do?"
    read request 
	case "$request" in
        create_database)
            echo "What would you like to call your database?"
            read dbname
            ./create_database.sh $dbname
            if [ $? -eq 1 ]; then
                echo "Database creation failed."
            else
                echo "Database created"
            fi
            ;; 
        create_table)
            echo "Please enter the database name, the name of the new table, and the name of the columns in the table in the following format: [database name] [table name] [column names]"
            read db_for_table table_name col_names
            ./create_table.sh $db_for_table $table_name $col_names
            if [ $? -eq 1 ]; then
                echo "Table creation failed."
            else
                echo "Table created"
            fi
            ;;
        insert)
            echo "Which database and table would you like to add data to? Please enter in the format [database name] [table name]"
            read db_mod table_mod
            echo "Please enter the data"
            read data
            ./insert.sh $db_mod $table_mod $data
            if [ $? -eq 1 ]; then
                echo "Error: There was a problem inserting the data."
            else
                echo "Data inserted."
            fi
            ;;
        select)
            echo "Which database and table would you like to select data from? Please enter in the format [database name] [table name] [columns]"
            read db_sel table_sel col_sel
            ./select.sh $db_sel $table_sel $col_sel
            if [ $? -eq 1 ]; then
                echo "Error: There was a problem selecting the data."
            else
                continue
            fi
            ;;
        *) 
            echo "Error: bad request"
            exit 1
    esac
done
