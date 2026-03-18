import sqlite3

conn = sqlite3.connect("college.db")
cursor = conn.cursor()

# Create table
cursor.execute("""
CREATE TABLE IF NOT EXISTS students(
id INTEGER PRIMARY KEY,
name TEXT,
marks INTEGER
)
""")

# Insert 5 records
students = [
(1,"Madhura",85),
(2,"Anish",78),
(3,"Riya",90),
(4,"Aman",67),
(5,"Neha",88)
]

cursor.executemany("INSERT INTO students VALUES (?,?,?)", students)

conn.commit()

print("Record inserted successfully")

conn.close()