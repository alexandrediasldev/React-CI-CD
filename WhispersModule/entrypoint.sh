#!/bin/sh -l
pip install whispers
output=$(whispers src/)
if [ "($output)" = "[]i" ]
	exit 0
fi
echo "Whispers error: $output"
exit 1
