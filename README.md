## Utilidade
- setup.sh
    É útil em projetos PHP usando servidor Apache2. O script basicamente altera o path do projeto raiz dentro do apache. Sendo assim, o script deve estar na pasta raiz do projeto. Ele irá apontar para pasta public. Quando acessar localhost, estara dentro da pasta public.
- restore_apache.sh
    Volta as configurações iniciais do apache.

# Tutorial
### Passo 1:
- Instalar os arquivos na raiz do projeto.

### Passo 2:
- No terminal, execute o comando abaixo para dar permissão de execução ao script:
```bash
chmod +x setup.sh
chmod +x restore_apache.sh
```

### Passo 3:
- Para rodar os scripts, utilize:
```bash
sudo ./setup.sh
sudo ./restore_apache.sh
```
