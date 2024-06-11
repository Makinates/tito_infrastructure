# What to do when you do a git pull over your uncommitted changes and your files got disappeared


If you've mistakenly run `git pull` and it has overwritten your local changes, there might still be a way to recover them, depending on the specifics of the changes and what exactly happened during the `git pull`. Here's a step-by-step approach to try to recover your work:

1. **Check the reflog**:
   Git keeps a log of all changes to the HEAD, which can help you find your previous state before the pull.

   ```sh
   git reflog
   ```

   Look for entries before the `git pull` operation. You should see an entry that corresponds to the state of your project before the pull.

2. **Identify the commit**:
   Identify the commit hash of the state you want to recover. The reflog will show you a list of recent actions with their respective commit hashes.

   Example output:
   ```
   abc1234 (HEAD -> master) HEAD@{0}: pull: Fast-forward
   def5678 HEAD@{1}: commit: Your commit message
   ```

   In this example, if `def5678` represents your state before the pull, you can use that hash.

3. **Undo the pull**:
   If you want to completely revert the `git pull`, you can reset your branch to the previous commit (use with caution):

   ```sh
   git reset --hard def5678
   ```

   This will discard any changes made by the pull, so be sure this is what you want to do.

### Example Steps

Assuming your reflog shows:

```
abc1234 (HEAD -> master) HEAD@{0}: pull: Fast-forward
def5678 HEAD@{1}: commit: Your commit message
```

You can hard reset at `def5678`:

```sh
git reset --hard def5678
```

Then, you can decide whether to merge or cherry-pick changes from `recover-branch` into your main branch.

### Important Note
Always make sure to create backups of your important work to avoid such situations in the future. Using version control systems effectively includes regular commits and pushes to remote repositories.