function git_history {
  git log $filename | grep "Date: "
}

function first_commit {
  git_history | tail -1
}

function last_commit {
  git_history | head -1
}

function number_of_commits {
  git_history | wc -l
}
 
function legible_output {
  # $2:   filename
  # $1:   lines of code
  # $3:   number of commits
  # $6:   month (first)
  # $7:   date (first)
  # $9:   year (first)
  # $13:  month (last)
  # $14:  date (last)
  # $16:  year (last)
  awk '{print $2 "," $1 "," $3 "," $6 " " $7 " " $9 "," $13 " " $14 " " $16}'
}

function lines_of_code {
  echo $(wc -l $1) | sed 's/\(\/.*\)[ ]/\1_/'
}

function csv_lines_for {

  # allow spaces in filenames, via file separator; re PR #7, Issue #5
  STORED_IFS=$IFS
  IFS=$(echo -en "\n\b")

  for filename in $(find . -iname "*.$1"); do
    echo "$(lines_of_code $filename) $(number_of_commits) $(first_commit) $(last_commit)" |
    legible_output |
    xargs echo
  done

  IFS=$STORED_IFS

}

function create_csv {
  echo "filename,lines of code,number of commits,date of first commit,date of last commit"

  for argument in "$@"
  do
    csv_lines_for $argument
  done
}

cd $1
create_csv ${@:2:$#}
cd -

