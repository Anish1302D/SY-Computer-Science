import psycopg2

conn = psycopg2.connect(
    host="localhost",
    database="testdb",
    user="postgres",
    password="your_password"
)

cursor = conn.cursor()

# Create table
cursor.execute("""
CREATE TABLE IF NOT EXISTS employees(
id SERIAL PRIMARY KEY,
name VARCHAR(50),
salary INT
)
""")

n = int(input("Enter number of employees: "))

count = 0

for i in range(n):
    name = input("Enter name: ")
    salary = int(input("Enter salary: "))

    cursor.execute("INSERT INTO employees(name,salary) VALUES(%s,%s)", (name, salary))
    count += 1

conn.commit()

print("Rows inserted:", count)

conn.close()