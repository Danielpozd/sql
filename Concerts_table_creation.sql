
-- таблица town, где хранится информация о городах
Create table town(
	id int not null auto_increment,
	name varchar(30) not null,
	primary key(id),
	UNIQUE(name)
);

-- таблица concerthall, где хранится информация о концертных залах города
Create table concerthall(
	id int not null auto_increment,
	townid int not null,
	name varchar(30) not null,
	availseats int not null,
	primary key(id),
	UNIQUE(name, availseats),
	foreign key(townid) references town (id) on DELETE RESTRICT on UPDATE CASCADE
);

-- таблица instrument, где хранится информация об инструментах, на которых играют испольнители
Create table instrument(
	id int not null auto_increment,
	name varchar(30) not null,
	primary key(id),
	UNIQUE(name)
);

-- таблица performer, где хранится информация об испольнителях
Create table performer(	
	id int not null auto_increment,
	surname varchar(30) not null,
	name varchar(30) not null,
	fathername varchar(30),
	instrumentid int not null,
	primary key(id),
	UNIQUE(surname, name, fathername),
	foreign key(instrumentid) references instrument (id) on DELETE RESTRICT on UPDATE CASCADE
);

-- таблица concertschedule, где хранится информация о расписании концертов
Create table concertschedule(
	id int not null auto_increment,
	performerid int not null,
	concerthallid int not null,
	concertdate datetime not null,
	priceticket int not null,
	primary key(id),
	UNIQUE(performerid, concerthallid, concertdate),
	foreign key(performerid) references performer (id) on DELETE RESTRICT on UPDATE CASCADE,
	foreign key(concerthallid) references concerthall (id) on DELETE RESTRICT on UPDATE CASCADE
);
	
