DROP SCHEMA IF EXISTS amici CASCADE;
CREATE SCHEMA amici;

DROP TABLE IF EXISTS amici.user;
CREATE TABLE amici.user (
    id UUID NOT NULL DEFAULT uuid_generate_v4(),
    scrambled_position GEOMETR
    is_matched boolean
);


CREATE TABLE amici.match()

CREATE TABLE amici.interest (

);

CREATE TABLE IF EXISTS amici.user_interests_through (

);