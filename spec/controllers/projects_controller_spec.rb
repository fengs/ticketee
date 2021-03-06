require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  it "handles a missing project properly" do
    get :show, id: "not-there"

    expect(response).to redirect_to(projects_path)
    message = "The project you were looking for could not be found"
    expect(flash[:alert]).to eq(message)
  end

end
