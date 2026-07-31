source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
    # smth smth
end

# start yazi
function y
    # temp file
    set tmp (mktemp -t "yazi-cwd.XXXXXX")

    # run yazi
    command yazi $argv --cwd-file="$tmp"

    # cd back
    if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end

    # clean up
    command rm -f -- "$tmp"
end

# set editor
set -gx EDITOR micro

# init zoxide
zoxide init fish | source
