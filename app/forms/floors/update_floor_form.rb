module Floors
  class UpdateFloorForm < BaseFloorForm
    def submit
      validate!

      ActiveRecord::Base.transaction do
        floor = Floor.find(id).tap { |floor| floor.update!(attributes) }
        table_attributes.each do |tbl|
          tbl_params = tbl.merge(floor_id: floor.id)
          if tbl[:id].present?
            Tables::UpdateTableForm.new(tbl_params).submit
            next
          end

          Tables::CreateTableForm.new(tbl_params).submit
        end

        floor
      end
    end
  end
end
