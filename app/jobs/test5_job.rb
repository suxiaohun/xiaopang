class Test5Job < ApplicationJob
  queue_as :dragon

  def perform(*args)
    sleep rand(10)
    puts "------test5"
  end
end
