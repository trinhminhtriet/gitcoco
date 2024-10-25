# ⚡ GitCoco

```text
  ____  _  _     ____                     
 / ___|(_)| |_  / ___|  ___    ___   ___  
| |  _ | || __|| |     / _ \  / __| / _ \ 
| |_| || || |_ | |___ | (_) || (__ | (_) |
 \____||_| \__| \____| \___/  \___| \___/ 
```

⚡ GitCoco: A Rust-based CLI for Conventional Commits, making commit standardization effortless and consistent for seamless project versioning and collaboration.


## ✨ Features

`gitcoco` gives tools to work with [Conventional Commits][1].

It provides the following commands:

- `gitcoco changelog`: Create a changelog file.
- `gitcoco check`: Checks if a range of commits is following the convention.
- `gitcoco commit`: Helps to make conventional commits.
- `gitcoco version`: Finds out the current or next version.



## 🚀 Installation

Make sure that `cmake` has been installed. If not, you should install `cmake`:

```bash
cmake --version
brew install cmake
```

To install **gitcoco**, simply clone the repository and follow the instructions below:

```bash
git clone git@github.com:trinhminhtriet/gitcoco.git
cd gitcoco

cargo install --path .
```

Running the below command will globally install the `gitcoco` binary.

```bash
cargo install gitcoco
```

Optionally, you can add `~/.cargo/bin` to your PATH if it's not already there

```bash
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## 💡 Usage

### Changelog

A changelog can be generated using the conventional commits.
It is inspired by [conventional changelog][2] and the [configuration file](#configuration) allows changes to the generated the output.

```sh
gitcoco changelog > CHANGELOG.md
```

### Check

Check a range of revisions for compliance.

It returns a non zero exit code if some commits are not conventional.
This is useful in a pre-push hook.

```sh
gitcoco check $remote_sha..$local_sha
```

### Commit

Helps to make conventional commits.
A scope, description, body, breaking change and issues will be prompted.
Convco will recover the previous message in case git failed to create the commit.

```sh
gitcoco commit --feat
```

`gitcoco commit` can also be used as git [core.editor][4].
In this case `gitcoco commit` will not invoke `git commit`, but `git` will invoke `gitcoco commit`

e.g.:

```sh
GIT_EDITOR='gitcoco commit' git commit -p
```

When persisting the git editor also set [`sequence.editor`][5] when editing the todo list of an interactive rebase.

Or configure a git alias:

```sh
git config --global alias.gitcoco '!GIT_EDITOR="gitcoco commit" git commit'
```

### Version

When no options are given it will return the current version.
When `--bump` is provided, the next version will be printed out.
Conventional commits are used to calculate the next major, minor or patch.
If needed one can provide `--major`, `--minor` or `--patch` to overrule the convention.

```sh
gitcoco version --bump
```

## 🗑️ Uninstallation

Running the below command will globally uninstall the `gitcoco` binary.

```bash
cargo uninstall gitcoco
```

Remove the project repo

```bash
rm -rf /path/to/git/clone/gitcoco
```

## 🤝 How to contribute

We welcome contributions!

- Fork this repository;
- Create a branch with your feature: `git checkout -b my-feature`;
- Commit your changes: `git commit -m "feat: my new feature"`;
- Push to your branch: `git push origin my-feature`.

Once your pull request has been merged, you can delete your branch.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## References

[1]: https://www.conventionalcommits.org/
[2]: https://github.com/conventional-changelog/conventional-changelog
[3]: https://github.com/conventional-changelog/conventional-changelog-config-spec/blob/master/versions/2.1.0/README.md
[4]: https://git-scm.com/docs/git-var#Documentation/git-var.txt-GITEDITOR
[5]: https://git-scm.com/docs/git-var#Documentation/git-var.txt-GITSEQUENCEEDITOR