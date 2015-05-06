require 'rails_helper'

RSpec.describe Task, type: :model do
  it "should be valid with a title, description due date" do
    task = Task.create(title: "title", description: "description", due_date: Date.today)

    expect(task).to be_valid
  end

  it "should be invalid without a title" do
    task = Task.create(title: nil, description: "description", due_date: Date.today)

    expect(task).to be_invalid
  end

  it "should be invalid without a description" do
    task = Task.create(title: "title", description: nil, due_date: Date.today)

    expect(task).to be_invalid
  end

  it "should be invalid without a due date" do
    task = Task.create(title: "title", description: "description", due_date: nil)

    expect(task).to be_invalid
  end

  it "defaults to complete false" do
    task = Task.create(title: "title", description: "description", due_date: nil)

    expect(task.complete).to eq false
  end

  it "can be udpated to complete true" do
    task = Task.create(title: "title", description: "description", due_date: nil)

    task.update_attributes(complete: false)
    expect(task.complete).to eq false
  end
end
