#!/bin/sh

ATOM_REPO=atom/atom
DOCKER_ATOM_REPO=jamesnetherton/docker-atom-editor
BASE_URL=https://api.github.com/repos
LATEST_TAG=$(curl -s -H "Authorization: token ${GITHUB_TOKEN}" ${BASE_URL}/${ATOM_REPO}/releases/latest | jgrep -s tag_name)
CURRENT_TAG=$(cat Dockerfile | grep "ENV ATOM_VERSION" | cut -f3 -d' ')
EXISTING_TAG=$(git tag -l ${LATEST_TAG})

if [[ -z "${EXISTING_TAG}" ]]
then
  sed -i "s/${CURRENT_TAG}/${LATEST_TAG}/g" Dockerfile
  git add Dockerfile
  git commit -m"Update to ${LATEST_TAG}"
  git push
  git tag ${LATEST_TAG}
  git push -u origin ${LATEST_TAG}

  curl -s -X POST --data "{ \"title\": \"Build image for ${LATEST_TAG}\", \"assignee\": \"jamesnetherton\" }" -H "Authorization: token ${GITHUB_TOKEN}" ${BASE_URL}/${DOCKER_ATOM_REPO}/issues
fi
