#!/bin/bash

catalog_count=$(ls ./test | wc -l)

echo $catalog_count

if  [[ $catalog_count -gt "4" ]]
        then
                echo "Есть что поудалять!!!"
                cd ./test
                ls -t | tail -n +3 | xargs -d '\n' rm -rf
        else
                echo "Удалять нечего. "
fi

ls -t
