#!/bin/sh -l
pip install whispers
[ "$(whispers src/)" = "[]i" ]
