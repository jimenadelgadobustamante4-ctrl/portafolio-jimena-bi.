# Cómo publicarlo en GitHub

## Sin usar Git en la terminal
1. Entra a https://github.com/new y crea un repositorio público llamado `jimena-delgado-bi-portfolio` (o el nombre que prefieras).
2. Descomprime el ZIP descargado. **No subas únicamente el archivo ZIP.**
3. En el repositorio, selecciona **Add file > Upload files**.
4. Arrastra el contenido de la carpeta `Portfolio_Jimena_BI_GitHub`, conservando sus subcarpetas, y confirma con **Commit changes**. Si tu navegador no permite carpetas enteras, usa GitHub Desktop o Git.
5. Abre la página principal del repositorio y verifica que aparezca el README con enlaces a los cinco proyectos.
6. Añade tus datos de contacto al README y capturas reales en `assets/`.
7. Antes de enviar, visita la página del repositorio sin iniciar sesión y comprueba que se ve el contenido público.

## Con Git
```bash
git init
git add .
git commit -m "Add BI and data portfolio"
git branch -M main
git remote add origin https://github.com/TU_USUARIO/jimena-delgado-bi-portfolio.git
git push -u origin main
```

## Sobre los dos proyectos Lovable
Ambos enlaces están documentados como proyectos externos. Para que un evaluador vea el **código fuente**, conecta cada proyecto de Lovable a GitHub y agrega sus repositorios o incorpora el código exportado. Los enlaces al editor pueden ser privados; comparte la URL publicada accesible sin sesión.

## Revisión previa a tu candidatura
- [ ] Sustituir datos de contacto pendientes.
- [ ] Verificar acceso a Lovable sin iniciar sesión.
- [ ] Añadir capturas auténticas de Excel y Power BI.
- [ ] Crear el informe Power BI desde el kit NEXORA y añadir el `.pbix` si el archivo no supera límites de GitHub.
- [ ] Explicar qué parte de cada proyecto implementaste personalmente.
