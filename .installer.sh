/usr/bin/env rm -fr ~/.dotfiles  # remove dir if already exists

git clone --recursive git@github.com:binarymason/dotfiles.git ~/.dotfiles
olddir=`pwd`

cd ~/.dotfiles

for f in *; do
  BASE=`basename $f`;
  CWD=`pwd`

  # Don't link install script or dotfiles
  if [[ ("${BASE:0:1}" == ".")]]; then
    continue
  fi

  # Don't link install the readme
  if [[ "${BASE}" == "README.md" ]]; then
    continue
  fi

  # Don't link install anything in other directory
  if [[ "${BASE}" == "other" ]]; then
      continue
  fi

  ln -fs "${CWD}/${BASE}" "${HOME}/.${BASE}"
done

cd $olddir

printf "\n"
printf "Set up and ready to go!"
printf "\n"
