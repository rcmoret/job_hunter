class CreateUserConfigViews < ActiveRecord::Migration[7.0]
  VIEW_NAME = "user_configuration_view".freeze
  UP_QUERY = <<-SQL.freeze
    CREATE VIEW #{VIEW_NAME} AS
      SELECT u.id as user_id,
             uco.description,
             coalesce(uc.value, uco.default_value) as value
      FROM user_configuration_options uco
      LEFT outer join user_configurations uc on uc.user_configuration_option_id = uco.id
      LEFT outer join users u on u.id = uc.user_id
  SQL

  def up
    ApplicationRecord.connection.exec_query(UP_QUERY)
  end

  def down
    ApplicationRecord.connection.exec_query("DROP VIEW IF EXISTS #{VIEW_NAME}")
  end
end
