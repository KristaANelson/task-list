require 'rails_helper'

RSpec.describe Task, type: :model do
  it "should be valid with a title" do
    list = List.new(title: "title")

    expect(task).to be_valid
  end

  it "defaults to archived" do
    list = List.create(title: "title")
    list.update_attributes(archieved: true)
    list.save
    expect(list.archieved).to eq true
  end
end
