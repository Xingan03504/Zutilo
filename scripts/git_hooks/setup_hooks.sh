#!/usr/bin/env bash
set -e
OS="$(uname)"

if [ $OS = "Linux" ] ; then
	DIR="$( cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"
elif [ $OS = "Darwin" ] ; then
	FILEPATH=$(readlink "${BASH_SOURCE[0]}")
	# Check exit status of readlink -- nonzero means BASH_SOURCE not a symlink
	if [ $? != 0 ] ; then
		FILEPATH="${BASH_SOURCE[0]}"
	fi
	DIR="$( cd -P "$(dirname "${FILEPATH}")" && pwd)"
fi

cd "${DIR}"
cd "$(git rev-parse --show-toplevel)"

ln -sf ../../scripts/git_hooks/pre-commit .git/hooks/pre-commit
