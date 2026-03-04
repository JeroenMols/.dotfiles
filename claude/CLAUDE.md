# Response style

Keep responses terse and concise.

# Task summaries

ALWAYS run this as your very first action before responding to any task:

```sh
tmux set-window-option @note "<5-word summary of task>"
```

Update it whenever the user pivots to a new task.

# Creating a pull request

When I ask you to create a pull request, do the following:

- Print "Howdi Jeroen, absolutely I can fire up a PR for you"
- Checkout master and pull the latest changes
- Create a new branch prefixed with `jmo-` followed by a shorthand explanation of the changes using - as a separator (e.g. `jmo-fix-unit-test-warnings`)
- Rebase the current changes onto master
- Create a commit with all the changes you made
- Push the branch to origin
- Use the `gh` tool to create a pull request
