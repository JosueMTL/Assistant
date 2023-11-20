CREATE TABLE IF NOT EXISTS users (
                                     id SERIAL PRIMARY KEY,
                                     namee VARCHAR(20) NOT NULL,
    gmail VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL
    );

CREATE TABLE IF NOT EXISTS configurations (
                                              id SERIAL PRIMARY KEY,
                                              volume INT,
                                              alertTones VARCHAR(50),
    users_id INT REFERENCES users(id)
    );

CREATE TABLE IF NOT EXISTS reminders (
                                         id SERIAL PRIMARY KEY,
                                         title VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    status ENUM('pending', 'completed', 'cancelled') NOT NULL,
    active BOOLEAN,
    users_id INT REFERENCES users(id),
    patienteInfo_id INT REFERENCES patienteInfo(id)
    );

CREATE TABLE IF NOT EXISTS patienteInfo (
                                            id SERIAL PRIMARY KEY,
                                            name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    date_of_diagnosis DATE NOT NULL,
    stage INT NOT NULL,
    users_id INT REFERENCES users(id)
    );

CREATE TABLE IF NOT EXISTS interactions (
                                            id SERIAL PRIMARY KEY,
                                            patienteInfo_id INT REFERENCES patienteInfo(id),
    user_mensaje VARCHAR(200) NOT NULL,
    asisstant_response VARCHAR(200) NOT NULL,
    date_time_interactions TIMESTAMP NOT NULL,
    request VARCHAR(255),
    rfid_tags_id INT REFERENCES rfid_tags(id)
    );

CREATE TABLE IF NOT EXISTS rfid_tags (
                                         id SERIAL PRIMARY KEY,
                                         interactions_id INT REFERENCES interactions(id),
    users_id INT REFERENCES users(id),
    read_date TIMESTAMP NOT NULL,
    location VARCHAR(200) NOT NULL
    );
