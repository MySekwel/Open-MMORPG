
CREATE TABLE
IF NOT EXISTS
users(
    user_id INT NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(24),
    user_discord_id VARCHAR(20),
    user_password VARCHAR(60),
    user_ip VARCHAR(15),
    PRIMARY KEY(user_id),
    UNIQUE KEY(user_name)
);

CREATE TABLE
IF NOT EXISTS
stats(
    user_id INT NOT NULL AUTO_INCREMENT,
    stat_level INT(11),
    stat_exp INT(11),
    stat_hunger FLOAT,
    stat_thirst FLOAT,
    stat_health FLOAT,
    stat_armor FLOAT,
    stat_stamina FLOAT,
    stat_strength FLOAT,
    stat_speed FLOAT,
    stat_weapon_skill FLOAT,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id)
    REFERENCES
    users(user_id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT
);

CREATE TABLE 
IF NOT EXISTS 
class(
    user_id INT NOT NULL AUTO_INCREMENT,
    class_position_x FLOAT,
    class_position_y FLOAT,
    class_position_z FLOAT,
    class_position_a FLOAT,
    class_position_interior INT(11),
    class_position_world INT(11),
    class_class VARCHAR(16),
    class_nationality VARCHAR(16),
    class_gender VARCHAR(6),
    class_age TINYINT(4),
    class_accent VARCHAR(16),
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id)
    REFERENCES
    users(user_id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT
);

CREATE TABLE
IF NOT EXISTS
inventory(
    user_id INT NOT NULL AUTO_INCREMENT,
    inv_cash INT(11),
    inv_counterfeit_cash INT(11),
    inv_medkit INT(11),
    inv_bandage INT(11),
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id)
    REFERENCES
    users(user_id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT
);