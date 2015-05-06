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
    task = Task.create(title: "title", description: "description", due_date: Date.today)

    expect(task.complete).to eq false
  end

  it "can be udpated to complete true" do
    task = Task.create(title: "title", description: "description", due_date: Date.today)

    task.update_attributes(complete: false)
    expect(task.complete).to eq false
  end

  it "should be valid with a pdf_file and has a paperclip attachment" do
    task = Task.create(title: "title", description: "description", due_date: Date.today)
    task.file = "http://s3.amazonaws.com/unleash-app/tasks/files/000/000/204/original/RackMultipart20150506-17002-nxtxtt.pdf?1430908709"

    expect(task).to be_valid
    expect(task.file.class).to eql(Paperclip::Attachment)
 end

 it "should be invalid with a gif_file" do
   task = Task.create(title: "title", description: "description", due_date: Date.today)
   task.file = "http://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_(large).gif"
   expect(task).to be_invalid
 end
end
