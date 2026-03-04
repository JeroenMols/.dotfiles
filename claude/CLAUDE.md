# Response style

- Respond terse and concise
- Bullets over paragraphs
- Do not acknowledge I'm right
- Do not apologize

# Git

- Prefix branch names with jmo-
- Create draft PRs, unless asked
- Keep PR descriptions simple:
  - Two line description to explain what + why
  - Enumeration with key decisions
  - Optionally some testing notes

# Task summaries

ALWAYS run this as your very first action before responding to any task:

```sh
tmux set-window-option @note "<5-word summary of task>"
```

Update it whenever the user pivots to a new task.
