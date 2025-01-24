# Turbot stack

## Installation

**Installing turbot_stack for the first time on a computer:**

      (turbot_stack)$ bash install_first_time.sh

install_first_time.sh installs the necessary dependencies, downloads the content of the submodules from github, installs cola2_lib and compiles the rest of the submodules.

**If turbot_stack has already been installed once on your computer:**

      (turbot_stack)$ bash download_submodules.sh

download_submodules.sh only downloads submodules from github.

## Working with submodules

**Add submodule**

Clones and adds a new submodule to the stack:

      (turbot_stack)$ git submodule add github_repository_url

If necessary, go into the submodule just downloaded and switch to the branch you need.

Modify .gitmodules to add the branch that you always want to be downloaded.

Finally:

      (turbot_stack)$ git add .
      (turbot_stack)$ git commit -m "insert_message"
      (turbot_stack)$ git push

**Remove submodule**

      (turbot_stack)$ git rm submodule_name
      (turbot_stack)$ git add .
      (turbot_stack)$ git commit -m "insert_message"
      (turbot_stack)$ git push

**Update submodule**

 1. Pull twice: On the main repository execute `git pull && git submodule foreach git pull`.
 2. Push twice: Work with the code in any submodule as usual. Commit and push as usual. At the end, go to the main repository and check what a `git status` shows. It will normally show that a particular repo has changed. For example:
