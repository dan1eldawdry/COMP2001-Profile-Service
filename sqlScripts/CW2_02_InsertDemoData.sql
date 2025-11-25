-- data into CITY table
INSERT INTO CW2.CITY (CityName) VALUES
('Plymouth, Devon, England'), --CityID=1
('Exeter, Devon, England'), -- CityID=2
('Taunton, Somerset, England'); -- CityID=3
GO

-- data into ACTIVITY table
INSERT INTO CW2.ACTIVITY (ActivityName) VALUES
('Hiking'), -- ActivityID=1
('Running'), -- ActivityID=2
('Cycling'); -- ActivityID=3
GO

-- data into USERS table
-- CityID mapping is 1=Plymouth, 2=Exeter, 3=Taunton
INSERT INTO CW2.USERS (Firstname, Lastname, Username, Email, Password, Bio, CityID) VALUES
('Grace', 'Hopper', 'Grace Hopper', 'grace@plymouth.ac.uk', 'ISAD123!', 'Like exploring trails', 1),
('Tim', 'Berners-Lee', 'Tim Berners-Lee', 'tim@plymouth.ac.uk', 'COMP2001!', 'Enjoy running long distance', 2),
('Ada', 'Lovelace', 'Ada Lovelace', 'ada@plymouth.ac.uk', 'insecurePassword', 'Passionate about hiking', 3);
GO

-- data into USERACTIVITY linking table
INSERT INTO CW2.USERACTIVITY (UserID, ActivityID) VALUES 
(1, 1), (1, 3), -- Grace is id=1, activities are hiking=1 and cycling=3
(2, 2), -- Tim is id=2, activity is running=2
(3, 1); -- Ada is id=3, activity is hiking=1
GO
