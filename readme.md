# Rewind: git history analysis scripts

## stats

Run a statistics bash script against a git repository. For each
filename, discover lines of code, number of commits, and the date of the
first and the last commit. Then pull that into a spreadsheet app, sort
by each metric, and get an idea which files are the most important files
in the history of the project.

    file_stats.sh > stats.csv
    open -a Numbers stats.csv

## authorship

This is more tricky, and requires Ruby. First run the
`determine_authors.sh` script to get a count of all the authorship
events in the repo; then run the `tally_authors.rb` Ruby script to sort
the authorship events by name.

You can do all that as a one-liner in bash like this:

    ruby tally_authors.rb <(cd project && /this_directory/determine_authors.sh "js")

The code isn't that tricky, and the output is easy to understand, but
it's also easy to misconstrue. That's the tricky part. A developer
could show up with few authorship events because they're new to a team,
because they often do pair programming, because they prefer large
commits to small ones, or for several other possible reasons. Exercise
good judgement.

