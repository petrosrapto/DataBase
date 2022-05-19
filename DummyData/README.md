In order to insert data to your Data Base:
1. You must have already created the schema using the file "create.sql"
2. Type "sudo mysql -u root -p" to access MySQL
3. Type "source /<absolute_path_of_file>" to run the commands included in each file.

Warning! You must insert data respecting the foreign keys constraints!
(You must insert the primary relation before referencing it to another relation)

Notes:
1. The Dummy Data are displayed at .xlsx files.
2. .txt contain the data in a txt format
3. "insert.cpp" was created to convey the txt data to
    MySQL code.
