#!/bin/bash

# Function to configure Git
configure_git() {
    echo "*** Git Configuration ***"

    sudo apt-get install git

    read -p "Enter your Git user.name: " git_name
    read -p "Enter your Git user.email: " git_email

    git config --global user.name "$git_name"
    git config --global user.email "$git_email"

    echo "Git has been configured with:"
    echo "Name: $git_name"
    echo "Email: $git_email"

    git config pull.rebase true

    git config --global alias.ci commit
    git config --global alias.st status
    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global alias.lg 'log --oneline --decorate --graph'
    git config --global alias.pu push
    git config --global alias.pl pull
    git config --global alias.me merge
    git config --global alias.sa stash
    git config --global alias.cl clone

    echo ""
}

# Function to install lazydocker
install_lazydocker() {
    echo "*** Installing lazydocker ***"
    echo "This will run the installation script from GitHub"
    read -p "Do you want to continue? (y/n): " confirm

    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
        echo "Installing lazydocker..."
        curl -s https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
        echo "lazydocker installation complete!"
    else
        echo "lazydocker installation canceled."
    fi
    echo ""
}

# Function to install lazygit
install_lazygit() {
    echo "*** Installing lazygit ***"
    echo "This will run the installation with apt"
    read -p "Do you want to continue? (y/n): " confirm

    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
        echo "Installing lazygit..."
	sudo apt install lazygit
        echo "lazygit installation complete!"
    else
        echo "lazygit installation canceled."
    fi
    echo ""
}


# Function to create .bash_aliases
create_bash_aliases() {
    echo "*** Create .bash_aliases ***"
    read -p "Do you want to create the .bash_aliases file? (y/n): " confirm
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
        echo "Creating .bash_aliases file..."
        cat << 'EOF' > ~/.bash_aliases
# Configs ----------------------------------------------------------------------
alias src='source ~/.bashrc && clear'

alias alias-edit='vim ~/.bash_aliases'
alias hosts-edit='sudo vim /etc/hosts'

# Apps -------------------------------------------------------------------------

alias g='git'
alias v='vim'
alias lgit='lazygit'
alias ldk='lazydocker'

# Commands ---------------------------------------------------------------------

# For Debian
# alias l='ls'
# alias ll='ls -lh'

alias la='ls -lah'
alias lr='ls -R'
alias lh='ls -d .*'
alias rmf='rm -rf' # just delete it
alias ht='history'

# Apt --------------------------------------------------------------------------

alias up='clear && sudo apt update'
alias upl='clear && apt list --upgradable'
alias upu='sudo apt upgrade'
alias upd='sudo apt dist-upgrade'
alias upc='sudo apt clean && sudo apt autoclean && sudo apt autoremove --purge'
alias ins='sudo apt install'
alias insp='sudo dpkg -i'

# Folders ----------------------------------------------------------------------

alias ..='cd ..'
alias ...='cd ../..'

# DOCKER -----------------------------------------------------------------------

alias dk='docker'
alias dk-up='dk compose up -d'
alias dk-up-b='dk compose up -d --build'
alias dk-dn='dk compose down'
EOF
        echo ".bash_aliases file created successfully!"
    else
        echo "Operation canceled."
    fi
    echo ""
}


# Function to install zoxide
install_zoxide() {
    echo "*** Installing zoxide ***"
    echo "This will run the installation script from GitHub"
    read -p "Do you want to continue? (y/n): " confirm

    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
        echo "Installing zoxide..."
        curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
        echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
        echo "zoxide installation complete! Please run 'source ~/.bashrc' to apply the changes."
    else
        echo "zoxide installation canceled."
    fi
    echo ""
}


# Main menu
while true; do
    echo "Fresh Linux Setup Configuration"
    echo "1. Configure Git"
    echo "2. Install lazydocker"
    echo "3. Install lazygit"
    echo "4. Create .bash_aliases"
    echo "5. Install zoxide"
    echo "6. Exit"
    read -p "Enter your choice (1-6): " choice

    case $choice in
        1)
		    create_bash_aliases
            ;;
        2)
            install_lazydocker
            ;;
        3)
		    install_lazygit
            ;;
        4)
            install_zoxide
            ;;
        5)
            configure_git
		    ;;

        6)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done

