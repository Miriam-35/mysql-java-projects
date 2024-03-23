DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;

CREATE TABLE project(
  project_id INT NOT NULL AUTO_INCREMENT,
  project_name VARCHAR(128) NOT NULL,
  estimated_hours DECIMAL(7,2),
  actual_hours DECIMAL(7,2),
  difficulty INT,
  notes TEXT,
  PRIMARY KEY (project_id)
);

CREATE TABLE category(
  category_id INT NOT NULL AUTO_INCREMENT,
  category_name VARCHAR(128) NOT NULL,
  PRIMARY KEY (category_id)
);

CREATE TABLE project_category(
  project_id INT NOT NULL,
  category_id INT NOT NULL,
  FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
  UNIQUE KEY (project_id, category_id)
);

CREATE TABLE step(
  step_id INT NOT NULL AUTO_INCREMENT,
  project_id INT NOT NULL,
  step_text TEXT NOT NULL,
  step_order INT NOT NULL,
  PRIMARY KEY (step_id),
  FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE material(
  material_id INT NOT NULL AUTO_INCREMENT,
  project_id INT NOT NULL,
  material_name VARCHAR(128) NOT NULL,
  num_required INT,
  cost DECIMAL(7,2),
  PRIMARY KEY (material_id),
  FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

// Windows

INSERT INTO project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes)
VALUES (2, 'Remove Window', 2, 3, 4, 'Remove window from outside');

INSERT INTO project_category (project_id, category_id)
VALUES (2, 1);

INSERT INTO step (step_id, project_id, step_text, step_order)
VALUES (2, 2, 'Remove storm windows', 1);

INSERT INTO step (step_id, project_id, step_text, step_order)
VALUES (3, 2, 'Score the window edge', 2);

INSERT INTO step (step_id, project_id, step_text, step_order)
VALUES (4, 2, 'Remove sash weights or springs', 3);

INSERT INTO step (step_id, project_id, step_text, step_order)
VALUES (5, 2, 'Identify stops', 4);

INSERT INTO step (step_id, project_id, step_text, step_order)
VALUES (6, 2, 'Score and remove stops', 5);

INSERT INTO step (step_id, project_id, step_text, step_order)
VALUES (7, 2, 'Fill holes and attach new pieces for stability', 6);

INSERT INTO material (material_id, project_id, material_name, num_required, cost)
VALUES (2, 2, 'Wood filler', 1, 12.00);


// Door Hanger 

INSERT INTO project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes)
VALUES (1, 'Hang a Door', 4, 3, 3, 'Use the door hangers from Home Depot');

INSERT INTO category (category_id, category_name)
VALUES (1, 'Doors and Windows');

INSERT INTO project_category (project_id, category_id)
VALUES (1, 1);

INSERT INTO step (step_id, project_id, step_text, step_order)
VALUES (1, 1, 'Screw door hangers on the top and bottom of each side of the door frame', 1);

INSERT INTO material (material_id, project_id, material_name, num_required, cost)
VALUES (1, 1, '2-inch screws', 20, 10.00);

