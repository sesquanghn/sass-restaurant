module Tables
  class UpdateTableForm < BaseTableForm
    def submit
      table = Table.find(id)
      return table.discard if _destroy

      validate!
      table.update!(attributes)
    end
  end
end
