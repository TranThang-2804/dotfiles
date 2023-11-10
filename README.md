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

###Some pre-configs:

1. Leader character: " "
2. Use \<leader\>cm to config code extension (linter, LSP, ...)
3. Use \<Ctrl+hjkl\> to navigate betwwen windows
4. Use \<Option+hjkl\> (MacOS) to resize windows
5. Use <Shift+hl> to swich between buffer (tab)
6. Use \<number\>\<leader\>t(h/v) to add terminal windows or \<Ctrl+-\> to open floated terminal7. Use \<leader\>e to toggle explorer
7. Use \<leader\>\<leader\> to open telescope
   ... Many more
