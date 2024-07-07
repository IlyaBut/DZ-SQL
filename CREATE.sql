create table if not exists Music_genres (
	id SERIAL PRIMARY KEY, 
	name VARCHAR(60) NOT NULL
);
create table if not exists Performers (
	id SERIAL PRIMARY KEY,
	group_name VARCHAR(60) NOT NULL
);
create table if not exists First_condition (
	music_genres_id INTEGER REFERENCES Music_genres(id),
	performers_id INTEGER REFERENCES Performers(id),
	CONSTRAINT pk PRIMARY KEY(music_genres_id,performers_id)
);
create table if not exists Album (
	id SERIAL PRIMARY KEY,
	name_album VARCHAR(60) NOT NULL,
	year_of_issue date NOT NULL
);
create table if not exists Second_condition (
	album_id INTEGER REFERENCES Album(id),
	performers_id INTEGER REFERENCES Performers(id),
	CONSTRAINT tk PRIMARY KEY(album_id,performers_id)
);
create table if not exists Collection (
	id SERIAL PRIMARY KEY,
	name_collection VARCHAR(60) NOT NULL,
	year_of_issue date NOT NULL
);
create table if not exists Music_track (
	id INTEGER PRIMARY KEY,
	name_track VARCHAR(60),
	duration_in_second INTEGER,
);

create table if not exists Collect_and_track (
	music_track_id INTEGER REFERENCES Music_track(id),
	collection_id INTEGER REFERENCES Collection(id),
	CONSTRAINT fk PRIMARY KEY(music_track_id,collection_id)
);

-- Добавил столбец под внешний ключ
alter table Music_track
add album_id integer;
alter table Music_track
add foreign key (album_id) references Album (id); 
