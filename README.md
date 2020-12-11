# sgsh's dotfiles
 ```
 ☻ ☺  ⌃ ⎋␛ ⌘ ⌥ ⌫ ⇧ ⏎⌤ ⇪ ⚠ ⌫ ⌨ ♨ ¿ ¡
 ```
## Automatic Configuration
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/sgsh-gh/dotfiles/main/init.sh)"
```
## Manual Configuration
### System Preference
  - ⌨ > Modifier key
    - ⇪ : ⌃
    - ⌃ : ⎋␛
   
### Iterm2
  - (⌘,) > Keys >
    - (Key bindings) >
      - (⌥ →) : ⎋␛ f
      - (⌥ ←) : ⎋␛ b
      - ⚠ Delete conflicting keybind in profile
      - (Touch Bar migration)
    - (Navigation Shortcuts) >
      - Window: None 
      - Tab: ⌘
      - Pane: ⌥
  - (⌘,) > Profiles >
    - General > Comannd : Login Shell 
    - Session > Configure Status Bar
    - Advanced > Triggers
      - (P|p)assword for .*:
      - .*'s (P|p)assword:
      - (P|p)assword:
  - (⌥ ⌘ F)

   
### IntelliJ
  - Other > (Usage view group) > Directory: remove (^ D)
  - (Main Menu) > 
    - Run > Dung : remove (^ D)
    - Edit > delete : add (^ D)
  -  Editor > Cut line backward: add (^ Q)

 

## References 
- [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
- [\\\[._.\]/ - Hi, I'm the MacOS bot](https://github.com/atomantic/dotfiles)
- [kisqragi's dotfiles](https://github.com/kisqragi/dotfiles)
