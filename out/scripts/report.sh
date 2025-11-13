#!/bin/bash

#bezpieczne funkcjonowanie skryptu:
set -Eeuo pipefail


# ustalam zmienną kat i sprawdzam czy ta zmienna jest pusta czy nie; jeśli pusta to wyświetlam instrukcję użycia
kat="${1:-}"
if [[ -z "$kat" ]]; then 
echo "Użycie: 'bash scripts/report.sh <KATALOG>' -> wtedy wypisze date i godzinę oraz pięć największych podkatalogów/plików od podanego katalogu posortowanych wielkością" >&2
exit 2
fi

#sprawdzam, czy katalog istnieje; jeśli nie wyświetlam informacje o błędzie
if [[ ! -d "$kat" ]]; then
echo "podany katalog nie istnieje" >&2
exit 1
fi

#wyświetlam datę i godzinę
date +"%F %T"

#wyświetlam posortowane dane w katalogu (5 największych)
du -sh "$kat"/* 2>/dev/null | sort -h | tail -5
