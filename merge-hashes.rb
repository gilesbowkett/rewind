require 'rubygems'
require 'awesome_print'
require './the-hashes'

total_commit_matrix = THE_HASHES.inject(Hash.new(0)) do |memo, commit_matrix|
  commit_matrix.each do |committer, commits|
    memo[committer] += commits
  end

  memo
end

ap total_commit_matrix

