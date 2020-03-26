class Test2Job < ApplicationJob
  queue_as :lion

  def perform(*args)
    sleep rand(10)
    puts "------test2"
    # Do something later
  end
end
