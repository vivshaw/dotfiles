# dotfiles

core dotfiles all live here. they are managed with Stow. there should be no need to run this manually- the Ansible playbook will provision them.

## Structure

instead of rewriting the `.zshrc` itself, I have modular scripts that I pop into the `.zshrc` (which remains unmanaged by stow). this is for two reasons: first, that lots of tools like to edit your `.zshrc`, and I don't want them to cause a dotfile diff (unless/until I choose to adopt them globally). second, because I find juggling a few OS-specific scripts simpler than templating it all into one script.

what's inside:

 - `.zshrc.base.sh` contains the core config, shared across all systems
 - os-specific config, containing things like system-specific tools and aliases:
   - `.zshrc.linux.sh`
   - `.zshrc.mac.sh`
   - `.zshrc.wsl.sh`
 - `.zshrc.starship.sh` initializes Starship, Atuin, and syntax highlighting in the required order
 - `.zshrc.atuin.sh` contains the Atuin initialization sourced by `.zshrc.starship.sh`
