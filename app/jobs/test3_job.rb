class Test3Job < ApplicationJob
  queue_as :tiger

  def perform(*args)
    sleep rand(10)
    puts "------test3"
    # Do something later
  end
end
