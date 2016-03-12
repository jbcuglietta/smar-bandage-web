DROP TABLE IF EXISTS bandage_record;
DROP TABLE IF EXISTS humidity_record;
DROP TABLE IF EXISTS temp_record;
DROP TABLE IF EXISTS moisture_record;
DROP TABLE IF EXISTS subscriptions;
DROP TABLE IF EXISTS patient;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  provider_id INT(5) UNSIGNED AUTO_INCREMENT,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(30) NOT NULL,
  user_type CHAR(1) NOT NULL,
  CHECK (user_type in ('a', 'n')),
  PRIMARY KEY (provider_id)
);

CREATE TABLE patient (
  patient_id INT(5) UNSIGNED AUTO_INCREMENT,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  PRIMARY KEY (patient_id)
);

CREATE TABLE subscriptions (
  care_provider INT(5) UNSIGNED NOT NULL,
  patient_id INT(5) UNSIGNED NOT NULL,
  PRIMARY KEY (care_provider,patient_id),
  FOREIGN KEY (care_provider) REFERENCES users(provider_id),
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE humidity_record (
  record_id INT(10) UNSIGNED NOT NULL,
  patient_id INT(5) UNSIGNED NOT NULL,
  bandage_id INT(5) UNSIGNED NOT NULL,
  creation_time DATETIME,
  value FLOAT(8,4) NOT NULL,
  PRIMARY KEY (record_id),
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE temp_record (
  record_id INT(10) UNSIGNED NOT NULL,
  patient_id INT(5) UNSIGNED NOT NULL,
  bandage_id INT(5) UNSIGNED NOT NULL,
  creation_time DATETIME,
  value FLOAT(8,4) NOT NULL,
  PRIMARY KEY (record_id),
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE moisture_record (
  record_id INT(10) UNSIGNED NOT NULL,
  patient_id INT(5) UNSIGNED NOT NULL,
  bandage_id INT(5) UNSIGNED NOT NULL,
  creation_time DATETIME,
  value FLOAT(8,4) NOT NULL,
  PRIMARY KEY (record_id),
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE bandage_record (
  record_id INT(10) UNSIGNED NOT NULL,
  patient_id INT(5) UNSIGNED NOT NULL,
  bandage_id INT(5) UNSIGNED NOT NULL,
  creation_time DATETIME,
  value FLOAT(8,4) NOT NULL,
  PRIMARY KEY (record_id),
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE alerts (
  patient_id INT(5) UNSIGNED NOT NULL,
  bandage_id INT(5) UNSIGNED NOT NULL,
  alert_type CHAR(1) NOT NULL,
  creation_time DATETIME,
  viewed boolean NOT NULL,
  viewed_by_user INT(5),
  CHECK (alert_type in ('h','t','m','r')),
  value FLOAT(8,4) NOT NULL,
  PRIMARY KEY (record_id),
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
  FOREIGN KEY (viewed_by_user) REFERENCES users(provider_id)
);
