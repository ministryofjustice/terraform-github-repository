# Contribution guidelines

When contributing to this repository, please first discuss the change you wish to make via issue, slack, or any other method with the owners of this repository.

Our primary slack channel for contributors who wish to get in touch is #ask-operations-engineering.

## Contributing

If you’ve got an idea or suggestion you can:

- [Contact the Operations Engineering team](https://moj.enterprise.slack.com/archives/C01BUKJSZD4)
- [Create a GitHub issue in our main repository](https://github.com/ministryofjustice/operations-engineering/issues)

## Raising bugs

When raising bugs, please explain the issue in reasonable detail and provide a guide on how to replicate it.

When describing the bug, it's useful to follow the format:

- What you did
- What you expected to happen
- What happened

## Suggesting features

Please raise feature requests as issues using our [feature request template](https://github.com/ministryofjustice/operations-engineering/issues/new?assignees=&labels=github%2Cfeature+request%2Cthird+party&projects=&template=github-feature-requests.md&title=). This ensures requests are openly discussed before any code is contributed.

## Security vulnerabilities

Please contact us via [Slack](https://mojdt.slack.com/archives/C01BUKJSZD4) to discuss the vulnerability first. Then raise an issue using our [report a security vulnerabilty template](https://github.com/ministryofjustice/operations-engineering/security/advisories/new).

## Contributing code

### Terraform Versions

We use Hashicorp [Terraform](https://www.terraform.io/) to deliver infrastructure as code.

We stay up to date with the latest version of Terraform, but control the version of the Terraform Providers in use.

### Tests

Our versioned Terraform modules have unit tests; these are written using [Terratest](https://pkg.go.dev/github.com/gruntwork-io/terratest#section-readme) and Go.

Your branch should ensure that changes you have made are reflected in the tests, and that these unit tests pass before raising a pull request.

A GitHub Action will automatically run tests against your pull request once you have raised it.

### Versioning

Where appropriate, versioning is based on your commit message using [Semantic Versioning](https://semver.org/).

When raising a pull request please provide context so that your changes are easier to understand.

### Release

Releases are actioned by the Operations Engineering team.
