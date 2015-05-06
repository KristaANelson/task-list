require 'rails_helper'

RSpec.describe List, type: :model do
  it "should be valid with a title" do
    list = List.new(title: "title")

    expect(list).to be_valid
  end

  it "should be invalid with a title" do
    list = List.new(title: "")

    expect(list).to be_invalid
  end

  it "defaults to archived false" do
    list = List.create(title: "title")

    list.update_attributes(archived: true)
    list.save

    expect(list.archived).to eq true
  end

  it "can be udpated to archived status" do
    list = List.create(title: "title")

    list.update_attributes(archived: false)
    list.save

    expect(list.archived).to eq false
  end
end
