source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

for file in ~/.config/shell/{profile,aliases,interactive} ~/.config/shell/*.bash; do
    [[ -r "$file" ]] && source "$file"
done


function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function fish_greeting
	# nothing
end

# zoxide (smarter cd)
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init bash)"
fi
