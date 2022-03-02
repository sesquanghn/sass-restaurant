class V1::PrefecturesController < V1::ApiController
  def index
    @prefectures = YAML.load_file(Rails.root.join('lib/master_data/prefecture_code.yml')).values
  end
end
