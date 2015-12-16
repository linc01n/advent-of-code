#!/usr/bin/env ruby

require 'digest'

key = 'bgvyzdsv'
count = 1
md5 = Digest::MD5

while md5.hexdigest(key + count.to_s)[0..5] != '000000'
  count += 1
end

puts count
