--creation de table etage
CREATE TABLE etage(
id_etage INTEGER IDENTITY(1,1) NOT NULL,
libellé VARCHAR(100) NOT NULL,
CONSTRAINT pk_id_etage_E PRIMARY KEY(id_etage)
)
--creation de table residence
CREATE TABLE residence(
id_residence INTEGER IDENTITY(1,1)  NOT NULL,
adresse VARCHAR(100) NOT NULL,
CONSTRAINT pk_id_residence_R PRIMARY KEY(id_residence)
)
--creation de table d'association etage et residence qui est une relation MANY TO MANY
CREATE TABLE etage_residence(
id INTEGER IDENTITY(1,1) NOT NULL,
id_etage INTEGER NOT NULL,
id_residence INTEGER NOT NULL,
CONSTRAINT pk_id_ER PRIMARY KEY (id),
CONSTRAINT fk_id_etage_ER FOREIGN KEY (id_etage) REFERENCES etage(id_etage),
CONSTRAINT fk_id_residence_ER FOREIGN KEY (id_residence) REFERENCES residence(id_residence)
)
--creation de table type appartement
CREATE TABLE type_appartement(
id_type_appart INTEGER IDENTITY(1,1) NOT NULL,
type_immeuble VARCHAR(100),
CONSTRAINT pk_id_type_appart PRIMARY KEY (id_type_appart)
)
--creation de table type garage
CREATE TABLE type_garage(
id_type_garage INTEGER IDENTITY(1,1) NOT NULL,
outils VARCHAR(100),
CONSTRAINT pk_id_type_garage PRIMARY KEY (id_type_garage)
)
--creationde table categorie_garage
CREATE TABLE categorie_garage(
id_cat_garage INTEGER IDENTITY(1,1) NOT NULL,
prix_garage FLOAT NOT NULL,
CONSTRAINT pk_id_cat_garage PRIMARY KEY(id_cat_garage)
)
--creation de table categorie_garage
CREATE TABLE categorie_residence(
id INTEGER IDENTITY(1,1) NOT NULL,
id_cat_garage INTEGER NOT NULL,
id_residence INTEGER NOT NULL,
CONSTRAINT pk_id_CR PRIMARY KEY(id),
CONSTRAINT fk_id_cat_garage_CR FOREIGN KEY(id_cat_garage) REFERENCES categorie_garage(id_cat_garage),
CONSTRAINT fk_id_residence_CR FOREIGN KEY (id_residence) REFERENCES residence(id_residence)
)
--creation de table agent
CREATE TABLE agent(
id_agent INTEGER IDENTITY(1,1) NOT NULL,
nom_agent VARCHAR(100) NOT NULL,
adresse_agent VARCHAR(100) NOT NULL,
CONSTRAINT pk_id_agent PRIMARY KEY(id_agent)
)
--creation de table client
CREATE TABLE client(
id_client INTEGER IDENTITY(1,1)  NOT NULL,
nomClient VARCHAR(100) NOT NULL,
prenomClient VARCHAR(100) NOT NULL,
adressClient VARCHAR(100) NOT NULL,
typeClient VARCHAR(100) NOT NULL,
emailClient VARCHAR(150) NOT NULL,
telClient INTEGER NOT NULL,
id_agent INTEGER NOT NULL,
CONSTRAINT pk_id_client PRIMARY KEY(id_client),
CONSTRAINT fk_id_agent_C FOREIGN KEY(id_agent) REFERENCES agent(id_agent)
)
--creation de la table appartement 
CREATE TABLE appartement(
id_appart INTEGER IDENTITY(1,1)  NOT NULL,
prin_metre_carre FLOAT NOT NULL,
id_etage INTEGER NOT NULL,
id_residence INTEGER NOT NULL,
id_type_appart INTEGER NOT NULL,
id_agent INTEGER NOT NULL,
id_client INTEGER NOT NULL
CONSTRAINT pk_id_appart PRIMARY KEY(id_appart),
CONSTRAINT fk_id_etage_A FOREIGN KEY (id_etage) REFERENCES etage(id_etage),
CONSTRAINT fk_id_residence_A FOREIGN KEY (id_residence) REFERENCES residence(id_residence),
CONSTRAINT fk_id_type_appart_A FOREIGN KEY(id_type_appart) REFERENCES type_appartement(id_type_appart),
CONSTRAINT fk_id_agent_A FOREIGN KEY(id_agent) REFERENCES agent(id_agent),
CONSTRAINT fk_id_client_A FOREIGN KEY(id_client) REFERENCES client(id_client)
)
--creation de la table garage
CREATE TABLE garage(
id_garage INTEGER IDENTITY(1,1)  NOT NULL,
parking VARCHAR(100) NOT NULL,
id_residence INTEGER NOT NULL,
id_cat_garage INTEGER NOT NULL,
id_type_garage INTEGER NOT NULL,
id_client INTEGER NOT NULL,
id_agent INTEGER NOT NULL,
CONSTRAINT pk_id_garage PRIMARY KEY(id_garage),
CONSTRAINT fk_id_residence_G FOREIGN KEY (id_residence) REFERENCES residence(id_residence),
CONSTRAINT fk_id_cat_garage_G FOREIGN KEY(id_cat_garage) REFERENCES categorie_garage(id_cat_garage),
CONSTRAINT fk_id_type_garage_G FOREIGN kEY(id_type_garage) REFERENCES type_garage(id_type_garage),
CONSTRAINT fk_id_agent_G FOREIGN KEY(id_agent) REFERENCES agent(id_agent),
CONSTRAINT fk_id_client_G FOREIGN KEY(id_client) REFERENCES client(id_client)

)