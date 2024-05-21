# Project Setup

This project requires executing a setup script to configure the local machine environment. Please follow the instructions below based on your operating system.

## macOS/linux

1. Open a Terminal on your macOS/linux system.

2. Navigate to the project directory using the `cd` command:
   `cd /path/to/project`

3. Make sure the setup script has execute permissions. If needed, grant execute permissions using the `chmod` command:
   `chmod +x setup.sh`

4. Run the setup script by executing the following command:
   if you want to only setup zsh, vim, and neovim then run:
   `. ./setup.sh`
   if you want to setup zsh, vim, and neovim as well as installing all packages in `package_management` then run:
   `. ./setup.sh all`

I used LazyVim for managing nvim packages with some pre-configs that are suitable for me. If you need to make modification, please go ahead.
