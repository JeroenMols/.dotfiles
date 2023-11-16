emulate -L zsh

local user_prompt=
local root_prompt=
local warn_prompt=
local prompt_glyph=

user_prompt="»" #$(emotty)"
# Currect root_prompt requires Hasklug Nerd Tree Font
root_prompt="" #☠︎" #🕭
warn_prompt="!" #$emoji[collision_symbol]"
if [ -n "${IN_NIX_SHELL}" ]; then
  # Currect nix-shell user_prompt requires Hasklug Nerd Tree Font
  user_prompt="" #"☢︎" #λ" #$emoji[radioactive_sign]"
  #root_prompt="$emoji[skull_and_crossbones]"
else
  #root_prompt="☠︎" #$emoji[skull]"
fi

#if [ -n "${TMUX}" ]; then
  vcs_unstaged_glyph="○" #▼"
  vcs_staged_glyph="●" #▲"
  #prompt_glyph="%#"
#else
  #vcs_unstaged_glyph="%{🅐}" #%{$emoji[circled_latin_capital_letter_m]$emoji2[emoji_style] %2G%}"
  #vcs_staged_glyph="%{🅢}" #$emoji[high_voltage_sign] %1G%}" ⚡︎↯
#fi
# Currect vcs_branch_glyph requires Hasklug Nerd Tree Font
vcs_branch_glyph="" # " #" #⎇  #⌥ #⢗" #$(print -P $'\Ue0a0') # 
vcs_action_glyph="%{❯ %2G%}" #$(print -P $'\U276f') # ❯

# Add support for non UTF8 console
if [ -d /usr/X11 -a -z "${DISPLAY}" ]; then
	user_prompt=">>"
	root_prompt="#"
	vcs_branch_glyph="|"
	vcs_unstaged_glyph="U"
	vcs_staged_glyph="S"
	vcs_action_glyph=">"
fi

prompt_glyph="%(#.${root_prompt}.${user_prompt})"




# Uncomment the next line if you also like to see the warn_prompt in the prompt on the right.
#last_command_failed="%(?.. %F{red}%1{${warn_prompt} %1G%}%?%f)"


setopt promptsubst

autoload -U colors && colors
autoload -U add-zsh-hook
autoload -Uz vcs_info
#autoload +X VCS_INFO_nvcsformats
# Workaround for zsh 5.2 release (kudos to @timothybasanov)
#functions[VCS_INFO_nvcsformats]=${functions[VCS_INFO_nvcsformats]/local -a msgs/}

local red="%{$fg[red]%}"
local yellow="%{$fg[yellow]%}"
local green="%{$fg[green]%}"
local cyan="%{$fg[cyan]%}"

zstyle ':vcs_info:*' enable git #hg svn cvs
zstyle ':vcs_info:*' get-revision false
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr "${red}${vcs_unstaged_glyph}"
zstyle ':vcs_info:*' stagedstr "${green}${vcs_staged_glyph}"

# %(K|F){color} set (back|fore)ground color
# %(k|f) reset (back|fore)ground color
zstyle ':vcs_info:*' max-exports 3
zstyle ':vcs_info:*' nvcsformats "${prompt_glyph}" '%3~' ''
zstyle ':vcs_info:*' formats "${yellow}%u%c%b${vcs_branch_glyph}%f" '%S|' "%{$bold_color%}%r%{$reset_color%}"
zstyle ':vcs_info:*' actionformats "${red}%K{white}%a${vcs_action_glyph}%k%f" '%S|' "%{$bold_color%}%r%{$reset_color%}"

local red_if_root="%(!.%F{red}.)"
local sshuser_on_host="${SSH_TTY:+%(!.$red.$yellow)%n@%m$reset_color}"

PROMPT='${sshuser_on_host}${vcs_info_msg_0_}${red_if_root} '
RPROMPT='${cyan}${vcs_info_msg_1_##.|}${vcs_info_msg_2_}%f${last_command_failed}'

#emotty_title() {
#  title "%{${${?/[^0]*/$warn_prompt $?}/0/${prompt_glyph}} %1G%}"
#}
#add-zsh-hook precmd emotty_title
add-zsh-hook precmd vcs_info

# vim:ft=zsh ts=2 sw=2 sts=2
