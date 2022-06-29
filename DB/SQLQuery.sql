/*filter*/
Select CourseID,CourseName from Course


/*select cac thong tin cua 1 group co CourseID = > */
Select g.GroupID,g.GroupName,g.LecturerID,c.CourseID,c.CourseName from [Group] g join Course c On g.CourseID = c.CourseID
Where c.CourseID = ?


/* select tat cac cac sinh vien co groupID = ? */
Select s.StudentID,s.StudentName,s.Gender,s.StudentMail,
g.GroupID,g.GroupName,g.LecturerID,g.CourseID 
from Student s join StudentGroup sg on s.StudentID = sg.StudentID
join [Group] g on sg.GroupID = g.GroupID
Where g.GroupID = ?




/*take attendence*/
INSERT INTO [dbo].[Attendance]([StudentID],[SessionID],[Status],[Recordtime],[Comment])VALUES(?,?,?,?,?)


Select se.SessionID,se.SessionNumber,se.SessionDate,se.Semester,r.RoomID,t.SlotID,g.GroupID,
t.[TimeStart],t.[TimeEnd],g.GroupName,l.LecturerID,c.CourseID,c.CourseName,l.LecturerName
From 
[Session] se join Timeslot t on se.SlotID = t.SlotID
join Room r on se.RoomID = r.RoomID 
join [Group] g on se.GroupID = g.GroupID
join Course c on g.CourseID =  c.CourseID
join Lecturer l on g.LecturerID = l.LecturerID
Where l.LecturerID = '?'  AND se.SessionDate = '?'


Select s.StudentID,s.StudentName,s.StudentMail,
g.GroupID,g.GroupName,g.LecturerID,g.CourseID 
from Student s join StudentGroup sg on s.StudentID = sg.StudentID
join [Group] g on sg.GroupID = g.GroupID
Where g.GroupID = ?





/*schedule*/
Select SlotID,[TimeStart],[TimeEnd] from Timeslot

Select ts.SlotID,ts.[TimeStart],ts.[TimeEnd],se.SessionID,se.SessionNumber,se.SessionDate,se.Semester,se.RoomID,
g.GroupID,g.GroupName,g.LecturerID,c.CourseID,c.CourseName from Timeslot ts
join [Session] se On ts.SlotID = se.SlotID 
join [Group] g On se.GroupID = g.GroupID
join Course c On g.CourseID = c.CourseID
Where SessionDate Between '?' And '?' AND g.LecturerID = '?'