require "sqlite3"

DB = SQLite3::Database.new("patients_doctors.sqlite")
# DB.results_as_hash = true

rows = DB.execute("SELECT * FROM doctors;")
p rows.flatten