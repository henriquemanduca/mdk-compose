#!/bin/bash

# Function to configure Git
configure_git() {
    echo "*** Git Configuration ***"
    read -p "Enter your Git user.name: " git_name
    read -p "Enter your Git user.email: " git_email
    
    git config --global user.name "$git_name"
    git config --global user.email "$git_email"
    
    echo "Git has been configured with:"
    echo "Name: $git_name"
    echo "Email: $git_email"
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

# Main menu
while true; do
    echo "Fresh Linux Setup Configuration"
    echo "1. Configure Git"
    echo "2. Install lazydocker"
    echo "3. Option 3 (Placeholder)"
    echo "4. Exit"
    read -p "Enter your choice (1-4): " choice
    
    case $choice in
        1)
            configure_git
            ;;
        2)
            install_lazydocker
            ;;
        3)
            echo "Option 3 selected"
            # Add your configuration here
            ;;
        4)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done

