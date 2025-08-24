# zsh-conf

configuration for zsh

## installation

```
> cd ~/repos
> git clone https://github.com/mizokichicode/zsh-conf.git
> ln -s ~/repos/zsh-conf/.zshrc ~/.zshrc
> ln -s ~/repos/zsh-conf/.zprofile ~/.zprofile
```

## use git prompt

```
> cd ~/repos
> git clone https://github.com/git/git.git --depth 1
> mkdir ~/.zsh
> ln -s ~/repos/git/contrib/completion/git-completion.zsh ~/.zsh/_git@
> ln -s ~/repos/git/contrib/completion/git-prompt.sh ~/.zsh/git-prompt.sh
```