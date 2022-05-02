Create Table  users(
    id	serial PRIMARY KEY,
	username	TEXT NOT NULL,
	hash	TEXT NOT NULL,
	income	REAL NOT NULL DEFAULT 60000.00,
	registerdate	TEXT NOT NULL,
	lastlogin	TEXT NOT NULL
);

CREATE TABLE budgets (
	id	serial PRIMARY KEY,
	name	TEXT NOT NULL,
	amount	REAL,
	user_id	INTEGER NOT NULL,
	year Real 
	CONSTRAINT budgets_user_id_fkey FOREIGN KEY (user_id)
		REFERENCES users (id) 
		ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE categories (
	id	serial PRIMARY KEY,
	name	TEXT NOT NULL
);

CREATE TABLE  userCategories (
	category_id	INTEGER NOT NULL,
	user_id	INTEGER NOT NULL,
	CONSTRAINT userCategories_category_id_fkey FOREIGN KEY (category_id)
		REFERENCES categories (id) 
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT userCategories_user_id_fkey FOREIGN KEY (user_id)
		REFERENCES users (id) 
		ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE budgetCategories (
	budgets_id	INTEGER NOT NULL,
	category_id	INTEGER NOT NULL,
	amount	REAL NOT NULL DEFAULT 0,
	CONSTRAINT budgetCategories_budgets_id_fkey FOREIGN KEY (budgets_id)
		REFERENCES budgets(id) 
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT budgetCategories_category_id_fkey FOREIGN KEY (category_id)
		REFERENCES categories (id) 
		ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE payers (
	user_id	INTEGER NOT NULL,
	name	TEXT NOT NULL,
	CONSTRAINT payers_user_id_fkey FOREIGN KEY (user_id)
		REFERENCES users (id) 
		ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE expenses (
	id	serial PRIMARY KEY,
	description	TEXT NOT NULL,
	category	TEXT NOT NULL,
	expensedate	TEXT NOT NULL,
	amount	REAL NOT NULL,
	payer	TEXT NOT NULL,
	submittime	TEXT NOT NULL,
	user_id	INTEGER,
	CONSTRAINT budgets_user_id_fkey FOREIGN KEY (user_id)
		REFERENCES users (id) 
		ON UPDATE NO ACTION ON DELETE NO ACTION
);

INSERT INTO categories(name) VALUES ('Groceries');
INSERT INTO categories(name) VALUES ('Housing');
INSERT INTO categories(name) VALUES ('Utilities');
INSERT INTO categories(name) VALUES ('Dining Out');
INSERT INTO categories(name) VALUES ('Shopping');
INSERT INTO categories(name) VALUES ('Travel');
INSERT INTO categories(name) VALUES ('Entertainment');
INSERT INTO categories(name) VALUES ('Other');