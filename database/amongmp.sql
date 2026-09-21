CREATE DATABASE IF NOT EXISTS amongmp
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE amongmp;

CREATE TABLE IF NOT EXISTS accounts (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(24) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    admin_level TINYINT UNSIGNED NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_login_at TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uq_accounts_username (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS characters (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    account_id INT UNSIGNED NOT NULL,
    name VARCHAR(24) NOT NULL,
    skin SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    color INT UNSIGNED NOT NULL DEFAULT 4294967295,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_characters_account (account_id),
    CONSTRAINT fk_characters_account
        FOREIGN KEY (account_id) REFERENCES accounts(id)
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS player_statistics (
    character_id INT UNSIGNED NOT NULL,
    games_played INT UNSIGNED NOT NULL DEFAULT 0,
    wins INT UNSIGNED NOT NULL DEFAULT 0,
    losses INT UNSIGNED NOT NULL DEFAULT 0,
    crewmate_games INT UNSIGNED NOT NULL DEFAULT 0,
    crewmate_wins INT UNSIGNED NOT NULL DEFAULT 0,
    impostor_games INT UNSIGNED NOT NULL DEFAULT 0,
    impostor_wins INT UNSIGNED NOT NULL DEFAULT 0,
    tasks_completed INT UNSIGNED NOT NULL DEFAULT 0,
    meetings_called INT UNSIGNED NOT NULL DEFAULT 0,
    votes_cast INT UNSIGNED NOT NULL DEFAULT 0,
    playtime_seconds BIGINT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (character_id),
    CONSTRAINT fk_statistics_character
        FOREIGN KEY (character_id) REFERENCES characters(id)
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
