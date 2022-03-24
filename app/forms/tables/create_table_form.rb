module Tables
  class CreateTableForm < BaseTableForm
    def submit
      validate!
      Table.create!(attributes)
    end
  end
end
