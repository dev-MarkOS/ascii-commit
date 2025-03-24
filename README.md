# ascii-commit

> dOnt EvEn BoThEr ApplYinG tO ThIs jOb iF yoUr ComMit GraPh doEsN't LoOk LiKe tHiS.

## How to use

1. Use [this website](https://patorjk.com/software/taag/#p=display&f=Banner&t=GIT%20GUD) to convert your text to a '#' pattern.
2. Paste the pattern into the pic.txt file. Make sure the file remains 52 columns wide and 7 rows tall.
3. Execute the `./reset.sh` script to reset the git repository to the initial state.
4. Execute the `./ascii-commit.sh` script to commit the pattern to the repository.

## How to contribute to this project

This is tricky, you cannot make a commit because the reset script will remove it. Instead, you need to rebase:

Copy the hash of the very first commit.
```bash
git log --reverse
```

```bash
git rebase -i --root
```

Replace `pick` with `edit` for the initial commit.
```bash
edit <hash> initial commit
pick <hash> Fake commit
pick <hash> Fake commit
```

Save and close the editor.

```bash

Make your changes. Use `git commit --amend --no-edit` to make sure the initial commit message remains the same. The reset script depends on it.

```bash
git rebase --continue
```



