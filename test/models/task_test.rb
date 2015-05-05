require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "valid with a title" do
    task = Task.new(title: "title")

    assert task.valid?
  end

  test "it defaults to completed" do
    task = Task.create(title: "title", description: "description")

    assert_eq(false), task.complete
  end
end
