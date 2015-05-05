require 'rails_helper'

RSpec.describe Task, type: :model do
  it "should be valid with a title and description" do
    task = Task.create(title: "title", description: "description")

    expect(task).to be_valid
  end

  it "defaults to completed" do
    task = Task.create(title: "title", description: "description")

    expect(task.complete).to eq false
  end
end
