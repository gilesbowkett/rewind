# this file parses git log scrapes of commit authors and counts them.
# in some cases it gives you a very primitive metric for authorship and
# authority; however these are definitely numbers to consider with a
# grain of salt.

require 'rubygems'
require 'awesome_print'

filename = ARGV[0]
authorship = {}

File.open(filename).each_line do |line|
  author = line.gsub(/Author: /, "").chomp.split.tap(&:pop).join(' ').downcase
  if authorship[author]
    authorship[author] += 1
  else
    authorship[author] = 1
  end
end

ap authorship

