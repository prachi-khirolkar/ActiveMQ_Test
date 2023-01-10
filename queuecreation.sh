awk -F'|' 'FNR==NR{keys[$0];next} {for(i in keys) {if ($1==i) $0=$0 OFS i; if ($2==i) $0=$0 ((NF>2)? " ":OFS) i}}1' OFS='|' keywords.txt outfile.txt

set var = "inserted" sed '/addresses/a\'$var test.xml
