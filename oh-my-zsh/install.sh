#!/bin/bash
echo "generating configs"
node generate

ZSH_CUSTOM="/opt/oh-my-zsh/custom"

echo "select one of these as \$MACHINE_TYPE (without .zshrc):"
ls ./rc
read -p "Machine type?" MACHINE_TYPE
read -p "user:group for ~/.zshrc?" USER_GROUP

[ -f "./rc/$MACHINE_TYPE.zshrc" ] || exit 1

# theme
sudo cp -r themes "$ZSH_CUSTOM/"
sudo chown -R root:root "$ZSH_CUSTOM/" || sudo chown -R root:staff "$ZSH_CUSTOM/"

# zshrc
cp "rc/$MACHINE_TYPE.zshrc" ~/.zshrc
sudo chown "$USER_GROUP" ~/.zshrc

echo "Done!"
exit 0
