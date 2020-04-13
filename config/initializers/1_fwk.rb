require './lib/fwk/color'
require './lib/fwk/time_extend'
require './lib/utils/rgb_color'

String.send(:include, Fwk::Color)
Time.send(:include, Fwk::TimeExpend)
DateTime.send(:include, Fwk::TimeExpend)
