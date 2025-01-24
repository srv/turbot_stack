# Turbot stack

## Installation

**Installing turbot_stack for the first time on a computer.**

Inside the turbot_stack directory, run:

      bash install_first_time.sh

install_first_time.sh installs the necessary dependencies, downloads the content of the submodules from github, installs cola2_lib and compiles the rest of the submodules.

**If turbot_stack has already been installed once on your computer.**

Inside the turbot_stack directory, run:

      bash download_submodules.sh

download_submodules.sh only downloads submodules from github.

## Working with submodules

**Add submodule.**

Inside the turbot_stack directory, run:

      git submodule add github_repository_url

If necessary, go into the submodule just downloaded and switch to the branch you need.

Modify .gitmodules to add the branch that you always want to be downloaded.

Finally, run these instructions from the turbot_stack directory:

      git add .
      git commit -m "insert_message"
      git push

**Remove submodule.**

Inside the turbot_stack directory, run:

      git rm submodule_name
      git add .
      git commit -m "insert_message"
      git push

**Update submodule.**

 1. Pull twice: On the main repository execute `git pull && git submodule foreach git pull`.
 2. Push twice: Work with the code in any submodule as usual. Commit and push as usual. At the end, go to the main repository and check what a `git status` shows. It will normally show that a particular repo has changed. For example:
