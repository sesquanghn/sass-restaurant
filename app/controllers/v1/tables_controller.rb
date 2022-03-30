class V1::TablesController < V1::AuthController
  before_action :authenticate_v1_user!

  def index
    @tables = Table.all
  end
end
