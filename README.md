# Development Machine Configuration

This is my personal development machine configuration (Mac OS).

First time setup:

    mkdir -p ~/bin
    curl -fsLS https://github.com/dotfilet/core/raw/main/bin/filet > ~/bin/filet
    chmod +x ~/bin/filet
    git clone https://github.com/nevir/home ~/.local/machine-config

To sync system state with the configuration:
    
    ~/bin/filet apply ~/.local/machine-config/home.filet
