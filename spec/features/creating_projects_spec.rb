require "rails_helper"

RSpec.feature "Users can create new projects" do
  scenario "with valid attributes" do
    visit "/"

    click_link "New Project"
    fill_in "Name", with: "Sublime 3"
    fill_in "Description", with: "A text editor for everyone"

    click_button "Create Project"

    expect(page).to have_content("Project has been created.")

    project = Project.find_by_name("Sublime 3")
    expect(page.current_url).to eq project_url(project)

    title = "Sublime 3 - Projects - Ticketee"
    expect(page).to have_title title
  end
end
