# Enable aliases to be sudo’ed
alias sudo='sudo '

alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -l"
alias la="lsd -la --icon always --color always --group-dirs first --blocks name,permission,size,date"
alias l="lsd --icon always --color always --group-dirs first --blocks name,permission,size,date"
alias ~="cd ~"
alias dotfiles='cd $DOTFILES_PATH'

# Git
alias gaa="git add -A"
alias gc='$DOTLY_PATH/bin/dot git commit'
alias gca="git add --all && git commit --amend --no-edit"
alias gco="git checkout"
alias gd='$DOTLY_PATH/bin/dot git pretty-diff'
alias gs="git status -sb"
alias gf="git fetch --all -p"
alias gps="git push"
alias gpsf="git push --force"
alias gpl="git pull --rebase --autostash"
alias gb="git branch"
alias gl='$DOTLY_PATH/bin/dot git pretty-log'

# Utils
alias k='kill -9'
alias i.='(idea $PWD &>/dev/null &)'
alias c.='(code $PWD &>/dev/null &)'
alias o.='open .'
alias up='dot package update_all'
alias reload='source ~/.zshrc'
alias zshconfig='$EDITOR ~/.zshrc'
alias dotconfig='cd $DOTFILES_PATH && $EDITOR .'
alias clip='pbcopy'
alias week='date +%V'
alias timestamp='date +%Y%m%d_%H%M%S'
alias weather='curl wttr.in'

# Sistema
alias diskspace='df -h && du -sh ~/Library/Caches/*/ 2>/dev/null | sort -rh | head -10'
alias ports='lsof -i -P | grep LISTEN'
alias myip='curl -s ifconfig.me'
alias localip='ipconfig getifaddr en0'
alias flushdns='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
alias cleanup='brew cleanup -s && npm cache clean --force && rm -rf ~/Library/Caches/Homebrew'

# Git extra
alias gst='git stash'
alias gstp='git stash pop'
alias gundo='git reset --soft HEAD~1'
alias gnuke='git reset --hard && git clean -fd'
alias gbD='git branch | grep -v main | xargs git branch -D'
alias glog='git log --oneline --graph --decorate --all'
alias gwip='git add -A && git commit -m "WIP"'

# Node / npm / pnpm
alias ni='npm install'
alias nid='npm install --save-dev'
alias nr='npm run'
alias nrd='npm run dev'
alias nrb='npm run build'
alias nrt='npm run test'
alias pi='pnpm install'
alias pr='pnpm run'
alias prd='pnpm run dev'
alias nvmuse='nvm use $(cat .nvmrc)'

# fzf
alias fcd='cd $(find . -type d | fzf)'
alias fopen='open $(find . -type f | fzf)'
alias fkill='kill -9 $(ps aux | fzf | awk "{print \$2}")'
alias fport='lsof -i -P | grep LISTEN | fzf'

# Chuleta de aliases propios
alias halias='cat $DOTFILES_PATH/shell/aliases.sh | grep -E "^alias" | sed "s/alias //" | column -t -s "=" | sort | bat --style=plain --language=bash 2>/dev/null || cat $DOTFILES_PATH/shell/aliases.sh | grep -E "^alias" | sed "s/alias //" | sort'
