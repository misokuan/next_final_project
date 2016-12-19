require "rails_helper"

RSpec.describe "Profile view request", :type => :request do
before(:each) do
    @user = User.create(email: "ejaytkm@gmail.com", password: "edelix123")
    @profile = Profile.create(description: "Just a boy who loves the wind", first_name: 'ejay', address: "12-8-19 Hartamas Regency", city: "Kuala Lumpur", interest: "gym, drink", gender: "male", user_id: @user.id)
  end

  it "Profile show get response page" do
    get "/users/#{@user.id}/profiles/#{@profile.id}"
    expect(response).to render_template(:show)
  end

  it "Profile shows the users details" do
    get "/users/#{@user.id}/profiles/#{@profile.id}"
    expect(response.body).to include("Just a boy who loves the wind")
    expect(response.body).to include("Ejay")
    expect(response.body).to include("12-8-19 Hartamas Regency")
  end

  it "Profile shows edit page" do 
    get "/users/#{@user.id}/profiles/#{@profile.id}/edit"

    expect(response.body).to include("username")
    expect(response.body).to include("description")
    expect(response.body).to include("input")
  end

  # it "Profile shows the users details" do
  #   get "/users/#{@user.id}/profiles/#{@profile.id}"
  #   expect(response).to render_template(:new)

  #   post "/widgets", :widget => {:name => "My Widget"}

  #   expect(response).to redirect_to(assigns(:widget))
  #   follow_redirect!

  #   expect(response).to render_template(:show)
  #   expect(response.body).to include("Widget was successfully created.")
  # end

  # it "does not render a different template" do
  #   get "/widgets/new"
  #   expect(response).to_not render_template(:show)
  # end
end

