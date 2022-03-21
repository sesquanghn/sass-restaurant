module Floors
  class CreateFloorForm < BaseFloorForm
    def submit
      validate!

      ActiveRecord::Base.transaction do
        floor = Floor.create!(attributes)
        table_attributes.each do |tbl|
          tbl_params = tbl.merge(floor_id: floor.id)
          Tables::CreateTableForm.new(tbl_params).submit
        end

        floor
      end
    end
  end
end
