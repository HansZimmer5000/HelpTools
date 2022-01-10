#!/bin/bash

log(){
    echo "$*"
}

a(){
    test -f return.sh &>/dev/null && echo abc || return 1
}

b(){
    test -f dfdfdf &>/dev/null && echo abc || return 1
}

c(){
    test -f return.sh || echo abc && return 1
}

d(){
    test -f dfdfdf &>/dev/null || echo abc && return 1
}

e(){
    test -f dfdfdf &>/dev/null || log abc && return 1
}

echo ".1"
a || echo def
echo ".2"
b || echo def
echo ".3"
c || echo def
echo ".4"
d || echo def
echo ".5"
e || echo def

