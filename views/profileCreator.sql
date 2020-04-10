CREATE TABLE IF NOT EXISTS football_games (
  visitor_name VARCHAR(30),       /* Name of the visiting team                     */
  home_score SMALLINT NOT NULL,   /* Final score of the game for the Buffs         */
  visitor_score SMALLINT NOT NULL,/* Final score of the game for the visiting team */
  game_date DATE NOT NULL,        /* Date of the game                              */
  players INT[] NOT NULL,         /* This array consists of the football player ids (basically a foreign key to the football_player.id) */
  PRIMARY KEY(visitor_name, game_date) /* A game's unique primary key consists of the visitor_name & the game date (this assumes you can't have multiple games against the same team in a single day) */
);

CREATE TABLE IF NOT EXISTS football_players(
  id SERIAL PRIMARY KEY,       /* Unique identifier for each player (it's possible multiple players have the same name/similiar information) */
  name VARCHAR(50) NOT NULL,   /* The player's first & last name */
  year VARCHAR(3),             /* FSH - Freshman, SPH - Sophomore, JNR - Junior, SNR - Senior */
  major VARCHAR(4),            /* The unique 4 character code used by CU Boulder to identify student majors (ex. CSCI, ATLS) */
  passing_yards SMALLINT,      /* The number of passing yards in the players entire football career  */
  rushing_yards SMALLINT,      /* The number of rushing yards in the players entire football career  */
  receiving_yards SMALLINT,    /* The number of receiving yards in the players entire football career*/
  img_src VARCHAR(200)         /* This is a file path (absolute or relative), that locates the player's profile image */
);

INSERT INTO football_games(visitor_name, home_score, visitor_score, game_date, players)
VALUES('Colorado State', 45, 13, '20190831', ARRAY [1,2,3,4,5]),
('Nebraska', 33, 28, '20190908', ARRAY [2,3,4,5,6]),
('New Hampshire', 45, 14, '20190915', ARRAY [3,4,5,6,7]),
('UCLA', 38, 16, '20190928', ARRAY [4,5,6,7,8]),
('Arizona State', 28, 21, '20191006', ARRAY [5,6,7,8,9]),
('Southern California', 20, 31, '20191013', ARRAY [6,7,8,9,10]),
('Washington', 13, 27, '20191020', ARRAY [7,8,9,10,1]),
('Oregon State', 34, 41, '20191027', ARRAY [8,9,10,1,2]),
('Arizona', 34, 42, '20191102', ARRAY [9,10,1,2,3]),
('Washington State', 7, 31, '20191110', ARRAY [10,1,2,3,4]),
('Utah', 7, 30, '20191117', ARRAY [1,2,3,4,5]),
('California', 21, 33, '20191124', ARRAY [2,3,4,5,6])
;

INSERT INTO football_players(name, year, major, passing_yards, rushing_yards, receiving_yards)
VALUES('Cedric Vega', 'FSH', 'ARTS', 15, 25, 33),
('Myron Walters', 'SPH', 'CSCI', 32, 43, 52),
('Javier Washington', 'JNR', 'MATH', 1, 61, 45),
('Wade Farmer', 'SNR', 'ARTS', 14, 55, 12),
('Doyle Huff', 'FSH', 'CSCI', 23, 44, 92),
('Melba Pope', 'SPH', 'MATH', 13, 22, 45),
('Erick Graves', 'JNR', 'ARTS', 45, 78, 98 ),
('Charles Porter', 'SNR', 'CSCI', 92, 102, 125),
('Rafael Boreous', 'JNR', 'MATH', 102, 111, 105),
('Jared Castillo', 'SNR', 'ARTS', 112, 113, 114);