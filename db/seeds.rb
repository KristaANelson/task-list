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
      title:      "task#{i}",
      description:  "this is a descritpion for task#{i}",
      due_date:      Date.today + rand(10),
      list_id:    rand(10)
      )
      puts "Task #{i}created!"
    end
  end
end

Seed.new
