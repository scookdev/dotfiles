/usr/bin/env timestamp=$(date +%F)
olddir=`pwd`

cd ~
printf "creating backup folder for existing dotfiles"
printf "backup files will be stored in '${timestamp}_dotfiles'"
backup_folder="${timestamp}_dotfiles"

for f in *; do
  BASE=`basename $f`
  CWD=`pwd`

  # Skip over everything that is not a dotfile in copy process
  if [[ ("${BASE:0:1}" != ".")]]; then
    continue
  fi

  cp -rf .* "${backup_folder}/"
done

rm -fr ~/.dotfiles  # remove dir if already exists
git clone --recursive https://github.com/m8ss/dotfiles.git ~/.dotfiles
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
