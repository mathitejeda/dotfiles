function load_env --description 'Exporta las variables de un archivo .env (por defecto ./.env)'
    set -l file $argv[1]
    test -z "$file"; and set file .env
    if not test -f $file
        echo "No existe $file"
        return 1
    end

    for line in (string trim < $file)
        # saltear líneas vacías y comentarios
        string match -qr '^(#|$)' -- $line; and continue
        set line (string replace -r '^export\s+' '' -- $line)
        set -l item (string split -m 1 '=' -- $line)
        test (count $item) -eq 2; or continue
        # sacar comillas que envuelven el valor
        set -gx $item[1] (string trim -c '"\'' -- $item[2])
        echo "Exported key $item[1]"
    end
end
