HighchartImageApi::Application.routes.draw do

  scope "/highchartsapi" do
    resources "chart_images", only: [:create]
    resource :status, only: [:show], controller: :status
  end
end
