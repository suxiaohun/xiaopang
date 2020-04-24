#if Rake::Task.task_defined?("assets:precompile")
#  binding.pry
#  puts "....1......initializes......clear task...yarn"
#  Rake::Task["assets:precompile"].clear_prerequisites
#  puts "....2......initializes......clear task...yarn"
#else
#  puts "....3.....not defined"
#end