USE airline;

CREATE TABLE flight (
  flight_id INT NOT NULL AUTO_INCREMENT,
  flight_number VARCHAR(30) NOT NULL,
  departure DATETIME NOT NULL,
  arrival DATETIME NOT NULL,
  status VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (flight_id)
);

-- Insert data into the flight table
INSERT INTO flight (flight_number, departure, arrival, status)
VALUES
  ("FR2513", "2023-09-01 08:30:00", "2023-09-01 13:20:00", "delayed"),
  ("PR1913", "2023-11-01 06:55:00", "2023-12-01 04:20:00", "cancelled"),
  ("IST1213", "2023-09-01 08:30:00", "2023-09-01 12:00:00", "on_time"),
  ("BH7513", "2023-09-01 08:30:00", "2023-09-01 12:45:00", "on_schedule"),
  ("LN8813", "2023-10-01 05:30:00", "2023-09-01 09:00:00", "on_time"),
  ("FX3213", "2023-12-01 06:15:00", "2023-12-01 11:40:00", "on_schedule");