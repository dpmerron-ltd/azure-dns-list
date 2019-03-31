# Azure DNS List for Bash
A quickly written Bash function to list List all Azure DNS records &amp;&amp; search

To use this, clone this reposotirory and add the following to your ~/.bashrc or ~/.zshrc with

echo "source $(pwd)/azure-dns-list/azure-dns.sh" >> ~/.zshrc

## Usage:

To search all Azure DNS zones for all records use:

`dns`

To search for a specific DNS zone use:

`dns <your zone name>`

To filter results use:

`dnsgrep <your search (without spaces>`

