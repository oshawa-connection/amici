CREATE EXTENSION IF NOT EXISTS POSTGIS;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";


DROP SCHEMA IF EXISTS main CASCADE;
CREATE SCHEMA main;

DROP TABLE IF EXISTS main.amici_user;
CREATE TABLE main.amici_user (
    id UUID PRIMARY KEY NOT NULL DEFAULT uuid_generate_v4(),
    user_name VARCHAR,
    geom GEOMETRY("POINT",3857) NOT NULL
);
CREATE INDEX amici_user_geom ON main.amici_user USING GIST(geom);


DROP TABLE IF EXISTS main.friend;
CREATE TABLE main.friend(
    id UUID PRIMARY KEY NOT NULL DEFAULT uuid_generate_v4(),
    amici_user_id_one UUID,
    amici_user_id_two UUID,
    both_matched BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (amici_user_id_one) REFERENCES main.amici_user(id),
    FOREIGN KEY (amici_user_id_two) REFERENCES main.amici_user(id)
);
CREATE INDEX amici_friend_user_id_one ON main.friend USING BTREE(amici_user_id_one);
CREATE INDEX amici_friend_user_id_two ON main.friend USING BTREE(amici_user_id_two);
CREATE INDEX amici_friend_both_matched ON main.friend USING BTREE(both_matched);


DROP TABLE IF EXISTS main.interest;
CREATE TABLE main.interest (
    id UUID PRIMARY KEY NOT NULL DEFAULT uuid_generate_v4(),
    title VARCHAR NOT NULL
);


DROP TABLE IF EXISTS main.amici_user_interests_through;
CREATE TABLE main.amici_user_interests_through (
    id UUID PRIMARY KEY NOT NULL DEFAULT uuid_generate_v4(),
    amici_user_id UUID NOT NULL,
    interest_id UUID NOT NULL,
    FOREIGN KEY (amici_user_id) REFERENCES main.amici_user(id),
    FOREIGN KEY (interest_id) REFERENCES main.interest(id)
);
CREATE INDEX amici_amici_user_interests_through_amici_user_id ON main.amici_user_interests_through USING BTREE(amici_user_id);
CREATE INDEX amici_amici_user_interests_through_interest_id ON main.amici_user_interests_through USING BTREE(interest_id);