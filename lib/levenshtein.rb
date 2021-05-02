require 'ffi'

module Levenshtein
  class << self
    extend FFI::Library

    # Try loading in order.
    library = File.dirname(__FILE__) + "/../ext/levenshtein/levenshtein"
    candidates = ['.bundle', '.so', '.dylib', ''].map { |ext| library + ext }
    ffi_lib(candidates)

    # Safe version of distance, checks that arguments are really arrays of strings.
    def distance(words1, words2)
      validate(words1)
      validate(words2)

      pointer1 = FFI::MemoryPointer.new(:uint32, words1.length)
      # Fill the memory location with your data
      pointer1.put_array_of_uint32(0, words1)

      pointer2 = FFI::MemoryPointer.new(:uint32, words2.length)
      # Fill the memory location with your data
      pointer2.put_array_of_uint32(0, words2)
      
      ffi_distance(pointer1, words1.length, pointer2, words2.length)
    end

    # Unsafe version. Results in a segmentation fault if passed nils!
    attach_function :ffi_distance, :levenshtein, [:pointer, :int, :pointer, :int], :int

    private
    def validate(arg)
      unless arg.kind_of?(Array)
        raise TypeError, "wrong argument type #{arg.class} (expected Array)"
      end
    end
  end
end
