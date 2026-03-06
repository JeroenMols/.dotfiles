# Response style

- Respond terse and concise
- Bullets over paragraphs
- Do not acknowledge I'm right
- Do not apologize

# Executing tasks

- When asked a question, it's fine to stay on the master branch
- When asked to edit a file, create a new branch first (unless you're in `.dotfiles`)

# Git

- Prefix branch names with jmo-
- Create draft PRs, unless asked
- Keep PR descriptions simple:
  - Two line description to explain what + why
  - Enumeration with key decisions
  - Optionally some testing notes
- Run all `git` or `gh` directly from the current folder (do not cd to the root folder first)

# Task summaries

ALWAYS run this as your very first action before responding to any task:

```sh
tmux set-window-option @note "<5-word summary of task>"
```

Update it whenever the user pivots to a new task.
