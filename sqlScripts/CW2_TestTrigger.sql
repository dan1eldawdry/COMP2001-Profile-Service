-- looks at log table
SELECT * FROM CW2.UserLog;

-- adds a test user
--INSERT INTO CW2.USERS (Firstname, Lastname, Username, Email, Password, Bio, CityID)
--VALUES ('Test', 'Log', 'Test Log', 'log@test.com', 'logpassword', 'the log test', 3);

-- checks if adding user worked
SELECT * FROM CW2.UserLog;

-- see new user
SELECT * FROM CW2.USERS WHERE Username = 'Test Log'