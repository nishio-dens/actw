connection = ActiveRecord::Base.connection

tables = %w[categories]

tables.each do |table|
  Rails.logger.log("TRUNCATE TABLE #{table}")
  connection.execute("TRUNCATE #{table}")
end

Dir.glob("db/seed_sql/*.sql").each do |sql_file|
  Rails.logger.log("load data #{sql_file}")
  sql = File.read(sql_file)
  statements = sql.split(/;$/)
  statements.pop

  ActiveRecord::Base.transaction do
    statements.each do |statement|
      connection.execute(statement)
    end
  end
end
