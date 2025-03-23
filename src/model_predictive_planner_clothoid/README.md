## Usage

Put on your `~/.bashrc` the following line:
```bash
alias mpp="$CARMEN_HOME/src/model_predictive_planner_clothoid/run.sh"
```
For usage, open terminal and type `mpp`

## Setup

```
git submodule update --init --recursive ./submodules/Clothoids

sudo apt install gem ninja-build
sudo gem install colorize rubyzip
```

## Strategy
