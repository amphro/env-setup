# env-setup

Initial setup of terminal and tool customization including environment variables, PATH, fzf, vscode, iterm, etc.

First, install all tools manually.
* iterm2 https://www.iterm2.com/
* vscode https://code.visualstudio.com

Next, run the setup scripts

```
./setup.sh
```

If you want to only run a specific customization, you can run that setup specifically.

```
./setup/env.sh
```

After running setup, open iterm2, select "Preferences...", select the "Amphro" profile, select "Other Actions..." and "Set as Default."

Import GPG keys from the previous machine using [these steps](https://gist.github.com/angela-d/8b27670bac26e4bf7c431715fef5cc51).
