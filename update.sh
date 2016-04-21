#!/bin/bash
#git submodule foreach git pull

find_git_branch() {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    git_branch="($branch)"
  else
    git_branch=""
  fi
}

#!/bin/bash
for d in */;
{ 
  cd "$d"; 
  echo "********* $d ***********"; 
  git pull origin $find_git_branch; 
  cd ..; 
}

