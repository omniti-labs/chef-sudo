# Sudoers

Manages /etc/sudoers and /etc/sudoers.d/ from attributes.

## Recipes

### `sudo` (`sudo::default`)

Creates /etc/sudoers.d if it does not exist.

Templates /etc/sudoers ; adds an include dir for /etc/sudoers.d , then walks
attributes to create entries for users and groups.

### `sudo::keep-ssh-agent`

Adds an entry to /etc/sudoers.d that will pass through the SSH_AUTH_SOCK
environment variable.

This allows you to retain your ssh identities via your agent after you have
sudo'd.


### `sudo::vagrant`

Adds an entry to /etc/sudoers.d granting passwordless sudo to the 'vagrant'
user, needed for use with the Vagrant VM tool.


## Attributes

    :authorization => {
        :sudo => {
            :users => [
               # Each user will be granted full sudo, password required.
               'bob',
            ],
            :groups => [
               # Any user that is a member of the listed groups will be
               # granted full sudo, password required.
               'wheel',
            ],

            # The ERB template for /etc/sudoers normally comes from the sudo
            # cookbook.  But you can replace that if you need different
            # options in the file.
            #:template_cookbook => 'something_else',
            # This cookbook provides an alternate template that adds NOPASSWD:
            # to each sudoers entry. To use it, set :template_file.
            :template_file => 'sudoers_nopasswd.erb',
        }
    }

You can also enable/disable the entire sudo cookbook by setting:

    node[:authorization][:sudo][:enabled] = false
