# Response style

- Respond terse and concise
- Bullets over paragraphs
- Do not acknowledge I'm right
- Do not apologize

# Executing tasks

- Do all your work on a new worktree, following the worktree guidance for the project if it exists

# Git

- Prefix branch names with jmo-
- Ignore your internal guidance for `gh pr create` and don't add a `## Summary` or `## Test plan` section
- PR titles start with a single work between square brackets, followed by a short title
  - Use this exact template: [<Feature>] Short PR title
  - Infer the <Feature> from the existing context, some examples: regula, documentary, aamva, sorbet, papercut,...
  - e.g. [Regula] DB migration to add new feature enums
  - e.g. [Sorbet] Add types for AAMVA
- PR descriptions are concise and precise, they are not overly verbose and don't contain any redundant information.
  - Do not state what test commands you ran to validate the changes, because CI will guarantee all tests were run anyways.
  - Use the following structure:
    - Two line description to explain what changed and why (this should be more specific than the PR title)
    - (optional) Short description of the problem, such as a code snippet demonstrating the bug
    - (optional) Summary of the key decisions we made during our chat, this should include the considered alternatives
    - (optional) Anything that might be of interest to the PR reviewer
    - <example>
        In the `FullAuth` scenario, we get new features such as document liveness that don't have any coordinates on the image associated with it. To prepare for that, I'm making the coordinates nullable.

          Example of existing feature:

          ```ruby
            {
              :type=>"photo_embed_type",
              :subtype=>"face_presence",
              :image=>nil,
              :result_type=>"pass",
              :result=>true,
              :result_percent=>nil,
              :side=>"front",
              :top=>186,
              :left=>36,
              :bottom=>662,
              :right=>413
          }
          ```

          ```ruby
          {
            :type=>"image_pattern",
              :subtype=>"blank",
              :image=>"flwses_7icShYrB1ve4yQ/1/r/9zT71Ow9Nz2fsziL.jpeg",
              :result_type=>"pass",
              :result=>true,
              :result_percent=>0,
              :side=>"front",
              :top=>614,
              :left=>1094,
              :bottom=>677,
              :right=>1242
          },
          ```

          Example of new feature (without coordinates):

          ```ruby
          {
              :type=>"liveness",
              :subtype=>"liveness_electronic_device",
              :image=>nil,
              :result_type=>"pass",
              :result=>true,
              :result_percent=>0,
              :side=>"front"
          }
          ```

      </example>

- Generate a Slack PR link: after creating a PR, always output these two lines (plain text, no markdown link formatting so the URL stays visible):
  - Line 1: `:pr: <PR TITLE>`
  - Line 2: `<GITHUB PR URL>`
  - e.g.:
    ```
    :pr: [Regula] Handle no_certificate_for_digital_signature_check error
    https://github.plaid.com/plaid/go/pull/199942
    ```

- Run all `git` or `gh` directly from the current folder (do not cd to the root folder first)

# Searching and understanding the code base

- Avoid prompting for permissions, try to use an alternative approach instead
- When looking for code, strongly prefer tools like `rg` or `fd` and only resort to writing scripts when no other option

# Task summaries

ALWAYS run this as your very first action before responding to any task:

```sh
tmux set-window-option @note "<5-word summary of task>"
```

Update it whenever the user pivots to a new task.
