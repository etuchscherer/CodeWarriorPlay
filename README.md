# onTrac Continous Delivery System

A simple continous delivery system, for a single server entity, backed by github.

If you are serving files from a replicated server environment, this may not be for you.

onTrac works by comparing the sha of your local git repo against the head of your ( github ) origin repo. If the Sha's do not match, the user has the option to deploy. 

## Installation

On osx:

    cd ~/Sites && git clone https://github.com/etuchscherer/CodeWarriorPlay.git
    cd CodeWarriorPlay && bundle
    echo SECRET_TOKEN=a secret string, used for CSRF protection > .env

## Configuration
Configuration steps:

1. Sign up.
2. Fill out the project configuration form.
3. Go!
    
## Useage:
To run onTrac locally on `localhost:3000`

    rails s

We currently recommend running onTrac on your production server.

## Todos
.5 onTrack Server Configuration (run it on the same hostname, different port)
1. Authorization
2. Notifications
3. Install Scripts
