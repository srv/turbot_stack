#!/bin/bash
find_git_branch() {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    git_branch="$branch"
  else
    git_branch=""
  fi
}

#!/bin/bash
for d in */;
{ 
  cd "$d"; 
  echo "********* $d ***********"; 
  find_git_branch;
  git pull origin $git_branch; 
  cd ..; 
}

DATE_FMT="+%Y-%m-%d %H:%M:%S"
COMMITMSG="Commit on update (%d)"

if [ -n "$DATE_FMT" ]; then
  FORMATTED_COMMITMSG="$(sed "s/%d/$(date "$DATE_FMT")/" <<< "$COMMITMSG")" # splice the formatted date-time into the commit message
fi

git add -u
git commit -m"$FORMATTED_COMMITMSG"
git push
