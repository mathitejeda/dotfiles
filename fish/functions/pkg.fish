function pkg --description 'Buscar e instalar paquetes (repos + AUR) con selección interactiva (fzf)'
    if not command -q fzf
        echo "pkg necesita fzf: sudo pacman -S fzf"
        return 1
    end

    # yay incluye el AUR; si no está, usa solo los repos oficiales
    set -l pm pacman
    command -q yay; and set pm yay

    set -l selected ($pm -Slq | sort -u | fzf --multi \
        --query "$argv" \
        --preview "$pm -Si {1}" \
        --preview-window 'right:60%:wrap' \
        --header 'TAB: multi-selección | Enter: instalar | Esc: cancelar')

    test (count $selected) -eq 0; and return 0

    if test $pm = yay
        yay -S --needed $selected
    else
        sudo pacman -S --needed $selected
    end
end
