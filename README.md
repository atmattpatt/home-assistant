home-assistant config
=====================

This repo contains my configuration files for [home-assistant]. I try to keep as
much configuration committed to Git as I can. This repository is a public mirror
of my configuration.

I run home-assistant as a Docker container, with a configuration directory
mounted in the container. The configuration files are managed by Puppet and
deployed with a self-hosted GitHub Actions runner which has the same
configuration directory mounted.

For security reasons, Actions are disabled on the public version of this
repository.

## Working in this repository

### Setup

- Ensure Ruby, yammlint, and prettier are installed
- `bundle install`

### Secrets

The `secrets.yaml` file used by home-assistant is managed outside of Git.

### CI

In the private repo, CI will run YAML linting and formatting, Puppet linting,
and a configuration test against the stable, beta, and dev versions of
home-assistant. It will also perform a `puppet apply --noop` to show any
changes that are pending.

A separate Deploy workflow can be triggered manually to `puppet apply` the
changes.

[home-assistant]: https://www.home-assistant.io/
