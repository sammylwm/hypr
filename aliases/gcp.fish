function gcp
    if test -d $argv[1]
        set path $argv[1]
        set msg (string join ' ' $argv[2..-1])
        pushd $path
        git add .
        git commit -m "$msg"
        git push
        popd
    else
        git add .
        git commit -m (string join ' ' $argv)
        git push
    end
end
