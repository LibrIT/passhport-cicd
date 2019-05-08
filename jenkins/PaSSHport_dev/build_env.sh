#!/usr/bin/env bash
########################
# Step 1: Setup virtualenv
# This step is only for Jenkins. Travis and CircleCI will ignore this step.
########################

if [ -n "${WORKSPACE:+1}" ]; then
	# Path to virtualenv cmd installed by pip
	# /usr/local/bin/virtualenv
	PATH=${WORKSPACE}/venv/bin:/usr/local/bin:$PATH
	if [ ! -d "venv" ]; then
		/usr/bin/env python3 -m venv "${JOB_BASE_NAME}"
		echo "Activating virtualenv"
		. "${JOB_BASE_NAME}/bin/activate"

		echo "Upgrading pip"
		pip install --upgrade pip
		echo "Install Requirements"
		pip install -r requirements.txt -r passhportd/app/tests/requirements.txt --cache-dir /tmp/$JOB_NAME
	fi
	echo "Activating virtualenv"
	. "${JOB_BASE_NAME}/bin/activate"
else
	# Alternatively, $TRAVIS_REPO_SLUG could be utilized here to provide name.
	echo "Error : problem with workspace"
	exit 1
fi
########################
# Step 2: Execute Test
########################
nosetests --with-xunit --all-modules --traverse-namespace --cover-package=me.maxwu --cover-inclusive --logging-level=INFO --debug=me.maxwu -s -v --xunit-file ci-stat_nose_xunit.xml --cover-html passhportd
