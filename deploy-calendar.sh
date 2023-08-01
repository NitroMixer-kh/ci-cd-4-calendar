#!/bin/bash
############################################################
#project/code - линка на актуальный деплой
#project/versions -  все билды
#project/deploy - файлы, который нужно переместить до старта нового деплоя в директорию нового деплоя, чтобы он прошел успеш>
############################################################

branch="master"
branch_dir="/var/www/calendar-$branch"
deploy_dir="$branch_dir/deploy"
all_versions_dir="$branch_dir/versions"
code_link="$branch_dir/code"
deploy_date=$(date -u +%Y_%m_%d_T%H_%M_%S)
version_dir="$all_versions_dir/$deploy_date"
previous_links="$branch_dir/previous_links/"

cd $deploy_dir
git clone https://github.com/NitroMixer-kh/ci-cd-4-calendar.git

mkdir $version_dir

rsync -a $deploy_dir/ $version_dir/

cp -Pf $code_link $previous_links
ln -sf -T $version_dir $code_link

rm -rf /var/www/calendar-master/deploy/*
