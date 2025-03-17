#!/bin/bash

# Caminho padrão do Apache e diretório do projeto
APACHE_CONF="/etc/apache2/sites-available/000-default.conf"
PROJECT_PATH="$(pwd)/public"

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

# Atualiza o DocumentRoot no arquivo de configuração
echo "🔄 Configurando o Apache para apontar para: $PROJECT_PATH"
sed -i "s|DocumentRoot .*|DocumentRoot $PROJECT_PATH|g" "$APACHE_CONF"

# Define permissões corretas apenas para a pasta `public`
echo "🔒 Ajustando permissões para o Apache..."
chown -R $USER:www-data "$PROJECT_PATH"
chmod -R 755 "$PROJECT_PATH"

# Reinicia o Apache para aplicar as mudanças
echo "🔄 Reiniciando o Apache..."
systemctl restart apache2

echo "✅ Apache configurado com sucesso! Acesse: http://localhost"
