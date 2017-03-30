module.exports = ({theme, tmux}) => `# auto-generated tmux.conf

# options
new-session -A -s 0
set -g mouse on
set-option -g allow-rename off
set-option -g renumber-windows on

# keys: prefix
set -g prefix C-${tmux.prefix}
unbind C-b

# keys: pane-splitting
bind c new-window -c "#{pane_current_path}"
bind h split-window -h -c "#{pane_current_path}"
bind v split-window -v -c "#{pane_current_path}"
unbind %
unbind '"'

# keys: pane-switching
bind -n M-Down select-pane -D
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U

# keys: scroll
bind s copy-mode

# style: statusbar
set -g status-attr dim
set -g status-bg default
set -g status-interval 1
set -g status-justify left
set -g status-position bottom

# style: statusbar-left
set -g status-left '#[bg=${theme.complementary},fg=${theme.neutral}] #S #[bg=default] '
set -g status-left-length 25

# style: statusbar-right
set -g status-right '#[bg=${theme.complementary},fg=${theme.neutral}] %Y-%m-%d #[bg=default] #[bg=${theme.color},fg=${theme.complementary}] %H:%M:%S '
set -g status-right-length 25

# style: pane-border
set -g pane-active-border-fg ${theme.color}
set -g pane-border-fg ${theme.complementary}

# style: message
set -g message-bg ${theme.complementary}
set -g message-command-bg ${theme.complementary}
set -g message-command-fg ${theme.highlight}
set -g message-fg ${theme.color}

# style: active tab
setw -g window-status-current-bg ${theme.color}
setw -g window-status-current-format ' #[fg=${theme.complementary}]#I #W '

# style: passive tab
setw -g window-status-bg ${theme.complementary}
setw -g window-status-format ' #[fg=${theme.color}]#I #W '

# stlye: bell tab
setw -g window-status-bell-bg ${theme.highlight}
setw -g window-status-bell-fg ${theme.complementary}
`
