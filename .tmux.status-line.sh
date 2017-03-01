disk=$(df -h | tr -s ' ' | grep ' /$' | cut -d ' ' -f 5 | cut -d '%' -f 1)

mem_total=$(free | tr -s ' ' | grep '^Mem: ' | cut -d ' ' -f 2)
mem_available=$(free | tr -s ' ' | grep '^Mem: ' | cut -d ' ' -f 7)
mem_used=$(expr $mem_total - $mem_available)

mem=$(expr $mem_used \* 100 / $mem_total)

print_percent() {
    local data="$1"

    local mark1=80
    local mark2=95

    local red='#[fg=red]'
    local yellow='#[fg=yellow]'
    local white='#[fg=white]'

    local color=$white

    [ $data -ge $mark1 ] && color=$yellow
    [ $data -ge $mark2 ] && color=$red

    printf "$color%2d%%$white" $data
}

echo -e "M $(print_percent $mem) #[fg=cyan]|#[fg=white] D $(print_percent $disk)"
