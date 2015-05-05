require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test "valid with a title" do
    list = List.new(title: "title")

    assert list.valid?
  end

  test "it can be archived" do
    list = List.create(title: "title")
    list.udpate_attributes(archieved: true)
    assert list.valid?
  end
end
