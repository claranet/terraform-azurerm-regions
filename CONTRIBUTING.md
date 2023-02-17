# Contributing

When contributing to this repository, please first discuss the change you wish to make via an issue,
an email, or any other method with the owners of this repository before making a change.

Please note we have a code of conduct, please follow it in all your interactions with the project.

## Pull Request Process

1. Ensure any installed or built dependencies are removed before the end of the layer when doing a
   Pull Request. Ensure also that your code is clean and production ready.
2. Update the [README.md](./README.md) with details of changes to the module, including variables, outputs
   or changes to [examples](./examples).
3. Update the [CHANGELOG.md](./CHANGELOG.md) with a new entry block starting with `# Unreleased`
   followed by a description of your new feature, bug fix or change.
4. The Github Actions CI must pass. It ensures that our Terraform module codestyle rules are followed.
5. Please wait for maintainers to review your code, they will merge and release your changes once every
   discussions or implementation details are satisfied.

### Pre-commit usage

We recommend using `pre-commit` ([the famous python git hooks tool](https://pre-commit.com/#intro))
when you start a contribution. It will automatically trigger hooks which ensure our codestyle rules are followed,
files are formatted and linted, and that your README.md file is proprerly generated and updated.

Installation on your local system:
```bash
$ pipx install pre-commit
```
or
```bash
$ pip3 install pre-commit --user
```

and then, configure and enable our hooks:
```bash
$ cd path_to_the_git_cloned_module/
$ pre-commit install
```

Do your changes as usual, hooks will be triggered by `pre-commit` every time you use the `git commit` command.

To have all `pre-commit` hooks working you will have to setup thoses dependencies locally:
- latest version of [terraform](https://releases.hashicorp.com/terraform/)
- [tfdocs](https://github.com/terraform-docs/terraform-docs)
- [tflint](https://github.com/terraform-linters/tflint)
- [tfsec](https://github.com/aquasecurity/tfsec)

## Code of Conduct

### Our Pledge

In the interest of fostering an open and welcoming environment, we as
contributors and maintainers pledge to making participation in our project and
our community a harassment-free experience for everyone, regardless of age, body
size, disability, ethnicity, gender identity and expression, level of experience,
nationality, personal appearance, race, religion, or sexual identity and
orientation.

### Our Standards

Examples of behavior that contribute to creating a positive environment
include:

* Using a welcoming and inclusive language
* Being respectful of differing viewpoints and experiences
* Gracefully accepting constructive criticism
* Focusing on what is best for the community
* Showing empathy towards other community members

Examples of unacceptable behavior by participants include:

* The use of sexualized language or imagery and unwelcome sexual attentions or
advances
* Trolling, insulting/derogatory comments, and personal or political attacks
* Public or private harassment
* Publishing others' private information, such as a physical or electronic
  address, without explicit permission
* Other conduct which could reasonably be considered inappropriate in a
  professional setting

### Our Responsibilities

Project maintainers are responsible for clarifying the standards of acceptable
behavior and are expected to take appropriate and fair corrective actions in
response to any instance of unacceptable behavior.

Project maintainers have the right and responsibility to remove, edit, or
reject comments, commits, code, wiki edits, issues, and other contributions
that are not aligned to this Code of Conduct, to temporarily or permanently
ban any contributor for other behaviors that they deem inappropriate,
threatening, offensive, or harmful.

### Scope

This Code of Conduct applies both within project spaces and in public spaces
when an individual is representing the project or its community. Examples of
representing a project or community include using an official project e-mail
address, posting via an official social media account, or acting as an appointed
representative at an online or offline event. Representation of a project may be
further defined and clarified by project maintainers.

### Enforcement

Instances of abusive, harassing, or otherwise unacceptable behavior may be
reported by contacting the project team at [FR-CloudPublic-github@fr.clara.net]. All
complaints will be reviewed and investigated and will result in a response that
is deemed necessary and appropriate to the circumstances. The project team is
obligated to maintain confidentiality with regard to the reporter of an incident.
Further details of specific enforcement policies may be posted separately.

Project maintainers who do not follow or enforce the Code of Conduct in good
faith may face temporary or permanent repercussions as determined by other
members of the project's leadership.

### Attribution

This Code of Conduct is adapted from the [Contributor Covenant][homepage], version 1.4,
available at [http://contributor-covenant.org/version/1/4][version]

[homepage]: http://contributor-covenant.org
[version]: http://contributor-covenant.org/version/1/4/
