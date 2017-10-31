ROM::SQL.migration do
  change do
    create_table(:tasks) do
      primary_key :id
      String :description
      Boolean :completed
      foreign_key :user_id, :users
      DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      DateTime :updated_at, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end
