require 'rails_helper'

RSpec.feature "User", type: :feature do
  it "should be see a list of Active task lists" do
    visit '/'

    expect(page).to have_content("Active Lists")
  end
end
