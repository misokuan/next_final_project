require "rails_helper"


RSpec.describe "Homepage request", :type => :request do

  it "shows the homepage" do
    get "/home"
    expect(response).to render_template(:index)
  end

  it "shows the navigation bar" do
    get "/home"
    expect(response.body).to include("mainNav")
  end
end
