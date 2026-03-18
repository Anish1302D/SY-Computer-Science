import sqlite3

conn = sqlite3.connect("college.db")
cursor = conn.cursor()

cursor.execute("SELECT * FROM students")

rows = cursor.fetchall()

print("ID  Name     Marks")
print("----------------------")

for row in rows:
    print(row[0], row[1], row[2])

conn.close()