levenshteint
===============

The levenshteint module implements fast Damerau-Levenshtein edit distance
computation in O(n) memory and O(n^2) time, using a C wrapper. The module has a
single function:

    require 'levenshteint'
    Levenshteint.distance([1, 2], [1, 3]) == 1 # returns true

Including in Gemfile
====================

    gem 'levenshteint', git: 'https://github.com/happyscribe/levenshteint.git'

Authors
=======

Original author is Schuyler Erle.

- David Balatero: Converted to FFI by for Ruby portability.
- Albert Segarra: Changed `Levenshteint.distance` to accept arrays of integers instead of strings for word-level distance support.

License
=======

The code is made available under the following BSD license:

Copyright (c) 2009, Schuyler Erle.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice,
      this list of conditions and the following disclaimer.

    * Redistributions in binary form must reproduce the above copyright notice,
      this list of conditions and the following disclaimer in the documentation
      and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

- end -
