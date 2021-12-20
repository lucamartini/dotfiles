GREEN="\033[1;32m"
NOCOLOR="\033[0m"

cd ~/.oh-my-zsh/custom/plugins/
for dir in */    
do
    dir=${dir%*/}
	cd $dir
  echo "upgrading ${GREEN}$dir${NOCOLOR}"
	git pull
	cd ..
done

cd ~/.oh-my-zsh/custom/themes/
for dir in */   
do
    dir=${dir%*/}
	cd $dir
  echo "upgrading ${GREEN}$dir${NOCOLOR}"
	git pull
	cd ..
done

cd ~/.tmux/plugins
for dir in */  
do
    dir=${dir%*/} 
	cd $dir
  echo "upgrading ${GREEN}$dir${NOCOLOR}"
	git pull
	cd ..
done
