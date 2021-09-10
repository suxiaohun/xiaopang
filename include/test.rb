require 'ffi'

module FfiTest
  extend FFI::Library
  ffi_lib 'c'
  ffi_lib 'test1'
  attach_function :ffi_pow, [ :int, :int ], :int
  attach_function :ffi_factorial, [ :int ], :int


  ffi_lib 'test2'
  attach_function :ffi_fibonacci, [ :int ], :int

end

puts FfiTest.ffi_factorial(5)
puts FfiTest.ffi_fibonacci(9)
puts FfiTest.ffi_pow(2, 10)
