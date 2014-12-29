connection = ActiveRecord::Base.connection

Dir.glob("db/seed_sql/*.sql").each do |sql_file|
  sql = File.read(sql_file)
  statements = sql.split(/;$/)
  statements.pop

  ActiveRecord::Base.transaction do
    statements.each do |statement|
      connection.execute(statement)
    end
  end
end
