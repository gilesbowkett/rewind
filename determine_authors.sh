# determine who are the key authors on the site; this file collects the data, another
# (Ruby) file sorts it to determine an **extremely** primitive measure of authority

# usage: determine_authors.sh [filetype]
#
# e.g.   determine_authors.sh "js"           # examines authorship for *.js files
#        determine_authors.sh "handlebars"
#        determine_authors.sh "ruby"
#        determine_authors.sh "et_cetera"

function generate_authors_file {
  for filename in $(git ls-tree --full-tree -r --name-only HEAD | grep ".*\.$1"); do
    git log $filename | grep Author;
  done
}

generate_authors_file $1

