ROM::SQL.migration do
  change do
    create_table(:users) do
      primary_key :id
      String :email
      String :password_digest
      DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      DateTime :updated_at, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end
