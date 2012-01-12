#!/bin/bash

# version: 0.1a
# guilty-party: Andrew Lenards <lenards@iplantcollaborative.org>
# date: December 20, 2010 (Mike Watt's Birthday)


PYMI='migrate.py'

if [ ! -e './'$PYMI ]
then
    echo -e 'ERROR: ' $PYMI ' is not found. Think of all the kittens!?!?!?'
    exit 1
fi

python migrate.py --operation refresh --db-version=650