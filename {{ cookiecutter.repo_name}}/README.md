# {{ cookiecutter.repo_name | replace("-", " ") }}

{{ cookiecutter.project_short_description  }}


## Requirements

N/A


## Role Variables

The following variables will change the behavior of this role (default values are shown below):

|  variable name  |    required     |  default value  |   description   |
| --------------- | --------------- | --------------- | --------------- |
| {{ cookiecutter.repo_name | replace('-', '_') }}_action |        y        |        -        | action of the playbook to run |


## Dependencies

N/A


## Example Playbook

```yaml
- hosts: "servers"
  roles:
    - role: "{{ cookiecutter.repo_name }}"
      user:
        {{ cookiecutter.repo_name | replace('-', '_') }}_action: "install"
```


## Test

This ansible role is tested though **molecule** with the proider **docker**.


### Run test

_note: your current context MUST be configured to spin container on an docker host_


```bash
# source into your python venv (optionnal)
pip install -r requirements.txt
molecule test --all --parallel
## molecule test -s <scenario name>

or 

# source into your python venv (optionnal)
make test
```


## License

MIT


## Author Information

{{ cookiecutter.author_full_name }}
