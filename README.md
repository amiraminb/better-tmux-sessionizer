# better-tmux-sessionizer

A tmux session manager with git worktree integration. Fuzzy-find projects, switch sessions, and open branches in worktrees — all from one fzf picker.

Based on [tmux-sessionizer](https://github.com/ThePrimeagen/tmux-sessionizer).

## Usage

```
better-tmux-sessionizer [OPTIONS] [SEARCH_PATH]
```

### Options

| Flag | Description |
|------|-------------|
| `-b`, `--branch` | Open branch picker directly for the current project |
| `-s`, `--session <idx>` | Session command index |
| `--vsplit` | Create vertical split for session command |
| `--hsplit` | Create horizontal split for session command |

### Interactive keys

| Key | Action |
|-----|--------|
| `Enter` | Select directory / branch |
| `Ctrl-W` | Toggle git branch picker |
| `Escape` | Exit |

### Branch picker

Press `Ctrl-W` on a git project to switch to its branch list. Select a branch to open it in a new tmux window via `git worktree`. Press `Ctrl-W` again to go back.

You can also open the branch picker directly for the current project with `--branch`:

```
better-tmux-sessionizer --branch
```

This detects the git project from your current pane's working directory.

Worktrees are stored at `~/dev/worktrees/<project>/<branch>`.

## Configuration

Create `~/.config/better-tmux-sessionizer/better-tmux-sessionizer.conf`:

```bash
TS_SEARCH_PATHS=(~/dev:2 ~/wiki:0 ~/.config:0)
BTS_WORKTREE_BASE=~/dev/worktrees
BTS_BRANCH_KEY=ctrl-w
```

If migrating from tmux-sessionizer, existing `~/.config/tmux-sessionizer/tmux-sessionizer.conf` is also picked up automatically.

## Install

```bash
git clone https://github.com/amiraminb/better-tmux-sessionizer.git
cd better-tmux-sessionizer
ln -sf "$(pwd)/better-tmux-sessionizer" ~/.local/bin/better-tmux-sessionizer
```

Then bind in tmux or your shell:

```bash
# tmux: Ctrl-F for project picker, Ctrl-W for branch picker
bind -r f run-shell "tmux neww ~/.local/bin/better-tmux-sessionizer"
bind -r w run-shell "tmux neww ~/.local/bin/better-tmux-sessionizer --branch"
```

```bash
# zsh: Ctrl-F for project picker, Ctrl-W for branch picker
bindkey -s '^f' 'better-tmux-sessionizer\n'
bindkey -s '^w' 'better-tmux-sessionizer --branch\n'
```
