#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

url='git://github.com/docker-library/rails'

echo '# maintainer: InfoSiftr <github@infosiftr.com> (@infosiftr)'

commit="$(git log -1 --format='format:%H' .)"
fullVersion="$(grep -m1 'ENV RAILS_VERSION ' Dockerfile | cut -d' ' -f3)"

versionAliases=()
while [ "${fullVersion%.*}" != "$fullVersion" ]; do
	versionAliases+=( $fullVersion )
	fullVersion="${fullVersion%.*}"
done
versionAliases+=( $fullVersion latest )

echo
for va in "${versionAliases[@]}"; do
	echo "$va: ${url}@${commit}"
done

for variant in onbuild; do
	echo
	for va in "${versionAliases[@]}"; do
		if [ "$va" = 'latest' ]; then
			va="$variant"
		else
			va="$va-$variant"
		fi
		echo "$va: ${url}@${commit} $variant"
	done
done