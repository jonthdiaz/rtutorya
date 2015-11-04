library(RPostgreSQL)
drv <- dbDriver("PostgreSQL")
# connect db
con <- dbConnect(drv, host="localhost", port=5432,user="tutorya_admin",
                 password="tut0ry4", dbname="tutorya_db")

users = dbGetQuery(con,"select * from profiles_user")
students = dbGetQuery(con,"select * from profiles_student")
tutors = dbGetQuery(con,"select * from profiles_tutor")
payments = dbGetQuery(con, "select * from billing_pagosonlinepayment ")

head(users)
str(users)
summary(users$id)
plot(users$id)
plot(payments$transaction_number)

barplot(payments$payment_ptr_id)

# exporta informacion a excel
# write.table(payments, "prueba.xls", sep="\t")


#tt = users[users$username=="jefferson.sur@hotmail.com",]

# Disconnect db
#dbDisconnect(con)
