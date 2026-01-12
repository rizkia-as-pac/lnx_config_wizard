alias killsidebutton="xmodmap -e 'pointer = 1 2 3 4 5 6 7 0 0 0 0 0 0'"
alias kucing="kitty --detach"
alias koceng="xterm &"
alias klipbord='xclip -selection clipboard'

alias ls='ls -al --color=auto'

print_tree() {
  local root="${1:-.}"

  find "$root" -mindepth 1 -printf '%P\n' 2>/dev/null \
    | LC_ALL=C sort \
    | awk -F'/' '
      {
        n = NF
        depth = n - 1
        name[NR] = $n
        depthArr[NR] = depth

        for (i = 1; i <= n; i++) part[NR, i] = $i

        # Track last occurrence of every prefix (for vertical bars ┃)
        pref = ""
        for (i = 1; i <= depth; i++) {
          pref = (i==1 ? $i : pref "/" $i)
          last[pref] = NR
        }

        # Track last child for each sibling group (parent + depth) (for └── vs ├──)
        parent = ""
        if (depth > 0) {
          parent = $1
          for (i = 2; i <= depth; i++) parent = parent "/" $i
        }
        parentKey[NR] = parent
        lastChild[parent SUBSEP depth] = NR
      }

      END {
        for (r = 1; r <= NR; r++) {
          depth = depthArr[r]
          prefix = ""

          # Build prefix columns: "│   " if that ancestor has more nodes later
          pref = ""
          for (d = 1; d <= depth; d++) {
            pref = (d==1 ? part[r,1] : pref "/" part[r,d])
            prefix = prefix ((last[pref] > r) ? "│   " : "    ")
          }

          connector = (r == lastChild[parentKey[r] SUBSEP depth]) ? "└── " : "├── "
          print prefix connector name[r]
        }
      }
    '
}

print_files() {
  if [ $# -eq 0 ]; then
    echo "Usage: cat_tree_ln <path> [find_options]"
    echo "Example: cat_tree_ln src/services"
    echo "Example: cat_tree_ln src -name '*.go'"
    return 1
  fi

  local target="$1"
  shift

  find "$target" -type f "$@" -exec sh -c '
    echo
    echo "$1"
    echo "================================================================================"
    nl -ba "$1"
  ' _ {} \;
}

