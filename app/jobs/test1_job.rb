class Test1Job < ApplicationJob
  queue_as :dragon

  def perform(*args)
    # Do something later
    sleep rand(10)
    puts "------test1"
  end
end
