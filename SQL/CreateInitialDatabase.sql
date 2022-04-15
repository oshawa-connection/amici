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



INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F000057C73497DDCC06C109CC0ABEE0245B41', 'Sharon Wallace');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00000B6FC8A7E1A003C1099A6104BD3A5B41', 'Hilda Marshall');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00004FEEAB46100A03C1D51C96CB16325B41', 'Mary Dugan');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000161A6E3EC45706C1E92E5B44C4355B41', 'Debra Carlone');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000C5749398ABB303C1D11B3D62C2315B41', 'Keith Dubois');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000E3B2C3DDAADD01C15529F6C7E13A5B41', 'Nancy Morgan');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F000071067EAF6C7C04C151AE364225225B41', 'Julie Good');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00001A725F3F588D06C12322FB2D2D3A5B41', 'Charles Patterson');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F000065DBC071D57406C118D4186D302A5B41', 'James Raitz');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F000056F99A028AAE04C1919E611009355B41', 'Marta Elmore');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00001AF2BA4E5D2407C11286D2A2A42F5B41', 'Cory Mcswain');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F000031C5D0889A5A04C10A186134B3225B41', 'Judy Fineran');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00006B629353E67B02C142E58689322B5B41', 'Michelle Porter');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000FBB6DC90152C03C173CAA01B4F325B41', 'Helen Gonzalez');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000F8747E8BC08902C1799A316B783D5B41', 'Kyle Gavin');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00004450E27714A704C1E61F5D6A67375B41', 'Martha Brown');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00001E985E3A5A2A03C147A2DD9692365B41', 'Kenny Bliler');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000861E9F8202C306C1BB1DFDF0182F5B41', 'Roberto White');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00001134F7575F9B05C1A93DE918E7375B41', 'Gene Poquette');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000D16A65E1D69604C1330CF11F29265B41', 'Casey Radosevich');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F000026E463B7DF5A05C1A8BBD31D9F355B41', 'Dusty Pinder');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000604C0D31F45E06C1060E3E4A333D5B41', 'Carlos Goodman');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000824ACE6CCE5504C1844E26C0AB395B41', 'Odis Moore');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00005F730FF09F1507C1E1D3D59D0A335B41', 'Lester Thomas');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000357BB0D7894602C122C11C78C0345B41', 'Robert Ketchum');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00002E00F0EC54AB03C1F0E3BC58F0375B41', 'Joseph Shick');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00004BA20042569A05C15E89BC3C2B265B41', 'Dolores Molina');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F000080D77E95E10C02C18A73D689152F5B41', 'Renee Thom');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000F408C2145E9A03C1D40D5B6C593A5B41', 'Patricia Selvage');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000631F44D8975202C1E066189766295B41', 'Ada Volo');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000FD76F75BCAC906C13DF35C0B4C2C5B41', 'Angela Conorich');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000A5B780196B7D03C11E02AF5542375B41', 'Jean Clark');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000F629FA11EC0807C1371FA98928365B41', 'Michael Hutchison');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F000029BF2BA723B804C1C34A53BC60325B41', 'Daniel Bryant');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000143C5F37B6BD06C14FABD0CF112D5B41', 'Charissa Rivera');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000C519CFC6336F05C1A69CA7C8B3315B41', 'Kathi Battle');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00001FB02A3B3DBC06C125B7474D10385B41', 'Susan Thomas');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000ACAF07DF48FB02C1CE544780EE285B41', 'Lydia Cribbin');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F000081B0C8ECB0CA04C1D75AF0259A285B41', 'Jerry Sult');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000237EA5F43AB102C1A9A271FDE6245B41', 'Harry Eagle');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000ECFF157DAE7305C16AE22E616B335B41', 'Vincent Rinehart');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000AE628FB3E2A205C1D8AEF65F3D245B41', 'Thomas Voeltner');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00002475C908F02203C1C58C3B57C02C5B41', 'Sandra Ugalde');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000793B61D3053202C185277CA1533D5B41', 'Laura Lamy');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000EE4FED285E7705C155E525F613245B41', 'Selma Cheeks');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F000000A0D68BC9BA01C15D90A021FB3C5B41', 'Gregory Baldwin');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000202DD49945B703C198C36196432C5B41', 'Gloria Terry');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00003D168270E24B05C171C73928A92F5B41', 'George Serrato');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00002978A0E93AB104C11461EFD6A1365B41', 'Saul Aubrey');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000DA05EBC9F61003C16B44C1E1D83B5B41', 'Nolan Hernandez');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F000055098FAF7BCB02C1B18F777420225B41', 'April Wellman');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000DCE266AB695505C1CE938A4BA3345B41', 'Hans Hayes');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00004CEE7F47259C03C1F7F2715B272C5B41', 'Louis Orts');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000D2C2ADFC459304C1E44D15843E2F5B41', 'Beatrice Silva');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00008463B30DB6E203C1EC3E5FCEE2335B41', 'Carl Hunsaker');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00004D54CAF1373002C18A88A6B9053A5B41', 'Lee Tackett');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F000049AB26FDC7E205C110E997C9B7365B41', 'Alice Bailey');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00007A652785140D02C1D78727C221325B41', 'Alberto Smith');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00001FE1CB7ED0D205C1D746107E2A235B41', 'Valerie Tidwell');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F000044BED51A14B702C17B1FAC6E0C275B41', 'Lisa Ruiz');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00005C47A81D3D8303C1EAB1EE11C7355B41', 'Jeanette Williams');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F000099E20B2EDA0307C109B319256D3C5B41', 'William Weaver');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00001A567A04775A02C1960C94BD74395B41', 'Julie Kruse');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00007B15BD47B70204C152B0759009225B41', 'Latoya Wilson');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000B298908D26F903C120FC2B0937335B41', 'Lucille Baker');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00000867E899933103C1B6B9FC34A0285B41', 'Ronald Wilcox');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F000091BD3812AE1103C1F245C1F1373C5B41', 'Jack Hagerty');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00004DEA457C3C6104C1F45D5C72F4255B41', 'Barry Leaton');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00001C3F83DBDD5E02C171C0C6079E2D5B41', 'Linda Vetter');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00003E0AF1588A3A03C11B66AFFDAE305B41', 'Stanley Hodges');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00002DA71D437FD804C19712111CA82E5B41', 'Timothy Kendrick');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000D46E6B66402702C1CBDBA3D2152C5B41', 'Gladys Gartrell');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00009BA7F0D453B802C1031A50D1032B5B41', 'Mary Nicholson');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00006DEFED41526E04C1DE51E2DEEF3B5B41', 'Jacqueline Watson');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000D91027A4DFC502C15DB41424DB2B5B41', 'Brittany Doyle');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000E4A6B958A9D505C144B55E1136305B41', 'William Aoki');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00009E82A2DE4D6603C1180119FC7B225B41', 'Earl Budge');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00005C4EEDFBC86E03C15AE5B012E5315B41', 'Robert Caddel');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000D88FAF50571E03C12FC5940F7F275B41', 'Connie Green');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00004D43BD138F3B02C11BC50FABBA225B41', 'Alanna Wade');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F000057ED79CE7A8105C11697516C19325B41', 'Jessie Lott');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00000A33A54FE7D304C115E9160F0E235B41', 'Judy Pierce');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00001A5C64DDE9B505C1D91EF1BD812B5B41', 'Robert Witter');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000E963E52F00A905C1920AE86A15305B41', 'Richard Ingram');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00007660951BEF2404C1DB6CC52D962C5B41', 'Cory Aden');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000A1884E9620DD06C179A68F2C0E305B41', 'Dorothy Tetreault');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000583E8D6BE5A404C15B6C9BC0B0365B41', 'Marco Lewis');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00004A10B4C35DF204C1670B482830345B41', 'William Acord');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00009C02B41E703806C166D43D47113A5B41', 'Natalie Murphy');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00004C52B090F17F06C1F5226F1D832F5B41', 'Jennifer Stathopoulos');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00005D581DA602C205C17CF1C29B5F2B5B41', 'Lamont Larkin');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000CEAB055A474506C11863516027295B41', 'Mary Schiller');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000642061070D1107C15ED6CFBD953C5B41', 'James Sorge');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F000021372BEE1C1205C188F8805DD12E5B41', 'Mary King');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000447C85D3A69B03C18503B8B7A62D5B41', 'Willie Halvorson');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000FFD4846ED50004C1D85942B31C345B41', 'James Cook');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000F762CFC0DF4E03C1BE052911EA2F5B41', 'Quentin Henry');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00001446EDDEAC8C03C16D799A7AD93C5B41', 'Paul Mcneely');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F0000936A7513279E06C1E29A9EB467275B41', 'Harold Cagle');
INSERT INTO "main"."amici_user" ("geom" , "user_name") VALUES ('0101000020110F00005B2375817A4A06C1C1FDE89A673A5B41', 'Paul Quincy');