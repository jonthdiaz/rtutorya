library(RPostgreSQL)
drv <- dbDriver("PostgreSQL")
# connect db
con <- dbConnect(drv, host="localhost", port=5432,user="tutorya_admin",
                 password="tut0ry4", dbname="tutorya_db")

users = dbGetQuery(con,"select * from profiles_user")
students = dbGetQuery(con,"select * from profiles_student")
tutors = dbGetQuery(con,"select * from profiles_tutor")
payments = dbGetQuery(con, "select * from billing_pagosonlinepayment ")
groups = dbGetQuery(con, "select * from courses_coursegroupstudent")
groups_course = dbGetQuery(con, "select * from courses_coursegroupstudent_courses")
groups_student =dbGetQuery(con, "select * from courses_coursegroupstudent_students")
users_student <- merge(students, users, by.x = "user_id",by.y = "id")
courses_groups <- merge(groups_student,groups, by.x = "coursegroupstudent_id", by.y = "id")
courses_groups_student <- merge(courses_groups, users_student, by.x="student_id", by.y = "id")


sort(courses_groups_student$coursegroupstudent_id)
# student class
student_class <- dbGetQuery(con,"select * from courses_coursestudentclass")
courses_groups_student$student_id
classes <- merge(student_class, courses_groups_student,by.x="student_id", by.y="student_id")




