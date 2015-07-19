#!/bin/sh

git add -A

read -p "Commit Message: " commitMessage
git commit -m "$commitMessage"

read -p "Do you want to add tag? (y/n)" answer

case $answer in
	y)
		git tag
		read -p "Tag: " tag
		git tag $tag
		git push --tags
		;;
	n)
		;;
	*)
		;;
esac

git push

# comments out below if you want to publish gh-pages
git checkout gh-pages
git rebase master
git push origin gh-pages
git checkout master