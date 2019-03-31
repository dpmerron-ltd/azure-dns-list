getdns () {
        for x in $(az network dns record-set a list -z $zone -g $rg | jq -r '.[].fqdn'); do
                
                echo "🐸 $x $(az network dns record-set a list -z $zone -g $rg | jq --arg fqdn "$x" '.[] | select(.fqdn==$fqdn)' | jq -r '.arecords | .[].ipv4Address' | tr '\n' ' ') $rg"
        
        done
}

allzones () {
	for i in $(az network dns zone list | jq -c '.[]'); do
		
		zone=$(echo "$i" | jq -r '.name') && rg=$(echo "$i" | jq -r '.resourceGroup')
		getdns

	done
}

dns () {

	if [[ -z $1 ]]; then
		
		echo "💥 ️Searching for DNS Records in ALL DNS zone 💥" && echo ""
		allzones

	else
		
		rg=$(echo "$(az network dns zone list | jq --arg zone "$1" -c '.[] | select(.name ==$zone)' | jq -r '.resourceGroup')")
	    zone=""$1""
		echo "💥 Searching for DNS A Records in $zone 💥" && echo ""
		getdns
		
	fi
}
 
dnsgrep () {

	dns | grep $1

}
