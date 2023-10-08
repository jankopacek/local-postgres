CREATE EXTENSION IF NOT EXISTS dblink;

CREATE OR REPLACE PROCEDURE create_database_if_not_exists(new_database_name name)
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_database WHERE datname=new_database_name) THEN
        PERFORM dblink_exec('dbname=' || current_database(), 'CREATE DATABASE ' || new_database_name);
    END IF;
END;
$$;


-- Create AFS databases
CALL create_database_if_not_exists('kristof');
