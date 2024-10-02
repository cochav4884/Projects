DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
    project_id INT NOT NULL,
    PRIMARY KEY (project_id) AUTO_INCREMENT,
    project_name VARCHAR(128) NOT NULL,
    estimated_hours DECIMAL(7,2) NULL,
    actual_hours DECIMAL(7,2) NULL,
    difficulty INT NULL,
    notes TEXT NULL
);

CREATE TABLE category (
    category_id INT NOT NULL,
    PRIMARY KEY (category_id),
    category_name VARCHAR(128) NOT NULL
);

CREATE TABLE material (
    material_id INT NOT NULL,
    PRIMARY KEY (material_id),
    project_id INT NOT NULL,
    FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
    material_name VARCHAR(128) NOT NULL,
    num_required INT NULL,
    cost DECIMAL(7,2) NULL
);

CREATE TABLE step (
    step_id INT NOT NULL,
    PRIMARY KEY (step_id),
    project_id INT NOT NULL,
    FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
    step_text TEXT NOT NULL,
    step_order INT NOT NULL
);

CREATE TABLE project_category (
    project_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (project_id, category_id),
    UNIQUE KEY (project_id, category_id),
    FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE
);
