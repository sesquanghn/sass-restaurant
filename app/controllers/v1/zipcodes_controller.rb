class V1::ZipcodesController < V1::ApiController
  def show
    @address = Jpostcode.find(params[:id])
  end
end
