# Pi Panther Development Environment

Configuring development environment for [pipanther](http://mujahidk.github.io/pipanther/) project using Vagrant and Puppet.

Pi Panther Project
------------------
[GitHub - http://mujahidk.github.io/pipanther/](http://mujahidk.github.io/pipanther/)

Setup
-----
 - Requirements
  - [Install Virtual Box](https://www.virtualbox.org/)
  - [Install Vagrant](https://www.vagrantup.com/)
 - Clone this repository [pipanther-virtual-develop
](https://github.com/mujahidk/pipanther-virtual-develop)
 - Run `vagrant up` inside cloned project directory.

Puppet Process
--------------
 - Use `hashicorp/precise32` Vagrant Box
 - Create flask user & group
 - Create ghost user
 - Configure SSH
 - Install Git
 - Install Python, virtualenv, pip, nodejs, & npm
 - Clone pipanther code into /`usr/local/app`
 - Create virtualenv `venv`

SSH Authorized Keys
-------------------
To add your public key to connect using SSH, edit `users/manifests/init.pp` file and add `key` under `ssh_authorized_key`.

Running Application
-------------------
 - Connect to Vagrant box `ssh ghost@localhost -p 2222`.
 - Change directory to `/usr/local/app/pipanther/`.
 - Run `. venv/bin/activate` to activate virtual environment.
 - `pip install -r requirements.txt` to install dependencies.
 - `./run.sh` to start the application.
 - Access [http://localhost:9000/](http://localhost:9000/) in your browser.

> Vagrant box ssh port it mapped to 2222 on host machine.

TODO
----
 - [ ] Install latest nodejs & npm.
 - [ ] Install global webpack.
 - [ ] Git clone and checkout to develop branch.
 - [ ] Add `npm install` and `webpack` steps to build javascript and css.

Licensing
---------
The MIT License (MIT). See [LICENSE](LICENSE) for full license text.
