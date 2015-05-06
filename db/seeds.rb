class Seed
  def initialize
    p "=============================="
    p "Seeding started"
    p "=============================="
    generate_lists
    generate_tasks
    p "=============================="
    p "Seed data loaded"
    p "=============================="
  end

  def generate_lists
    10.times do |i|
      list = List.create!(title:   "A Really Great Title#{i + 1}")
      puts "#{list.title} created!"
    end
  end

  def generate_tasks
    200.times do |i|
      task = Task.create!(
      title:        "Task Title #{i + 1}",
      description:  "This is a descritpion for Task#{i + 1}",
      due_date:      Date.today + rand(10),
      file:          ["http://s3.amazonaws.com/unleash-app/tasks/files/000/000/204/original/RackMultipart20150506-17002-nxtxtt.pdf?1430908709", nil].sample,     
      list_id:       rand(10)
      )
      puts "Task #{i}created!"
    end
  end
end

Seed.new
