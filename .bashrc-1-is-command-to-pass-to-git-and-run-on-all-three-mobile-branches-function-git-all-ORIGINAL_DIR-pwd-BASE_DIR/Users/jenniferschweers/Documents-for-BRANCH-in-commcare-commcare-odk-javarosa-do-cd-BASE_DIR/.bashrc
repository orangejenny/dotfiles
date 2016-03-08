### Dimagi: mobile

# $1 is command to pass to git and run on all three mobile branches
function git-all() {
    ORIGINAL_DIR=`pwd`
    BASE_DIR="/Users/jenniferschweers/Documents"
    for BRANCH in 'commcare' 'commcare-odk' 'javarosa'
    do
        cd "$BASE_DIR/$BRANCH"
        echo ""
        echo "============= $BRANCH"
        git $1
    done
    cd $ORIGINAL_DIR
}

function git-all-branch() {
    git-all branch
}

function git-all-status() {
    git-all status
}

### Dimagi: HQ
function show-branches() {
    for BRANCH in `git branch | grep -v '\\*'`
    do
        echo $(git log $BRANCH -1\
        --pretty="
            %C(magenta)%ad
            %C(reset)<name>
            %C(yellow)%s
            %C(red)%d
            %C(reset)
        ") | sed "s/<name>/$BRANCH -/g"
    done
}

function pyc-purge() {
    find . -name '*.pyc' -delete
}

function pull-latest-masters() {
    git checkout master
    git pull origin master
    git submodule update --init
    git submodule foreach --recursive 'git checkout master; git pull origin master &'
    until [ -z "$(ps aux | grep '[g]it pull')" ]; do sleep 1; done
    pyc-purge
}
function update-code() {
    git checkout master
    git pull origin master
    git submodule update --init --recursive
    pyc-purge
}

function hammer() {
    git checkout master
    git pull origin master
    git submodule update --init --recursive
    pip install -r requirements/requirements.txt -r requirements/dev-requirements.txt -r requirements/prod-requirements.txt
    find . -name '*.pyc' -delete
    ./manage.py migrate
    bower install
}
