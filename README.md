[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT HEADER -->
<br />
<p align="center">
  <h3 align="center">reusable-workflows</h3>

  <p align="center">
    Reusable workflows for all my github stuff
    <br />
    <br />
    ·
    <a href="https://github.com/beuluis/reusable-workflows/issues">Report Bug</a>
    ·
    <a href="https://github.com/beuluis/reusable-workflows/issues">Request Feature</a>
    ·
  </p>
</p>

<!-- ABOUT THE PROJECT -->

## About The Project

> [!WARNING]  
> This project is currently in a restructure phase. So the documentation is not up to date and all is unstable.

Reusable workflows for all my github stuff. See [reusing-workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows).

## Disclaimer

Most workflows are fitted to my taste of development. This project is still open source since i believe oversharing is better.
So if you are going to use this be aware that those workflows are meant for my own repositories and will grow and adapt with the needs of them.

## Workflows

### [NPM Publish](.github/workflows/npm-publish.yml)

Publish a NPM package to the NPM registry.

#### Inputs

| Name              | Description                                    | Type     | Default  | Required |
| ----------------- | ---------------------------------------------- | -------- | -------- | -------- |
| `dist_tag`        | NPM dist tag to publish to.                    | `string` | `latest` | `false`  |
| `node_version`    | Node version to build on.                      | `string` | `18`     | `false`  |
| `package_manager` | Package manager to use. Can be 'npm' or 'bun'. | `string` | `npm`    | `false`  |

#### Secrets

| Name        | Description                                 | Required |
| ----------- | ------------------------------------------- | -------- |
| `NPM_TOKEN` | NPM token with right access for publishing. | `true`   |

#### Environment deployment

It deploys to a environment with the same name as the `dist_tag`.

### [GitHub NPM Publish](.github/workflows/github-npm-publish.yml)

Publish a NPM package to the GitHub registry.

#### Inputs

| Name              | Description                                    | Type     | Default | Required |
| ----------------- | ---------------------------------------------- | -------- | ------- | -------- |
| `dist_tag`        | NPM dist tag to publish to.                    | `string` | ``      | `true`   |
| `node_version`    | Node version to build on.                      | `string` | `18`    | `false`  |
| `package_manager` | Package manager to use. Can be 'npm' or 'bun'. | `string` | `npm`   | `false`  |

#### Secrets

| Name           | Description                                    | Required |
| -------------- | ---------------------------------------------- | -------- |
| `GITHUB_TOKEN` | GitHub token with right access for publishing. | `true`   |

### [NPM dist-tag remove](.github/workflows/github-npm-remove-dist-tag.yml)

Remove a dist-tag from the GitHub registry.

#### Inputs

| Name       | Description             | Type     | Default | Required |
| ---------- | ----------------------- | -------- | ------- | -------- |
| `dist_tag` | NPM dist tag to remove. | `string` |         | `true`   |

#### Secrets

| Name           | Description                                  | Required |
| -------------- | -------------------------------------------- | -------- |
| `GITHUB_TOKEN` | GitHub token with right access for removing. | `true`   |

### [Deploy](.github/workflows/deploy.yml)

Deploys a service to a specified environment.

#### Inputs

| Name               | Description          | Type     | Default | Required |
| ------------------ | -------------------- | -------- | ------- | -------- |
| `environment_name` | Name of environment. | `string` | none    | `true`   |

#### Secrets

| Name           | Description                                           | Required |
| -------------- | ----------------------------------------------------- | -------- |
| `SSH_HOST`     | SSH server to log in via SSH.                         | `true`   |
| `SSH_USERNAME` | SSH username to log in via SSH.                       | `true`   |
| `SSH_KEY`      | SSH secret key to log in via SSH.                     | `true`   |
| `ENVIRONMENT`  | Environment file string to be used during deployment. | `true`   |

#### Environment deployment

It deploys to a environment with the same name as the `environment_name`.

### [NPM Node Testing](.github/workflows/npm-node-qa-testing.yml)

Testing for node app using npm as package manager, libraries and components.

#### Inputs

| Name                   | Description                                                         | Type      | Default                    | Required |
| ---------------------- | ------------------------------------------------------------------- | --------- | -------------------------- | -------- |
| `node_versions`        | Node versions matrix to test on.                                    | `string`  | `['16.x', '17.x', '18.x']` | `false`  |
| `package_manager`      | Package manager to use. Can be 'npm' or 'bun'.                      | `string`  | `npm`                      | `false`  |
| `format_command`       | Format command to run. To disable set to `''`.                      | `string`  | `npm run format`           | `false`  |
| `lint_command`         | Lint command to run. To disable set to `''`.                        | `string`  | `npm run lint`             | `false`  |
| `build_command`        | Build command to run.                                               | `string`  | `npm run build`            | `false`  |
| `test_command`         | Test command to run. To disable set to `''`.                        | `string`  | `npm run test`             | `false`  |
| `run_jest_coverage`    | Run and report the coverage with jest. Uses `test_command` as base. | `boolean` | `true`                     | `false`  |
| `skip_coverage_report` | Skip coverage reporting for resources that can not accept comments. | `boolean` | `false`                    | `false`  |

#### Permissions

| Name            | value   | Description                                                          |
| --------------- | ------- | -------------------------------------------------------------------- |
| `pull-requests` | `write` | Only needed if job is used in a job with the `pull_request` trigger. |
| `contents`      | `write` | Only needed if job is used in a job with the `push` trigger.         |

### [Bun Node Testing](.github/workflows/bun-node-qa-testing.yml)

Testing for node app using bun as package manager, libraries and components.

#### Inputs

| Name                   | Description                                                         | Type      | Default                    | Required |
| ---------------------- | ------------------------------------------------------------------- | --------- | -------------------------- | -------- |
| `node_versions`        | Node versions matrix to test on.                                    | `string`  | `['16.x', '17.x', '18.x']` | `false`  |
| `format_command`       | Format command to run. To disable set to `''`.                      | `string`  | `bun run format`           | `false`  |
| `lint_command`         | Lint command to run. To disable set to `''`.                        | `string`  | `bun run lint`             | `false`  |
| `build_command`        | Build command to run.                                               | `string`  | `bun run build`            | `false`  |
| `test_command`         | Test command to run. To disable set to `''`.                        | `string`  | `bun run test`             | `false`  |
| `run_jest_coverage`    | Run and report the coverage with jest. Uses `test_command` as base. | `boolean` | `true`                     | `false`  |
| `skip_coverage_report` | Skip coverage reporting for resources that can not accept comments. | `boolean` | `false`                    | `false`  |

#### Permissions

| Name            | value   | Description                                                          |
| --------------- | ------- | -------------------------------------------------------------------- |
| `pull-requests` | `write` | Only needed if job is used in a job with the `pull_request` trigger. |
| `contents`      | `write` | Only needed if job is used in a job with the `push` trigger.         |

### [Environment Setup](.github/workflows/environment-setup.yml)

Checks out the commit, set up the node env and setup the package manager with caching.

#### Inputs

| Name                | Description                                          | Type     | Default                      | Required |
| ------------------- | ---------------------------------------------------- | -------- | ---------------------------- | -------- |
| `node_versions`     | Node versions matrix to test on.                     | `string` | `['16.x', '17.x', '18.x']`   | `false`  |
| `package_manager`   | Package manager to use. Can be 'npm' or 'bun'.       | `string` | `npm`                        | `false`  |
| `dependencies_type` | Dependencies type to install. Can be 'prod' or 'dev' | `string` | `prod`                       | `false`  |
| `registry_url`      | Registry url to use.                                 | `string` | `https://registry.npmjs.org` | `false`  |

## Directory structure and file naming

> Reusable workflows are YAML-formatted files, very similar to any other workflow file. As with other workflow files, you locate reusable workflows in the `.github/workflows` directory of a repository. Subdirectories of the `workflows` directory are not supported.

From [Creating a reusable workflow](https://docs.github.com/en/actions/using-workflows/reusing-workflows#creating-a-reusable-workflow)

So until we have something nicer here, I'll use file naming to create some sort of organization.

- `internal-*` will be used for workflows for this repository not meant for reusing
- for the others i will just convert my wanted subdirectories to filenames like: `qa/eslint.yml` to `qa-eslint.yml`

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/beuluis/reusable-workflows.svg?style=flat-square
[contributors-url]: https://github.com/beuluis/reusable-workflows/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/beuluis/reusable-workflows.svg?style=flat-square
[forks-url]: https://github.com/beuluis/reusable-workflows/network/members
[stars-shield]: https://img.shields.io/github/stars/beuluis/reusable-workflows.svg?style=flat-square
[stars-url]: https://github.com/beuluis/reusable-workflows/stargazers
[issues-shield]: https://img.shields.io/github/issues/beuluis/reusable-workflows.svg?style=flat-square
[issues-url]: https://github.com/beuluis/reusable-workflows/issues
[license-shield]: https://img.shields.io/github/license/beuluis/reusable-workflows.svg?style=flat-square
