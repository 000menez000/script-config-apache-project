#!/bin/bash

# Caminho padrão do arquivo de configuração do Apache
APACHE_CONF="/etc/apache2/sites-available/000-default.conf"
DEFAULT_DOCUMENT_ROOT="/var/www/html"

# Verifica se o usuário é root
if [ "$EUID" -ne 0 ]; then
    echo "❌ Execute como root (use sudo)"
    exit 1
fi

# Verifica se o Apache está instalado
if ! command -v apache2 &> /dev/null; then
    echo "❌ Apache não está instalado. Execute: sudo apt install apache2"
    exit 1
fi

# Restaura o DocumentRoot para o padrão
echo "🔄 Restaurando o Apache para apontar para: $DEFAULT_DOCUMENT_ROOT"
sed -i "s|DocumentRoot .*|DocumentRoot $DEFAULT_DOCUMENT_ROOT|g" "$APACHE_CONF"

# Reinicia o Apache para aplicar as mudanças
echo "🔄 Reiniciando o Apache..."
systemctl restart apache2

echo "✅ Apache restaurado para o padrão com sucesso! Acesse: http://localhost"

