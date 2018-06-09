# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

###########
# ALIASES #
###########

# User specific aliases and functions
# Wrap git automatically by adding the following to ~/.bash_profile:

# This was here by default, unsure what it does or why it is here
# eval "$(hub alias -s)"

# clean redis datebase, needs to be flushed whenever testbed config changes
alias clean_redis="redis-cli flushdb"

# shortcuts to common directories
alias cyc_helpers="cd ~/git/cyc_core/cyc_platform/src/package/cyc_helpers"
alias cyc_proxy="cd ~/git/cyc_core/cyc_platform/src/cyc_proxy/connection_service"
alias cyc_test="cd ~/git/cyc_core/cyc_platform/src/package/cyc_test"
alias fe_tests="cd ~/git/cyc_core/cyc_platform/src/tests/fe_tests/fe_tests"
alias cyc_configs="cd ~/git/cyc_core/cyc_platform/src/package/cyc_configs"

# ENV SETUP
# set up stuff from wikis
export WORKON_HOME=$HOME/envs
source  /usr/bin/virtualenvwrapper.sh

export DEVOPS_ARTIFACTORY_SERVER=afeoscyc-mw.cec.lab.emc.com
export DEVOPS_ARTIFACTORY_ROUSER=svc_cyclonero
export DEVOPS_ARTIFACTORY_ROPASSWORD=APp7khsCmmQJNBJZp5riFjKj26

# make config point to a qemu system
#export CYC_CONFIG=/home/cyc/cyc-cfg.txt.qemu_host

# make config point to H2046 (system from platform FE team)
export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.cyc-H2046
#export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.cyc-H2090
#export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.cyc-H2158
#export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.cyc-H3002
#export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.cyc-H4051-BM
#export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.cyc-H4055-BM
#export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.WN-H0186
#export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.WN-H0265
#export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.WN-H0019-BM
#export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.WN-H0041-BM
#export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.WN-H0140-BM
#export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.WN-H0142-BM
#export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.WN-H0143-BM
#export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.WN-N0008-BM
#export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.WN-N0039-BM
#export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.WN-N0041-BM
#export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.WN-N0048-BM
#export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.cyc-N2010-BM
#export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.cyc-H2092
#export CYC_CONFIG=/home/cyc/git/cyc_core/cyc_platform/src/package/cyc_configs/cyc-cfg.txt.WN-N0010-BM

# alias
alias cyc_helpers="cd ~/git/cyc_core/cyc_platform/src/package/cyc_helpers/"

# Makes the function __git_ps1 available
source ~/.git-completion.bash

# Func to get current cyc_config
function display_cyc_config {
  if [[ -z $CYC_CONFIG ]]; then
    echo ""
  else
    echo "($(/usr/bin/grep -oP 'cyc_system_name=\"\K[\w-]+' $CYC_CONFIG))"
  fi
}

# Set up my PS1
PS1='[$(echo $?)]\h:\w\[\033[32m\]$(__git_ps1) $(display_cyc_config)\[\033[0m\] $ '

# git aliases
#alias cleangitbranch='git branch --merged | grep -v dev | grep -v master | grep -v NULL | xargs -n 1 git branch -d'
alias cleangitbranch='git branch --merged | grep -v integration | xargs -n 1 git branch -d'

# Get to Glens devvm for fetching logs
alias glen_vm="ssh cyc@10.244.36.221"
