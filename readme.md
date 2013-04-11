# Rewind: git history analysis scripts

A small library of handy git analysis scripts
roughly inspired by Gary Bernhardt's [Destroy All
Software](https://www.destroyallsoftware.com/) screencasts, and
extensively documented in my ebook _[Unfuck A Monorail For Great
Justice](http://gilesbowkett.blogspot.com/2013/03/new-ebook-unfuck-monorail-for-great.html)_.

Use these when you want to quickly generate meaningful history reports
for git projects.

## stats

Run a statistics bash script against a git repository. For each
filename, discover lines of code, number of commits, and the date of the
first and the last commit. Then pull that into a spreadsheet app, sort
by each metric, and get an idea which files are the most important files
in the history of the project.

    bash file_stats.sh [dir] [filetypes] > stats.csv
    open -a Numbers stats.csv

For example:

    bash file_stats.sh /ember-project "js" "handlebars"

Or:

    bash file_stats.sh /rails-project "rb" "haml" "coffee" "scss"

## authorship

This is more tricky, and requires Ruby. First run the
`determine_authors.sh` script to get a count of all the authorship
events in the repo; then run the `tally_authors.rb` Ruby script to sort
the authorship events by name.

You can do all that as a one-liner in bash like this:

    ruby tally_authors.rb <(cd /project && /this_dir/determine_authors.sh "js")

The code isn't tricky at all, and the output is easy to understand, but
it's also easy to misconstrue. That's the tricky part. A developer
could show up with few authorship events because they're new to a team,
because they often do pair programming, because they prefer large
commits to small ones, or for several other possible reasons. Exercise
good judgement.

Also, where `file_stats.sh` will examine multiple file types,
`determine_authors.sh` and `tally_authors.rb` assumes you're only
working with one type of file at a time. Pull requests welcome!

Caveat: Running this code against extremely large projects with very
long histories (e.g. Rails) might be very slow.

## Why Rewind?

<img src="http://s3.amazonaws.com/giles/rewind_041113/LiarsAtoD1-Rewind.jpg">

[Rewind is currently a key character in the IDW _Transformers_
comics](http://tfwiki.net/wiki/Rewind_\(G1\)#IDW_Generation_1_continuity).

