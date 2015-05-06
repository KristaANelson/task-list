require 'rails_helper'

RSpec.feature "User", type: :feature do
  it "by default should only see unarchived task lists" do
    visit '/'
    within(".lists-list") do
      expect(page).to have_content("Active Task Lists")
      expect(page).to_not have_content("Archived Task Lists")
    end
  end

  it "A user can create a task list" do
    visit '/'

    fill_in 'list[title]', with: "Write this test"
    click_link_or_button("Submit")

    within(".listed-lists") do
      expect(page).to have_content("Write this test")
    end
  end

  it "can only delete a task list from the archive" do
    @list = List.create(title: "Title3434")
    @list = List.create(title: "Title3434", archived: true)

    visit root_path
    expect(page).to_not have_button("Delete")

    visit archived_lists_path

    click_link_or_button("Delete")
    expect(page).to have_content("There are no Archived Task Lists")
  end

  it "can view archived task lists" do
    visit root_path

    expect(page).to have_link("See Archived Task Lists")
    click_link("See Archived Task Lists")

    expect(current_path).to eq(archived_lists_path)
  end

  it "can create a task" do
    @list = List.create(title: "Title3434")
    visit list_path(@list)

    fill_in 'task[title]', with: "Write this test"
    fill_in 'task[description]', with: "Write this test description"
    click_link_or_button("Submit")


    expect(page).to have_content("Write this test")
  end

  it "by default, only sees incomplete tasks" do
    @list = List.create(title: "Title3434")
    visit root_path

    click_link "0 tasks"

    expect(page).to have_content("Incompleted Tasks for:")
  end

  it "can see completed tasks and mark them as incomplete" do
    @list = List.create(title: "Title3434")
    @task = Task.create(list_id:      @list.id,
                        title:        "Title",
                        description:  "Des",
                        due_date:      Date.today,
                        complete:      true)

    visit root_path
    click_link("1 tasks")
    click_link("Completed tasks")

    expect(page).to have_content("Completed Tasks for:")
    expect(page).to have_content("Mark Incomplete")
  end
end
